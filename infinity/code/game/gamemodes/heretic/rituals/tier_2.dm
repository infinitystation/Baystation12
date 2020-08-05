
//Tier 2 runes. Yep, main runes are here. T3 runes are very hard and powerful.

/datum/ritual/armor
	name = "Armorcalling Ritual"
	desc = "Creates a very strong armor, made out of bones."

	requirments = list(/obj/effect/decal/cleanable/blood = 1) //As usual.

	ritual_flags = NEEDS_BOOK | RITUAL_BLOODY | NEEDS_FLOOR

/datum/ritual/armor/cast(var/obj/effect/rune/ritual_rune, var/mob/living/user)
	. = ..()

	mass_incantation(ritual_rune, "Ta'gh fara'qha fel d'amar det!")

	var/obj/O = user.get_equipped_item(slot_wear_suit)
	if((O && !istype(O, /obj/item/clothing/suit/storage/hooded/cultrobes) && user.unEquip(O)) || !O)
		user.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/hooded/cultrobes(user), slot_wear_suit)

	O = user.get_equipped_item(slot_shoes)
	if((O && !istype(O, /obj/item/clothing/shoes/cult) && user.unEquip(O)) || !O) //We wanna shoes to drop OR to create new ones
		user.equip_to_slot_or_del(new /obj/item/clothing/shoes/cult(user), slot_shoes)

	O = user.get_equipped_item(slot_back)
	if(istype(O, /obj/item/weapon/storage) && !istype(O, /obj/item/weapon/storage/backpack/cultpack) && user.unEquip(O))
		var/obj/item/weapon/storage/backpack/cultpack/C = new /obj/item/weapon/storage/backpack/cultpack(user)
		user.equip_to_slot_or_del(C, slot_back)
		if(C && O)
			for(var/obj/item/I in O)
				I.forceMove(C)
	else if(!O)
		var/obj/item/weapon/storage/backpack/cultpack/C = new /obj/item/weapon/storage/backpack/cultpack(user)
		user.equip_to_slot_or_del(C, slot_back)

	user.update_icons()

/datum/ritual/cultistshift
	name = "Bloody Call Ritual"
	desc = "This ritual allows you to forcefully teleport a cultist to the rune."

	requirments = list(/obj/effect/decal/cleanable/blood = 1,
					   /obj/item/device/soulstone = 0) //E

	ritual_flags = NEEDS_BOOK | NEEDS_KNIFE | NEEDS_FLOOR

/datum/ritual/cultistshift/cast(var/obj/effect/rune/ritual_rune, var/mob/living/user)
	. = ..()

	var/list/cultists = list()
	for(var/datum/mind/M in GLOB.cult.current_antagonists)
		if(M.current && M.current.stat != DEAD)
			cultists |= M.current

	var/mob/living/cultist = input(user, "Who do you wish to call to the [ritual_rune]?", "Followers of the Geometer") as null|anything in (cultists - user)
	mass_incantation(ritual_rune, "N'ath reth sh'yro eth d'rekkathnor!")
	if(cultist.buckled)
		var/obj/buckled = cultist.buckled
		buckled.unbuckle_mob()

	var/obj/effect/temporary/effect = new(get_turf(cultist), 8, 'infinity/icons/effects/effects.dmi', "cultout")
	effect.dir = cultist.dir

	cultist.forceMove(get_turf(ritual_rune))

	var/obj/effect/temporary/effect2 = new(get_turf(ritual_rune), 8, 'infinity/icons/effects/effects.dmi', "cultin")
	effect2.dir = cultist.dir

/datum/ritual/spiritrealm
	name = "Spirit Realm Ritual"
	desc = "Spirit Realm Ritual will allow you to materialise nearby ghosts in weak, but humanoid form."

	requirments = list(/obj/effect/decal/cleanable/blood = 1,
					   /obj/item/weapon/book/tome = 1) //Ya need a spare tome for that

	required_cultists = 1

	ritual_flags = NEEDS_KNIFE | NEEDS_FLOOR | RITUAL_VERY_BLOODY


