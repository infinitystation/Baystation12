GLOBAL_DATUM_INIT(cult, /datum/antagonist/cultist, new)

/proc/iscultist(var/mob/player)
	if(!GLOB.cult || !player.mind)
		return 0
	if(player.mind in GLOB.cult.current_antagonists)
		return 1

/datum/antagonist/cultist
	id = MODE_CULTIST
	role_text = "Cultist"
	role_text_plural = "Cultists"
	restricted_jobs = list(/datum/job/lawyer, /datum/job/captain, /datum/job/hos)
	protected_jobs = list(/datum/job/officer, /datum/job/warden, /datum/job/detective)
	blacklisted_jobs = list(/datum/job/ai, /datum/job/cyborg, /datum/job/chaplain, /datum/job/psychiatrist, /datum/job/submap)
	feedback_tag = "cult_objective"
	antag_indicator = "hudcultist"
	welcome_text = "You have a tome in your possession; one that will help you start the cult. Use it well and remember - there are others."
	victory_text = "The cult wins! It has succeeded in serving its dark masters!"
	loss_text = "The staff managed to stop the cult!"
	victory_feedback_tag = "win - cult win"
	loss_feedback_tag = "loss - staff stopped the cult"
	flags = ANTAG_SUSPICIOUS | ANTAG_RANDSPAWN | ANTAG_VOTABLE
	hard_cap = 5
	hard_cap_round = 6
	initial_spawn_req = 3
	initial_spawn_target = 4
	antaghud_indicator = "hudcultist"
	skill_setter = /datum/antag_skill_setter/station

	var/allow_narsie = 1
	var/powerless = 0
	var/chorus = 0
	var/list/chosens = list()
	var/cult_level = 1
	var/last_chosen_time = 0
	var/reality_torn = 0
	var/datum/mind/sacrifice_target
	var/list/obj/effect/rune/teleport/teleport_runes = list()
	var/list/bloodstones = list()
	var/list/spires = list()
	var/list/rune_strokes = list()
	var/list/sacrificed = list()
	var/cult_rating = 0
	var/list/cult_rating_bounds = list(CULT_RUNES_1, CULT_RUNES_2, CULT_RUNES_3, CULT_RUNES_4, CULT_GHOSTS_1, CULT_GHOSTS_2, CULT_GHOSTS_3, CULT_GHOSTS_4)
	var/max_cult_rating = 0
	var/conversion_blurb = "You catch a glimpse of the Realm of Nar-Sie, the Geometer of Blood. You now see how flimsy the world is, you see that it should be open to the knowledge of That Which Waits. Assist your new compatriots in their dark dealings. Their goals are yours, and yours are theirs. You serve the Dark One above all else. Bring It back."

	faction = "cult"
	ambitious = 0
/datum/antagonist/cultist/create_objectives(var/datum/mind/cultist, override = 1)
	if(!..())
		return

/datum/antagonist/cultist/create_global_objectives()

	if(!..())
		return

	global_objectives = list()
	global_objectives |= new /datum/objective/cult/eldergod
	var/datum/objective/cult/sacrifice/sacrifice = new()
	sacrifice.find_target()
	sacrifice_target = sacrifice.target
	global_objectives |= sacrifice

/datum/antagonist/cultist/equip(var/mob/living/carbon/human/player)

	if(!..())
		return 0

	var/obj/item/weapon/book/tome/T = new(get_turf(player))
	var/list/slots = list (
		"backpack" = slot_in_backpack,
		"left pocket" = slot_l_store,
		"right pocket" = slot_r_store,
		"left hand" = slot_l_hand,
		"right hand" = slot_r_hand,
	)
	for(var/slot in slots)
		player.equip_to_slot(T, slot)
		if(T.loc == player)
			break
	var/obj/item/weapon/storage/S = locate() in player.contents
	if(istype(S))
		T.forceMove(S)

	var/obj/item/weapon/melee/cultblade/dagger/D = new(get_turf(player))
	for(var/slot in slots)
		player.equip_to_slot(D, slot)
		if(D.loc == player)
			break
	if(istype(S))
		D.forceMove(S)

