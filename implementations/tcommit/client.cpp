#include <arpa/inet.h>		// ntohs()
#include <stdio.h>		// printf(), perror()
#include <iostream>
#include <stdlib.h>		// atoi()
#include <string.h>		// strlen()
#include <string>
#include <strings.h>		// bzero()Uu
#include <sys/socket.h>		// socket(), connect(), send(), recv()
#include <unistd.h>		// close()

#include "helpers.h"		// make_client_sockaddr()

static const int MAX_MESSAGE_SIZE = 256;
const int port = 400;

/**
 * Sends a string message to the server.
 *
 * Parameters:
 *		hostname: 	Remote hostname of the server.
 *		port: 		Remote port of the server.
 * 		message: 	The message to send, as a C-string.
 * Returns:
 *		0 on success, -1 on failure.
 */
int send_message(const char *hostname, int port, const char *message) {
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

int prepare(const char* hostname, const char* client_id) {
	const char* connect_str = "prepare ";
    char target[256];
    strcpy(target, connect_str);
    return send_message(hostname, port, strcat(target, client_id));
}

int decide_commit(const char* hostname, const char* client_id) {
	const char* disconnect_str = "decide_commit ";
    char target[256];
    strcpy(target, disconnect_str);
    return send_message(hostname, port, strcat(target, client_id));
}

int decide_abort(const char* hostname, const char* client_id) {
    const char* disconnect_str = "decide_abort ";
    char target[256];
    strcpy(target, disconnect_str);
    return send_message(hostname, port, strcat(target, client_id));
}

int main(int argc, const char **argv) {
	// Parse command line arguments
	if (argc != 3) {
		printf("Usage: ./client hostname client_id\n");
		return 1;
	}
	const char *hostname = argv[1];
    const char *client_id = argv[2];

	while(true){
		printf("> ");
		std::string command;
		std::cin >> command;
		const char *message = command.c_str();
		// int port = atoi(argv[2]);
		// const char *message = argv[4];		
		if (strcmp(message, "prepare") != 0
         && strcmp(message, "decide_commit") != 0
         && strcmp(message, "decide_abort") != 0) {
			printf("Usage: <prepare/decide_commit/decide_abort>\n");
			return 1;
		}
        if (strcmp(message, "prepare") == 0) {
            if (prepare(hostname, client_id) == -1) {
                return 1;
            }
        }
        if (strcmp(message, "decide_commit") == 0) {
            if (decide_commit(hostname, client_id) == -1) {
                return 1;
            }
        }
        if (strcmp(message, "decide_abort") == 0) {
            if (decide_abort(hostname, client_id) == -1) {
                return 1;
            }
        }
	}
}
