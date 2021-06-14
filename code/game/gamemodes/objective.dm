//This file was auto-corrected by findeclaration.exe on 25.5.2012 20:42:31
var/global/list/all_objectives = list()

/datum/objective
	//Who owns the objective.
	var/datum/mind/owner = null
	//What that person is supposed to do.
	var/explanation_text = "Nothing"
	//If they are focused on a particular person.
	var/datum/mind/target = null
	//If they are focused on a particular number. Steal objectives have their own counter.
	var/target_amount = 0

/datum/objective/New(var/text)
	all_objectives |= src
	if(text)
		explanation_text = text
	..()

/datum/objective/Destroy()
	all_objectives -= src
	..()

/datum/objective/proc/find_target(override = 0) //inf, was: /datum/objective/proc/find_target()
	var/list/possible_targets = list()
	for(var/datum/mind/possible_target in SSticker.minds)
		if(possible_target != owner && ishuman(possible_target.current) && (possible_target.current.stat != DEAD) \
//[INF]
		&& possible_target.current.client.wishes_to_be_role(lowertext(owner.special_role)))
			if(owner)
				var/is_target = 0
				for(var/datum/objective/O in owner.objectives)
					if(possible_target == O.target)
						is_target = 1
						break
				if(!is_target)
					possible_targets += possible_target
//[/INF]
//INF			possible_targets += possible_target
	if(possible_targets.len > 0)
		target = pick(possible_targets)


/datum/objective/proc/find_target_by_role(role, role_type = 0)//Option sets either to check assigned role or special role. Default to assigned.
	for(var/datum/mind/possible_target in SSticker.minds)
		if((possible_target != owner) && ishuman(possible_target.current) && ((role_type ? possible_target.special_role : possible_target.assigned_role) == role) )
			target = possible_target
			break


// Assassinate //

/datum/objective/assassinate/find_target(override = 0) //inf, was: /datum/objective/assassinate/find_target()
	..()
	if(target && target.current)
		explanation_text = "Убить [target.current.real_name], [target.assigned_role]."
	else
//[INF]
		if(override)
			return 0
		else
//[/INF]
			explanation_text = "Свободная Цель"
	return target

/datum/objective/assassinate/find_target_by_role(role, role_type = 0)
	..(role, role_type)
	if(target && target.current)
		explanation_text = "Убить [target.current.real_name],[!role_type ? target.assigned_role : target.special_role]."
	else
		explanation_text = "Свободная Цель"
	return target

// Execute //

/datum/objective/anti_revolution/execute/find_target(override = 0) //inf, was: /datum/objective/anti_revolution/execute/find_target()
	..()
	if(target && target.current)
		explanation_text = "[target.current.real_name], the [target.assigned_role] has extracted confidential information above their clearance. Execute \him[target.current]."
	else
		explanation_text = "Свободная Цель"
	return target

/datum/objective/anti_revolution/execute/find_target_by_role(role, role_type = 0)
	..(role, role_type)
	if(target && target.current)
		explanation_text = "[target.current.real_name], the [!role_type ? target.assigned_role : target.special_role] has extracted confidential information above their clearance. Execute \him[target.current]."
	else
		explanation_text = "Свободная Цель"
	return target

// Brig //

/datum/objective/anti_revolution/brig
	var/already_completed = 0

/datum/objective/anti_revolution/brig/find_target(override = 0) //inf, was: /datum/objective/anti_revolution/brig/find_target()
	..()
	if(target && target.current)
		explanation_text = "Brig [target.current.real_name], the [target.assigned_role] for 20 minutes to set an example."
	else
		explanation_text = "Свободная Цель"
	return target

/datum/objective/anti_revolution/brig/find_target_by_role(role, role_type = 0)
	..(role, role_type)
	if(target && target.current)
		explanation_text = "Brig [target.current.real_name], the [!role_type ? target.assigned_role : target.special_role] for 20 minutes to set an example."
	else
		explanation_text = "Свободная Цель"
	return target

// Demote //

