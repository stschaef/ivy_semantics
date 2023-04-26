#include <arpa/inet.h>		// htons()
#include <stdio.h>		// printf(), perror()i
#include <string>
#include <stdlib.h>		// atoi()
#include <sys/socket.h>		// socket(), bind(), listen(), accept(), send(), recv()
#include <unistd.h>		// close()
#include <set>

#include "helpers.h"		// make_server_sockaddr(), get_port_number()

static const size_t MAX_MESSAGE_SIZE = 256;

bool SEMAPHORE = true;
int connected = -1;

void print_connections() {
    printf("Connected to: ");
    if (connected != -1) {
        printf("%d ", connected);
    }
    else {
        printf("none");
    }
    printf("\n");
}

/**
 * Receives a string message from the client and prints it to stdout.
 *
 * Parameters:
 * 		connectionfd: 	File descriptor for a socket connection
 * 				(e.g. the one returned by accept())
 * Returns:
 *		0 on success, -1 on failure.
 */
int handle_connection(int connectionfd) {

	printf("New connection %d\n", connectionfd);

	// (1) Receive message from client.

	char msg[MAX_MESSAGE_SIZE + 1];
	memset(msg, 0, sizeof(msg));

	// Call recv() enough times to consume all the data the client sends.
	size_t recvd = 0;
	ssize_t rval;
// TODO make this a single round
	do {
		// Receive as many additional bytes as we can in one call to recv()
		// (while not exceeding MAX_MESSAGE_SIZE bytes in total).
		rval = recv(connectionfd, msg + recvd, MAX_MESSAGE_SIZE - recvd, 0);
		if (rval == -1) {
			perror("Error reading stream message");
			return -1;
		}
		recvd += rval;
	} while (rval > 0);  // recv() returns 0 when client closes
// requires pending_message(<server_id>, <client_id>, <message>, <time>)

    char * command = strtok(msg, " ");
    int client_id = atoi(strtok(NULL, " "));

    // msg = "connect 10"
    // command = "connect"
    // client_id = 10
    // like python string.split()

	// (2) Print out the message
	printf("Client %d says '%s'\n", client_id, command);
    if (strcmp(command, "connect") == 0) {
        // command \in type COMMAND = {connect, disconnect, garbage}
        // command ?== connect
        if (SEMAPHORE) {
            printf("Client %d is connected\n", client_id);
            SEMAPHORE = false;
            connected = client_id;
        } else {
            printf("Server already connected. Client %d is rejected\n", client_id);
        }
   }
    if (strcmp(command, "disconnect") == 0) {
        if (connected == client_id) {
            connected = -1;
            SEMAPHORE = true;
            printf("Client %d is disconnected\n", client_id);
        }
        else {
            printf("Client %d is not connected. Disconnect failed\n", client_id);
        }
    }
    print_connections();
	// (4) Close connection
	close(connectionfd);

	return 0;
}

/**
 * Endlessly runs a server that listens for connections and serves
 * them _synchronously_.
 *
 * Parameters:
 *		port: 		The port on which to listen for incoming connections.
 *		queue_size: 	Size of the listen() queue
 * Returns:
 *		-1 on failure, does not return on success.
 */
int run_server(int port, int queue_size) {

	// (1) Create socket
	int sockfd = socket(AF_INET, SOCK_STREAM, 0);
	if (sockfd == -1) {
		perror("Error opening stream socket");
		return -1;
	}

	// (2) Set the "reuse port" socket option
	int yesval = 1;
	if (setsockopt(sockfd, SOL_SOCKET, SO_REUSEADDR, &yesval, sizeof(yesval)) == -1) {
		perror("Error setting socket options");
		return -1;
	}

	// (3) Create a sockaddr_in struct for the proper port and bind() to it.
	struct sockaddr_in addr;
	if (make_server_sockaddr(&addr, port) == -1) {
		return -1;
	}

	// (3b) Bind to the port.
	if (bind(sockfd, (sockaddr *) &addr, sizeof(addr)) == -1) {
		perror("Error binding stream socket");
		return -1;
	}

	// (3c) Detect which port was chosen.
	port = get_port_number(sockfd);
	printf("Server listening on port %d...\n", port);

	// (4) Begin listening for incoming connections.
	listen(sockfd, queue_size);

	// (5) Serve incoming connections one by one forever.
	while (true) {
		int connectionfd = accept(sockfd, 0, 0);
		if (connectionfd == -1) {
			perror("Error accepting connection");
			return -1;
		}

		if (handle_connection(connectionfd) == -1) {
			return -1;
		}
	}
}

int main(int argc, const char **argv) {
	// Parse command line arguments
	if (argc != 2) {
		printf("Usage: ./server port_num\n");
		return 1;
	}
	int port = atoi(argv[1]);

	if (run_server(port, 10) == -1) {
		return 1;
	}
	return 0;
}
