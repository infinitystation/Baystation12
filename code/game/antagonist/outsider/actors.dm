GLOBAL_DATUM_INIT(actor, /datum/antagonist/actor, new)

/datum/antagonist/actor
	id = MODE_ACTOR
	role_text = "Actor"
	role_text_plural = "Actors"
	welcome_text = "Вы были наняты чтобы развлекать людей с помощью телевидения!"
	landmark_id = "ActorSpawn"
	id_type = /obj/item/card/id/syndicate

	flags = ANTAG_OVERRIDE_JOB | ANTAG_OVERRIDE_MOB | ANTAG_SET_APPEARANCE | ANTAG_CHOOSE_NAME | ANTAG_RANDOM_EXCEPTED

	hard_cap = 7
	hard_cap_round = 10
	initial_spawn_req = 1
	initial_spawn_target = 1
	show_objectives_on_creation = 0 //actors are not antagonists and do not need the antagonist greet text
	required_language = LANGUAGE_HUMAN_EURO

	antag_text = "" //INF
	ambitious = 0 //INF

/datum/antagonist/actor/greet(var/datum/mind/player)
	if(!..())
		return

	player.current.show_message("<span class='info'>Вы - актер, работающий на [GLOB.using_map.company_name] и назначенный на обеспечение многих корпоративных объектов развлекательным телевизионным контентом.</span>")
	player.current.show_message("<span class='info'>Развлекайте экипаж! Старайтесь не отвлекать их и уж точно не мешать им в работе. И помните, [GLOB.using_map.company_name] прежде всего!</span>")

/datum/antagonist/actor/equip(var/mob/living/carbon/human/player)
	player.equip_to_slot_or_del(new /obj/item/clothing/under/chameleon(src), slot_w_uniform)
	player.equip_to_slot_or_del(new /obj/item/clothing/shoes/chameleon(src), slot_shoes)
	player.equip_to_slot_or_del(new /obj/item/device/radio/headset/entertainment(src), slot_l_ear)
	var/obj/item/card/id/centcom/ERT/commando/C = new(player.loc)
	C.assignment = "Actor"
	player.set_id_info(C)
	player.equip_to_slot_or_del(C,slot_wear_id)

	return 1

/mob/observer/ghost/verb/join_as_actor()
	set category = "Ghost"
	set name = "Join as Actor"
	set desc = "Присоедениться как Актер, чтобы развлекать экипаж по средствам телевидения!"

	if(!MayRespawn(1) || !GLOB.actor.can_become_antag(usr.mind, 1))
		return

	if(jobban_isbanned(usr, MODE_ACTOR))
		to_chat(usr, "Кажется, у вас джоб-бан на работу Актера. Что ж, плохие новости.")
		return

	var/choice = alert("Вы уверены, что хотите стать актером?", "Confirmation","Yes", "No")
	if(choice != "Yes")
		return

	if(GLOB.actor.current_antagonists.len >= GLOB.actor.hard_cap)
		to_chat(usr, "В настоящее время актеры больше не могут появляться.")
		return

	GLOB.actor.create_default(usr)
