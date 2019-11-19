GLOBAL_DATUM_INIT(ninjas, /datum/antagonist/ninja, new)

/datum/antagonist/ninja
	id = MODE_NINJA
	role_text = "Ninja"
	role_text_plural = "Ninja"
	landmark_id = "ninjastart"
	welcome_text = "\
	<hr>����, �� - ������. ���, �� ������� � ��������� � ��������� ����, � ������������. �� ������&#255;��� ������� \
	������, ��&#255; ������� ������ ��� ������� ������ ����� ����������� � ������������ ������������. \
	�� ����&#255;���� ��&#255; ��������� ������������&#255; � ������ �� ��������� ���������&#255; ����� ����� �� ����� \
	��������� ��������. ���������� ������&#255;� ������ ����, ���������������&#255; ������� � ���������� ������ \
	��&#255; ���������&#255; ���� � ���������� ������� �������������� ���������� - ��� ���� ������ �����&#255;. \
	���� ���� ���������� ����������. <u>�� ������ ������� ����������� ��������� ���������� ��������������� ������� \
	�� ���, ������� ����������� ������� ������������ ������ �����, ����� ��� ������� � ��������� ���������, � \
	��������, ���� ��������� ����� ���������.</u> <i>��� ��������, ������ ����� �������, ����������� �� ��� \
	�������������� ������&#255; - ������������ ��������� �� ���������������.</i> � �����-������, ������������ � \
	���������� � ������� ����� � ���, � �� � ����-�� ���."
	flags = ANTAG_OVERRIDE_JOB | ANTAG_OVERRIDE_MOB | ANTAG_CLEAR_EQUIPMENT | ANTAG_CHOOSE_NAME | ANTAG_RANDSPAWN | ANTAG_VOTABLE | ANTAG_SET_APPEARANCE
	antaghud_indicator = "hudninja"

	initial_spawn_req = 1
	initial_spawn_target = 1
	hard_cap = 1
	hard_cap_round = 3
	min_player_age = 18

	id_type = /obj/item/weapon/card/id/syndicate

	faction = "ninja"
	base_to_load = /datum/map_template/ruin/antag_spawn/ninja

/datum/antagonist/ninja/attempt_random_spawn()
	if(config.ninjas_allowed) ..()

/datum/antagonist/ninja/create_objectives(var/datum/mind/ninja)

	if(!..())
		return

	var/objective_list = list(1,2,3,4,5)
	for(var/i=rand(2,4),i>0,i--)
		switch(pick(objective_list))
			if(1)//Kill
				var/datum/objective/assassinate/ninja_objective = new
				ninja_objective.owner = ninja
				ninja_objective.target = ninja_objective.find_target()
				if(ninja_objective.target != "Free Objective")
					ninja.objectives += ninja_objective
				else
					i++
				objective_list -= 1 // No more than one kill objective
			if(2)//Steal
				var/datum/objective/steal/ninja_objective = new
				ninja_objective.owner = ninja
				ninja_objective.target = ninja_objective.find_target()
				ninja.objectives += ninja_objective
			if(3)//Protect
				var/datum/objective/protect/ninja_objective = new
				ninja_objective.owner = ninja
				ninja_objective.target = ninja_objective.find_target()
				if(ninja_objective.target != "Free Objective")
					ninja.objectives += ninja_objective
				else
					i++
					objective_list -= 3
			if(4)//Download
				var/datum/objective/download/ninja_objective = new
				ninja_objective.owner = ninja
				ninja_objective.gen_amount_goal()
				ninja.objectives += ninja_objective
				objective_list -= 4
			if(5)//Harm
				var/datum/objective/harm/ninja_objective = new
				ninja_objective.owner = ninja
				ninja_objective.target = ninja_objective.find_target()
				if(ninja_objective.target != "Free Objective")
					ninja.objectives += ninja_objective
				else
					i++
					objective_list -= 5

	var/datum/objective/survive/ninja_objective = new
	ninja_objective.owner = ninja
	ninja.objectives += ninja_objective

/datum/antagonist/ninja/greet(var/datum/mind/player)

	if(!..())
		return 0
	var/directive = generate_ninja_directive("heel")
	player.StoreMemory("<B>����������� ��������:</B> <span class='danger'>[directive]</span><br>", /decl/memory_options/system)
	to_chat(player, "<b>������� � ����������� �������&#255;�:</b> [directive].")