/datum/objective/anti_revolution/demote/find_target(override = 0) //inf, was: /datum/objective/anti_revolution/demote/find_target()
	..()
	if(target && target.current)
		explanation_text = "[target.current.real_name], the [target.assigned_role]  has been classified as harmful to [GLOB.using_map.company_name]'s goals. Demote \him[target.current] to assistant."
	else
		explanation_text = "Свободная Цель"
	return target

/datum/objective/anti_revolution/demote/find_target_by_role(role, role_type = 0)
	..(role, role_type)
	if(target && target.current)
		explanation_text = "[target.current.real_name], the [!role_type ? target.assigned_role : target.special_role] has been classified as harmful to [GLOB.using_map.company_name]'s goals. Demote \him[target.current] to assistant."
	else
		explanation_text = "Свободная Цель"
	return target

// Debrain //

/datum/objective/debrain/find_target(override = 0) //inf, was: /datum/objective/debrain/find_target()
	..()
	if(target && target.current)
		explanation_text = "Украсть мозг [target.current.real_name]."
	else
//[INF]
		if(override)
			return 0
		else
//[/INF]
			explanation_text = "Свободная Цель"
	return target

/datum/objective/debrain/find_target_by_role(role, role_type = 0)
	..(role, role_type)
	if(target && target.current)
		explanation_text = "Украсть мозг [target.current.real_name], [!role_type ? target.assigned_role : target.special_role]."
	else
		explanation_text = "Свободная Цель"
	return target

// Protection, The opposite of killing a dude. //

/datum/objective/protect/find_target(override = 0) //inf, was: /datum/objective/protect/find_target()
	..()
	if(target && target.current)
		explanation_text = "Защитить [target.current.real_name], the [target.assigned_role]."
	else
		explanation_text = "Свободная Цель"
	return target


/datum/objective/protect/find_target_by_role(role, role_type = 0)
	..(role, role_type)
	if(target && target.current)
		explanation_text = "Protect [target.current.real_name], the [!role_type ? target.assigned_role : target.special_role]."
	else
		explanation_text = "Свободная Цель"
	return target

// Hijack //

/datum/objective/hijack
	explanation_text = "Угнать шаттл, улетев в одиночестве."

// Shuttle Escape //

/datum/objective/escape
	explanation_text = "Сбежать на шаттле или спасательной капсуле не будучи задержанным"

// Survive //

/datum/objective/survive
	explanation_text = "Выжить до окончания смены."

// Brig, similar to the anti-rev objective, but for traitors //

/datum/objective/brig
	var/already_completed = 0

/datum/objective/brig/find_target(override = 0)//inf, was:/datum/objective/brig/find_target()
	..()
	if(target && target.current)
		explanation_text = "Задержать [target.current.real_name], [target.assigned_role] в камере брига на 10 минут и более."
	else
//[INF]
		if(override)
			return 0
		else
//[/INF]
			explanation_text = "Свободная Цель"
	return target

/datum/objective/brig/find_target_by_role(role, role_type = 0)
	..(role, role_type)
	if(target && target.current)
		explanation_text = "Задержать [target.current.real_name], [!role_type ? target.assigned_role : target.special_role] в камере брига на 10 минут и более."
	else
		explanation_text = "Свободная Цель"
	return target

// Harm a crew member, making an example of them //

/datum/objective/harm
	var/already_completed = 0

/datum/objective/harm/find_target(override = 0) //inf, was: /datum/objective/harm/find_target()
	..()
	if(target && target.current)
		explanation_text = "Преподать урок [target.current.real_name], [target.assigned_role]. Переломать кости, отрезать конечность или изуродовать лицо. Убедиться, что цель это переживет."
	else
//[INF]
		if(override)
			return 0
		else
//[/INF]
			explanation_text = "Свободная Цель"
	return target

/datum/objective/harm/find_target_by_role(role, role_type = 0)
	..(role, role_type)
	if(target && target.current)
		explanation_text = "Преподать урок [target.current.real_name], [!role_type ? target.assigned_role : target.special_role]. Переломать кости, отрезать конечность или изуродовать лицо. Убедиться, что цель это переживет."
	else
		explanation_text = "Свободная Цель"
	return target

// Nuclear Explosion //

