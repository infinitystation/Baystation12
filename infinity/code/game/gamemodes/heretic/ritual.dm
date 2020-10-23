
//Flags of rituals

#define NEEDS_KNIFE 1
#define NEEDS_BOOK  2
#define NEEDS_ARMOR 4
#define NEEDS_FLOOR 8

#define RITUAL_BLOODY      16
#define RITUAL_VERY_BLOODY 32

/datum/ritual
	var/name = "Buggy Ritual"
	var/desc = "Summons an admin to ask you how you reached this shit. Report this!"

	var/requirments = list()
	var/ritual_flags = NEEDS_KNIFE

	var/required_cultists = 1
	var/ritual_radius = 1 //Basically 3x3 with radius 1

	var/noghosts = 0

	var/performing = FALSE

/datum/ritual/proc/speak_incantation(var/mob/living/user, var/incantation)
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		for(var/datum/active_effect/cult_tattoo/silence/tattoo in H.active_effects)
			if(istype(tattoo))
				return

	var/datum/language/L = all_languages[LANGUAGE_CULT]
	if(incantation && (L in user.languages))
		user.say(incantation, L)

/datum/ritual/proc/check_cultists(var/obj/effect/rune/ritual_rune, var/mob/user)
	var/cultists = 0
	for(var/mob/living/cultist in orange(ritual_rune, ritual_radius))

		if(ishuman(cultist))
			var/mob/living/carbon/human/H = cultist
			if(H.species == "Cult" && noghosts)
				continue

		if(iscultist(cultist))
			cultists += 1

	if(cultists < required_cultists)
		return 0

	return cultists

/datum/ritual/proc/mass_incantation(var/obj/effect/rune/ritual_rune, var/incantation)
	for(var/mob/cultist in range(ritual_radius, get_turf(ritual_rune)))
		if(iscultist(cultist))
			speak_incantation(cultist, incantation)

