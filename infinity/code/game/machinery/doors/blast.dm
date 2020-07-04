/obj/machinery/door/blast/proc/crush()
	for(var/mob/living/L in get_turf(src))
		if(ishuman(L)) //For humans
			var/mob/living/carbon/human/H = L
			H.adjustBruteLoss(DOOR_CRUSH_DAMAGE)
			H.Weaken(5)
			if(H.can_feel_pain())
				H.emote("scream")
		else if(istype(L, /mob/living/exosuit))
			L.apply_damage((DOOR_CRUSH_DAMAGE / 2), BRUTE)
		else //for simple_animals & borgs
			L.adjustBruteLoss(DOOR_CRUSH_DAMAGE)

/obj/machinery/door/blast/regular/admin/ex_act()
	return

/obj/machinery/door/blast/regular/admin/emp_act()
	return

/obj/machinery/door/blast/regular/admin/emag_act()
	return

/obj/machinery/door/blast/regular/admin/take_damage()
	return

/obj/machinery/door/blast/regular/evacshield

/obj/machinery/door/blast/regular/evacshield/proc/evacuation() //Literally shitcode of force_open but without sleep(8)
	src.operating = 1
	playsound(src.loc, open_sound, 100, 1)
	flick(icon_state_opening, src)
	src.set_density(0)
	update_nearby_tiles()
	src.update_icon()
	src.set_opacity(0)
	src.layer = open_layer
	src.operating = 0
