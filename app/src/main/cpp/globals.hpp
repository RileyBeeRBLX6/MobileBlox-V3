#pragma once

#include <cstdint>
#include "luau/lua.h"
#include "luau/lstate.h"

static std::uintptr_t ScriptContext{};
static lua_State* rL{};
static lua_State* eL{};

static constexpr std::uintptr_t startscript_addy = 0x1A2FBB0;
static constexpr std::uintptr_t getstate_addy = 0x19D4A78;
static constexpr std::uintptr_t newthread_addy = 0x38C76A0;
static constexpr std::uintptr_t luauload_addy = 0x38F12D8;
static constexpr std::uintptr_t spawn_addy = 0x19D6B20;
