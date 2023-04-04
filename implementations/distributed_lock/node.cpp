#include <arpa/inet.h>		// ntohs()
#include <stdio.h>		// printf(), perror()
#include <iostream>
#include <stdlib.h>		// atoi()
#include <string.h>		// strlen()
#include <string>
#include <strings.h>		// bzero()Uu
#include <sys/socket.h>		// socket(), connect(), send(), recv()
#include <unistd.h>		// close()
#include <thread>
#include "helpers.h"		// make_client_sockaddr()

int epoch = 0;
bool held;

std::mutex cout_lock;
std::mutex state_lock;

int transfer(const char* hostname, int dst_port, int epoch){
	const char* transfer_str = "transfer ";
	char epoch_str[10];
	snprintf(epoch_str, 10, "%d", epoch);
    char target[256];
    strcpy(target, transfer_str);

	state_lock.lock();
	held = false;
	state_lock.unlock();

    return send_message(hostname, dst_port, strcat(target, epoch_str));
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

	// (1) Receive message from client.

	char msg[MAX_MESSAGE_SIZE + 1];
	memset(msg, 0, sizeof(msg));

	// Call recv() enough times to consume all the data the client sends.
	size_t recvd = 0;
	ssize_t rval;
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

    char * command = strtok(msg, " ");
    int msg_epoch = atoi(strtok(NULL, " "));

	// (2) Print out the message
	cout_lock.lock();
	printf("Received %s at epoch %d\n", command, msg_epoch);
	cout_lock.unlock();
    if (strcmp(command, "transfer") == 0) {
        if (msg_epoch > epoch) {
			state_lock.lock();
			epoch = msg_epoch;
			held = true;
			state_lock.unlock();
			cout_lock.lock();
            printf("Holds lock at epoch %d\n", msg_epoch);
			cout_lock.unlock();
        } else {
			std::lock_guard<std::mutex> raii(cout_lock);
            printf("Received epoch %d <= current epoch %d. No lock transfer\n", msg_epoch, epoch);
        }
    }
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
	cout_lock.lock();
	printf("Server listening on port %d...\n", port);
	cout_lock.unlock();

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

// User constraint: need to have node_id = 0 for one node
int repl(const char* hostname) {
	while(true){
		cout_lock.lock();
		printf("> ");
		cout_lock.unlock();
		int port;
		std::string command;
		std::cin >> command >> port;
		int send_epoch = epoch + 1;
		const char *message = command.c_str();
	
		if (strcmp(message, "transfer") != 0) {
			std::lock_guard<std::mutex> raii(cout_lock);
			printf("Usage: transfer port_num\n");
			return 1;
		}
		else if (!held){
			std::lock_guard<std::mutex> raii(cout_lock);
			printf("Cannot transfer a lock you don't have\n");
		}
		else {
			cout_lock.lock();
			printf("Transferring to %s:%d at epoch %d\n", hostname, port, send_epoch);
			cout_lock.unlock();
			if (transfer(hostname, port, send_epoch) == -1){
				return 1;
			}
		}
	}
}

int main(int argc, const char **argv) {
	// Parse command line arguments
	if (argc != 4) {
		std::lock_guard<std::mutex> raii(cout_lock);
		printf("Usage: ./node port_num hostname node_id\n");
		return 1;
	}
	int port = atoi(argv[1]);
	const char *hostname = argv[2];
    int node_id = atoi(argv[3]);
	held = (node_id == 0);

	std::thread t(run_server, port, 10);

	return repl(hostname);
}

// why send a message to yourself?
// how to always be listening for messages but also always be listening for user input? thread
// can you open a channel while listening for messages? yes with threads