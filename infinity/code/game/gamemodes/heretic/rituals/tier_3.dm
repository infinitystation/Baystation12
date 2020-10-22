/datum/ritual/massshift
	name = "Joined Souls Ritual"
	desc = "Using this ritual allows you to teleport every cultist to the rune."

	requirments = list(/obj/effect/decal/cleanable/blood = 1,
					   /obj/item/device/soulstone = 1,
					   /obj/item/weapon/book/tome = 0)

	required_cultists = 3

	ritual_flags = NEEDS_KNIFE | NEEDS_FLOOR | RITUAL_VERY_BLOODY | NEEDS_ARMOR

/datum/ritual/massshift/cast(var/obj/effect/rune/ritual_rune, var/mob/living/user)
	. = ..()

	if(!.)
		return

	for(var/datum/mind/M in GLOB.cult.current_antagonists)
		if(M.current && M.current.stat != DEAD)
			mass_incantation(ritual_rune, "Eha'wajae nerkaeh ja'raree!")
			if(M.current.buckled)
				var/obj/buckled = M.current.buckled
				buckled.unbuckle_mob()

			var/obj/effect/temporary/effect = new(get_turf(M.current), 8, 'infinity/icons/effects/effects.dmi', "cultout")
			effect.dir = M.current.dir

			M.current.forceMove(get_turf(ritual_rune))

			var/obj/effect/temporary/effect2 = new(get_turf(ritual_rune), 8, 'infinity/icons/effects/effects.dmi', "cultin")
			effect2.dir = M.current.dir
			sleep(max(1, 7 - check_cultists(ritual_rune)))

	performing = FALSE

/datum/ritual/god_eye
	name = "Eye of God"
	desc = "This eye allows you to see anything, that your cultists can see!"

	requirments = list(/obj/effect/decal/cleanable/blood = 1,
					   /obj/item/weapon/material/shard = 1,
					   /obj/item/organ/internal/eyes = 1)

	ritual_flags = NEEDS_KNIFE | RITUAL_BLOODY | NEEDS_FLOOR

	required_cultists = 1
	ritual_radius = 1

/datum/ritual/god_eye/cast(var/obj/effect/rune/ritual_rune, var/mob/living/user)
	. = ..()

	if(!.)
		return

	mass_incantation(ritual_rune, "Ja'opar ha'veha yu're!")

	new /obj/item/clothing/glasses/god_eye(get_turf(ritual_rune))
	performing = FALSE

/datum/ritual/see_ghosts
	name = "Vision of the Undead"
	desc = "You will be able to see ghosts after you complete this ritual!"

	requirments = list(/obj/effect/decal/cleanable/blood = 1,
					   /obj/item/device/soulstone = 1,
					   /obj/item/organ/internal/eyes = 1)

	ritual_flags = NEEDS_BOOK | NEEDS_KNIFE | RITUAL_BLOODY

	required_cultists = 1
	ritual_radius = 1

/datum/ritual/see_ghosts/cast(var/obj/effect/rune/ritual_rune, var/mob/living/user)
	. = ..()

	if(!.)
		return

	mass_incantation(ritual_rune, "Veya'hebe haurat'ere!")
	user.see_invisible = SEE_INVISIBLE_CULT
	performing = FALSE

/datum/ritual/bloody_bond
	name = "Blood Bond Ritual"
	desc = "After compliting this ritual, anybody who casted it will be bonded. If anyone from them dies, they all will die. But for every cultist who completed this ritual, they will get a health boost."

	requirments = list(/obj/effect/decal/cleanable/blood = 1,
					   /obj/item/device/soulstone = 0)

	ritual_flags = NEEDS_BOOK | NEEDS_KNIFE | RITUAL_VERY_BLOODY | NEEDS_FLOOR

	required_cultists = 3
	ritual_radius = 2 //BIG and THICK rune

/datum/ritual/bloody_bond/cast(var/obj/effect/rune/ritual_rune, var/mob/living/user)
	. = ..()

	if(!.)
		return

	var/list/bonds = list()
	for(var/mob/living/carbon/human/cultist in orange(ritual_rune, ritual_radius))
		if(iscultist(cultist))
			var/choice = alert(cultist, "Would you like to bond your life with others on this rune?",,"Yes","No")
			if(choice == "Yes")
				bonds.Add(cultist)
				speak_incantation(cultist, "Ahe'ohaja ware'opa!")

	for(var/mob/living/carbon/human/bonded in bonds)
		var/datum/active_effect/blood_bond/bond = new()
		bond.add_to_human(bonded)
		bond.blood_bonded = bonds
		for (var/o in bonded.organs)
			var/obj/item/organ/organ = o
			organ.vital = 0
			if (!BP_IS_ROBOTIC(organ))
				organ.rejuvenate(1)
				organ.max_damage *= 1.5
				organ.min_broken_damage = Floor(organ.max_damage * 0.75)

	performing = FALSE

/datum/ritual/blood_boil
	name = "Blood Boil Ritual"
	desc = "This ritual will boil the blood of your enemies!"

	requirments = list(/obj/effect/decal/cleanable/blood = 1)

	ritual_flags =  NEEDS_KNIFE | RITUAL_VERY_BLOODY | NEEDS_ARMOR

	required_cultists = 4
	ritual_radius = 1

