/mob/living
	var/list/known_things = list()
	var/teleporing_in_progress = 0

/obj/item/lordvessel
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

	var/teleport_cooldown				=	10 SECONDS
	var/last_teleporting_time

/obj/item/lordvessel/examine(mob/user)
	if(isliving(user))
		var/mob/living/U = user
		if(type in U.known_things || U.psi)
			desc = desc_know_what_it_is
			if(!is_silent_teleporting)
				desc += "<br>From [src]'s light you can hear silent belling."
	. = ..()
	desc = initial(desc)

/obj/item/lordvessel/attack_self(mob/user)
	. = ..()
	if(isliving(user))
		var/mob/living/U	=	user
		var/CH				=	"Say my path"
		to_chat(U, SPAN_OCCULT("<font size=3>You hear whispers: \"Your path is...\"</font>"))

		if(!U.teleporing_in_progress)
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
					if(!last_teleporting_time || last_teleporting_time < world.time)
						if(length(known_areas))
							visible_message("\icon[src] \the [src] start glowing")
							var/area/targetarea
							if(length(known_areas) > 1) targetarea = input(U, "You hear whispers: \"Your path is...\"") in known_areas
							else targetarea = known_areas[1]
							if(targetarea)
								if(istype(targetarea))
									U.say("My path is [targetarea.name]")
									U.teleporing_in_progress = 1
									sleep(2 SECONDS)
									teleport2(targetarea, U)
									if(!(type in U.known_things)) U.known_things += type
									return 1
								else
									to_chat(U, SPAN_OCCULT("You hear whispers: \"You won't to say us your path...\""))
									return 1.4
					else
						to_chat(U, SPAN_OCCULT("\icon[src] [src]'s bell is stuck. Maybe you need to wait?"))
		else to_chat(U, SPAN_OCCULT("<font size=2>\"But you already in travel.\"</font>"))

/obj/item/lordvessel/proc/omious_belling()
	for(var/mob/M in GLOB.player_list)
		sound_to(M, teleportsound)
		to_chat(M, SPAN_OCCULT("You hear ominous belling, far-far away from you."))

/obj/item/lordvessel/proc/teleport2(area/A, mob/T)
	if(isliving(T))
		var/mob/living/target = T
		target.teleporing_in_progress = 1
		if(!is_silent_teleporting)
			omious_belling()
		sleep(2 SECONDS)
		add_ash_screen_to(target)
		var/turf/start					=	get_turf(target)
		var/turf/end					=	target.try_teleport(A)
		var/obj/effect/temporary/AN		=	new(get_step(start, SOUTHWEST), 10 SECONDS, teleportation_effect_icon, teleportation_effect_icon_state)
		var/obj/effect/temporary/E		=	new(get_step(end, SOUTHWEST), 20 SECONDS, teleportation_effect_icon, teleportation_effect_icon_state)
		var/obj/AN_tmp_target_holder	=	new(start)
		var/obj/E_tmp_target_holder		=	new(end)
		for(var/obj/EF in list(AN, E))
			EF.color					=	teleportation_effect_color
			switch(length(teleportation_effect_possition))
				if(1)
					EF.pixel_x			=	teleportation_effect_possition[1]
					EF.pixel_y			=	teleportation_effect_possition[1]
				if(2)
					EF.pixel_x			=	teleportation_effect_possition[1]
					EF.pixel_y			=	teleportation_effect_possition[2]
		target.forceMove(AN_tmp_target_holder)
		sleep(4 SECONDS)
		target.dir = 2
		log_admin("[target] moved to [A] ([GET_ATOMLOC_HREF_FOR(target)]) from [start] ([GET_ATOMLOC_HREF_FOR(start)])")
		target.forceMove(E_tmp_target_holder)
		sleep(4 SECONDS)
		target.forceMove(end)
		target.teleporing_in_progress = 0
		remove_ash_of(target)
		qdel(AN_tmp_target_holder)
		qdel(E_tmp_target_holder)
		last_teleporting_time = world.time + teleport_cooldown