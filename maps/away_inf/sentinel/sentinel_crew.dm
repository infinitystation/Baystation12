/obj/cryo_spawner/patrol_craft
	name = "patrol craft crew"
	random_name = TRUE
	species_can_only_use = list(SPECIES_HUMAN,SPECIES_IPC)

/obj/cryo_spawner/patrol_craft/equip_character(mob/living/carbon/human/H, is_admin)
	..()
	var/obj/item/clothing/under/uniform = H.w_uniform
	if(uniform)
		var/obj/item/clothing/accessory/solgov/fleet_patch/fifth/patch = new()
		if(uniform.can_attach_accessory(patch))
			uniform.attach_accessory(null, patch)
		else
			qdel(patch)

/obj/cryo_spawner/patrol_craft/crewman
	name = "patrol craft crewman"

/obj/cryo_spawner/patrol_craft/crewman/equip_character(mob/living/carbon/human/H, is_admin)
	H.equip_to_slot_or_del(new /obj/item/clothing/under/solgov/utility/fleet(H), slot_w_uniform)
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/dutyboots(H), slot_shoes)
	H.equip_to_slot_or_del(new /obj/item/device/radio/headset(H), slot_l_ear)
	H.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack/satchel/leather/navy(H), slot_back)

	var/obj/item/weapon/card/id/torch/crew/W = new(H)
	if(!W) return
	H.set_id_info(W)
	W.desc = "An identification card issued to SolGov crewmembers aboard the Patrol Craft."
	W.assignment = "Patrol Craft Crewman"
	W.military_branch = /datum/mil_branch/fleet
	W.military_rank = /datum/mil_rank/fleet/e3
	W.name = "[H.real_name]'s ID Card ([W.assignment])"
	H.equip_to_slot_or_del(W, slot_wear_id)

//	H.post_equip
	..()
	var/obj/item/clothing/under/uniform = H.w_uniform
	if(uniform)
		var/obj/item/clothing/accessory/solgov/rank/fleet/enlisted/e3/crewman = new()
		if(uniform.can_attach_accessory(crewman))
			uniform.attach_accessory(null, crewman)
		else
			qdel(crewman)

/obj/cryo_spawner/patrol_craft/engineer
	name = "patrol craft engineer"

/obj/cryo_spawner/patrol_craft/engineer/equip_character(mob/living/carbon/human/H, is_admin)
	H.equip_to_slot_or_del(new /obj/item/clothing/under/solgov/utility/fleet/engineering(H), slot_w_uniform)
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/dutyboots(H), slot_shoes)
	H.equip_to_slot_or_del(new /obj/item/device/radio/headset/headset_eng(H), slot_l_ear)
	H.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack/satchel/leather/navy(H), slot_back)

	var/obj/item/weapon/card/id/torch/crew/engineering/W = new(H)
	if(!W) return
	H.set_id_info(W)
	W.desc = "An identification card issued to SolGov crewmembers aboard the Patrol Craft."
	W.assignment = "Patrol Craft Engineer"
	W.military_branch = /datum/mil_branch/fleet
	W.military_rank = /datum/mil_rank/fleet/e4
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

/obj/cryo_spawner/patrol_craft/doctor
	name = "patrol craft doctor"

/obj/cryo_spawner/patrol_craft/doctor/equip_character(mob/living/carbon/human/H, is_admin)
	H.equip_to_slot_or_del(new /obj/item/clothing/under/solgov/utility/fleet/medical(H), slot_w_uniform)
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/dutyboots(H), slot_shoes)
	H.equip_to_slot_or_del(new /obj/item/device/radio/headset/headset_med(H), slot_l_ear)
	H.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack/satchel/leather/navy(H), slot_back)

	var/obj/item/weapon/card/id/torch/crew/medical/W = new(H)
	if(!W) return
	H.set_id_info(W)
	W.desc = "An identification card issued to SolGov crewmembers aboard the Patrol Craft."
	W.assignment = "Patrol Craft Doctor"
	W.military_branch = /datum/mil_branch/fleet
	W.military_rank = /datum/mil_rank/fleet/e4
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

/obj/cryo_spawner/patrol_craft/officer
	name = "patrol craft officer"

