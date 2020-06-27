/datum/species/xenos/get_bodytype(var/mob/living/carbon/H)
	return "Xenophage"

/datum/species/xenos/can_understand(var/mob/other)
	if(istype(other,/mob/living/carbon/alien/larva))
		return 1
	return 0

/datum/species/xenos/hug(var/mob/living/carbon/human/H,var/mob/living/target)
	H.visible_message("<span class='notice'>[H] caresses [target] with countless prickling, needle-like legs.</span>", \
					"<span class='notice'>You caress [target] with countless prickling, needle-like legs.</span>")

/datum/species/xenos/handle_post_spawn(var/mob/living/carbon/human/H)
	if(H.mind)
		H.mind.reset()
		H.mind.assigned_role = "Alien"
		H.mind.special_role = "Alien"

	var/decl/cultural_info/culture/hidden/xenophage/culture = SSculture.get_culture(force_cultural_info[TAG_CULTURE])
	if(istype(culture))
		culture.caste_number++
		H.real_name = culture.get_random_name(H)
		H.SetName(H.real_name)
	..()

/datum/species/xenos/handle_environment_special(var/mob/living/carbon/human/H)
	if(H.getBruteLoss() + H.getFireLoss() >= total_health)
		H.death() //rip species and human mechanics
		return

	if(H.alpha < 255)
		if(H.check_alien_ability(1))
			if(!locate(/obj/structure/alien/weeds) in get_turf(H))
				H.alpha += 4
		else
			H.alpha = 255
			to_chat(H, SPAN_ALIEN("Вы более не можете поддерживать свою маскировку"))

	H.set_see_in_dark(8)
	H.see_invisible  = 25

	var/turf/T = H.loc
	if(!T) return
	var/datum/gas_mixture/environment = T.return_air()
	if(!environment) return

	var/obj/item/organ/internal/xeno/plasmavessel/P = H.internal_organs_by_name["plasma vessel"]

	P.stored_plasma += weeds_plasma_rate * 0.25

	var/obj/structure/alien/weeds/plant = locate() in T

	if(plant)
		slowdown = initial(slowdown) - 0.25
	else
		slowdown = initial(slowdown)

	if(environment.gas["phoron"] > 0 || plant)
		if(!regenerate(H))
			P.stored_plasma += weeds_plasma_rate * 2
			P.stored_plasma = min(max(P.stored_plasma,0),P.max_plasma)
	else
		started_healing["\ref[H]"] = null
	..()

/datum/species/xenos/proc/regenerate(var/mob/living/carbon/human/H)

	var/heal_rate = weeds_heal_rate
//	var/mend_prob = 10
	if (!H.lying)
		heal_rate = weeds_heal_rate / 2
//		mend_prob = 1

	if(!H.resting || !started_healing["\ref[H]"])
		started_healing["\ref[H]"] = world.time
	if(world.time - started_healing["\ref[H]"] > accelerated_healing_threshold)
		heal_rate *= 2
//		mend_prob *= 5


	//heal internal organs
	for(var/obj/item/organ/I in H.internal_organs)
		if(I.damage > 0)
			I.damage = max(I.damage - heal_rate, 0)
			if (prob(5))
				to_chat(H, "<span class='alium'>You feel a soothing sensation within your [I.parent_organ]...</span>")
			return 1
/* they cannot break bones or get artery cut anymore
	//next mend broken bones, approx 10 ticks each
	for(var/obj/item/organ/external/E in H.bad_external_organs)
		if(prob(mend_prob))
			if(E.status & ORGAN_ARTERY_CUT)
				E.status &= ~ORGAN_ARTERY_CUT
				. = 1
			else if((E.status & ORGAN_BROKEN) && E.mend_fracture())
				. = 1
			else if(E.status & ORGAN_TENDON_CUT)
				E.status &= ~ORGAN_TENDON_CUT
				. = 1
		if(.)
			to_chat(H, "<span class='alium'>You feel something mend itself inside your [E.name].</span>")
			return TRUE
*/

	//heal damages
	// Recover blood due laser's mechanic
	if(H.vessel.total_volume < H.vessel.maximum_volume)
		H.regenerate_blood(heal_rate*7)
	if (H.getOxyLoss())
		H.adjustOxyLoss(-heal_rate)
		return TRUE
	if (H.getBruteLoss())
		H.adjustBruteLoss(-heal_rate)
		return TRUE
	if (H.getFireLoss())
		H.adjustFireLoss(-heal_rate)
		return TRUE

	return FALSE

/datum/species/xenos/disarm_attackhand(var/mob/living/carbon/human/attacker, var/mob/living/carbon/human/target)
	attacker.do_attack_animation(target)

	if(target.w_uniform)
		target.w_uniform.add_fingerprint(attacker)

	var/push_mod = min(max(1 + attacker.get_skill_difference(SKILL_COMBAT, target), 1), 3)

	target.apply_effect(push_mod * 0.1, STUN, 0)
	target.apply_effect(push_mod, WEAKEN, 0)

	playsound(target.loc, 'sound/weapons/thudswoosh.ogg', 50, 1, -1)

	target.visible_message("<span class='danger'>[attacker] has takled [target] down!</span>")

/datum/hud_data/alien

	icon = 'infinity/icons/mob/screen1_alien.dmi'
	has_a_intent =  1
	has_m_intent =  1
	has_warnings =  1
	has_hands =     1
	has_drop =      1
	has_throw =     1
	has_resist =    1
	has_pressure =  0
	has_nutrition = 0
	has_bodytemp =  0
	has_internals = 0

	gear = list(
		"o_clothing" =   list("loc" = ui_belt,      "name" = "Suit",         "slot" = slot_wear_suit, "state" = "equip",  "dir" = SOUTH),
		"head" =         list("loc" = ui_id,        "name" = "Hat",          "slot" = slot_head,      "state" = "hair"),
		"storage1" =     list("loc" = ui_storage1,  "name" = "Left Pocket",  "slot" = slot_l_store,   "state" = "pocket"),
		"storage2" =     list("loc" = ui_storage2,  "name" = "Right Pocket", "slot" = slot_r_store,   "state" = "pocket"),
		)
