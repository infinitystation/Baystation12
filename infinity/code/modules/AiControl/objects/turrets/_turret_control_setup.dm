//turrets
#define TURRET_COLOR "#aacc00"
#define TURRET_COLOR_CLOSED "#00aa00"
//mobs
#define TURRET_ALLOWED_COLOR "#fff000"
#define TURRET_ENEMY_COLOR "#aa0000"
//doors
#define TURRET_DOOR_OPEN_COLOR "#00aa99"
#define TURRET_DOOR_CLOSED_COLOR "#663300"
//walls
//#define TURRET_WALL_COLOR "#333366"
#define TURRET_WALL_COLOR "#6666aa"

#define IM_ICON 'infinity/icons/obj/screen/fullscreen/turret_matrix.dmi'


#include "turret_matrix.dm"
#include "turret_control.dm"

#undef TURRET_COLOR
#undef TURRET_COLOR_CLOSED

#undef TURRET_ALLOWED_COLOR
#undef TURRET_ENEMY_COLOR

#undef TURRET_DOOR_OPEN_COLOR
#undef TURRET_DOOR_CLOSED_COLOR

#undef TURRET_WALL_COLOR

#undef IM_ICON
