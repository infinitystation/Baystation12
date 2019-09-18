GLOBAL_DATUM_INIT(mercs, /datum/antagonist/mercenary, new)

/datum/antagonist/mercenary
	id = MODE_MERCENARY
	role_text = "Mercenary"
	antag_indicator = "hudsyndicate"
	role_text_plural = "Mercenaries"
	landmark_id = "Syndicate-Spawn"
	welcome_text = "<hr><u>������ ������ ���� ���������, � ��, ��� �������� ���� � ���� ����� �� ������ �������&#255; \
	� �����</u> - ��� ������, � ��� ��� ������ �� ���������&#255;, ����� �� ����������� �� ��� ����. ���� ������ \
	������� �� ���������&#255; ����������� ������� �� <b>�����</b> ��������� ����� - ������������ ��������, \
	��������, ����������� ����������� ����������, ������ ����������, ����� ������������ � ������ ��������, \
	� ������� ���������&#255; ��� ����������� �� ����� �� �����������. <u>�� ������ ���������� ����� \
	� ������� &#255;������� ���&#255;��, �������������� ������� ������ �� ������ - �����������&#255;, ������, ���� � ����, \
	���� ������ ������ ������&#255; ���.</u> \
	��������� �� � �������� ���������� �� ���� ���� �� ������ �� ����, ��� ������� ������ �������� ������� \
	����� ��������� &#255;������ ����. <br>����������� ������� ':t' ��&#255; ������&#255; �� ������ ����� �����.\
	<br><b>������������ � ������� � ������������ �� ���������� ���� ����� ��� �� ������ ��������.</b>"
	flags = ANTAG_VOTABLE | ANTAG_OVERRIDE_JOB | ANTAG_OVERRIDE_MOB | ANTAG_CLEAR_EQUIPMENT | ANTAG_CHOOSE_NAME | ANTAG_HAS_NUKE | ANTAG_SET_APPEARANCE | ANTAG_HAS_LEADER
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
	var/datum/objective/heist/K //raider's C_G_O copypaste
	K = new /datum/objective/nuclear/kidnap()
	K.choose_target()
	global_objectives |= K
	return 1

/datum/antagonist/mercenary/equip(var/mob/living/carbon/human/player)
	if(!..())
		return 0

	var/decl/hierarchy/outfit/mercenary = outfit_by_type(/decl/hierarchy/outfit/mercenary)
	mercenary.equip(player)

	if(player.mind == leader)
		var/obj/item/device/radio/uplink/U = new(get_turf(player), player.mind, TEAM_TELECRYSTAL_AMOUNT)
		player.put_in_hands(U)
		var/obj/item/clothing/head/beret/leader = new(get_turf(player))
		player.equip_to_slot_or_del(leader, slot_head)
		var/obj/item/weapon/paper/roles_nuclear/paper = new(get_turf(player))
		player.put_in_hands(paper)
	else
		var/obj/item/device/radio/uplink/U = new(get_turf(player), player.mind, 0)
		player.put_in_hands(U)
		var/obj/item/weapon/paper/roles_nuclear/paper = new(get_turf(player))
		player.put_in_hands(paper)

	return 1