/obj/cryo_spawner/patrol_craft/officer/equip_character(mob/living/carbon/human/H, is_admin)
	H.equip_to_slot_or_del(new /obj/item/clothing/under/solgov/utility/fleet/command(H), slot_w_uniform)
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/dutyboots(H), slot_shoes)
	H.equip_to_slot_or_del(new /obj/item/device/radio/headset/bridgeofficer(H), slot_l_ear)
	H.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack/satchel/leather/navy(H), slot_back)

	var/obj/item/weapon/card/id/patrol/officer/W = new(H)
	if(!W) return
	H.set_id_info(W)
	W.desc = "An identification card issued to SolGov crewmembers aboard the Patrol Craft."
	W.assignment = "Patrol Craft Officer"
	W.military_branch = /datum/mil_branch/fleet
	W.military_rank = /datum/mil_rank/fleet/o1
	W.name = "[H.real_name]'s ID Card ([W.assignment])"
	H.equip_to_slot_or_del(W, slot_wear_id)

//	H.post_equip
	..()
	var/obj/item/clothing/under/uniform = H.w_uniform
	if(uniform)
		var/obj/item/clothing/accessory/solgov/rank/fleet/officer/officer = new()
		if(uniform.can_attach_accessory(officer))
			uniform.attach_accessory(null, officer)
		else
			qdel(officer)
	if(uniform)
		var/obj/item/clothing/accessory/solgov/speciality/pilot/spec = new()
		if(uniform.can_attach_accessory(spec))
			uniform.attach_accessory(null, spec)
		else
			qdel(spec)

/obj/cryo_spawner/patrol_craft/captain
	name = "patrol craft captain"
	species_can_only_use = list(SPECIES_HUMAN)

/obj/cryo_spawner/patrol_craft/captain/equip_character(mob/living/carbon/human/H, is_admin)
	H.equip_to_slot_or_del(new /obj/item/clothing/under/solgov/utility/fleet/command(H), slot_w_uniform)
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/dutyboots(H), slot_shoes)
	H.equip_to_slot_or_del(new /obj/item/device/radio/headset/heads(H), slot_l_ear)
	H.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack/satchel/leather/navy(H), slot_back)

	var/obj/item/weapon/card/id/patrol/captain/W = new(H)
	if(!W) return
	H.set_id_info(W)
	W.desc = "An identification card issued to SolGov crewmembers aboard the Patrol Craft."
	W.assignment = "Patrol Craft Captain"
	W.military_branch = /datum/mil_branch/fleet
	W.military_rank = /datum/mil_rank/fleet/o3
	W.name = "[H.real_name]'s ID Card ([W.assignment])"
	H.equip_to_slot_or_del(W, slot_wear_id)

//	H.post_equip
	..()
	var/obj/item/clothing/under/uniform = H.w_uniform
	if(uniform)
		var/obj/item/clothing/accessory/solgov/rank/fleet/officer/o3/captain = new()
		if(uniform.can_attach_accessory(captain))
			uniform.attach_accessory(null, captain)
		else
			qdel(captain)

/obj/cryo_spawner/patrol_craft/marine
	name = "patrol craft marine"
	species_can_only_use = list(SPECIES_HUMAN)

/obj/cryo_spawner/patrol_craft/marine/equip_character(mob/living/carbon/human/H, is_admin)
	H.equip_to_slot_or_del(new /obj/item/clothing/under/solgov/utility/army/urban(H), slot_w_uniform)
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/dutyboots(H), slot_shoes)
	H.equip_to_slot_or_del(new /obj/item/device/radio/headset/rescue(H), slot_l_ear)
	H.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack/ert/security(H), slot_back)

	var/obj/item/weapon/card/id/patrol/marine/W = new(H)
	if(!W) return
	H.set_id_info(W)
	W.assignment = "Trooper"
	W.military_branch = "Marine Corps"
	W.military_rank = "Private First Class"
	W.name = "PFC [H.real_name]'s ID Card ([W.assignment])"
	H.equip_to_slot_or_del(W, slot_wear_id)

//	H.post_equip
	..()
	var/obj/item/clothing/under/uniform = H.w_uniform
	if(uniform)
		var/obj/item/clothing/accessory/solgov/rank/army/enlisted/e2/marine = new()
		if(uniform.can_attach_accessory(marine))
			uniform.attach_accessory(null, marine)
		else
			qdel(marine)

