#define AIHOLDERINIT AiHolder = new(src)
#define AIHOLDER_INITIALIZE(typeofHolder) ##typeofHolder/Initialize(loc, ...){. = ..(); AIHOLDERINIT}

#include "atom_helpers.dm"
#include "ai.dm"
#include "AiHolder/_AiHolder.dm"
#include "objects/turrets/_turret_control_setup.dm"
