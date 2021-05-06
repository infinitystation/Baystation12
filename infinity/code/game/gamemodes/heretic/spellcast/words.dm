/*
//Basics

	to_chat(user, "")

	to_chat(user, "<span class='cult italic'>Wa'hag ra</span>") //Stun
	to_chat(user, "<span class='cult italic'>Nar'ene</span>") //Mute
	to_chat(user, "<span class='cult italic'>Tag'nerea</span>") //Handcuff
	to_chat(user, "<span class='cult italic'>Ka'anahe</span>") //Pain
	to_chat(user, "<span class='cult italic'>Jab'a'rate</span>") //EMP
	to_chat(user, "<span class='cult italic'>Ya'za'nere</span>") //Teleport
	to_chat(user, "<span class='cult italic'>Khari'd</span>") //Convert(Things and synths)
	to_chat(user, "<span class='cult italic'>Mah'weyh</span>") //Hallucinate
	to_chat(user, "<span class='cult italic'>Car'tafo</span>") //Invisiblility
	to_chat(user, "<span class='cult italic'>Mir'kanas</span>") //Heal

	//Modyfiers

	to_chat(user, "")

	to_chat(user, "<span class='cult italic'>Bejer'ehe</span>")  // Strong(Gives more damage to caster)
	to_chat(user, "<span class='cult italic'>Il'tarat</span>") //Weak(Gives lower damage to caster)
	to_chat(user, "<span class='cult italic'>Ol'btoh</span>") //Unholy(Makes your spell shit, but it will affect chap)
	to_chat(user, "<span class='cult italic'>Ev'loso</span>") //Quiet(Weaker, but nobody can see/hear its activation)
	to_chat(user, "<span class='cult italic'>Mud'gib</span>") //Long(Allows you to not re-prepair it)

	//Ways of activation

	to_chat(user, "")

	to_chat(user, "<span class='cult italic'>Ger'be'rah</span>")  //Targeted melee Ger'be'rah Jab'a'rate
	to_chat(user, "<span class='cult italic'>De'erah</span>") //All non-living atoms
	to_chat(user, "<span class='cult italic'>Ja'wana</span>") //In area(Cultists)
	to_chat(user, "<span class='cult italic'>Kaote'r</span>") //In area(Non-cultists)
	to_chat(user, "<span class='cult italic'>Uba'rate</span>") //Self

*/

/datum/heretic_word
	var/word

	var/power_affect = 1 //Multiplier. Uses when there's more than one effect. Counts like [multiple of all spells except the last one] / [amount of targets]

/datum/heretic_word/proc/affect(var/atom/A, var/power = 1, var/mob/living/caster, var/mass = 0)

/datum/heretic_word/stun
	word = "Wa'hag ra"
	power_affect = 0.6 //Kinda powerful

/datum/heretic_word/stun/affect(var/atom/A, var/power = 1, var/mob/living/caster, var/mass = 0)
	if(istype(A, /mob))
		var/mob/M = A
		M.Stun(5 * power)
		M.Weaken(10 * power)

/datum/heretic_word/mute
	word = "Nar'ene"
	power_affect = 0.75

/datum/heretic_word/mute/affect(var/atom/A, var/power = 1, var/mob/living/caster, var/mass = 0)
	if(istype(A, /mob/living))
		var/mob/living/L = A
		L.silent = 10 SECONDS * power

/datum/heretic_word/cuff
	word = "Tag'nerea"
	power_affect = 0.5 //Causes to drop stuff and fiddle from the cuffs :)

/datum/heretic_word/cuff/affect(var/atom/A, var/power = 1, var/mob/living/caster, var/mass = 0)
	if(istype(A, /mob/living/carbon))
		var/mob/living/carbon/C = A
		var/obj/item/handcuffs/wizard/shadow/cuffs = new(get_turf(C))
		cuffs.place_handcuffs(C, caster, mass)

/datum/heretic_word/pain
	word = "Ka'anahe"
	power_affect = 0.75

