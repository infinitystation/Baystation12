/turf/open/ai_visible
	name = ""
	icon = PIC_IN_PIC_STANDART_ICON
	icon_state = "room_background"
//maybewillneed	flags_1 = NOJAUNT_1

/area/ai_multicam_room
	name = "ai_multicam_room"
	icon_state = "ai_camera_room"
	dynamic_lighting = 0
	ambience = list()
//maybewillneed	flags_1 = NONE

GLOBAL_DATUM(ai_camera_room_landmark, /obj/effect/landmark/ai_multicam_room)

/obj/effect/landmark/ai_multicam_room
	name = "ai camera room"
	icon = 'icons/effects/landmarks.dmi'
	icon_state = "x"

/obj/effect/landmark/ai_multicam_room/Initialize()
	. = ..()
	qdel(GLOB.ai_camera_room_landmark)
	GLOB.ai_camera_room_landmark = src

/obj/effect/landmark/ai_multicam_room/Destroy()
	if(GLOB.ai_camera_room_landmark == src)
		GLOB.ai_camera_room_landmark = null
	return ..()