/datum/ritual/proc/cast(var/obj/effect/rune/ritual_rune, var/mob/living/user)

	if(performing)
		to_chat(user, SPAN_WARNING("Somebody is already performing a ritual on this rune."))
		return

	var/has_knife = 0
	var/has_tome = 0
	var/has_robes = 0
	var/cult_ground = 0

	performing = TRUE

	mass_incantation(ritual_rune, "Ba'haj glab'namra!")

	sleep(15)

	mass_incantation(ritual_rune, "Da gla'rar nao'reda!")

	if(istype(user.get_active_hand(), /obj/item/weapon/material/knife) || istype(user.get_inactive_hand(), /obj/item/weapon/material/knife) || istype(user.get_active_hand(), /obj/item/weapon/melee/cultblade/dagger) || istype(user.get_inactive_hand(), /obj/item/weapon/melee/cultblade/dagger))
		has_knife = 1

	if(istype(user.get_active_hand(), /obj/item/weapon/book/tome) || istype(user.get_inactive_hand(), /obj/item/weapon/book/tome))
		has_tome = 1

	if(istype(user.get_equipped_item(slot_head), /obj/item/clothing/head/culthood) && istype(user.get_equipped_item(slot_wear_suit), /obj/item/clothing/suit/storage/hooded/cultrobes) && istype(user.get_equipped_item(slot_shoes), /obj/item/clothing/shoes/cult))  //INF was /obj/item/clothing/suit/cultrobes
		has_robes = 1

	var/turf/T = get_turf(ritual_rune)
	if(T.holy)
		to_chat(user, SPAN_WARNING("This place is blessed, you may not perform rituals on it - defile it first."))
		performing = FALSE
		return

	if(!istype(T, /turf/simulated))
		to_chat(src, SPAN_WARNING("You need more space to perform a ritual here."))
		performing = FALSE
		return

	if(T.icon_state == "cult" || T.icon_state == "cult-narsie")
		cult_ground = 1

	if(ritual_flags & NEEDS_KNIFE && !has_knife)
		to_chat(user, SPAN_WARNING("You can't perform this ritual without a knife!"))
		performing = FALSE
		return

	if(ritual_flags & NEEDS_BOOK && !has_tome)
		to_chat(user, SPAN_WARNING("The ritual is too complex to perform it without a tome!"))
		performing = FALSE
		return

	sleep(15)

	mass_incantation(ritual_rune, "Ka'anahe ra jab'a'rate!")

	if(ritual_flags & NEEDS_ARMOR && !has_robes)
		to_chat(user, SPAN_WARNING("You can't manage to perform this ritual without a propper set of clothing!"))
		performing = FALSE
		return

	if(ritual_flags & NEEDS_FLOOR && !cult_ground)
		to_chat(user, SPAN_WARNING("Your connection to this world is too strong on non-defiled floor!"))
		performing = FALSE
		return

	for(var/obj in requirments)
		if(!locate(obj) in get_turf(ritual_rune))
			var/atom/ay = new obj(ritual_rune)
			to_chat(user, SPAN_WARNING("You need [ay] on the rune to perform this ritual!"))
			qdel(ay)
			performing = FALSE
			return

	for(var/obj in requirments)
		if(requirments[obj] > 1)
			var/list/listing = locate(obj) in get_turf(ritual_rune)
			if(listing.len < requirments[obj])
				var/atom/ay = new obj(ritual_rune)
				to_chat(user, SPAN_WARNING("You need at least [requirments[obj]] [ay] on the rune to perform this ritual!"))
				performing = FALSE
				qdel(ay)
				return


	sleep(15)

	if(!check_cultists(ritual_rune))
		return

	mass_incantation(ritual_rune, "Ya za'nere da per'ene!")

	for(var/obj in requirments)
		if(requirments[obj])
			for(var/i = 1 to requirments[obj])
				var/req_item = locate(obj) in get_turf(ritual_rune)
				qdel(req_item)

	if(ritual_flags & RITUAL_BLOODY)
		if(ishuman(user))
			var/mob/living/carbon/human/H = user
			H.drip(5, get_turf(ritual_rune))
			H.visible_message(SPAN_WARNING("[H] cuts his finger and lets some blood out!"))
			sleep(15)
			if(!check_cultists(ritual_rune))
				performing = FALSE
				return

	if(ritual_flags & RITUAL_VERY_BLOODY)
		if(ishuman(user))
			var/mob/living/carbon/human/H = user
			for(var/i = 1 to 3)
				H.drip(5, get_turf(ritual_rune))
			H.visible_message(SPAN_WARNING("[H] cuts his wrist and blood sprays from the cut!"))
			sleep(15)
			if(!check_cultists(ritual_rune))
				performing = FALSE
				return

	sleep(15)

	mass_incantation(ritual_rune, "Da'hamar ja'haba!")

	sleep(15)

	return 1


/mob/living/carbon/human/proc/zombify_cult()
	src.rejuvenate()
	ChangeToHusk()
	mutations |= MUTATION_CLUMSY //No shooting zombies
	src.visible_message("<span class='danger'>\The [src]'s skin decays before your very eyes!</span>", "<span class='cult italic'>Your entire body is ripe with pain as it is consumed down to flesh and bones. You feel that Nar'Sie, The Geometer of Blood called you from the world of dead to serve him!</span>")
	if (src.mind)
		GLOB.cult.add_antagonist(mind, ignore_role = 1, do_not_equip = 1)

	log_admin("[key_name(src)] has transformed into a cult zombie!")
	if (should_have_organ(BP_HEART))
		vessel.add_reagent(/datum/reagent/blood, species.blood_volume - vessel.total_volume)
	for (var/o in organs)
		var/obj/item/organ/organ = o
		organ.vital = 0
		if(istype(organ, /obj/item/organ/internal))
			if (!BP_IS_ROBOTIC(organ))
				organ.rejuvenate(1)
				organ.max_damage *= 3
				organ.min_broken_damage = Floor(organ.max_damage * 0.75)
		else
			if (!BP_IS_ROBOTIC(organ))
				organ.rejuvenate(1)
				organ.max_damage *= 0.5
				organ.min_broken_damage = Floor(organ.max_damage * 0.75)
	playsound(get_turf(src), 'sound/hallucinations/wail.ogg', 20, 1)