/datum/heretic_word/pain/affect(var/atom/A, var/power = 1, var/mob/living/caster, var/mass = 0)
	if(istype(A, /mob/living/carbon))
		var/mob/living/carbon/C = A
		C.adjustHalLoss(30)
		if(prob(30) && C.can_feel_pain() && !C.silent)
			C.emote("scream")

/datum/heretic_word/emp
	word = "Jab'a'rate"
	power_affect = 0.75

/datum/heretic_word/emp/affect(var/atom/A, var/power = 1, var/mob/living/caster, var/mass = 0)
	empulse(A, 1 * power, 3 * power)

/datum/heretic_word/teleport
	word = "Ya'za'nere"
	power_affect = 0.2 //Since its teleport...

/datum/heretic_word/teleport/affect(var/atom/movable/A, var/power = 1, var/mob/living/caster, var/mass = 0)
	if(mass)
		return //NOPE

	var/list/runes = list()
	for(var/obj/effect/rune/teleport/T in GLOB.cult.teleport_runes)
		runes.Add("[T.destination]" = T)

	var/choice = input("Choose the destination rune") in runes

	if(!choice)
		return

	A.dropInto(get_turf(runes[choice]))

/datum/heretic_word/convert
	word = "Khari'd"
	power_affect = 0.6

/datum/heretic_word/convert/affect(var/atom/A, var/power = 1, var/mob/living/caster, var/mass = 0)
	if(istype(A, /turf))
		var/turf/T = A
		T.cultify()
		return

	if(istype(A, /obj/machinery/door/airlock) || istype(A, /obj/machinery/door/unpowered))
		if(!do_after(caster,50))
			return
		new /obj/machinery/door/unpowered/simple/cult(get_turf(A))
		//new /obj/effect/temporary(get_turf(A), 4.5, 'infinity/icons/effects/cult.dmi', "door_glow")
		qdel(A)
		return

	if(istype(A, /mob/living/silicon/robot))
		if(mass)
			return
		var/mob/living/silicon/robot/R = A
		var/construct = alert(caster, "Please choose which type of construct you wish to create.",,"Artificer", "Wraith", "Juggernaut")
		R.color = "#000000"
		if(!do_after(caster, 75, R))
			return
		var/ctype
		switch(construct)
			if("Artificer")
				ctype = /mob/living/simple_animal/construct/builder
			if("Wraith")
				ctype = /mob/living/simple_animal/construct/wraith
			if("Juggernaut")
				ctype = /mob/living/simple_animal/construct/armoured
		var/mob/living/simple_animal/construct/C = new ctype(get_turf(R))
		C.key = R.key
		GLOB.cult.add_antagonist(C.mind)
		qdel(R)

	if(istype(A, /obj/item/stack/material/plasteel))
		var/obj/item/stack/material/plasteel/M = A
		var/obj/item/stack/material/cult/C = new(get_turf(M))
		C.amount = M.amount
		qdel(M)
	if(istype(A, /obj/item/stack/material/steel))
		var/obj/item/stack/material/steel/M = A
		if(M.amount == 50)
			new /obj/structure/constructshell/cult(get_turf(M))
			qdel(M)

/datum/heretic_word/hallucinate
	word = "Mah'weyh"
	power_affect = 0.75

/datum/heretic_word/hallucinate/affect(var/atom/A, var/power = 1, var/mob/living/caster, var/mass = 0)
	if(istype(A, /mob/living/carbon))
		var/mob/living/carbon/C = A

		C.adjust_hallucination(70 * power, 20 * power)

/datum/heretic_word/invisibility
	word = "Car'tafo"
	power_affect = 0.1 //OH MY GAWD

/datum/heretic_word/invisibility/affect(var/atom/A, var/power = 1, var/mob/living/caster, var/mass = 0)
	new /obj/effect/effect/smoke(A)
	A.alpha = 10 / power //You barely can see it

	addtimer(CALLBACK(src, .proc/revert_alpha, A), power * 40 SECONDS) //40 * 0.1 == 4 seconds basically

