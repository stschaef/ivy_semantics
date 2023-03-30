#include <iostream>
#include <unistd.h>
#include <sys/wait.h>
#include <fcntl.h>
#include <sys/stat.h>
#include <sys/mman.h>
#include <semaphore.h>
#include <cstring>

const int NUM_NODES = 5;

enum ActionType {
    VOTE1,
    VOTE2,
    FAIL,
    GO1,
    GO2,
    COMMIT,
    ABORT
};

struct Action {
    ActionType type;
    int nodeId;
};

struct NodeState {
    bool vote_yes;
    bool vote_no;
    bool alive;
    bool go_commit;
    bool go_abort;
    bool decide_commit;
    bool decide_abort;
};

struct SharedMemory {
    NodeState nodes[NUM_NODES];
    bool abort_flag;
    sem_t action_sem;
    Action action;
};


void node(int nodeId, SharedMemory *shm) {
    NodeState &state = shm->nodes[nodeId];

    while (true) {
        sem_wait(&shm->action_sem);
        Action action = shm->action;

        if (action.nodeId != nodeId) {
            sem_post(&shm->action_sem);
            continue;
        }

        switch (action.type) {
            case VOTE1:
                if (state.alive && !state.vote_no && !state.decide_commit && !state.decide_abort) {
                    state.vote_yes = true;
                }
                break;

            case VOTE2:
                if (state.alive && !state.vote_yes && !state.decide_commit && !state.decide_abort) {
                    state.vote_no = true;
                    shm->abort_flag = true;
                    state.decide_abort = true;
                }
                break;

            case FAIL:
                if (state.alive) {
                    state.alive = false;
                    shm->abort_flag = true;
                }
                break;

            case GO1:
                if (!state.go_commit && !state.go_abort && state.vote_yes) {
                    state.go_commit = true;
                }
                break;

            case GO2:
              {
                bool found_vote_no = false;
                for (int i = 0; i < NUM_NODES; ++i) {
                    if (!shm->nodes[i].alive || shm->nodes[i].vote_no) {
                        found_vote_no = true;
                        break;
                    }
                }
                if (!state.go_commit && !state.go_abort && found_vote_no) {
                    state.go_abort = true;
                }
                break;
}
            case COMMIT:
                if (state.alive && state.go_commit) {
                    state.decide_commit = true;
                }
                break;

            case ABORT:
                if (state.alive && state.go_abort) {
                    state.decide_abort = true;
                }
                break;
        }

        sem_post(&shm->action_sem);
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

    sem_init(&shm->action_sem, 1, 1);

        for (int i = 0; i < NUM_NODES; ++i) {
        NodeState &state = shm->nodes[i];
        state.vote_yes = false;
        state.vote_no = false;
        state.alive = true;
        state.go_commit = false;
        state.go_abort = false;
        state.decide_commit = false;
        state.decide_abort = false;
    }
    shm->abort_flag = false;

    pid_t nodePids[NUM_NODES];
    for (int i = 0; i < NUM_NODES; ++i) {
        nodePids[i] = fork();
        if (nodePids[i] == 0) {
            node(i, shm);
            exit(0);
        }
    }

    // Perform actions here, using sem_wait() and sem_post() to modify the shared memory
    // For example: shm->action = {VOTE1, 0}; sem_post(&shm->action_sem);

    for (int i = 0; i < NUM_NODES; ++i) {
        waitpid(nodePids[i], NULL, 0);
    }

    sem_destroy(&shm->action_sem);
    munmap(shm, sizeof(SharedMemory));
    close(fd);
    shm_unlink("/my_shared_memory");

    return 0;
}
