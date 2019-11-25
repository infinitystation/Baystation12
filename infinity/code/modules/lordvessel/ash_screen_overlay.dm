/obj/screen/fullscreen/ash
	icon = 'icons/effects/96x96.dmi'
	icon_state = "smoke"
	screen_loc = "WEST,SOUTH to EAST-2,NORTH-2"
	color = "#fbfc9a"

/obj/item/lordvessel/proc/add_ash_screen_to(mob/living/target)
	target.set_fullscreen(target.teleporing_in_progress, "ashly", /obj/screen/fullscreen/ash)

/obj/item/lordvessel/proc/remove_ash_of(mob/living/target)
	target.clear_fullscreen("ashly", 2 SECONDS)