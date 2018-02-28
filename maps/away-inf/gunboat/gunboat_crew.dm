/obj/cryo_spawner/gunboat
	name = "gunboat crew"
	random_name = TRUE
	species_can_only_use = list(SPECIES_HUMAN,SPECIES_IPC)

/obj/cryo_spawner/patrol_craft/equip_character(mob/living/carbon/human/H, is_admin)
	..()
	var/obj/item/clothing/under/uniform = H.w_uniform
	if(uniform)
		var/obj/item/clothing/accessory/solgov/fleet_patch/third/patch = new()
		if(uniform.can_attach_accessory(patch))
			uniform.attach_accessory(null, patch)
		else
			qdel(patch)

/obj/cryo_spawner/gunboat/gunner
	name = "gunboat gunner"

/obj/cryo_spawner/patrol_craft/crewman/equip_character(mob/living/carbon/human/H, is_admin)
	H.equip_to_slot_or_del(new /obj/item/clothing/under/solgov/utility/fleet(H), slot_w_uniform)
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/dutyboots(H), slot_shoes)
	H.equip_to_slot_or_del(new /obj/item/device/radio/off(H), slot_l_store)
	H.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack/satchel/leather/navy(H), slot_back)

	var/obj/item/weapon/card/id/torch/crew/W = new(H)
	if(!W) return
	H.set_id_info(W)
	W.desc = "An identification card issued to SolGov crewmembers aboard the Gunboat."
	W.assignment = "Gunboat Gunner"
	W.military_branch = /datum/mil_branch/fleet
	W.military_rank = /datum/mil_rank/fleet/e4
	W.name = "[H.real_name]'s ID Card ([W.assignment])"
	H.equip_to_slot_or_del(W, slot_wear_id)

//	H.post_equip
	..()
	var/obj/item/clothing/under/uniform = H.w_uniform
	if(uniform)
		var/obj/item/clothing/accessory/solgov/rank/fleet/enlisted/e4/gunboat = new()
		if(uniform.can_attach_accessory(gunboat))
			uniform.attach_accessory(null, gunboat)
		else
			qdel(gunboat)

/obj/cryo_spawner/gunboat/engineer
	name = "gunboat engineer"

/obj/cryo_spawner/patrol_craft/engineer/equip_character(mob/living/carbon/human/H, is_admin)
	H.equip_to_slot_or_del(new /obj/item/clothing/under/solgov/utility/fleet/engineering(H), slot_w_uniform)
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/dutyboots(H), slot_shoes)
	H.equip_to_slot_or_del(new /obj/item/device/radio/off(H), slot_l_store)
	H.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack/satchel/leather/navy(H), slot_back)

	var/obj/item/weapon/card/id/torch/crew/engineering/W = new(H)
	if(!W) return
	H.set_id_info(W)
	W.desc = "An identification card issued to SolGov crewmembers aboard the Patrol Craft."
	W.assignment = "Patrol Craft Engineer"
	W.military_branch = /datum/mil_branch/fleet
	W.military_rank = /datum/mil_rank/fleet/e3
	W.name = "[H.real_name]'s ID Card ([W.assignment])"
	H.equip_to_slot_or_del(W, slot_wear_id)

//	H.post_equip
	..()
	var/obj/item/clothing/under/uniform = H.w_uniform
	if(uniform)
		var/obj/item/clothing/accessory/solgov/rank/fleet/enlisted/e4/engineer = new()
		if(uniform.can_attach_accessory(engineer))
			uniform.attach_accessory(null, engineer)
		else
			qdel(engineer)

/obj/cryo_spawner/gunboat/doctor
	name = "gunboat doctor"

/obj/cryo_spawner/patrol_craft/doctor/equip_character(mob/living/carbon/human/H, is_admin)
	H.equip_to_slot_or_del(new /obj/item/clothing/under/solgov/utility/fleet/medical(H), slot_w_uniform)
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/dutyboots(H), slot_shoes)
	H.equip_to_slot_or_del(new /obj/item/device/radio/off(H), slot_l_store)
	H.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack/satchel/leather/navy(H), slot_back)

	var/obj/item/weapon/card/id/torch/crew/medical/W = new(H)
	if(!W) return
	H.set_id_info(W)
	W.desc = "An identification card issued to SolGov crewmembers aboard the Gunboat."
	W.assignment = "Patrol Craft Doctor"
	W.military_branch = /datum/mil_branch/fleet
	W.military_rank = /datum/mil_rank/fleet/e3
	W.name = "[H.real_name]'s ID Card ([W.assignment])"
	H.equip_to_slot_or_del(W, slot_wear_id)

//	H.post_equip
	..()
	var/obj/item/clothing/under/uniform = H.w_uniform
	if(uniform)
		var/obj/item/clothing/accessory/solgov/rank/fleet/enlisted/e4/doctor = new()
		if(uniform.can_attach_accessory(doctor))
			uniform.attach_accessory(null, doctor)
		else
			qdel(doctor)


/obj/cryo_spawner/gunboat/captain
	name = "gunboat captain"
	species_can_only_use = list(SPECIES_HUMAN)

/obj/cryo_spawner/patrol_craft/captain/equip_character(mob/living/carbon/human/H, is_admin)
	H.equip_to_slot_or_del(new /obj/item/clothing/under/solgov/utility/fleet/command(H), slot_w_uniform)
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/dutyboots(H), slot_shoes)
	H.equip_to_slot_or_del(new /obj/item/device/radio/off(H), slot_l_store)
	H.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack/satchel/leather/navy(H), slot_back)

	var/obj/item/weapon/card/id/torch/crew/bridgeofficer/W = new(H)
	if(!W) return
	H.set_id_info(W)
	W.desc = "An identification card issued to SolGov crewmembers aboard the Gunboat."
	W.assignment = "Gunboat Captain"
	W.military_branch = /datum/mil_branch/fleet
	W.military_rank = /datum/mil_rank/fleet/o2
	W.name = "[H.real_name]'s ID Card ([W.assignment])"
	H.equip_to_slot_or_del(W, slot_wear_id)

//	H.post_equip
	..()
	var/obj/item/clothing/under/uniform = H.w_uniform
	if(uniform)
		var/obj/item/clothing/accessory/solgov/rank/fleet/officer/o2/captain = new()
		if(uniform.can_attach_accessory(captain))
			uniform.attach_accessory(null, captain)
		else
			qdel(captain)