/datum/objective/nuclear
	explanation_text = "Уничтожить объект с помощью системы самоуничтожения."


// Steal //

/datum/objective/steal
	var/obj/item/steal_target
	var/target_name

/* original
	var/global/possible_items[] = list(
		"the captain's antique laser gun" = /obj/item/gun/energy/captain,
		"a bluespace rift generator" = /obj/item/integrated_circuit/manipulation/bluespace_rift,
		"an RCD" = /obj/item/rcd,
		"a jetpack" = /obj/item/tank/jetpack,
		"a captain's jumpsuit" = /obj/item/clothing/under/rank/captain,
		"a functional AI" = /obj/item/aicard,
		"a pair of magboots" = /obj/item/clothing/shoes/magboots,
		"the [station_name()] blueprints" = /obj/item/blueprints,
		"a nasa voidsuit" = /obj/item/clothing/suit/space/void,
		"28 moles of phoron (full tank)" = /obj/item/tank,
		"a sample of slime extract" = /obj/item/slime_extract,
		"a piece of corgi meat" = /obj/item/reagent_containers/food/snacks/meat/corgi,
		"a chief science officer's jumpsuit" = /obj/item/clothing/under/rank/research_director,
		"a chief engineer's jumpsuit" = /obj/item/clothing/under/rank/chief_engineer,
		"a chief medical officer's jumpsuit" = /obj/item/clothing/under/rank/chief_medical_officer,
		"a head of security's jumpsuit" = /obj/item/clothing/under/rank/head_of_security,
		"a head of personnel's jumpsuit" = /obj/item/clothing/under/rank/head_of_personnel,
		"the hypospray" = /obj/item/reagent_containers/hypospray,
		"the captain's pinpointer" = /obj/item/pinpointer,
		"an ablative armor vest" = /obj/item/clothing/suit/armor/laserproof,
	)
/original */
//[INF]
	var/global/possible_items[] = list(
		"РЦД"									= /obj/item/rcd,
//		"ракетый ранец"							= /obj/item/tank/jetpack,
		"интеллекарту - желательно, с ИИ"		= /obj/item/aicard,
		"уникальное мачете Лидера Экспедиции"	= /obj/item/material/hatchet/machete/deluxe,
//		"магнитные ботинки"						= /obj/item/clothing/shoes/magboots,
		"чертежи [station_name()]"				= /obj/item/blueprints,
//		"полную канистру форона"				= /obj/item/tank,
		"образец целого ядра слайма"			= /obj/item/slime_extract,
		"мясо корги"							= /obj/item/reagent_containers/food/snacks/meat/corgi,
//		"комбенизон капитана"					= /obj/item/clothing/under/rank/captain,
//		"комбенизон Директора Исследований"		= /obj/item/clothing/under/rank/research_director,
//		"комбенизон Главного Инженера"			= /obj/item/clothing/under/rank/chief_engineer,
//		"комбенизон Главного Врача"				= /obj/item/clothing/under/rank/chief_medical_officer,
//		"комбенизон Главы Охраны"				= /obj/item/clothing/under/rank/head_of_security,
//		"комбенизон Главы Персонала"			= /obj/item/clothing/under/rank/head_of_personnel,
//		"костюм Агента Внутренних Дел"			= /obj/item/clothing/under/rank/internalaffairs/,
//		"тактические очки"						= /obj/item/clothing/glasses/tacgoggles,
		"гипоспрей"								= /obj/item/reagent_containers/hypospray,
		"пинпоинтер"							= /obj/item/pinpointer,
		"нагрудник аблятивной брони"			= /obj/item/clothing/suit/armor/laserproof,
		"нагрудник баллистической брони"		= /obj/item/clothing/suit/armor/bulletproof,
		"секретные документы АВД"				= /obj/item/documents
	)
