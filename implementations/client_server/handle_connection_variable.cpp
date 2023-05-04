#include <string>
#include <stdlib.h>		// atoi()
#include <sys/socket.h>		// socket(), bind(), listen(), accept(), send(), recv()
#include <unistd.h>		// close()


static const size_t MAX_MESSAGE_SIZE = 256;

bool semaphore = true;
int connected = -1;
// TODO: reflect internally the server ids. prob as a command line arg in main function


int handle_connection(int connectionfd) {
	char msg[MAX_MESSAGE_SIZE + 1];
	memset(msg, 0, sizeof(msg));

	size_t recvd = 0;
	ssize_t rval;

    rval = recv(connectionfd, msg + recvd, MAX_MESSAGE_SIZE - recvd, 0);
	if (rval == -1) {
		return -1;
    }
    recvd += rval;
    rval = recv(connectionfd, msg + recvd, MAX_MESSAGE_SIZE - recvd, 0);
    if (rval != 0) {
        return -1;
    }

    char * command = strtok(msg, " ");
    int client_id = atoi(strtok(NULL, " "));

    if (strcmp(command, "connect") == 0) {
        if (semaphore) {
            semaphore = false;
            connected = client_id;
        } else {
          return -1;
        }
   }
    if (strcmp(command, "disconnect") == 0) {
        if (connected == client_id) {
            connected = -1;
            semaphore = true;
        }
        else {
          return -1;
        }
    }
	close(connectionfd);
	return 0;
}