/datum/heretic_word/invisibility/proc/revert_alpha(var/atom/A)
	A.alpha = initial(A.alpha)

/datum/heretic_word/heal
	word = "Mir'kanas"
	power_affect = 0.5

/datum/heretic_word/mute/affect(var/atom/A, var/power = 1, var/mob/living/caster, var/mass = 0)
	if(istype(A, /mob/living))
		var/mob/living/L = A
		L.adjustBruteLoss(power * -10)
		L.adjustFireLoss(power * -10)
		L.adjustToxLoss(power * -5)
		L.adjustOxyLoss(power * -5)



/datum/heretic_word/way
	power_affect = 1

/datum/heretic_word/way/proc/get_targets(var/list/targets, var/mob/living/caster, var/list/affects, var/power = 1, var/spellphrase = "")
	return targets

/datum/heretic_word/way/proc/get_affects(var/list/targets, var/mob/living/caster, var/list/affects, var/power = 1, var/spellphrase = "")
	return affects



/datum/heretic_word/way/strong
	word = "Bejer'ehe"
	power_affect = 2

/datum/heretic_word/way/strong/get_affects(var/list/targets, var/mob/living/caster, var/list/affects, var/power = 1, var/spellphrase = "")
	affects.Add("Strong")
	return affects


/datum/heretic_word/way/weak
	word = "Il'tarat"
	power_affect = 0.5

/datum/heretic_word/way/weak/get_affects(var/list/targets, var/mob/living/caster, var/list/affects, var/power = 1, var/spellphrase = "")
	affects.Add("Weak")
	return affects


/datum/heretic_word/way/unholy
	word = "Ol'btoh"
	power_affect = 0.75

/datum/heretic_word/way/unholy/get_affects(var/list/targets, var/mob/living/caster, var/list/affects, var/power = 1, var/spellphrase = "")
	affects.Add("Unholy")
	return affects


/datum/heretic_word/way/quiet
	word = "Ev'loso"
	power_affect = 0.75

/datum/heretic_word/way/quiet/get_affects(var/list/targets, var/mob/living/caster, var/list/affects, var/power = 1, var/spellphrase = "")
	affects.Add("Quiet")
	return affects


/datum/heretic_word/way/long
	word = "Mud'gib"

/datum/heretic_word/way/long/get_affects(var/list/targets, var/mob/living/caster, var/list/affects, var/power = 1, var/spellphrase = "")
	affects.Add("Long")
	return affects


/datum/heretic_word/way/self
	word = "Uba'rate"

/datum/heretic_word/way/self/get_targets(var/list/targets, var/mob/living/caster, var/list/affects, var/power = 1, var/spellphrase = "")
	targets.Add(caster)
	return targets


/datum/heretic_word/way/items
	word = "De'erah"

/datum/heretic_word/way/items/get_targets(var/list/targets, var/mob/living/caster, var/list/affects, var/power = 1, var/spellphrase = "")
	for(var/obj/target in range(4 * power, get_turf(caster)))
		targets.Add(target)

	for(var/turf/simulated/target in range(4 * power, get_turf(caster)))
		targets.Add(target)

	return targets

/datum/heretic_word/way/items/get_affects(var/list/targets, var/mob/living/caster, var/list/affects, var/power = 1, var/spellphrase = "")
	affects.Add("Mass")
	return affects

/datum/heretic_word/way/noncult
	word = "Kaote'r"

/datum/heretic_word/way/noncult/get_targets(var/list/targets, var/mob/living/caster, var/list/affects, var/power = 1, var/spellphrase = "")
	for(var/mob/target in range(6 * power, get_turf(caster)))
		if(!iscultist(target))
			targets.Add(target)

	return targets