/datum/antagonist/ninja/update_antag_mob(var/datum/mind/player)
	..()
	var/ninja_title = pick(GLOB.ninja_titles)
	var/ninja_name = pick(GLOB.ninja_names)
	var/mob/living/carbon/human/H = player.current
	if(istype(H))
		H.real_name = "[ninja_title] [ninja_name]"
		H.SetName(H.real_name)
	player.name = H.name

/datum/antagonist/ninja/equip(var/mob/living/carbon/human/player)
	. = ..()
	if(.)
		var/obj/item/device/radio/R = new /obj/item/device/radio/headset(player)
		player.equip_to_slot_or_del(R, slot_l_ear)
		player.equip_to_slot_or_del(new /obj/item/clothing/under/color/black(player), slot_w_uniform)
		player.equip_to_slot_or_del(new /obj/item/device/flashlight(player), slot_belt)
		create_id("Infiltrator", player)
		equip_rig(/obj/item/weapon/rig/light/ninja, player)
		var/obj/item/modular_computer/pda/syndicate/U = new
		player.put_in_hands(U)
		var/decl/uplink_source/pda/uplink_source = new
		uplink_source.setup_uplink_source(player, 0)

/datum/antagonist/ninja/proc/generate_ninja_directive(side)
	var/directive = "[side=="face"?"[GLOB.using_map.company_name]":"A criminal syndicate"] is your employer. "//Let them know which side they're on.
	switch(rand(1,19))
		if(1)
			directive += "���� ����� ���������� �� ��������� � ���� ��������. ���������� ������� � ����������� � ����."
		if(2)
			directive += "[GLOB.using_map.company_name] ������������� ������ ����� �����. ������� ������� ����������, ��������� ��� ��������."
		if(3)
			directive += "������� ����� �� ����� �������� ������� ��� �����������, �� �������� �����&#255; ���������&#255;. �������� �������� �����, ����� ��� ����������&#255;."
		if(4)
			directive += "���� ����� ���������� �� ��������� � ���� ��������. ���������� ����, ��� ������ � ���."
		if(5)
			directive += "�� ������ ������, �� ������������ � [GLOB.using_map.company_name]. �������� ����������&#255; ���� � ������� ������."
//		if(6)
//			directive += "We are engaged in a legal dispute over [GLOB.using_map.station_name]. If a laywer is present on board, force their cooperation in the matter."
//		if(7)
//			directive += "A financial backer has made an offer we cannot refuse. Implicate criminal involvement in the operation."
		if(8)
			directive += "����� ����� �� ����������&#255; � ������� ����� �����. ���������� ������������ ����� ��������������� ���������, � ������� �� �����������."
//		if(9)
//			directive += "A free agent has proposed a lucrative business deal. Implicate [GLOB.using_map.company_name] involvement in the operation."
		if(10)
			directive += "���� ��������&#255; ��������&#255; ��� �������. �������� ��� ����� ������ ����� ����������� � ��������."
		if(11)
			directive += "���� ����� �� ����. ����������� ������ ����������� �������, ����� ������ ���� � ������������."
		if(12)
			directive += "� �����&#255;��� ����&#255;, �� ����� ���������� � ������� ������ ���������. ���������� �������� ��� ���������� ������, ������������ ��� ������ ������������ �������."
//		if(13)
//			directive += "��������� ����������� ���������� [GLOB.using_map.company_name] ������������ ���� ��&#255;���������. ����������� �� �� ������ ��������� ��������&#255; �� ������� ���������� �������."
		if(14)
			var/xenorace = pick(SPECIES_UNATHI,SPECIES_TAJARA, SPECIES_SKRELL)
			directive += "������ ����������� [xenorace] ���� ������� ������������ ����� �����. ���&#255;��&#255;��� ���������� � [xenorace], ����� ��� ��������."
		if(15)
			directive += "���� ����� ������� ��� ������� � ����������� ����������������. ����������� ���������� � ���������� � �������� ��������� ������ ���������."
		if(16)
			directive += "���� ����� �������� ������ � ������������� �������������� ��������. ������������ �������� ������� [GLOB.using_map.company_name] � ������ �����."
		if(17)
			directive += "���� ����� ������� ����� ��������� ����� �������. ������� ������&#255;��� ���������� � ������� �� ��������� ����� ������� �����."
		if(18)
			directive += "������ �����������&#255; �������� �������� ������� � ����� ������. ��������, ��� ���� ����� �������� � ���������."
		else
			directive += "� �����&#255;��� ����&#255; ��� ����������� �������������� ����������."
	return directive
