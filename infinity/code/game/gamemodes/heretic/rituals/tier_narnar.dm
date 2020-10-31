/datum/ritual/apocalypse
	name = "Apocalypse Ritual"
	desc = "Prepare the dimensional barriers to be torn apart."

	requirments = list(/obj/effect/decal/cleanable/blood = 1,
					   /obj/item/organ/internal/heart = 1,
					   /obj/item/device/soulstone = 1,
					   /obj/item/organ/external/head = 1) //Yep, we need a god damn head.

	required_cultists = 9

	ritual_radius = 2

	ritual_flags = NEEDS_KNIFE | NEEDS_FLOOR | RITUAL_VERY_BLOODY

/datum/ritual/apocalypse/cast(var/obj/effect/rune/ritual_rune, var/mob/living/user)
	. = ..()
	var/mob/living/carbon/human/target = null

	for(var/mob/living/carbon/human/M in get_turf(ritual_rune))
		if(M.stat == DEAD)
			target = M
			break

	while(target.getFireLoss() < 100)
		target.fire_stacks = max(2, target.fire_stacks)
		target.IgniteMob()


	mass_incantation(ritual_rune, "Pasnar val'keriam usinar. Savrae ines amutan. Yam'toth remium il'tarat!")

	sleep(10)

	target.gib()

	mass_incantation(ritual_rune, "Ta'gh fara'qha fel d'amar det! Savrae ines amutan! Sas'so c'arta forbici!")
	command_announcement.Announce("High levels of bluespace interference detected nearby [station_name()]. \
								   The same effects were spotted before after failed attempt to tear bluespace barriers by Nar'Sien cultists.") //The crew must know that something is goin on since... eh, we need em to fight

	for(var/mob/living/carbon/C in GLOB.player_list)
		if(iscultist(C))
			continue

		to_chat(C, SPAN_WARNING("You feel a terrible headache. You also can hear something tearing apart... It definetly isn't good."))
		C.adjust_hallucination(70, 20)

	GLOB.cult.reality_torn = 1

	empulse(get_turf(ritual_rune), 8, 4, 2) //A VERY large EMP



/datum/ritual/narnar
	name = "Ritual of Dimensional Rending"
	desc = "Break the chains, that hold your dark god, Nar'Sie"
	requirments = list(/obj/effect/decal/cleanable/blood = 1,
					   /obj/item/organ/internal/heart = 1,
					   /obj/item/device/soulstone = 3,
					   /obj/item/organ/external/head = 1) //Pretty much the same.

	required_cultists = 9

	ritual_radius = 2

	ritual_flags = NEEDS_KNIFE | NEEDS_FLOOR | RITUAL_VERY_BLOODY | NEEDS_ARMOR

	noghosts = 1

/datum/ritual/narnar/cast(var/obj/effect/rune/ritual_rune, var/mob/living/user)
	. = ..()

	if((!GLOB.cult.reality_torn) || (!GLOB.cult.allow_narsie))
		return

	mass_incantation(ritual_rune, "Tok-lyr rqa'nap g'lt-ulotf!")

	var/the_end_comes = 0

	var/area/A = get_area(src)
	command_announcement.Announce("High levels of bluespace interference detected at \the [A]. Suspected wormhole forming. Break the process immediately.")

	while(check_cultists(ritual_rune) && the_end_comes < 300)
		if(check_cultists(ritual_rune) > 4)
			the_end_comes += 1

		if(check_cultists(ritual_rune) > 8)
			the_end_comes += 1

		if(check_cultists(ritual_rune) > 12)
			the_end_comes += 1

		if(check_cultists(ritual_rune) < 4)
			the_end_comes -= 1

		var/list/cultists = list()
		for(var/mob/living/cultist in orange(ritual_rune, ritual_radius))

			if(ishuman(cultist))
				var/mob/living/carbon/human/H = cultist
				if(H.species == "Cult" && noghosts)
					continue

			if(iscultist(cultist))
				cultists.Add(cultist)

		for(var/mob/living/M in cultists)
			if(prob(5))
				speak_incantation(M, pick("Hakkrutju gopoenjim.", "Nherasai pivroiashan.", "Firjji prhiv mazenhor.", "Tanah eh wakantahe.", "Obliyae na oraie.", "Miyf hon vnor'c.", "Wakabai hij fen juswix."))

		for(var/turf/T in range(ritual_rune, min(the_end_comes, 15)))
			if(prob(the_end_comes / 3))
				T.cultify()

		sleep(10)

	if(!check_cultists(ritual_rune))
		command_announcement.Announce("Bluespace anomaly has ceased.")
		return

	new /obj/singularity/narsie/large(get_turf(ritual_rune))
