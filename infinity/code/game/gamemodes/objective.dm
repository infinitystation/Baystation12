/datum/objective/nuclear
	explanation_text = "Уничтожьте объект с помощью &#255;дерного зар&#255;да."

/datum/objective/steal/check_completion()
	if(!steal_target || !owner.current)	return 0
	if(!isliving(owner.current))	return 0
	var/list/all_items = owner.current.get_contents()
	switch (target_name)
		if("28 moles of phoron (full tank)","10 diamonds","50 gold bars","25 refined uranium bars")
			var/target_amount = text2num(target_name)//Non-numbers are ignored.
			var/found_amount = 0.0//Always starts as zero.

			for(var/obj/item/I in all_items) //Check for phoron tanks
				if(istype(I, steal_target))
					found_amount += (target_name=="28 moles of phoron (full tank)" ? (I:air_contents:gas["phoron"]) : (I:amount))
			return found_amount>=target_amount

		if("a functional AI")
			for(var/mob/living/silicon/ai/ai in SSmobs.mob_list)
				if(ai.stat == DEAD)
					continue
				var/turf/T = get_turf(ai)
				if(owner.current.contains(ai) || (T && is_type_in_list(T.loc, GLOB.using_map.post_round_safe_areas)))
					return 1

		if("an ablative armor kit")
			for(var/obj/item/clothing/suit/armor/laserproof/I in all_items) //Check for kit
				if(istype(I, steal_target))
					if(I.accessories == list(/obj/item/clothing/accessory/armguards/ablative, /obj/item/clothing/accessory/legguards/ablative))
						return 1

		if("a ballistic armor kit")
			for(var/obj/item/clothing/suit/armor/bulletproof/I in all_items) //Check for kit
				if(istype(I, steal_target))
					if(I.accessories == list(/obj/item/clothing/accessory/armguards/ballistic, /obj/item/clothing/accessory/legguards/ballistic))
						return 1
		else
			for(var/obj/I in all_items) //Check for items
				if(istype(I, steal_target))
					return 1
	return 0

/datum/objective/kidnap/proc/choose_target()
	return

/datum/objective/kidnap/choose_target()
	var/list/roles = list(/datum/job/captain, /datum/job/lawyer, /datum/job/chief_engineer, /datum/job/rd, /datum/job/engineer)
	var/list/possible_targets = list()
	var/list/priority_targets = list()

	for(var/datum/mind/possible_target in SSticker.minds)
		if(possible_target != owner && ishuman(possible_target.current) && (possible_target.current.stat != 2) && (!possible_target.special_role))
			possible_targets += possible_target
			for(var/role in SSjobs.get_by_path(roles))
				if(possible_target.assigned_role == role)
					priority_targets += possible_target
					continue

	if(priority_targets.len > 0)
		target = pick(priority_targets)
	else if(possible_targets.len > 0)
		target = pick(possible_targets)

	if(target && target.current)
		explanation_text = "Наниматель хочет, чтобы мы захватили '[target.current.real_name], [target.assigned_role]' и доставили на базу. Цель должна быть живой."
	else
		explanation_text = "Захвать по крайней мере одного высокопоставленного или обладающего ценными данными члена экипажа живым. Приоритет - ученые, главы, инженеры, пассажиры."
	return target

/datum/objective/kidnap/check_completion()
	if(target && target.current)
		if (target.current.stat == DEAD)
			return 0 // They're dead. Fail.
		//if (!target.current.restrained())
		//	return 0 // They're loose. Close but no cigar.

		var/area/syndicate_mothership/elite_squad/A = locate()
		for(var/mob/living/carbon/human/M in A)
			if(target.current == M)
				return 1 //They're restrained on the shuttle. Success.
	else
		return 0

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
