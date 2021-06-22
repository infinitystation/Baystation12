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

// Бластдуры - гигантские стальные пластины БЕЗ ПАНЕЛИ УПРАВЛЕНИЯ. Ты чо емагаешь, чорт? Иди кнопку емагай.
/obj/machinery/door/blast/emag_act(remaining_charges, var/override = FALSE)
	if(!override)
		return
	. = ..()
