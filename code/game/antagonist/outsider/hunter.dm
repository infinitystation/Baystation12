GLOBAL_DATUM_INIT(hunters, /datum/antagonist/hunter, new)

/datum/antagonist/hunter
	id = MODE_HUNTER
	role_text = "Hunter"
	role_text_plural = "Hunters"
	flags = ANTAG_HAS_LEADER | ANTAG_OVERRIDE_JOB | ANTAG_OVERRIDE_MOB | ANTAG_CLEAR_EQUIPMENT
	leader_welcome_text = "Вы самка Восхождения и управляете выводком крылатых существ. Ваша задача \
	взять под контроль этот сектор, что основать новую крепость-гнездо. Разведывайте и собирайте местные ресурсы, \
	и уничтожьте все, что может угрожать вашему потомству."
	welcome_text = "Вы существо из Восхождения, задача которого избавить этот сектор от всего, что Ваша Мать прикажет, \
	и подготовить его к мозданию новой крепости-гнезда. Повинуйтесь своей Матери и принесите процветание своему роду."
	leader_welcome_text
	antaghud_indicator = "hudhunter"
	antag_indicator = "hudhunter"
	hard_cap = 10
	hard_cap_round = 10
	initial_spawn_req = 4
	initial_spawn_target = 6

/datum/antagonist/hunter/update_antag_mob(var/datum/mind/player, var/preserve_appearance)
	. = ..()
	if(ishuman(player.current))
		var/mob/living/carbon/human/H = player.current
		if(!leader && is_species_whitelisted(player.current, SPECIES_MANTID_GYNE))
			leader = player
			if(H.species.get_bodytype() != SPECIES_MANTID_GYNE)
				H.set_species(SPECIES_MANTID_GYNE)
			H.gender = FEMALE
		else
			if(H.species.get_bodytype() != SPECIES_MANTID_ALATE)
				H.set_species(SPECIES_MANTID_ALATE)
			H.gender = MALE
		var/decl/cultural_info/culture/ascent/ascent_culture = SSculture.get_culture(CULTURE_ASCENT)
		H.real_name = ascent_culture.get_random_name(H.gender)
		H.name = H.real_name

/datum/antagonist/hunter/equip(var/mob/living/carbon/human/player)
	. = ..()
	if(.)
		if(player.species.get_bodytype(player) == SPECIES_MANTID_GYNE)
			equip_rig(/obj/item/rig/mantid/gyne, player)
		else
			equip_rig(/obj/item/rig/mantid, player)
			player.put_in_hands(new /obj/item/gun/energy/particle)

/datum/antagonist/hunter/equip_rig(rig_type, mob/living/carbon/human/player)
	var/obj/item/rig/mantid/rig = ..()
	if(rig)
		rig.visible_name = player.real_name
		return rig
