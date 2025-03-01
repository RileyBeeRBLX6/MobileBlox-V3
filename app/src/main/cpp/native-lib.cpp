#include <thread>
#include <dobby.h>
#include <unistd.h>

#include "hooks/hooks.hpp"
#include "memory/mem.hpp"
#include "exec/funcs.hpp"

void mainfunc() {
    // Wait until Roblox is fully loaded before proceeding
    while (!isLibraryLoaded("libroblox.so")) {
        sleep(1);
    }

    initfuncs();

    DobbyHook(reinterpret_cast<void*>(getAddress(startscript_addy)), 
              reinterpret_cast<void*>(&hkstartscript), 
              reinterpret_cast<void**>(&origstartscript));

    // Test execution (uncomment to verify)
    // sleep(80);
    // executescript(eL, "loadstring(\"print('hi')\")()");
}

[[maybe_unused]] __attribute__((constructor))
void EntryPoint() {
    std::thread(mainfunc).detach();
}