//[/INF]
	var/global/possible_items_special[] = list(
		/*"nuclear authentication disk" = /obj/item/disk/nuclear,*///Broken with the change to nuke disk making it respawn on z level change.
		"a bluespace rift generator" = /obj/item/integrated_circuit/manipulation/bluespace_rift,//inf
		"nuclear gun" = /obj/item/gun/energy/gun/nuclear,
		"diamond drill" = /obj/item/pickaxe/diamonddrill,
		"bag of holding" = /obj/item/storage/backpack/holding,
		"hyper-capacity cell" = /obj/item/cell/hyper,
		"10 diamonds" = /obj/item/stack/material/diamond,
		"50 gold bars" = /obj/item/stack/material/gold,
		"25 refined uranium bars" = /obj/item/stack/material/uranium,
	)

/datum/objective/steal/proc/set_target(item_name)
	target_name = item_name
	steal_target = possible_items[target_name]
	if (!steal_target )
		steal_target = possible_items_special[target_name]
	explanation_text = "Украсть [target_name]."
	return steal_target


/datum/objective/steal/find_target(override = 0) //inf, was: /datum/objective/steal/find_target()
	return set_target(pick(possible_items))


/datum/objective/steal/proc/select_target()
	var/list/possible_items_all = possible_items+possible_items_special+"custom"
	var/new_target = input("Select target:", "Objective target", steal_target) as null|anything in possible_items_all
	if (!new_target) return
	if (new_target == "custom")
		var/obj/item/custom_target = input("Select type:","Type") as null|anything in typesof(/obj/item)
		if (!custom_target) return
		var/tmp_obj = new custom_target
		var/custom_name = tmp_obj:name
		qdel(tmp_obj)
		custom_name = sanitize(input("Enter target name:", "Objective target", custom_name) as text|null)
		if (!custom_name) return
		target_name = custom_name
		steal_target = custom_target
		explanation_text = "Steal [target_name]."
	else
		set_target(new_target)
	return steal_target

// RnD progress download //

/datum/objective/download
	proc/gen_amount_goal()
		target_amount = rand(10,20)
		explanation_text = "Скачать [target_amount] уровней исследований."
		return target_amount

// Capture //

/datum/objective/capture

/datum/objective/capture/proc/gen_amount_goal()
	target_amount = rand(5,10)
	explanation_text = "Accumulate [target_amount] capture points."
	return target_amount

// Changeling Absorb //

/datum/objective/absorb/proc/gen_amount_goal(var/lowbound = 4, var/highbound = 6)
	target_amount = rand (lowbound,highbound)
	var/n_p = 1 //autowin
	if (GAME_STATE == RUNLEVEL_SETUP)
		for(var/mob/new_player/P in GLOB.player_list)
			if(P.client && P.ready && P.mind!=owner)
				n_p ++
	else if (GAME_STATE == RUNLEVEL_GAME)
		for(var/mob/living/carbon/human/P in GLOB.player_list)
			if(P.client && !(P.mind.changeling) && P.mind!=owner)
				n_p ++
	target_amount = min(target_amount, n_p)

	explanation_text = "Поглотить ([target_amount]) совместимых геномов."
	return target_amount

// Heist objectives.
/datum/objective/heist/proc/choose_target()
	return

/datum/objective/heist/kidnap
	var/list/roles = list(/datum/job/chief_engineer, /datum/job/rd, /datum/job/roboticist, /datum/job/chemist, /datum/job/engineer)

/datum/objective/heist/kidnap/choose_target()
	var/list/possible_targets = list()
	var/list/priority_targets = list()

	for(var/datum/mind/possible_target in SSticker.minds)
		if(possible_target != owner && ishuman(possible_target.current) && (possible_target.current.stat != DEAD) && (!possible_target.special_role))
			possible_targets += possible_target
			for (var/path in roles)
				var/datum/job/role = SSjobs.get_by_path(path)
				if(possible_target.assigned_role == role.title)
					priority_targets += possible_target
					continue

	if(priority_targets.len > 0)
		target = pick(priority_targets)
	else if(possible_targets.len > 0)
		target = pick(possible_targets)

	if(target && target.current)
		explanation_text = "Нам могут хорошо заплатить за [target.current.real_name], [target.assigned_role]. Необходимо взять товар живым и невредимым."
	else
		explanation_text = "Свободная Цель"
	return target

