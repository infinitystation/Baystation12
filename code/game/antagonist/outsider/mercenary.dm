GLOBAL_DATUM_INIT(mercs, /datum/antagonist/mercenary, new)

/datum/antagonist/mercenary
	id = MODE_MERCENARY
	role_text = "Mercenary"
	antag_indicator = "hudsyndicate"
	role_text_plural = "Mercenaries"
	landmark_id = "Syndicate-Spawn"
	welcome_text = "<hr><u>Работа должна быть выполнена, а те, кто согласен идти с вами через ад должны остатьс&#255; \
	в живых</u> - это первое, о чём вам стоило бы задуматьс&#255;, когда Вы согласились на эту роль. Ваша работа \
	состоит из выполнени&#255; специфичных заказов от <b>очень</b> серьезных людей - политические убийства, \
	терракты, уничтожение лабораторий корпораций, захват заложников, кража исследований и другие операции, \
	о которых корпораци&#255; или государство не стало бы афишировать. <u>Вы должны уничтожить судно \
	с помощью &#255;дерного зар&#255;да, предварительно выкачав оттуда всё ценное - исследовани&#255;, учёных, глав и всех, \
	кому хватит мозгов сдатьс&#255; вам.</u> \
	Доставьте их в качестве заложников на свою базу за минуту до того, как залитый кровью невинных корабль \
	будет уничтожен &#255;дерным огнём. <br>Используйте префикс ':t' дл&#255; общени&#255; со своими через рацию.\
	<br><b>Определитесь с главным и постарайтесь не прикончить друг друга ещё до начала операции.</b>"
	flags = ANTAG_VOTABLE | ANTAG_OVERRIDE_JOB | ANTAG_OVERRIDE_MOB | ANTAG_CLEAR_EQUIPMENT | ANTAG_CHOOSE_NAME | ANTAG_HAS_NUKE | ANTAG_SET_APPEARANCE | ANTAG_HAS_LEADER
	antaghud_indicator = "hudoperative"

	hard_cap = 4
	hard_cap_round = 8
	initial_spawn_req = 4
	initial_spawn_target = 6
	min_player_age = 14

	faction = "mercenary"
	ambitious = 0 //INF

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
