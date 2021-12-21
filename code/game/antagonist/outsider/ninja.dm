GLOBAL_DATUM_INIT(ninjas, /datum/antagonist/ninja, new)

/datum/antagonist/ninja
	id = MODE_NINJA
	role_text = "Ninja"
	role_text_plural = "Ninja"
	landmark_id = "ninjastart"
	welcome_text = "\
	<hr>Итак, Вы - наёмник. Нет, не верзила с пулеметом в штурмовом РИГе, а профессионал. Вы выполняете частные \
	заказы, для которых шпионы или обычные убийцы плохо экипированы и недостаточно подготовлены. \
	Вы снаряжены для скрытного проникновения и такого же скрытного выполнения своих задач на самых \
	различных объектах. Оптический камуфляж вашего РИГа, телепортационная система и встроенный клинок \
	для разрезания стен и скафандров слишком любознательных охранников - вот ваши лучшие друзья. \
	Ваши цели достаточно специфичны. <u>Вы должны скачать максимально возможное количество технологических уровней \
	из РНД, украсть максимально большое количичество ценных вещей, таких как чертежи и секретные документы, и \
	возможно, даже опорочить чужую репутацию.</u> <i>Ваш заказчик, помимо всего прочего, накладывает на вас \
	дополнительные условия - постарайтесь следовать им безукоснительно.</i> В конце-концов, преимущество в \
	экипировке и навыках здесь у вас, а не у кого-то ещё."
	flags = ANTAG_OVERRIDE_JOB | ANTAG_OVERRIDE_MOB | ANTAG_CLEAR_EQUIPMENT | ANTAG_CHOOSE_NAME | ANTAG_RANDSPAWN | ANTAG_VOTABLE | ANTAG_SET_APPEARANCE
	antaghud_indicator = "hudninja"

	initial_spawn_req = 1
	initial_spawn_target = 1
	hard_cap = 1
	hard_cap_round = 3
	min_player_age = 18

	id_type = /obj/item/card/id/syndicate

	faction = "ninja"
	base_to_load = /datum/map_template/ruin/antag_spawn/ninja

/datum/antagonist/ninja/create_objectives(var/datum/mind/ninja)

	if(!..())
		return

	var/objectives_count = round(count_living()/config.traitor_objectives_scaling) + 1
	var/objective_list = list(1,2,3,4,5)
	for(var/i in 1 to objectives_count)
		switch(pick(objective_list))
			if(1)//Kill
				var/datum/objective/assassinate/ninja_objective = new
				ninja_objective.owner = ninja
				ninja_objective.target = ninja_objective.find_target()
				objective_list -= 1 // No more than one kill objective
			if(2)//Steal
				var/datum/objective/steal/ninja_objective = new
				ninja_objective.owner = ninja
				ninja_objective.target = ninja_objective.find_target(ninja.objectives)
				ninja.objectives += ninja_objective
			if(3)//Protect
				var/datum/objective/protect/ninja_objective = new
				ninja_objective.owner = ninja
				ninja_objective.target = ninja_objective.find_target()
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

	var/datum/objective/survive/ninja_objective = new
	ninja_objective.owner = ninja
	ninja.objectives += ninja_objective

/datum/antagonist/ninja/greet(var/datum/mind/player)

	if(!..())
		return 0
	var/directive = generate_ninja_directive("heel")
	player.StoreMemory("<B>Специальное указание:</B> <span class='danger'>[directive]</span><br>", /decl/memory_options/system)
	to_chat(player, "<b>Помните о специальных указаниях:</b> [directive].")

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
		equip_rig(/obj/item/rig/light/ninja, player)
		var/obj/item/modular_computer/pda/syndicate/U = new
		player.put_in_hands(U)
		var/decl/uplink_source/pda/uplink_source = new
		uplink_source.setup_uplink_source(player, 0)

/datum/antagonist/ninja/proc/generate_ninja_directive(side)
	var/directive = "[side=="face"?"[GLOB.using_map.company_name]":"A criminal syndicate"] is your employer. "//Let them know which side they're on.
	switch(rand(1,14))
		if(1)
			directive += "Клан Паука официально не причастен к этой операции. Действуйте скрытно и оставайтесь в тени."
		if(2)
			directive += "[GLOB.using_map.company_name] финансировало врагов Клана Паука. Учините столько разрушений, насколько это возможно."
		if(3)
			directive += "Богатые борцы за права животных сделали нам предложение, от которого нельзя отказаться. Спасайте животных тогда, когда это потребуется."
		if(4)
			directive += "Клан Паука официально не причастен к этой операции. Уничтожьте всех, кто узнает о вас."
		if(5)
			directive += "На данный момент, мы сотрудничаем с [GLOB.using_map.company_name]. Убийства допускаются лишь в крайнем случае."
		if(6)
			directive += "Пусть никто не сомневается в милости Клана Паука. Обеспечьте безопасность всего второстепенного персонала, с которым вы столкнетесь."
		if(7)
			directive += "Наша репутация находится под угрозой. Нанесите как можно меньше вреда гражданским и невинным."
		if(8)
			directive += "Наша честь на кону. Используйте только благородную тактику, когда имеете дело с противниками."
		if(9)
			directive += "В настоящее время, мы ведем переговоры с лидером группы наемников. Маскируйте убийства под несчастные случаи, самоубийства или другие естественные причины."
		if(10)
			var/xenorace = pick(SPECIES_UNATHI,SPECIES_TAJARA, SPECIES_SKRELL, SPECIES_RESOMI)
			directive += "Группа радикальных [xenorace] была верными сторонниками клана паука. Проявляйте милосердие к [xenorace], когда это возможно."
		if(11)
			directive += "Клан Паука недавно был обвинен в религиозной бесчувственности. Попытайтесь поговорить с капелланом и доказать неправоту данных обвинений."
		if(12)
			directive += "Клан Паука заключил сделку с конкурирующим производителем протезов. Постарайтесь показать протезы [GLOB.using_map.company_name] в плохом свете."
		if(13)
			directive += "Клан Паука недавно начал вербовать новых агентов. Найдите подходящих кандидатов и оцените их поведение среди экипажа судна."
		if(14)
			directive += "Группа освобождения киборгов выразила интерес к нашей службе. Докажите, что клан Паука милостив к синтетике."
	return directive