/datum/ritual/spiritrealm/cast(var/obj/effect/rune/ritual_rune, var/mob/living/user)
	. = ..()

	var/mob/observer/ghost/ghost
	for(var/mob/observer/ghost/O in range(get_turf(ritual_rune), 1))
		if(!O.client)
			continue
		if(O.mind && O.mind.current && O.mind.current.stat != DEAD)
			continue
		ghost = O
		break
	if(!ghost)
		ritual_rune.visible_message(SPAN_WARNING("The rune fizzles uselessly."))
		return

	var/mob/living/carbon/human/G = new(get_turf(ritual_rune))
	G.set_species("Cult")
	G.h_style  = ghost.client.prefs.h_style
	G.f_style  = ghost.client.prefs.f_style
	G.r_hair   = ghost.client.prefs.r_hair
	G.b_hair   = ghost.client.prefs.b_hair
	G.g_hair   = ghost.client.prefs.g_hair
	G.r_facial = ghost.client.prefs.r_facial
	G.b_facial = ghost.client.prefs.b_facial
	G.g_facial = ghost.client.prefs.g_facial
	G.key = ghost.key
	G.real_name = "spirit of [ghost.name]"
	G.gender = ghost.gender
	G.add_language(LANGUAGE_CULT)
	G.add_language(LANGUAGE_CULT_GLOBAL)

	GLOB.cult.add_antagonist(G.mind, ignore_role = 1, do_not_equip = 1)

	var/outfit_type = pick(/decl/hierarchy/outfit/cultghost)
	var/decl/hierarchy/outfit/cultghost_outfit = outfit_by_type(outfit_type)
	cultghost_outfit.equip(G)

	to_chat(G, "<span class='cult itallic'>You are a dark spirit, called by Nar'Sie cult. You must help the cult at all costs!</span>")

	while(get_turf(user) == get_turf(ritual_rune))
		user.take_overall_damage(0, 0.5)
		sleep(1)

	G.dust()

/datum/ritual/necro_basic
	name = "Imperfect Ritual"
	desc = "This ritual can raise dead in form of ghouls. They are much weaker and slower. Probably you can make the ritual more accurate if more acolytes will join the cult..."

	requirments = list(/obj/effect/decal/cleanable/blood = 1,
					   /obj/item/device/soulstone = 1)

	required_cultists = 1

	ritual_flags = NEEDS_KNIFE | NEEDS_FLOOR | RITUAL_VERY_BLOODY


/datum/ritual/necro_basic/cast(var/obj/effect/rune/ritual_rune, var/mob/living/user)
	. = ..()

	var/mob/living/carbon/human/target = null
	for(var/mob/living/carbon/human/M in get_turf(src))
		if(M.stat == DEAD)
			target = M
			break

	if(!target)
		to_chat(user, SPAN_WARNING("You need somebody on the rune to revive!"))
		return

	mass_incantation(ritual_rune, "Dedo ol'btoh! Ah'sau re'haba!")

	target.zombify_cult()

	GLOB.cult.add_antagonist(target.mind, ignore_role = 1, do_not_equip = 1)



/datum/ritual/blooddrain
	name = "Blood Drain Ritual"
	desc = "Drain blood of your enemies, regaining lost health."

	requirments = list(/obj/effect/decal/cleanable/blood = 1,
					   /obj/item/weapon/material/knife = 0) //You can literraly get the heart from the dead person ya wanna to raise. He will grow new ones

	required_cultists = 1

	ritual_flags = NEEDS_KNIFE | NEEDS_FLOOR | RITUAL_VERY_BLOODY

/datum/ritual/blooddrain/cast(var/obj/effect/rune/ritual_rune, var/mob/living/user)
	. = ..()

	var/mob/living/carbon/human/target = null
	for(var/mob/living/carbon/human/M in get_turf(src))
		if(!iscultist(M) && M.stat != DEAD)
			target = M
			break

	if(!target)
		to_chat(user, SPAN_WARNING("You need somebody on the rune to convert!"))
		return

	mass_incantation(ritual_rune, "Wa'awaue ha raha'ja!")

	var/speed = 1
	admin_attack_log(user, target, "Used a blood drain rune.", "Was victim of a blood drain rune.", "used a blood drain rune on")

	while(target.vessel.has_reagent(/datum/reagent/blood, speed))
		if(!target.vessel.has_reagent(/datum/reagent/blood, speed))
			to_chat(user, "<span class='warning'>This body has no blood in it.</span>")
			return

		target.vessel.remove_reagent(/datum/reagent/blood, speed)
		mass_incantation("Yu'gular faras desdae. Havas mithum javara. Umathar uf'kal thenar!")
		user.visible_message("<span class='warning'>Blood flows from \the [src] into \the [user]!</span>", "<span class='cult'>The blood starts flowing from \the [src] into your frail mortal body. [capitalize(english_list(heal_user(user, speed), nothing_text = "you feel no different"))].</span>", "You hear liquid flow.")

		speed = min(speed + 1, 20)
		sleep(3)

