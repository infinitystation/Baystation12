GLOBAL_DATUM_INIT(ninjas, /datum/antagonist/ninja, new)

/datum/antagonist/ninja
	id = MODE_NINJA
	role_text = "Ninja"
	role_text_plural = "Ninja"
	landmark_id = "ninjastart"
	welcome_text = "<span class='info'>Вы - элитный наемный убийца <b>Клана Паука</b>. Вы обладаете богатым перечнем навыков и множеством возможностей благодар&#255; своему опыту, знани&#255;м... И высокотехнологичному костюму.</span>"
	flags = ANTAG_OVERRIDE_JOB | ANTAG_CLEAR_EQUIPMENT | ANTAG_CHOOSE_NAME | ANTAG_RANDSPAWN | ANTAG_VOTABLE | ANTAG_SET_APPEARANCE
	antaghud_indicator = "hudninja"

	initial_spawn_req = 1
	initial_spawn_target = 1
	hard_cap = 1
	hard_cap_round = 3
	min_player_age = 18

	id_type = /obj/item/weapon/card/id/syndicate

	faction = "ninja"

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
	player.store_memory("<B>Специальное указание:</B> <span class='danger'>[directive]</span><br>")
	to_chat(player, "<b>Помните о специальных указани&#255;х:</b> [directive].")

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

	if(!..())
		return 0

	var/obj/item/device/radio/R = new /obj/item/device/radio/headset(player)
	player.equip_to_slot_or_del(R, slot_l_ear)
	player.equip_to_slot_or_del(new /obj/item/clothing/under/color/black(player), slot_w_uniform)
	player.equip_to_slot_or_del(new /obj/item/device/flashlight(player), slot_belt)
	player.equip_to_slot_or_del(new /obj/item/clothing/mask/gas/half(player), slot_wear_mask)
	create_id("Infiltrator", player)

	var/obj/item/weapon/rig/light/ninja/ninjasuit = new(get_turf(player))
	ninjasuit.seal_delay = 0
	player.put_in_hands(ninjasuit)
	player.equip_to_slot_or_del(ninjasuit,slot_back)
	if(ninjasuit)
		ninjasuit.toggle_seals(src,1)
		ninjasuit.seal_delay = initial(ninjasuit.seal_delay)

	if(istype(player.back,/obj/item/weapon/rig))
		var/obj/item/weapon/rig/rig = player.back
		if(rig.air_supply)
			player.internal = rig.air_supply

	var/obj/item/modular_computer/pda/syndicate/U = new
	player.put_in_hands(U)
	var/decl/uplink_source/pda/uplink_source = new
	uplink_source.setup_uplink_source(player, 0)

	spawn(10)
		if(player.internal)
			player.internals.icon_state = "internal1"
		else
			to_chat(player, "<span class='danger'>Вы забыли включить систему подачи кислорода! Скорее, откройте клапан!</span>")

/datum/antagonist/ninja/proc/generate_ninja_directive(side)
	var/directive = "[side=="face"?"[GLOB.using_map.company_name]":"A criminal syndicate"] is your employer. "//Let them know which side they're on.
	switch(rand(1,19))
		if(1)
			directive += "Клан Паука официально не причастен к этой операции. Действуйте скрытно и оставайтесь в тени."
		if(2)
			directive += "[GLOB.using_map.company_name] финансировало врагов Клана Паука. Учините столько разрушений, насколько это возможно."
		if(3)
			directive += "Богатые борцы за права животных сделали нам предложение, от которого нельз&#255; отказатьс&#255;. Спасайте животных тогда, когда это потребуетс&#255;."
		if(4)
			directive += "Клан Паука официально не причастен к этой операции. Уничтожьте всех, кто узнает о вас."
		if(5)
			directive += "На данный момент, мы сотрудничаем с [GLOB.using_map.company_name]. Убийства допускаютс&#255; лишь в крайнем случае."
//		if(6)
//			directive += "We are engaged in a legal dispute over [GLOB.using_map.station_name]. If a laywer is present on board, force their cooperation in the matter."
//		if(7)
//			directive += "A financial backer has made an offer we cannot refuse. Implicate criminal involvement in the operation."
		if(8)
			directive += "Пусть никто не сомневаетс&#255; в милости Клана Паука. Обеспечьте безопасность всего второстепенного персонала, с которым вы столкнетесь."
//		if(9)
//			directive += "A free agent has proposed a lucrative business deal. Implicate [GLOB.using_map.company_name] involvement in the operation."
		if(10)
			directive += "Наша репутаци&#255; находитс&#255; под угрозой. Нанесите как можно меньше вреда гражданским и невинным."
		if(11)
			directive += "Наша честь на кону. Используйте только благородную тактику, когда имеете дело с противниками."
		if(12)
			directive += "В насто&#255;щее врем&#255;, мы ведем переговоры с лидером группы наемников. Маскируйте убийства под несчастные случаи, самоубийства или другие естественные причины."
//		if(13)
//			directive += "Некоторые недовольные сотрудники [GLOB.using_map.company_name] поддерживают нашу де&#255;тельность. Остерегайте их от любого жестокого обращени&#255; со стороны командного состава."
		if(14)
			var/xenorace = pick(SPECIES_UNATHI,SPECIES_TAJARA, SPECIES_SKRELL)
			directive += "Группа радикальных [xenorace] была верными сторонниками клана паука. Про&#255;вл&#255;йте милосердие к [xenorace], когда это возможно."
		if(15)
			directive += "Клан Паука недавно был обвинен в религиозной бесчувственности. Попытайтесь поговорить с капелланом и доказать неправоту данных обвинений."
		if(16)
			directive += "Клан Паука заключил сделку с конкурирующим производителем протезов. Постарайтесь показать протезы [GLOB.using_map.company_name] в плохом свете."
		if(17)
			directive += "Клан Паука недавно начал вербовать новых агентов. Найдите подход&#255;щих кандидатов и оцените их поведение среди экипажа судна."
		if(18)
			directive += "Группа освобождени&#255; киборгов выразила интерес к нашей службе. Докажите, что клан Паука милостив к синтетике."
		else
			directive += "В насто&#255;щее врем&#255; нет специальных дополнительных инструкций."
	return directive
