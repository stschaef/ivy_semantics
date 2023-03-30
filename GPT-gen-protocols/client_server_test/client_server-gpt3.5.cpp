#include <iostream>
#include <string>
#include <fcntl.h>
#include <sys/stat.h>
#include <unistd.h>

using namespace std;

const string SERVER_FIFO_PREFIX = "/tmp/server_fifo_";
const string CLIENT_FIFO_PREFIX = "/tmp/client_fifo_";
const int MAX_MESSAGE_SIZE = 256;

// Helper function to create a named pipe with the given name
int create_fifo(const string& name) {
    int res = mkfifo(name.c_str(), 0666);
    if (res == -1) {
        cerr << "Error creating named pipe: " << name << endl;
        exit(1);
    }
    return res;
}

// Server implementation
void run_server(int server_id) {
    string server_fifo_name = SERVER_FIFO_PREFIX + to_string(server_id);
    create_fifo(server_fifo_name);

    // Initialize semaphore to true
    bool semaphore = true;

    while (true) {
        // Open FIFO for reading
        int fd = open(server_fifo_name.c_str(), O_RDONLY);
        if (fd == -1) {
            cerr << "Error opening named pipe for server " << server_id << endl;
            exit(1);
        }

        // Read client request from FIFO
        char buffer[MAX_MESSAGE_SIZE];
        ssize_t num_bytes_read = read(fd, buffer, MAX_MESSAGE_SIZE);
        if (num_bytes_read == -1) {
            cerr << "Error reading from named pipe for server " << server_id << endl;
            exit(1);
        }
        buffer[num_bytes_read] = '\0';

        // Parse client request
        string request = buffer;
        bool connect = request.find("connect") == 0;
        bool disconnect = request.find("disconnect") == 0;
        int client_id = stoi(request.substr(request.find("(") + 1, request.find(")") - request.find("(") - 1));

        // Process client request
        if (connect) {
            if (semaphore) {
                // Send response to client
                string client_fifo_name = CLIENT_FIFO_PREFIX + to_string(client_id);
                int client_fd = open(client_fifo_name.c_str(), O_WRONLY);
                if (client_fd == -1) {
                    cerr << "Error opening named pipe for client " << client_id << endl;
                    exit(1);
                }
                string response = "connected";
                write(client_fd, response.c_str(), response.size());
                close(client_fd);

                // Update server state
                semaphore = false;
            } else {
                // Send response to client
                string client_fifo_name = CLIENT_FIFO_PREFIX + to_string(client_id);
                int client_fd = open(client_fifo_name.c_str(), O_WRONLY);
                if (client_fd == -1) {
                    cerr << "Error opening named pipe for client " << client_id << endl;
                    exit(1);
                }
                string response = "rejected";
                write(client_fd, response.c_str(), response.size());
                close(client_fd);
            }
        } else if (disconnect) {
            // Send response to client
            string client_fifo_name = CLIENT_FIFO_PREFIX + to_string(client_id);
            int client_fd = open(client_fifo_name.c_str(), O_WRONLY);
            if (client_fd == -1) {
                cerr << "Error opening named pipe for client " << client_id << endl;
                exit(1);
            }
            string response = "disconnected";
            write(client_fd, response.c_str(), response.size());
            close(client_fd);

            // Update server state
            semaphore = true;
     }

    // Close FIFO
    close(fd);
    }
}
 // Client implementation
void run_client(int client_id, int server_ids[]) {
string client_fifo_name = CLIENT_FIFO_PREFIX + to_string(client_id);
create_fifo(client_fifo_name);
 for (int i = 0; i < 2; i++) {
    // Open FIFO for writing to server
    int server_id = server_ids[i];
    string server_fifo_name = SERVER_FIFO_PREFIX + to_string(server_id);
    int fd = open(server_fifo_name.c_str(), O_WRONLY);
    if (fd == -1) {
        cerr << "Error opening named pipe for server " << server_id << endl;
        exit(1);
    }

    // Send connect request to server
    string request = "connect(" + to_string(client_id) + ")";
    write(fd, request.c_str(), request.size());

    // Read response from server
    char buffer[MAX_MESSAGE_SIZE];
    ssize_t num_bytes_read = read(fd, buffer, MAX_MESSAGE_SIZE);
    if (num_bytes_read == -1) {
        cerr << "Error reading from named pipe for server " << server_id << endl;
        exit(1);
    }
    buffer[num_bytes_read] = '\0';

    // Parse server response
    string response = buffer;

    if (response == "connected") {
        cout << "Client " << client_id << " connected to server " << server_id << endl;
        break;
    } else {
        cout << "Client " << client_id << " rejected by server " << server_id << endl;
    }

    // Close FIFO
    close(fd);
}

sleep(5);

for (int i = 0; i < 2; i++) {
    // Open FIFO for writing to server
    int server_id = server_ids[i];
    string server_fifo_name = SERVER_FIFO_PREFIX + to_string(server_id);
    int fd = open(server_fifo_name.c_str(), O_WRONLY);
    if (fd == -1) {
        cerr << "Error opening named pipe for server " << server_id << endl;
        exit(1);
    }

    // Send disconnect request to server
    string request = "disconnect(" + to_string(client_id) + ")";
    write(fd, request.c_str(), request.size());

    // Read response from server
    char buffer[MAX_MESSAGE_SIZE];
    ssize_t num_bytes_read = read(fd, buffer, MAX_MESSAGE_SIZE);
    if (num_bytes_read == -1) {
        cerr << "Error reading from named pipe for server " << server_id << endl;
        exit(1);
    }
    buffer[num_bytes_read] = '\0';

    // Parse server response
    string response = buffer;

    cout << "Client " << client_id << " disconnected from server " << server_id << endl;

    // Close FIFO
    close(fd);
}
 }
// Main function to start servers and clients
int main() {
// Start servers
for (int i = 0; i < 3; i++) {
if (fork() == 0) {
run_server(i);
}
}
// Start clients
int client_ids[] = {1, 2};
int server_ids[] = {0, 1};
for (int i = 0; i < 2; i++) {
    if (fork() == 0) {
        run_client(client_ids[i], server_ids);
    }
}

// Wait for child processes to finish
for (int i = 0; i < 5; i++) {
    wait(NULL);
}

return 0;
}
