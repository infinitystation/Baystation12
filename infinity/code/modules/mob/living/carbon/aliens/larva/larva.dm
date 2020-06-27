/mob/living/carbon/alien/larva
	name = "alien larva"
	real_name = "alien larva"
	icon = 'infinity/icons/mob/alien.dmi'
	icon_state = "alien"
	mob_size = MOB_TINY
	see_in_dark = 8

	speak_emote = list("шипит")
	icon_state = "larva"
	language = "Hivemind"
	species_language = "Xenophage"
	maxHealth = 25
	health = 25
	auto_progress = 0

	var/adult_form = /mob/living/carbon/human
	var/amount_grown = 0
	var/max_grown = 80
	var/time_of_birth
	var/can_namepick_as_adult = 0
	var/adult_name

/mob/living/carbon/alien/larva/can_feel_pain()
	return 0

/mob/living/carbon/alien/larva/New()
	verbs += /mob/living/proc/night_vision
	..()
	time_of_birth = world.time
	add_language("Xenophage")
	internal_organs |= new /obj/item/organ/internal/xeno/hivenode(src)
	create_reagents(100)

/mob/living/carbon/alien/larva/update_icons()

	var/state = 0
	if(amount_grown > max_grown*0.75)
		state = 2
	else if(amount_grown > max_grown*0.25)
		state = 1

	if(stat == DEAD)
		icon_state = "[initial(icon_state)][state]_dead"
	else if (stunned)
		icon_state = "[initial(icon_state)][state]_stun"
	else if(lying || resting)
		icon_state = "[initial(icon_state)][state]_sleep"
	else
		icon_state = "[initial(icon_state)][state]"

/mob/living/carbon/alien/larva/attack_ghost(var/mob/observer/ghost/user)
	if(!src)
		return
	if(src.mind)
		return
	if(jobban_isbanned(user, MODE_XENOMORPH))
		to_chat(user, SPAN_DANGER("У вас имеется бан на роль ксенофага. Вы не можете играть за них."))
		return
	var/confirm = alert(user, "Are you sure you want to join as a Xenophage larva?", "Become Larva", "No", "Yes")
	if(!src || confirm != "Yes")
		return
	if(!user || !user.ckey)
		return
	src.ckey = user.ckey
	GLOB.xenomorphs.add_antagonist(src.mind, 1)
	spawn(-1)
		if(user) qdel(user) // Remove the keyless ghost if it exists.

/mob/living/carbon/alien/larva/on_structure_offset() //too small
	return