/obj/cryo_spawner/patrol_craft/marine_eng
	name = "patrol craft marine-engineer"
	species_can_only_use = list(SPECIES_HUMAN)

/obj/cryo_spawner/patrol_craft/marine_eng/equip_character(mob/living/carbon/human/H, is_admin)
	H.equip_to_slot_or_del(new /obj/item/clothing/under/solgov/utility/army/urban(H), slot_w_uniform)
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/dutyboots(H), slot_shoes)
	H.equip_to_slot_or_del(new /obj/item/device/radio/headset/rescue(H), slot_l_ear)
	H.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack/ert/engineer(H), slot_back)

	var/obj/item/weapon/card/id/patrol/marine/W = new(H)
	if(!W) return
	H.set_id_info(W)
	W.assignment = "Squad Engineer"
	W.military_branch = "Marine Corps"
	W.military_rank = "Lance Corporal"
	W.name = "LCAP [H.real_name]'s ID Card ([W.assignment])"
	H.equip_to_slot_or_del(W, slot_wear_id)

//	H.post_equip
	..()
	var/obj/item/clothing/under/uniform = H.w_uniform
	if(uniform)
		var/obj/item/clothing/accessory/solgov/rank/army/enlisted/e3/ceng = new()
		if(uniform.can_attach_accessory(ceng))
			uniform.attach_accessory(null, ceng)
		else
			qdel(ceng)

/obj/cryo_spawner/patrol_craft/marine_med
	name = "patrol craft marine-medic"
	species_can_only_use = list(SPECIES_HUMAN)

/obj/cryo_spawner/patrol_craft/marine_med/equip_character(mob/living/carbon/human/H, is_admin)
	H.equip_to_slot_or_del(new /obj/item/clothing/under/solgov/utility/army/urban(H), slot_w_uniform)
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/dutyboots(H), slot_shoes)
	H.equip_to_slot_or_del(new /obj/item/device/radio/headset/rescue(H), slot_l_ear)
	H.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack/ert/medical(H), slot_back)

	var/obj/item/weapon/card/id/patrol/marine/W = new(H)
	if(!W) return
	H.set_id_info(W)
	W.assignment = "Squad Medic"
	W.military_branch = "Marine Corps"
	W.military_rank = "Lance Corporal"
	W.name = "LCAP [H.real_name]'s ID Card ([W.assignment])"
	H.equip_to_slot_or_del(W, slot_wear_id)

//	H.post_equip
	..()
	var/obj/item/clothing/under/uniform = H.w_uniform
	if(uniform)
		var/obj/item/clothing/accessory/solgov/rank/army/enlisted/e3/medic = new()
		if(uniform.can_attach_accessory(medic))
			uniform.attach_accessory(null, medic)
		else
			qdel(medic)

/obj/cryo_spawner/patrol_craft/marine_lead
	name = "patrol craft marine-leader"
	species_can_only_use = list(SPECIES_HUMAN)

/obj/cryo_spawner/patrol_craft/marine_lead/equip_character(mob/living/carbon/human/H, is_admin)
	H.equip_to_slot_or_del(new /obj/item/clothing/under/solgov/utility/army/urban(H), slot_w_uniform)
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/dutyboots(H), slot_shoes)
	H.equip_to_slot_or_del(new /obj/item/device/radio/headset/rescue/leader(H), slot_l_ear)
	H.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack/ert/commander(H), slot_back)

	var/obj/item/weapon/card/id/patrol/marine/leader/W = new(H)
	if(!W) return
	H.set_id_info(W)
	W.assignment = "Squad Leader"
	W.military_branch = "Marine Corps"
	W.military_rank = "Sergeant"
	W.name = "SRG [H.real_name]'s ID Card ([W.assignment])"
	H.equip_to_slot_or_del(W, slot_wear_id)

//	H.post_equip
	..()
	var/obj/item/clothing/under/uniform = H.w_uniform
	if(uniform)
		var/obj/item/clothing/accessory/solgov/rank/army/enlisted/e5/leader = new()
		if(uniform.can_attach_accessory(leader))
			uniform.attach_accessory(null, leader)
		else
			qdel(leader)