/datum/ritual/blooddrain/proc/heal_user(var/mob/living/carbon/human/user, var/speed = 1)
	if(!istype(user))
		return list("you feel no different")
	var/list/statuses = list()
	var/charges = speed
	var/use
	use = min(charges, user.species.blood_volume - user.vessel.total_volume)
	if(use > 0)
		user.vessel.add_reagent(/datum/reagent/blood, use)
		charges -= use
		statuses += "you regain lost blood"
		if(!charges)
			return statuses
	if(user.getBruteLoss() || user.getFireLoss())
		var/healbrute = user.getBruteLoss()
		var/healburn = user.getFireLoss()
		if(healbrute < healburn)
			healbrute = min(healbrute, charges / 2)
			charges -= healbrute
			healburn = min(healburn, charges)
			charges -= healburn
		else
			healburn = min(healburn, charges / 2)
			charges -= healburn
			healbrute = min(healbrute, charges)
			charges -= healbrute
		user.heal_organ_damage(healbrute, healburn, 1)
		statuses += "your wounds mend"
		if(!charges)
			return statuses
	if(user.getToxLoss())
		use = min(user.getToxLoss(), charges)
		user.adjustToxLoss(-use)
		charges -= use
		statuses += "your body stings less"
		if(!charges)
			return statuses
	if(charges >= 15)
		for(var/obj/item/organ/external/e in user.organs)
			if(e && e.status & ORGAN_BROKEN)
				e.status &= ~ORGAN_BROKEN
				statuses += "bones in your [e.name] snap into place"
				charges -= 15
				if(charges < 15)
					break
	if(!charges)
		return statuses
	var/list/obj/item/organ/damaged = list()
	for(var/obj/item/organ/I in user.internal_organs)
		if(I.damage)
			damaged += I
	if(damaged.len)
		statuses += "you feel pain inside for a moment that passes quickly"
		while(charges && damaged.len)
			var/obj/item/organ/fix = pick(damaged)
			fix.damage = max(0, fix.damage - min(charges, 1))
			charges = max(charges - 1, 0)
			if(fix.damage == 0)
				damaged -= fix

	if(charges)
		user.reagents.add_reagent(/datum/reagent/hell_water, charges)
		statuses += "you feel empowered"

	return statuses

/datum/ritual/curse_mirrors
	name = "Curse Of Mirrors"
	desc = "Victim will hear everybody as himself. Lasts 5 minutes."

	requirments = list(/obj/effect/decal/cleanable/blood = 1,
					   /obj/item/weapon/material/shard = 3)

	ritual_flags = NEEDS_KNIFE | RITUAL_BLOODY

	required_cultists = 1
	ritual_radius = 1

/datum/ritual/curse_pain/cast(var/obj/effect/rune/ritual_rune, var/mob/living/user)
	. = ..()
	var/obj/item/cursed

	for(var/obj/item/curse in get_turf(ritual_rune))
		if(!istype(curse, /obj/item/weapon/material/shard))
			cursed = curse
			break

	var/mob/living/carbon/human/cursing = null

	for(var/mob/living/carbon/human/try_to_curse in cursed.fingerprintsmob)
		if(iscultist(try_to_curse) || try_to_curse.stat == DEAD || !istype(try_to_curse))
			continue

		cursing = try_to_curse
		break

	if(!cursing)
		ritual_rune.visible_message(SPAN_WARNING("[ritual_rune] starts glowing red, but fails to activate without an item that victim touched."))
		return

	cursing.mirror_curse += 5 MINUTES

	mass_incantation("Ha'yahaje ra'wayanarar!")

/datum/ritual/weapon
	name = "Summon Weapon ritual"
	desc = "This ritual can summon a cult blade, capable of killing your enemies easily."

	requirments = list(/obj/effect/decal/cleanable/blood = 1) //Nothing special

	required_cultists = 1

	ritual_flags = NEEDS_BOOK | NEEDS_FLOOR | NEEDS_ARMOR

/datum/ritual/weapon/cast(var/obj/effect/rune/ritual_rune, var/mob/living/user)
	. = ..()
	mass_incantation(ritual_rune, "N'ath reth sh'yro eth d'raggathnor!")
	user.put_in_hands(new /obj/item/weapon/melee/cultblade(user))

/datum/ritual/shadowstone
	name = "Shadowstone ritual"
	desc = "This ritual will transmutate the glass shard into a shadowstone."

	requirments = list(/obj/effect/decal/cleanable/blood = 1,
					   /obj/item/weapon/material/shard = 1)

	required_cultists = 1

	ritual_flags = NEEDS_BOOK | NEEDS_FLOOR

/datum/ritual/shadowstone/cast(var/obj/effect/rune/ritual_rune, var/mob/living/user)
	mass_incantation("V'hajera re'thanara!")
	new /obj/item/device/flashlight/flashdark/stone(get_turf(ritual_rune))
