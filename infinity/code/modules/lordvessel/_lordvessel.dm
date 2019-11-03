/mob/living/var/list/known_things = list()

/obj/item/lordwessel
	name 								=	"lordvessel"
	desc 								=	"A bowl. You can see strange ligth at it's bottom."
	icon 								=	'infinity/obj/item/ds/lordvessel.dmi'
	icon_state							=	"lordvessel"
	color								=	"#fbfc9a"

	var/desc_know_what_it_is			=	"A great bowl, creation of gods. Allow user move through known areas. You can see strange light at it's bottom."

	var/teleportation_effect_icon_state =	"smoke"
	var/teleportation_effect_icon		=	'icons/effects/96x96.dmi'
	var/teleportation_effect_color		=	"#fbfc9a"
	var/teleportation_effect_possition	=	list()

	var/teleportsound					=	'infinity/sound/effects/lordvessel/ominous-bell.ogg'
	var/list/known_areas				=	list("(CANCEL)")

	var/is_silent_teleporting			=	0
	var/teleporing_in_progress			=	0

/obj/item/lordwessel/examine(mob/user)
	if(isliving(user))
		var/mob/living/U = user
		if(type in U.known_things || U.psi)
			desc = desc_know_what_it_is
			if(!is_silent_teleporting)
				desc += "<br>From [src]'s light you can hear silent belling.</span>"
	. = ..()
	desc = initial(desc)

/obj/item/lordwessel/attack_self(mob/user)
	. = ..()
	if(isliving(user))
		var/mob/living/U	=	user
		var/CH				=	"Say my path"
		to_chat(U, SPAN_OCCULT("<font size=3>You hear whispers: \"Your path is...\"</font>"))

		if(!teleporing_in_progress)
			if(U.psi)
				CH = alert(U, "You can touch light on bottom of [src]", "[src]", "Say my path", "Touch Light")
			switch(CH)
				if("Touch Light")
					if(alert(U, "Do you want to [is_silent_teleporting ? "ring in the" : "stop"] ominous bell in [src]'s light.", "[src]", "Yes", "No") == "Yes")
						is_silent_teleporting = !is_silent_teleporting
						if(is_silent_teleporting)	to_chat(U, SPAN_OCCULT("<font size=2>You stopped ominous bell in \icon[src] [src]'s light and now \icon[src] [src] will not remember new places, but bell will not belling around the world after translocations.</font>"))
						else						to_chat(U, SPAN_OCCULT("<font size=2>You make the ominous bell in \icon[src] [src]'s light swing again. And it start belling again. Now \icon[src] [src] will remember new places and belling around the world after translocations.</font>"))
						return 2
				if("Say my path")
					if(length(known_areas))
						visible_message("\icon[src] \the [src] start glowing")
						var/area/targetarea
						if(length(known_areas) > 1) targetarea = input(U, "You hear whispers: \"Your path is...\"") in known_areas
						else targetarea = known_areas[1]
						if(targetarea)
							if(istype(targetarea))
								U.say("My path is [targetarea.name]")
								sleep(2 SECONDS)
								teleport2(targetarea, U)
								if(!(type in U.known_things)) U.known_things += type
								return 1
							else
								to_chat(U, SPAN_OCCULT("You hear whispers: \"You won't to say as your path...\""))
								return 1.4
		else to_chat(U, SPAN_OCCULT("<font size=2>\"But you already in travel.\"</font>"))

/obj/item/lordwessel/proc/teleport2(area/A, mob/target)
	teleporing_in_progress			=	1
	if(!is_silent_teleporting)
		for(var/mob/M in GLOB.player_list)
			sound_to(M, teleportsound)
			to_world(SPAN_NOTICE("You hear ominous belling, far-far away from you."))
	var/mob/living/M				=	target
	var/turf/start					=	get_turf(M)
	var/turf/end					=	M.try_teleport(A)
	var/obj/effect/temporary/AN		=	new(get_step(start, SOUTHWEST), 10 SECONDS, teleportation_effect_icon, teleportation_effect_icon_state)
	var/obj/effect/temporary/E		=	new(get_step(end, SOUTHWEST), 20 SECONDS, teleportation_effect_icon, teleportation_effect_icon_state)
	var/obj/AN_tmp_target_holder	=	new(start)
	var/obj/E_tmp_target_holder		=	new(end)
	AN.color						=	teleportation_effect_color
	E.color							=	teleportation_effect_color
	for(var/obj/EF in list(AN, E))
		switch(length(teleportation_effect_possition))
			if(1)
				EF.pixel_x			=	teleportation_effect_possition[1]
				EF.pixel_y			=	teleportation_effect_possition[1]
			if(2)
				EF.pixel_x			=	teleportation_effect_possition[1]
				EF.pixel_y			=	teleportation_effect_possition[2]
	M.forceMove(AN_tmp_target_holder)
	sleep(6 SECONDS)
	M.dir = 2
	log_admin("[M] moved to [A] ([GET_ATOMLOC_HREF_FOR(M)]) from [start] ([GET_ATOMLOC_HREF_FOR(start)])")
	M.forceMove(E_tmp_target_holder)
	sleep(4 SECONDS)
	M.forceMove(end)
	teleporing_in_progress = 0
	qdel(AN_tmp_target_holder)
	qdel(E_tmp_target_holder)