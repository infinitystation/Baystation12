/obj/structure/clank_cube
	name = "The Cube"
	desc = "An unknown cube-like structure made of clocks and music boxes. <span class='warning'>You feel uneasy standing near it.</span>"
	icon = 'icons/obj/structures.dmi'
	icon_state = "grille"
	density = 1
	anchored = 0

	var was_touched = 0
	var touch_sound = 'sound/effects/clank_cube_touched.ogg'

/obj/structure/clank_cube/New()
	..()
	return

/obj/structure/clank_cube/attack_hand(mob/user as mob)
	if(!was_touched)
		user.visible_message("<span class=\"warning\">\The [user] reaches out and touches \the [src].</span>", \
		"<span class=\"danger\">Suddenly, the cube starts humming from within..</span>")

		was_touched = 1

		playsound(src.loc, touch_sound, 20, 20, 20)
		spawn(300) Doom()
		return
	else
		user.visible_message("<span class=\"warning\">\The [src] does not respond to the touch anymore..</span>"

/obj/structure/clank_cube/proc/Doom()
	was_touched = 0
	return