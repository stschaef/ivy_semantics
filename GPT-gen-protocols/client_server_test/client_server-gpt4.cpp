#include <iostream>
#include <unistd.h>
#include <sys/wait.h>
#include <fcntl.h>
#include <sys/stat.h>
#include <sys/mman.h>
#include <semaphore.h>
#include <string>
#include <cstring>

const int NUM_SERVERS = 3;
const int NUM_CLIENTS = 2;

enum CommandType {
    CONNECT,
    DISCONNECT
};

struct Command {
    CommandType type;
    int clientId;
    int serverId;
};

struct SharedMemory {
    Command cmd[NUM_SERVERS];
    sem_t sem[NUM_SERVERS];
};

void server(int serverId, SharedMemory *shm) {
    sem_t *semaphore = &shm->sem[serverId];

    while (true) {
        sem_wait(semaphore);
        Command cmd = shm->cmd[serverId];

        switch (cmd.type) {
            case CONNECT:
                std::cout << "Server " << serverId << " connected to client " << cmd.clientId << std::endl;
                break;

            case DISCONNECT:
                std::cout << "Server " << serverId << " disconnected from client " << cmd.clientId << std::endl;
                break;
        }
    }
}

void client(int clientId, SharedMemory *shm) {
        for (int serverId = 0; serverId < NUM_SERVERS; ++serverId) {
        Command cmd;
        cmd.type = CONNECT;
        cmd.clientId = clientId;
        cmd.serverId = serverId;

        shm->cmd[serverId] = cmd;
        sem_post(&shm->sem[serverId]);

        sleep(1);

        cmd.type = DISCONNECT;
        shm->cmd[serverId] = cmd;
        sem_post(&shm->sem[serverId]);

        sleep(1);
    }
}

int main() {
    int fd = shm_open("/my_shared_memory", O_CREAT | O_RDWR, S_IRUSR | S_IWUSR);
    if (fd == -1) {
        perror("shm_open");
        exit(1);
    }

    if (ftruncate(fd, sizeof(SharedMemory)) == -1) {
        perror("ftruncate");
        exit(1);
    }

    SharedMemory *shm = static_cast<SharedMemory *>(mmap(NULL, sizeof(SharedMemory), PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0));
    if (shm == MAP_FAILED) {
        perror("mmap");
        exit(1);
    }

    for (int i = 0; i < NUM_SERVERS; ++i) {
        sem_init(&shm->sem[i], 1, 0);
    }

        pid_t serverPids[NUM_SERVERS];
    for (int i = 0; i < NUM_SERVERS; ++i) {
        serverPids[i] = fork();
        if (serverPids[i] == 0) {
            server(i, shm);
            exit(0);
        }
    }

    pid_t clientPids[NUM_CLIENTS];
    for (int i = 0; i < NUM_CLIENTS; ++i) {
        clientPids[i] = fork();
        if (clientPids[i] == 0) {
            client(i, shm);
            exit(0);
        }
    }

    for (int i = 0; i < NUM_CLIENTS; ++i) {
        waitpid(clientPids[i], NULL, 0);
    }

    for (int i = 0; i < NUM_SERVERS; ++i) {
        waitpid(serverPids[i], NULL, 0);
    }

    for (int i = 0; i < NUM_SERVERS; ++i) {
        sem_destroy(&shm->sem[i]);
    }

    munmap(shm, sizeof(SharedMemory));
    close(fd);
    shm_unlink("/my_shared_memory");

    return 0;
}
