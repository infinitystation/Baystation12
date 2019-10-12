/datum/objective/nuclear
	explanation_text = "Уничтожьте объект с помощью &#255;дерного зар&#255;да."

/datum/objective/nuclear/kidnap
	var/list/roles = list(/datum/job/captain, /datum/job/lawyer, /datum/job/chief_engineer, /datum/job/rd, /datum/job/engineer)

/datum/objective/nuclear/kidnap/proc/choose_target()
	return

/datum/objective/nuclear/kidnap/choose_target()
	var/list/possible_targets = list()
	var/list/priority_targets = list()

	for(var/datum/mind/possible_target in SSticker.minds)
		if(possible_target != owner && ishuman(possible_target.current) && (possible_target.current.stat != 2) && (!possible_target.special_role))
			possible_targets += possible_target
			for(var/datum/job/role in SSjobs.get_by_path(roles))
				if(possible_target.assigned_role == role.title)
					priority_targets += possible_target
					continue

	if(priority_targets.len > 0)
		target = pick(priority_targets)
	else if(possible_targets.len > 0)
		target = pick(possible_targets)

	if(target?.current)
		explanation_text = "Наниматель хочет, чтобы мы захватили '[target.current.real_name], [target.assigned_role]' и доставили на базу. Цель должна быть живой."
	else
		explanation_text = "Захвать по крайней мере одного высокопоставленного или обладающего ценными данными члена экипажа живым. Приоритет - ученые, главы, инженеры, пассажиры."
	return target

/datum/objective/heist/loot/choose_target()
	var/loot = "an object"
	switch(rand(1,8))
		if(1)
			target = /obj/item/weapon/gun/projectile/revolver/medium/captain
			target_amount = 1
			loot = "a captain's revolver"
		if(2)
			target = /obj/machinery/media/jukebox
			target_amount = 1
			loot = "a mediatronic jukebox"
		if(3)
			target = /obj/machinery/power/emitter
			target_amount = 2
			loot = "two emitters"
		if(4)
			target = /obj/machinery/nuclearbomb
			target_amount = 1
			loot = "a nuclear bomb"
		if(5)
			target = /obj/item/weapon/gun
			target_amount = 6
			loot = "six guns"
		if(6)
			target = /obj/item/weapon/gun/energy
			target_amount = 4
			loot = "four LAEP90 energy guns"
		if(7)
			target = /obj/item/weapon/gun/energy/laser
			target_amount = 2
			loot = "two G40E lasers"
		if(8)
			target = /obj/item/weapon/gun/energy/ionrifle
			target_amount = 1
			loot = "an ion gun"

	explanation_text = "It's a buyer's market out here. Steal [loot] for resale."