/datum/antagonist/cultist/remove_antagonist(var/datum/mind/player, var/show_message, var/implanted)
	if(!..())
		return 0
	if(implanted)
		return 0
	to_chat(player.current, "<span class='danger'>An unfamiliar white light flashes through your mind, cleansing the taint of the dark-one and the memories of your time as his servant with it.</span>")
	player.ClearMemories(type)
	if(show_message)
		player.current.visible_message("<span class='notice'>[player.current] looks like they just reverted to their old faith!</span>")
	remove_cult_magic(player.current)
	remove_cultiness(CULTINESS_PER_CULTIST)

/datum/antagonist/cultist/can_become_antag(var/datum/mind/player, var/ignore_role)
	if(..())
		if(player.current)
			if(ishuman(player.current))
				var/mob/living/carbon/human/H = player.current
				if(istype(H.species, /datum/species/human/cult))
					return 1
				if(H.isSynthetic())
					return 0
				if(H.species.species_flags & SPECIES_FLAG_NO_SCAN)
					return 0
				return 1

			else if(isnewplayer(player.current))
				if(player.current.client && player.current.client.prefs)
					var/datum/species/S = all_species[player.current.client.prefs.species]
					if(S && (S.species_flags & SPECIES_FLAG_NO_SCAN))
						return 0
					if(player.current.client.prefs.organ_data[BP_CHEST] == "cyborg") // Full synthetic.
						return 0
					return 1
	if(player.current && istype(player.current, /mob/living/simple_animal/construct))
		var/mob/living/simple_animal/construct/C = player.current
		return !C.is_angelic

 	return 0

/datum/antagonist/cultist/add_antagonist(var/datum/mind/player, var/ignore_role, var/do_not_equip, var/move_to_spawn, var/do_not_announce, var/preserve_appearance)
	. = ..()
	if(.)
		to_chat(player, "<span class='cult'>[conversion_blurb]</span>")
		if(player.current && !istype(player.current, /mob/living/simple_animal/construct))
			player.current.add_language(LANGUAGE_CULT)

/datum/antagonist/cultist/remove_antagonist(var/datum/mind/player, var/show_message, var/implanted)
	. = ..()
	if(. && player.current && !istype(player.current, /mob/living/simple_animal/construct))
		player.current.remove_language(LANGUAGE_CULT)

/datum/antagonist/cultist/update_antag_mob(var/datum/mind/player)
	. = ..()
	add_cultiness(CULTINESS_PER_CULTIST)
	add_cult_magic(player.current)

/datum/antagonist/cultist/proc/add_cultiness(var/amount)
	cult_rating += amount
	var/old_rating = max_cult_rating
	max_cult_rating = max(max_cult_rating, cult_rating)
	if(old_rating >= CULT_MAX_CULTINESS)
		return
	var/list/to_update = list()
	for(var/i in cult_rating_bounds)
		if((old_rating < i) && (max_cult_rating >= i))
			to_update += i

	if(to_update.len)
		update_cult_magic(to_update)

/datum/antagonist/cultist/proc/update_cult_magic(var/list/to_update)
	if(CULT_RUNES_1 in to_update)
		cult_level = 2
		for(var/datum/mind/H in GLOB.cult.current_antagonists)
			if(H.current)
				to_chat(H.current, FONT_LARGE("<span class='cult'>Act II.</span>"))
				to_chat(H.current, "<span class='cult'>The veil between this world and beyond grows thin, and your power grows.</span>")
				add_cult_magic(H.current)

	if(CULT_RUNES_2 in to_update)
		cult_level = 3
		for(var/datum/mind/H in GLOB.cult.current_antagonists)
			if(H.current)
				to_chat(H.current, FONT_LARGE("<span class='cult'>Act III.</span>"))
				to_chat(H.current, "<span class='cult'>You feel that the fabric of reality is tearing.</span>")
				add_cult_magic(H.current)

	if(CULT_RUNES_3 in to_update)
		cult_level = 4
		for(var/datum/mind/H in GLOB.cult.current_antagonists)
			if(H.current)
				to_chat(H.current, FONT_LARGE("<span class='cult'>Act IV.</span>"))
				to_chat(H.current, "<span class='cult'>The veil is torn apart and now you are almost near your target.</span>")
				add_cult_magic(H.current)

	if(CULT_RUNES_4 in to_update) //It has its own tier but eh, it basically is just needed for narnar runes to work
		for(var/datum/mind/H in GLOB.cult.current_antagonists)
			if(H.current)
				to_chat(H.current, FONT_LARGE("<span class='cult'>Act V.</span>"))
				to_chat(H.current, "<span class='cult'>The world is at end. The veil is as thin as ever.</span>")
				add_cult_magic(H.current)

	if((CULT_GHOSTS_1 in to_update) || (CULT_GHOSTS_2 in to_update) || (CULT_GHOSTS_3 in to_update) || (CULT_GHOSTS_4 in to_update))
		for(var/mob/observer/ghost/D in SSmobs.mob_list)
			add_ghost_magic(D)

	for(var/obj/structure/cult/spire/spire in spires)
		spire.update_icon()

