// Ported from Halo Station 13 Project
/* todo:
make it machinery
add wires
*/

#define TDP_CROSS_DELAY 3 SECONDS
#define TDP_PANEL_INTERRACT_DELAY 8 SECONDS
#define TDP_DOCKING_DELAY 20 SECONDS
#define TDP_BREAK_TYPE_EXPLOSION 1
#define TDP_BREAK_TYPE_MOVEMENT 0
#define TDP_MAX_CROSSED_WALLS 3

/obj/docking_port //it's useless. Just to keep things in one subtype
	name = "TDP master object"
	desc = "Чувак, ты не должен был видеть это."
	icon = 'infinity/icons/obj/overmap/docking_port.dmi'
	icon_state = "master"

	opacity = FALSE
	density = TRUE
	anchored = TRUE
	atom_flags = ATOM_FLAG_NO_TEMP_CHANGE | ATOM_FLAG_CLIMBABLE

	plane = DEFAULT_PLANE
	layer = BELOW_TABLE_LAYER

/obj/docking_port/CanPass(atom/movable/mover, turf/target, height=0, air_group=0)
	if(air_group || (height==0))
		return 1
	if(istype(mover, /obj/item/projectile))
		return 1
