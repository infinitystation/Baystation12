/obj/effect/fading
	name = "strange silhouette"
	icon = 'icons/effects/effects.dmi'
	icon_state = "energynet"
	anchored = 0
	mouse_opacity = 0
	var/duration = 50

/obj/effect/fading/Initialize(mapload, atom/mimiced_atom)
	. = ..()
	alpha = initial(alpha)
	if(mimiced_atom)
		name = mimiced_atom.name
		appearance = mimiced_atom.appearance
		set_dir(mimiced_atom.dir)
		mouse_opacity = 2

	animate(src, alpha = 0, time = duration)
	QDEL_IN(src, duration)

/obj/effect/fading/small_smoke
	name = "smoke"
	icon_state = "smoke"
	duration = 54
