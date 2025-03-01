#pragma once

#include <jni.h>
#include <unistd.h>
#include <cstdio>
#include <cstring>
#include <string>
#include <cstdlib>

static uintptr_t libBase = 0;

static uintptr_t getLibBase(const char *library) {
    FILE *fp = fopen("/proc/self/maps", "rt");
    if (!fp) {
        perror("fopen");
        return 0;
    }

    char buffer[1024];
    uintptr_t address = 0;

    while (fgets(buffer, sizeof(buffer), fp)) {
        if (strstr(buffer, library)) {
            address = strtoul(buffer, nullptr, 16);
            break;
        }
    }

    fclose(fp);
    return address;
}

static uintptr_t getAddress(uintptr_t relativeAddr) {
    libBase = getLibBase("libroblox.so");
    return (libBase != 0) ? (libBase + relativeAddr) : 0;
}

static uintptr_t getLibAddress(const char *lib, uintptr_t relativeAddr) {
    libBase = getLibBase(lib);
    return (libBase != 0) ? (libBase + relativeAddr) : 0;
}

static bool isLibraryLoaded(const char *libraryName) {
    FILE *fp = fopen("/proc/self/maps", "rt");
    if (!fp) return false;

    char line[512];
    bool found = false;

    while (fgets(line, sizeof(line), fp)) {
        if (strstr(line, libraryName)) {
            found = true;
            break;
        }
    }

    fclose(fp);
    return found;
}

static jboolean isGameLibLoaded(JNIEnv *env, jobject thiz) {
    return isLibraryLoaded("libroblox.so");
}