/datum/objective/heist/loot/choose_target()
	var/loot = "an object"
	switch(rand(1,8))
		if(1)
			target = /obj/structure/particle_accelerator
			target_amount = 6
			loot = "a complete particle accelerator"
		if(2)
			target = /obj/machinery/the_singularitygen
			target_amount = 1
			loot = "a gravitational generator"
		if(3)
			target = /obj/machinery/power/emitter
			target_amount = 4
			loot = "four emitters"
		if(4)
			target = /obj/machinery/nuclearbomb
			target_amount = 1
			loot = "a nuclear bomb"
		if(5)
			target = /obj/item/gun
			target_amount = 6
			loot = "six guns"
		if(6)
			target = /obj/item/gun/energy
			target_amount = 4
			loot = "four energy guns"
		if(7)
			target = /obj/item/gun/energy/laser
			target_amount = 2
			loot = "two laser guns"
		if(8)
			target = /obj/item/gun/energy/ionrifle
			target_amount = 1
			loot = "an ion gun"

	explanation_text = "It's a buyer's market out here. Steal [loot] for resale."

/datum/objective/heist/salvage/choose_target()
	switch(rand(1,8))
		if(1)
			target = MATERIAL_STEEL
			target_amount = 300
		if(2)
			target = MATERIAL_GLASS
			target_amount = 200
		if(3)
			target = MATERIAL_PLASTEEL
			target_amount = 100
		if(4)
			target = MATERIAL_PHORON
			target_amount = 100
		if(5)
			target = MATERIAL_SILVER
			target_amount = 50
		if(6)
			target = MATERIAL_GOLD
			target_amount = 20
		if(7)
			target = MATERIAL_URANIUM
			target_amount = 20
		if(8)
			target = MATERIAL_DIAMOND
			target_amount = 20

	explanation_text = "Ограбить [station_name()] и улететь вместе с [target_amount] [target]."

/datum/objective/heist/preserve_crew
	explanation_text = "Мы своих не бросаем - ни живыми, ни мертвыми."

//Borer objective(s).
/datum/objective/borer_survive
	explanation_text = "Survive in a host until the end of the round."

/datum/objective/borer_reproduce
	explanation_text = "Reproduce at least once."

/datum/objective/ninja_highlander
   explanation_text = "You aspire to be a Grand Master of the Spider Clan. Kill all of your fellow acolytes."

/datum/objective/cult/survive
	explanation_text = "Наше учение должно жить.."
	target_amount = 5

/datum/objective/cult/survive/New()
	..()
	explanation_text = "Наши знания должны жить. По крайней мере ([target_amount]) аколитов должны покинуть объект."

/datum/objective/cult/eldergod
	explanation_text = "Призвать Нар-Си с помощью соответствующей руны. Для призыва необходимо, чтобы 9 акколитов стояли вокруг руны, пока происходит призыв."

/datum/objective/cult/sacrifice
	explanation_text = "Провести ритуал жертвоприношения во славу Нар-Си."

/datum/objective/cult/sacrifice/find_target(override = 0) //inf, was: /datum/objective/cult/sacrifice/find_target()
	var/list/possible_targets = list()
	if(!possible_targets.len)
		for(var/mob/living/carbon/human/player in GLOB.player_list)
			if(player.mind && !(player.mind in GLOB.cult.current_antagonists) \
			&& player.client.wishes_to_be_role(GLOB.cult.id)) //INF
				possible_targets += player.mind
	if(possible_targets.len > 0)
		target = pick(possible_targets)
	if(target) explanation_text = "Принести в жертву [target.name], [target.assigned_role]. Необходима руна жертвоприношения и три акколита для совершения ритуала."

/datum/objective/rev/find_target(override = 0) //inf, was: /datum/objective/rev/find_target()
	..()
	if(target && target.current)
		explanation_text = "Убить, пленить или завербовать [target.current.real_name], [target.assigned_role]."
	else
		explanation_text = "Свободная Цель"
	return target

/datum/objective/rev/find_target_by_role(role, role_type=0)
	..(role, role_type)
	if(target && target.current)
		explanation_text = "Убить, пленить или завербовать [target.current.real_name], [!role_type ? target.assigned_role : target.special_role]."
	else
		explanation_text = "Свободная Цель"
	return target
