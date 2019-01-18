GLOBAL_DATUM_INIT(mercs, /datum/antagonist/mercenary, new)

/datum/antagonist/mercenary
	id = MODE_MERCENARY
	role_text = "Mercenary"
	antag_indicator = "hudsyndicate"
	role_text_plural = "Mercenaries"
	landmark_id = "Syndicate-Spawn"
	leader_welcome_text = "�� - ����� ������ ���������. ����������� ������� ':t' ����� �������� � ������ ����������� �� �����."
	welcome_text = "��� ������� ����� ������� �������������, ����������� ������� ':t'."
	flags = ANTAG_VOTABLE | ANTAG_OVERRIDE_JOB | ANTAG_CLEAR_EQUIPMENT | ANTAG_CHOOSE_NAME | ANTAG_HAS_NUKE | ANTAG_SET_APPEARANCE | ANTAG_HAS_LEADER
	antaghud_indicator = "hudoperative"

	hard_cap = 4
	hard_cap_round = 8
	initial_spawn_req = 4
	initial_spawn_target = 6
	min_player_age = 14

	faction = "mercenary"

/datum/antagonist/mercenary/create_global_objectives()
	if(!..())
		return 0
	global_objectives = list()
	global_objectives |= new /datum/objective/nuclear
	var/datum/objective/heist/K //raider's C_G_O copapaste
	K = new /datum/objective/heist/kidnap_nuke()
	K.choose_target()
	global_objectives |= K
	return 1

/datum/antagonist/mercenary/equip(var/mob/living/carbon/human/player)
	if(!..())
		return 0

	var/decl/hierarchy/outfit/mercenary = outfit_by_type(/decl/hierarchy/outfit/mercenary)
	mercenary.equip(player)

//	var/obj/item/device/radio/uplink/U = new(get_turf(player), player.mind, DEFAULT_TELECRYSTAL_AMOUNT)
//	player.put_in_hands(U)

	return 1
