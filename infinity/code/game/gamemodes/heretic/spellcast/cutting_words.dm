/mob/living/carbon/human
	var/list/cutted_spells = list()

/obj/item/weapon/melee/cultblade/dagger/attack_self(var/mob/living/carbon/human/user)
	to_chat(user, "<span class='warning'>You prepare [src] for carving ancient words.</span>")

	var/spell = input(user, "Would you like to carve on your arm?", "Prepare your spell", "") as null|text

	if(!do_after(user,10))
		return

	user.visible_message(SPAN_WARNING("[user] finishes carving something on his wrist with [src]!"))

	user.cutted_spells.Add(spell)


/mob/living/carbon/human/proc/activate_carvings()
	set name = "Activate Carvings"
	set category = "Cult Magic"
	var/choice = input("Choose the spell to activate") in cutted_spells

	var/multiplier = 1
	var/pain_mod = 1
	var/additional_affects = list()


	var/list/global_words = list()

	for(var/wordtype in subtypesof(/datum/heretic_word))
		var/datum/heretic_word/word = new wordtype
		if(!word.word)
			continue
		global_words.Add(word)

	var/list/targets = list()


	var/list/listing = splittext(choice, " ")

	var/list/acting_words = list()

	for(var/word in listing)

		var/datum/heretic_word/act_word = null

		for(var/datum/heretic_word/wordy in global_words)
			if(wordy.word == word)
				act_word = wordy
				break

		if(!act_word)
			continue

		acting_words.Add(act_word)
		multiplier *= act_word.power_affect

	for(var/datum/heretic_word/act_word in acting_words)
		if(!act_word)
			return

		if(istype(act_word, /datum/heretic_word/way))
			var/datum/heretic_word/way/way_word = act_word
			targets = way_word.get_targets(targets, src, additional_affects, multiplier, choice)
			additional_affects = way_word.get_affects(targets, src, additional_affects, multiplier, choice)

	if("Strong" in additional_affects)
		pain_mod *= 4

	if("Weak" in additional_affects)
		pain_mod *= 0.25

	if(targets && targets.len != 0)
		multiplier /= targets.len

	if(multiplier == 0) //In case they manage to do this shit
		multiplier = 0.1

	for(var/datum/heretic_word/act_word in acting_words)

		if(!act_word)
			continue

		for(var/atom/A in targets)
			//if("Unholy" in additional_affects || !locate(/obj/item/weapon/nullrod) in A)

			act_word.affect(A, multiplier, src, "Mass" in additional_affects)

		var/datum/language/L = all_languages[LANGUAGE_CULT]
		if(L in languages && !("Quiet" in additional_affects))
			say(act_word.word, L)

	if(!("Long" in additional_affects))
		cutted_spells.Remove(choice)

	var/obj/item/organ/external/O = get_organ(pick(BP_L_HAND, BP_R_HAND))
	if(!O)
		adjustBruteLoss(pain_mod * 2)
		adjustFireLoss(pain_mod)
		return

	apply_damage(pain_mod * 2, BRUTE, O)
	apply_damage(pain_mod, BURN, O)