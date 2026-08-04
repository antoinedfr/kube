#ifndef CREATE_H
#define CREATE_H

typedef enum {
    WRITE_MODE
} FileMode;

int createFile(const char* filename, const char* content, FileMode mode);
#endif