/datum/heretic_word/way/noncult/get_affects(var/list/targets, var/mob/living/caster, var/list/affects, var/power = 1, var/spellphrase = "")
	affects.Add("Mass")
	return affects

/datum/heretic_word/way/cult
	word = "Ja'wana"

/datum/heretic_word/way/cult/get_targets(var/list/targets, var/mob/living/caster, var/list/affects, var/power = 1, var/spellphrase = "")
	for(var/mob/target in range(6 * power, get_turf(caster)))
		if(iscultist(target))
			targets.Add(target)

	return targets

/datum/heretic_word/way/cult/get_affects(var/list/targets, var/mob/living/caster, var/list/affects, var/power = 1, var/spellphrase = "")
	affects.Add("Mass")
	return affects

/datum/heretic_word/way/hand
	word = "Ger'be'rah"

/datum/heretic_word/way/hand/get_targets(var/list/targets, var/mob/living/caster, var/list/affects, var/power = 1, var/spellphrase = "")
	if(istype(caster, /mob/living/carbon/human))
		var/mob/living/carbon/human/H = caster
		if(H.l_hand && H.r_hand)
			to_chat(H, SPAN_WARNING("Your hands are full."))
			return targets
		var/obj/item/spellhand/spell = new(H)
		H.put_in_hands(spell)
		spell.spellphrase = spellphrase
	return targets



/obj/item/spellhand
	name = "burning hand"
	desc = "A burning hand, which is used to cast bloody spells..."

	icon = 'infinity/icons/obj/cult.dmi'
	icon_state = "spellhand"

	item_icons = list(
		slot_l_hand_str = 'infinity/icons/mob/onmob/items/lefthand.dmi',
		slot_r_hand_str = 'infinity/icons/mob/onmob/items/righthand.dmi',
		)

	canremove = 0
	anchored = TRUE
	throwforce = 0 //Just to be on the safe side
	throw_range = 0
	throw_speed = 0
	force = 0

	var/spellphrase = ""

/obj/item/spellhand/afterattack(atom/target, mob/user, proximity)
	. = ..()
	if(!proximity)
		return
	cast_spell(target, user)
	qdel(src)

/obj/item/spellhand/proc/cast_spell(atom/target, mob/user)
	var/multiplier = 1
	var/pain_mod = 1
	var/additional_affects = list()

	var/list/global_words = list()

	var/mob/living/carbon/holder = loc

	for(var/wordtype in subtypesof(/datum/heretic_word))
		var/datum/heretic_word/word = new wordtype
		if(!word.word)
			continue
		global_words.Add(word)


	var/list/listing = splittext(spellphrase, " ")

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

		if(istype(act_word, /datum/heretic_word/way) && !istype(act_word, /datum/heretic_word/way/hand))
			var/datum/heretic_word/way/way_word = act_word
			additional_affects = way_word.get_affects(list(target), src, additional_affects, multiplier, spellphrase)

	if("Strong" in additional_affects)
		pain_mod *= 4

	if("Weak" in additional_affects)
		pain_mod *= 0.25

	for(var/datum/heretic_word/act_word in acting_words)

		if(!act_word)
			continue

		act_word.affect(target, multiplier, user, "Mass" in additional_affects)

	var/datum/language/L = all_languages[LANGUAGE_CULT]

	if(ishuman(holder))
		var/mob/living/carbon/human/H = holder

		var/obj/item/organ/external/O = H.get_organ(pick(BP_L_HAND, BP_R_HAND))
		if(!O)
			H.adjustBruteLoss(pain_mod * 2)
			H.adjustFireLoss(pain_mod)
		else
			H.apply_damage(pain_mod * 2, BRUTE, O)
			H.apply_damage(pain_mod, BURN, O)
		H.remove_blood_simple(pain_mod * 2)

		for(var/datum/active_effect/cult_tattoo/silence/tattoo in H.active_effects)
			if(istype(tattoo))
				return

	if(!("Quiet" in additional_affects))
		holder.say(spellphrase, L)