/datum/ritual/blood_boil/cast(var/obj/effect/rune/ritual_rune, var/mob/living/user)
	. = ..()

	if(!.)
		return

	mass_incantation(ritual_rune, "Dedo ol'btoh!")

	var/list/mob/living/previous = list()
	var/list/mob/living/current = list()
	while(check_cultists(ritual_rune))
		for(var/mob/living/carbon/M in viewers(ritual_rune))
			if(iscultist(M))
				continue
			current |= M
			var/obj/item/weapon/nullrod/N = locate() in M
			if(N)
				continue
			M.take_overall_damage(5, 5)
			if(!(M in previous))
				if(M.should_have_organ(BP_HEART))
					to_chat(M, "<span class='danger'>Your blood boils!</span>")
				else
					to_chat(M, "<span class='danger'>You feel searing heat inside!</span>")
		previous = current.Copy()
		current.Cut()
		sleep(10)
		mass_incantation(ritual_rune, "Ko'eha va'epea!")

	performing = FALSE

/datum/ritual/necro_advanced
	name = "Revival Ritual"
	desc = "This ritual can raise dead. It looks almost perfect, but you think you can do something with mortal form..."

	requirments = list(/obj/effect/decal/cleanable/blood = 1,
					   /obj/item/organ/internal/heart = 1,
					   /obj/item/device/soulstone = 0)

	required_cultists = 3

	ritual_flags = NEEDS_KNIFE | NEEDS_FLOOR | RITUAL_VERY_BLOODY


/datum/ritual/necro_advanced/cast(var/obj/effect/rune/ritual_rune, var/mob/living/user)
	. = ..()

	if(!.)
		return

	var/mob/living/carbon/human/target = null

	for(var/mob/living/carbon/human/M in get_turf(src))
		if(M.stat == DEAD)
			target = M
			break

	if(!target)
		to_chat(user, SPAN_WARNING("You need somebody on the rune to revive!"))
		performing = FALSE
		return

	mass_incantation(ritual_rune, "Pasnar val'keriam usinar. Savrae ines amutan. Yam'toth remium il'tarat!")

	target.rejuvenate()

	GLOB.cult.add_antagonist(target.mind, ignore_role = 1, do_not_equip = 1)

	target.visible_message("<span class='warning'>\The [target]'s eyes glow with a faint red as \he stands up, slowly starting to breathe again.</span>", "<span class='warning'>Life... I'm alive again...</span>", "You hear liquid flow.")
	performing = FALSE

/datum/ritual/dark_chorus
	name = "Dark Chorus"
	desc = "This forbidden ritual will allow the acolytes to communicate withoud any signs of it and in any situation!"

	requirments = list(/obj/effect/decal/cleanable/blood = 1)

	required_cultists = 6

	ritual_flags = NEEDS_KNIFE | NEEDS_FLOOR | RITUAL_VERY_BLOODY | NEEDS_ARMOR

/datum/ritual/dark_chorus/cast(var/obj/effect/rune/ritual_rune, var/mob/living/user)
	. = ..()

	if(!.)
		return

	mass_incantation(ritual_rune, "Ha'taye raba'pehe! Ja'uayhrm nauhda! Waj'aueh ahyue!")

	GLOB.cult.chorus = 1

	for(var/datum/mind/H in GLOB.cult.current_antagonists)
		if(H.current)
			to_chat(H.current, "<span class='cult italic'>You feel your mind being shifted somewhere and connected to the Nar'Sie, Geometer of Blood! Now communicating with your cult will be much, much easier!</span>")

	performing = FALSE

/datum/ritual/silence
	name = "Silence Ritual"
	desc = "This ritual will mute the victim for 10 minutes straight."

	requirments = list(/obj/effect/decal/cleanable/blood = 1,
					   /obj/item/clothing/mask/muzzle = 1,
					   /obj/item/weapon/material/knife = 0) //E

	required_cultists = 3

	ritual_flags = NEEDS_KNIFE | NEEDS_FLOOR | RITUAL_BLOODY

/datum/ritual/silence/cast(var/obj/effect/rune/ritual_rune, var/mob/living/user)
	. = ..()

	if(!.)
		return

	var/obj/effect/decal/cleanable/blood/blood = locate() in get_turf(ritual_rune)

	if(length(blood.blood_DNA) == 0)
		ritual_rune.visible_message(SPAN_WARNING("[ritual_rune] starts glowing red, but fails to activate without a sample of victim's blood."))
		performing = FALSE
		return

	var/mob/living/carbon/human/cursing = null

	for(var/mob/living/carbon/human/H in GLOB.player_list)
		if(md5(H.real_name) == blood.blood_DNA[length(blood.blood_DNA)]) //Checks last blood sample
			cursing = H
			break

	if(!cursing)
		ritual_rune.visible_message(SPAN_WARNING("[ritual_rune] starts glowing red, but fails to activate without a sample of victim's blood."))
		performing = FALSE
		return

	mass_incantation(ritual_rune, "Ere'hewo ja'eyrep!")
	cursing.silent = 10 MINUTES
	performing = FALSE