/datum/antagonist/cultist/proc/offer_uncult(var/mob/M)
	if(!iscultist(M) || !M.mind)
		return

	to_chat(M, "<span class='cult'>Do you want to abandon the cult of Nar'Sie? <a href='?src=\ref[src];confirmleave=1'>ACCEPT</a></span>")

/datum/antagonist/cultist/Topic(href, href_list)
	if(href_list["confirmleave"])
		GLOB.cult.remove_antagonist(usr.mind, 1)

/datum/antagonist/cultist/proc/remove_cultiness(var/amount)
	cult_rating = max(0, cult_rating - amount)

/datum/antagonist/cultist/proc/add_cult_magic(var/mob/M)
	M.verbs += Tier1Runes

	if(max_cult_rating >= CULT_RUNES_1)
		M.verbs += Tier2Runes

		if(max_cult_rating >= CULT_RUNES_2)
			M.verbs += Tier3Runes

			if(max_cult_rating >= CULT_RUNES_3)
				M.verbs += Tier4Runes

				if(max_cult_rating >= CULT_RUNES_4)
					M.verbs += TierNarNarRunes


/datum/antagonist/cultist/proc/remove_cult_magic(var/mob/M)
	M.verbs -= Tier1Runes
	M.verbs -= Tier2Runes
	M.verbs -= Tier3Runes
	M.verbs -= Tier4Runes
	M.verbs -= TierNarNarRunes

/mob/proc/cult_communicate()
	set category = "Cult Magic"
	set name = "Communicate"

	var/chorus = GLOB.cult.chorus

	if(ishuman(src))
		var/mob/living/carbon/human/H = src
		for(var/datum/active_effect/cult_tattoo/chorus/tattoo in H.active_effects)
			if(istype(tattoo))
				chorus = TRUE

	if(incapacitated() && !chorus)
		to_chat(src, "<span class='warning'>Not when you are incapacitated.</span>")
		return

	if(!chorus)
		message_cult_communicate()
		remove_blood_simple(3)

	var/input = input(src, "Please choose a message to tell to the other acolytes.", "Voice of Blood", "")
	if(!input)
		return

	if(!chorus)
		whisper("[input]")

	input = sanitize(input)
	log_and_message_admins("used a communicate verb to say '[input]'")
	for(var/datum/mind/H in GLOB.cult.current_antagonists)
		if(H.current && !H.current.stat)
			to_chat(H.current, "<span class='cult'>Acolyte [real_name]: [input]</span>")

/mob/living/carbon/cult_communicate()
	if(incapacitated(INCAPACITATION_RESTRAINED))
		to_chat(src, "<span class='warning'>You need at least your hands free to do this.</span>")
		return
	..()

/mob/proc/message_cult_communicate()
	return

/mob/living/carbon/human/message_cult_communicate()
	if(GLOB.cult.chorus)
		return
	say("Yo'toke ra na'sure", wishpering = 1)

/datum/reagent/hell_water
	name = "Hell water"
	reagent_state = LIQUID
	color = "#0050a1"
	metabolism = REM * 0.1

/datum/reagent/hell_water/affect_ingest(var/mob/living/carbon/M, var/alien, var/removed)
	if(iscultist(M))
		M.AdjustParalysis(-1)
		M.AdjustStunned(-1)
		M.AdjustWeakened(-1)
		M.add_chemical_effect(CE_PAINKILLER, 40)
		M.add_chemical_effect(CE_SPEEDBOOST, 1)
		M.adjustOxyLoss(-10 * removed)
		M.heal_organ_damage(5 * removed, 5 * removed, 1)
		M.adjustToxLoss(-5 * removed)
	else
		M.fire_stacks = max(2, M.fire_stacks)
		M.IgniteMob()
