#include <arpa/inet.h>		// htons(), ntohs()
#include <netdb.h>		// gethostbyname(), struct hostent
#include <netinet/in.h>		// struct sockaddr_in
#include <stdio.h>		// perror(), fprintf()
#include <string.h>		// memcpy()
#include <sys/socket.h>		// getsockname()
#include <unistd.h>		// stderr

static const int MAX_MESSAGE_SIZE = 256;

/**
 * Make a server sockaddr given a port.
 * Parameters:
 *		addr: 	The sockaddr to modify (this is a C-style function).
 *		port: 	The port on which to listen for incoming connections.
 * Returns:
 *		0 on success, -1 on failure.
 * Example:
 *		struct sockaddr_in server;
 *		int err = make_server_sockaddr(&server, 8888);
 */
int make_server_sockaddr(struct sockaddr_in *addr, int port) {
	// Step (1): specify socket family.
	// This is an internet socket.
	addr->sin_family = AF_INET;

	// Step (2): specify socket address (hostname).
	// The socket will be a server, so it will only be listening.
	// Let the OS map it to the correct address.
	addr->sin_addr.s_addr = INADDR_ANY;

	// Step (3): Set the port value.
	// If port is 0, the OS will choose the port for us.
	// Use htons to convert from local byte order to network byte order.
	addr->sin_port = htons(port);

	return 0;
}

/**
 * Make a client sockaddr given a remote hostname and port.
 * Parameters:
 *		addr: 		The sockaddr to modify (this is a C-style function).
 *		hostname: 	The hostname of the remote host to connect to.
 *		port: 		The port to use to connect to the remote hostname.
 * Returns:
 *		0 on success, -1 on failure.
 * Example:
 *		struct sockaddr_in client;
 *		int err = make_client_sockaddr(&client, "141.88.27.42", 8888);
 */
int make_client_sockaddr(struct sockaddr_in *addr, const char *hostname, int port) {
	// Step (1): specify socket family.
	// This is an internet socket.
	addr->sin_family = AF_INET;

	// Step (2): specify socket address (hostname).
	// The socket will be a client, so call this unix helper function
	// to convert a hostname string to a useable `hostent` struct.
	struct hostent *host = gethostbyname(hostname);
	if (host == nullptr) {
		fprintf(stderr, "%s: unknown host\n", hostname);
		return -1;
	}
	memcpy(&(addr->sin_addr), host->h_addr, host->h_length);

	// Step (3): Set the port value.
	// Use htons to convert from local byte order to network byte order.
	addr->sin_port = htons(port);

	return 0;
}

/**
 * Return the port number assigned to a socket.
 *
 * Parameters:
 * 		sockfd:	File descriptor of a socket
 *
 * Returns:
 *		The port number of the socket, or -1 on failure.
 */
 int get_port_number(int sockfd) {
 	struct sockaddr_in addr;
	socklen_t length = sizeof(addr);
	if (getsockname(sockfd, (sockaddr *) &addr, &length) == -1) {
		perror("Error getting port of socket");
		return -1;
	}
	// Use ntohs to convert from network byte order to host byte order.
	return ntohs(addr.sin_port);
 }


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