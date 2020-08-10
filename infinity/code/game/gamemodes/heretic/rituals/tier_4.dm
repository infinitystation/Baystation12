/datum/ritual/necro_max
	name = "Necromantic Ritual"
	desc = "This ritual will raise dead people, while making them much stronger that they were before."

	requirments = list(/obj/effect/decal/cleanable/blood = 1,
					   /obj/item/organ/internal/heart = 1,
					   /obj/item/device/soulstone = 1)

	required_cultists = 5

	ritual_flags = NEEDS_KNIFE | NEEDS_FLOOR | RITUAL_VERY_BLOODY | NEEDS_ARMOR


/datum/ritual/necro_max/cast(var/obj/effect/rune/ritual_rune, var/mob/living/user)
	. = ..()
	var/mob/living/carbon/human/target = null

	for(var/mob/living/carbon/human/M in get_turf(src))
		if(M.stat == DEAD)
			target = M
			break

	if(!target)
		to_chat(user, SPAN_WARNING("You need somebody on the rune to revive!"))
		return

	mass_incantation(ritual_rune, "Pasnar val'keriam usinar. Savrae ines amutan. Yam'toth remium il'tarat!")

	target.rejuvenate()

	GLOB.cult.add_antagonist(target.mind, ignore_role = 1, do_not_equip = 1)

	target.visible_message("<span class='warning'>\The [target]'s eyes glow with a faint red as \he stands up, slowly starting to breathe again.</span>", "<span class='warning'>Life... I'm alive again... I feel... Immortal.</span>", "You hear liquid flow.")

	for (var/o in target.organs)
		var/obj/item/organ/organ = o
		organ.vital = 0
		var/datum/active_effect/no_pain/necromancy/no_pain = new()
		no_pain.add_to_human(target)
		if (!BP_IS_ROBOTIC(organ))
			organ.rejuvenate(1)
			organ.max_damage *= 1.2 //Not as cool as bloodbond, but still.
			organ.min_broken_damage = Floor(organ.max_damage * 0.75)

/datum/ritual/wall_mega
	name = "Shieldcasting Ritual"
	desc = "This ritual will create an impassible sphere around the rune."

	requirments = list(/obj/effect/decal/cleanable/blood = 1)

	required_cultists = 4

	ritual_flags = NEEDS_BOOK | NEEDS_FLOOR | NEEDS_ARMOR


/datum/ritual/wall_mega/cast(var/obj/effect/rune/ritual_rune, var/mob/living/user)
	. = ..()

	var/list/ignore_turfs = list()

	for(var/turf/T in range(1, ritual_rune))
		ignore_turfs.Add(T)

	for(var/turf/T in range(2, ritual_rune))
		if(T in ignore_turfs)
			continue

		var/obj/effect/cultwall/wall = locate() in T
		if(wall)
			wall.health = wall.max_health
			continue
		wall = new(T, "#ffffff", ritual_rune)

	mass_incantation(ritual_rune, "Khari'd! Eske'te tannin!")

/datum/ritual/weapon_bloody
	name = "Summon Bloody Bastard Ritual"
	desc = "This ritual can summon a bloody bastard, an eldritch sword that can rapidly harvest souls of non-belivers."

	requirments = list(/obj/effect/decal/cleanable/blood = 1,
					   /obj/item/weapon/material/knife = 1)

	required_cultists = 3

	ritual_flags = NEEDS_KNIFE | NEEDS_FLOOR | NEEDS_ARMOR | RITUAL_BLOODY

/datum/ritual/weapon/cast(var/obj/effect/rune/ritual_rune, var/mob/living/user)
	. = ..()
	mass_incantation(ritual_rune, "H'ayepaen ja'enemrahd!")
	user.put_in_hands(new /obj/item/weapon/melee/cultbastard(user))


/datum/ritual/hellhunter
	name = "Summon Hellhunter Glasses Ritual"
	desc = "Summon pair of hell glasses that will protect you from bright light and allow you to see people through walls"

	requirments = list(/obj/effect/decal/cleanable/blood = 1,
					   /obj/item/device/soulstone = 1,
					   /obj/item/clothing/glasses = 1)

	required_cultists = 1

	ritual_flags = NEEDS_KNIFE | NEEDS_FLOOR | RITUAL_BLOODY

/datum/ritual/hellhunter/cast(var/obj/effect/rune/ritual_rune, var/mob/living/user)
	. = ..()
	mass_incantation(ritual_rune, "Wa'harjare naje'yakanja!")
	new /obj/item/clothing/glasses/tacgoggles/cult(get_turf(ritual_rune))


/datum/ritual/dark_phoenix
	name = "Dark Phoenix Ritual"
	desc = "This ritual will put victim on a very, very long fire."

	requirments = list(/obj/effect/decal/cleanable/blood = 1,
					   /obj/item/device/soulstone = 1,
					   /obj/item/weapon/flame/lighter = 1,
					   /obj/item/weapon/paper = 1)

	required_cultists = 3

	ritual_flags = NEEDS_KNIFE | NEEDS_FLOOR | NEEDS_ARMOR | RITUAL_BLOODY

/datum/ritual/dark_phoenix/cast(var/obj/effect/rune/ritual_rune, var/mob/living/user)
	. = ..()

	var/obj/item/cursed

	for(var/obj/item/curse in get_turf(ritual_rune))
		if(!(curse.type in requirments))
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

	while(cursing.stat != DEAD && check_cultists(ritual_rune))
		mass_incantation(ritual_rune, "Wa'hwaye ja'ieyane!")
		cursing.fire_stacks = FIRE_MAX_STACKS //T4 rune, what the fuck ya wanted
		cursing.IgniteMob()
		sleep(20 * rand(1, 2.5))
