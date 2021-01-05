/datum/active_effect
	var/duration //In ticks. Handled in Life()
	var/infinite = FALSE
	var/mob/living/carbon/human/owner

/datum/active_effect/proc/add_to_human(var/mob/living/carbon/human/H)
	H.active_effects.Add(src)
	owner = H

/datum/active_effect/proc/handle_effect()
	if(!infinite)
		duration -= 1
		if(duration < 1)
			handle_removal()

/datum/active_effect/proc/handle_removal()
	owner.active_effects.Remove(src)
	qdel(src)

/datum/active_effect/proc/handle_death()
	handle_removal()

/datum/active_effect/proc/attack_hand(var/atom/A)
	return 0

/datum/active_effect/proc/bullet_act(var/obj/item/projectile/P, var/def_zone)
	return 0

/datum/active_effect/proc/no_pain()
	return 0

/datum/active_effect/proc/handle_heard_msg(var/message)
	return message

/datum/active_effect/proc/handle_heard_name(var/speaker_name)
	return speaker_name

/datum/active_effect/proc/handle_speech(var/message)
	return message

/datum/active_effect/proc/handle_fire()
	return 0

/datum/active_effect/mirror_curse
	duration = 5 MINUTES

/datum/active_effect/mirror_curse/handle_heard_name(var/speaker_name)
	speaker_name = owner.real_name
	return speaker_name

/datum/active_effect/necromancy
	infinite = TRUE

/datum/active_effect/necromancy/no_pain()
	return 1

/datum/active_effect/blood_bond
	var/list/blood_bonded = list()
	infinite = TRUE

/datum/active_effect/blood_bond/no_pain()
	return 0

/datum/active_effect/blood_bond/no_painy/no_pain()
	return 1

/datum/active_effect/blood_bond/handle_death()
	for(var/mob/living/carbon/human/H in blood_bonded)
		if(H == owner)
			continue

		for(var/datum/active_effect/blood_bond/effect in H.active_effects)
			effect.handle_removal() //So they won't recurse

		H.dust()

	owner.active_effects.Remove(src)
	owner.dust()
	qdel(src)

	return 0

/datum/active_effect/cult_tattoo
	var/name = ""
	var/icon_state = ""
	var/tier = 0
	infinite = TRUE

/datum/active_effect/cult_tattoo/silence
	name = "Silent Casting"
	tier = 1
	icon_state = "silence"

/datum/active_effect/cult_tattoo/fast
	name = "Fast Runedrawing"
	tier = 1
	icon_state = "fast"

/datum/active_effect/cult_tattoo/dagger
	name = "Blood Stealing"
	tier = 1
	icon_state = "dagger"

/datum/active_effect/cult_tattoo/memorise
	name = "No Tome"
	tier = 2
	icon_state = "memorise"

/datum/active_effect/cult_tattoo/chorus
	name = "Dark Chorus"
	tier = 2
	icon_state = "chorus"

/datum/active_effect/cult_tattoo/unholy
	name = "Unholy Blood"
	tier = 2
	icon_state = "holy"

/datum/active_effect/cult_tattoo/bloodpool
	name = "Blood Sucking"
	tier = 3
	icon_state = "bloodpool"

/datum/active_effect/cult_tattoo/bloodpool/handle_effect()
	var/obj/effect/decal/cleanable/blood/blood = locate() in get_turf(owner)
	if(istype(blood))
		owner.vessel.add_reagent(/datum/reagent/blood, round(blood.amount / 2))
		qdel(blood)
	. = ..()

/datum/active_effect/cult_tattoo/sigil
	name = "Shortcut Creation"
	tier = 3
	icon_state = "sigil"

/datum/active_effect/cult_tattoo/sigil/attack_hand(var/atom/A)
	if(!istype(A, /turf/simulated/wall))
		return
	var/turf/simulated/wall/wall = A
	if(locate(/obj/effect/sigil) in wall)
		return
	if(owner.should_have_organ(BP_HEART) && owner.vessel && owner.vessel.has_reagent(/datum/reagent/blood, max(50, owner.species.blood_volume * 0.5)))
		owner.vessel.remove_reagent(/datum/reagent/blood, 50)
		owner.visible_message(SPAN_WARNING("[owner] cuts their wrist and starts drawing something on the [wall]!"))
		if(!do_after(owner, 240, wall))
			return
		new /obj/effect/sigil(wall)


/datum/active_effect/cult_tattoo/manifest
	name = "Dark Form"
	tier = 3
	icon_state = "manifest"

/datum/active_effect/cult_tattoo/manifest/add_to_human(var/mob/living/carbon/human/H)
	. = ..()
	owner.species.blood_color = "#2b1217"
	owner.species.flesh_color = "#d5d4d3"
	owner.species.brute_mod = 1.25
	owner.species.burn_mod = 1.25

/datum/active_effect/cult_tattoo/manifest/no_pain()
	return 1

/datum/active_effect/cult_tattoo/phoenix
	name = "Phoenix"
	tier = 4
	icon_state = "phoenix"

/datum/active_effect/cult_tattoo/phoenix/handle_fire()
	for(var/obj/item/organ/external/E in owner.organs)
		if(prob(20))
			E.take_external_damage(burn = -1, used_weapon = "fire") //Decent healing
	return 1

/datum/active_effect/cult_tattoo/mirror
	name = "Illusion Creating"
	tier = 4
	icon_state = "mirror"

	var/illusions = 3

/datum/active_effect/cult_tattoo/mirror/bullet_act(var/obj/item/projectile/P, var/def_zone)
	if(illusions > 0)
		illusions--
		addtimer(CALLBACK(src, .proc/readd), 450)
		if(prob(60))
			var/mob/living/simple_animal/hostile/illusion/M = new(owner.loc)
			M.faction = list("cult")
			M.Copy_Parent(owner, 70, 10, 5)
			M.target_mob = P.firer
		else
			var/mob/living/simple_animal/hostile/illusion/escape/E = new(owner.loc)
			E.Copy_Parent(owner, 70, 10)
			E.target_mob = owner

/datum/active_effect/cult_tattoo/mirror/proc/readd()
	illusions++

/datum/active_effect/cult_tattoo/repulse
	name = "Power Repulse"
	tier = 4
	icon_state = "repulse"

/datum/active_effect/cult_tattoo/repulse/attack_hand(var/atom/A)
	if(owner.a_intent != I_DISARM && owner.a_intent != I_HURT)
		return

	if(isliving(A))
		var/mob/living/L = A
		var/throwdir = get_dir(owner, L)
		L.throw_at(get_edge_target_turf(L, throwdir),1,1)
