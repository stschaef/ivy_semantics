#include <arpa/inet.h>		// htons()
#include <stdio.h>		// printf(), perror()i
#include <string>
#include <stdlib.h>		// atoi()
#include <sys/socket.h>		// socket(), bind(), listen(), accept(), send(), recv()
#include <unistd.h>		// close()
#include <set>

#include "helpers.h"		// make_server_sockaddr(), get_port_number()

static const size_t MAX_MESSAGE_SIZE = 256;
static const int NUM_NODES = 4;

// A unique identifier for each client
int id; // TODO get from command line
bool is_leader = false;

bool is_previous_node(int id_in) {
    return id - 1 == id_in || (id == 0 && id_in == NUM_NODES - 1);
}

int send_message(const char *hostname, int port, const char *message) {
    printf("Message: %s\n", message);
    if (strlen(message) > MAX_MESSAGE_SIZE) {
		perror("Error: Message exceeds maximum length\n");
		return -1;
	}

	// (1) Create a socket
	int sockfd = socket(AF_INET, SOCK_STREAM, 0);

	// (2) Create a sockaddr_in to specify remote host and port
	struct sockaddr_in addr;
	if (make_client_sockaddr(&addr, hostname, port) == -1) {
		return -1;
	}

	// (3) Connect to remote server
	if (connect(sockfd, (sockaddr *) &addr, sizeof(addr)) == -1) {
		perror("Error connecting stream socket");
		return -1;
	}

	// (4) Send message to remote server
	// Call send() enough times to send all the data
	size_t message_len = strlen(message);
	size_t sent = 0;
	do {
		ssize_t n = send(sockfd, message + sent, message_len - sent, 0);
		if (n == -1) {
			perror("Error sending on stream socket");
			return -1;
		}
		sent += n;
	} while (sent < message_len);

	// (5) Close connection
	close(sockfd);

	return 0;
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

	// printf("New connection %d\n", connectionfd);
	printf("id: %d\n", id);

	char msg[MAX_MESSAGE_SIZE + 1];
	memset(msg, 0, sizeof(msg));

	size_t recvd = 0;
	ssize_t rval;

    //  Receive message from client
    rval = recv(connectionfd, msg + recvd, MAX_MESSAGE_SIZE - recvd, 0);
	if (rval == -1) {
		perror("Error reading stream message");
		return -1;
    }
    recvd += rval;
    // Ensure that the entire message is received with the first call to recv()
    rval = recv(connectionfd, msg + recvd, MAX_MESSAGE_SIZE - recvd, 0);
    if (rval != 0) {
        perror("Error: couldn't fit message in buffer");
        return -1;
    }

    int sender_id = atoi(strtok(msg, " "));
    int id_in_msg = atoi(strtok(NULL, " "));

    if (!is_previous_node(sender_id)) {
        printf("Message not permitted by network topology\n");
        printf("sender_id: %d\n", sender_id);
    }

    if (id_in_msg == id) {
        printf("%d is the leader\n", id);
        is_leader = true;
    }
    else {
        printf("Sending message to %d\n", (id + 1) % NUM_NODES);
        char * new_msg = (char *) malloc(sizeof(char) * MAX_MESSAGE_SIZE);
        sprintf(new_msg, "%d %d", id, id_in_msg);
        send_message("localhost", 3000 + (id + 1) % NUM_NODES, new_msg);
    }

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
int run(int port, int queue_size) {

    if (id == 0) {
        printf("Starting election\n");
        char * msg = (char *) malloc(sizeof(char) * MAX_MESSAGE_SIZE);
        sprintf(msg, "%d %d", id, id);
        send_message("localhost", 3000 + ((id + 1) % NUM_NODES), msg);
    }

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
		printf("Usage: ./node id\n");
		return 1;
	}
	id = atoi(argv[1]);
    int port = 3000 + id;
    printf("id: %d\n", id);
    printf("port: %d\n", port);

	if (run(port, 10) == -1) {
		return 1;
	}
	return 0;
}
