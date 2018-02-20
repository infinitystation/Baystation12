/obj/cryo_spawner/patrol_craft
	name = "patrol craft crewman"

/obj/cryo_spawner/patrol_craft/equip_character(mob/living/carbon/human/H, is_admin)
	H.equip_to_slot_or_del(new /obj/item/clothing/under/solgov/utility/fleet(H), slot_w_uniform)
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/dutyboots(H), slot_shoes)
	H.equip_to_slot_or_del(new /obj/item/device/radio/headset(H), slot_l_ear)
	H.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack/satchel/leather/navy(H), slot_back)

	var/obj/item/weapon/card/id/torch/crew/W = new(H)
	W.name = "[H.real_name]'s ID Card"
	W.desc = "An identification card issued to SolGov crewmembers aboard the Patrol Craft."
	W.assignment = "Patrol Craft Crewman"
	W.registered_name = H.real_name
	H.equip_to_slot_or_del(W, slot_wear_id)

//	H.post_equip
	..()
	var/obj/item/clothing/under/uniform = H.w_uniform
	if(uniform)
		var/obj/item/clothing/accessory/solgov/rank/fleet/enlisted/e3/rank = new()
		if(uniform.can_attach_accessory(rank))
			uniform.attach_accessory(null, rank)
		else
			qdel(rank)

/obj/cryo_spawner/patrol_craft/engineer
	name = "patrol craft engineer"

/obj/cryo_spawner/patrol_craft/engineer/equip_character(mob/living/carbon/human/H, is_admin)
	H.equip_to_slot_or_del(new /obj/item/clothing/under/solgov/utility/fleet/engineering(H), slot_w_uniform)
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/dutyboots(H), slot_shoes)
	H.equip_to_slot_or_del(new /obj/item/device/radio/headset/headset_eng(H), slot_l_ear)
	H.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack/satchel/leather/navy(H), slot_back)

	var/obj/item/weapon/card/id/torch/crew/engineering/W = new(H)
	W.name = "[H.real_name]'s ID Card"
	W.desc = "An identification card issued to SolGov crewmembers aboard the Patrol Craft."
	W.assignment = "Patrol Craft Engineer"
	W.registered_name = H.real_name
	H.equip_to_slot_or_del(W, slot_wear_id)

//	H.post_equip
	..()
	var/obj/item/clothing/under/uniform = H.w_uniform
	if(uniform)
		var/obj/item/clothing/accessory/solgov/rank/fleet/enlisted/e4/rank = new()
		if(uniform.can_attach_accessory(rank))
			uniform.attach_accessory(null, rank)
		else
			qdel(rank)

/obj/cryo_spawner/patrol_craft/doctor
	name = "patrol craft doctor"

/obj/cryo_spawner/patrol_craft/doctor/equip_character(mob/living/carbon/human/H, is_admin)
	H.equip_to_slot_or_del(new /obj/item/clothing/under/solgov/utility/fleet/medical(H), slot_w_uniform)
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/dutyboots(H), slot_shoes)
	H.equip_to_slot_or_del(new /obj/item/device/radio/headset/headset_med(H), slot_l_ear)
	H.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack/satchel/leather/navy(H), slot_back)

	var/obj/item/weapon/card/id/torch/crew/medical/W = new(H)
	W.name = "[H.real_name]'s ID Card"
	W.desc = "An identification card issued to SolGov crewmembers aboard the Patrol Craft."
	W.assignment = "Patrol Craft Doctor"
	W.registered_name = H.real_name
	H.equip_to_slot_or_del(W, slot_wear_id)

//	H.post_equip
	..()
	var/obj/item/clothing/under/uniform = H.w_uniform
	if(uniform)
		var/obj/item/clothing/accessory/solgov/rank/fleet/enlisted/e4/rank = new()
		if(uniform.can_attach_accessory(rank))
			uniform.attach_accessory(null, rank)
		else
			qdel(rank)

/obj/cryo_spawner/patrol_craft/officer
	name = "patrol craft officer"

/obj/cryo_spawner/patrol_craft/officer/equip_character(mob/living/carbon/human/H, is_admin)
	H.equip_to_slot_or_del(new /obj/item/clothing/under/solgov/utility/fleet/command(H), slot_w_uniform)
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/dutyboots(H), slot_shoes)
	H.equip_to_slot_or_del(new /obj/item/device/radio/headset/bridgeofficer(H), slot_l_ear)
	H.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack/satchel/leather/navy(H), slot_back)

	var/obj/item/weapon/card/id/torch/crew/bridgeofficer/W = new(H)
	W.name = "[H.real_name]'s ID Card"
	W.desc = "An identification card issued to SolGov crewmembers aboard the Patrol Craft."
	W.assignment = "Patrol Craft Officer"
	W.registered_name = H.real_name
	H.equip_to_slot_or_del(W, slot_wear_id)

//	H.post_equip
	..()
	var/obj/item/clothing/under/uniform = H.w_uniform
	if(uniform)
		var/obj/item/clothing/accessory/solgov/rank/fleet/officer/rank = new()
		if(uniform.can_attach_accessory(rank))
			uniform.attach_accessory(null, rank)
		else
			qdel(rank)
	if(uniform)
		var/obj/item/clothing/accessory/solgov/speciality/pilot/spec = new()
		if(uniform.can_attach_accessory(spec))
			uniform.attach_accessory(null, spec)
		else
			qdel(spec)

/obj/cryo_spawner/patrol_craft/captain
	name = "patrol craft captain"

/obj/cryo_spawner/patrol_craft/captain/equip_character(mob/living/carbon/human/H, is_admin)
	H.equip_to_slot_or_del(new /obj/item/clothing/under/solgov/utility/fleet/command(H), slot_w_uniform)
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/dutyboots(H), slot_shoes)
	H.equip_to_slot_or_del(new /obj/item/device/radio/headset/heads(H), slot_l_ear)
	H.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack/satchel/leather/navy(H), slot_back)

	var/obj/item/weapon/card/id/torch/crew/bridgeofficer/W = new(H)
	W.name = "[H.real_name]'s ID Card"
	W.desc = "An identification card issued to SolGov crewmembers aboard the Patrol Craft."
	W.assignment = "Patrol Craft Captain"
	W.registered_name = H.real_name
	H.equip_to_slot_or_del(W, slot_wear_id)

//	H.post_equip
	..()
	var/obj/item/clothing/under/uniform = H.w_uniform
	if(uniform)
		var/obj/item/clothing/accessory/solgov/rank/fleet/officer/o3/rank = new()
		if(uniform.can_attach_accessory(rank))
			uniform.attach_accessory(null, rank)
		else
			qdel(rank)

/obj/cryo_spawner/patrol_craft/marine
	name = "patrol craft marine"

/obj/cryo_spawner/patrol_craft/marine/equip_character(mob/living/carbon/human/H, is_admin)
	H.equip_to_slot_or_del(new /obj/item/clothing/under/solgov/utility/marine/urban(H), slot_w_uniform)
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/dutyboots(H), slot_shoes)
	H.equip_to_slot_or_del(new/obj/item/device/radio/headset/headset_sec(H), slot_l_ear)
	H.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack/satchel/leather/black(H), slot_back)

	var/obj/item/weapon/card/id/torch/crew/W = new(H)
	W.name = "[H.real_name]'s ID Card"
	W.desc = "An identification card issued to SolGov crewmembers aboard the Patrol Craft."
	W.assignment = "Patrol Craft Trooper"
	W.registered_name = H.real_name
	H.equip_to_slot_or_del(W, slot_wear_id)

//	H.post_equip
	..()
	var/obj/item/clothing/under/uniform = H.w_uniform
	if(uniform)
		var/obj/item/clothing/accessory/solgov/rank/marine/enlisted/e2/rank = new()
		if(uniform.can_attach_accessory(rank))
			uniform.attach_accessory(null, rank)
		else
			qdel(rank)

/obj/cryo_spawner/patrol_craft/marine_eng
	name = "patrol craft marine-engineer"

/obj/cryo_spawner/patrol_craft/marine_eng/equip_character(mob/living/carbon/human/H, is_admin)
	H.equip_to_slot_or_del(new /obj/item/clothing/under/solgov/utility/marine/urban(H), slot_w_uniform)
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/dutyboots(H), slot_shoes)
	H.equip_to_slot_or_del(new/obj/item/device/radio/headset/headset_sec(H), slot_l_ear)
	H.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack/satchel/leather/black(H), slot_back)

	var/obj/item/weapon/card/id/torch/crew/engineering/W = new(H)
	W.name = "[H.real_name]'s ID Card"
	W.desc = "An identification card issued to SolGov crewmembers aboard the Patrol Craft."
	W.assignment = "Patrol Craft Combat Engineer"
	W.registered_name = H.real_name
	H.equip_to_slot_or_del(W, slot_wear_id)

//	H.post_equip
	..()
	var/obj/item/clothing/under/uniform = H.w_uniform
	if(uniform)
		var/obj/item/clothing/accessory/solgov/rank/marine/enlisted/e3/rank = new()
		if(uniform.can_attach_accessory(rank))
			uniform.attach_accessory(null, rank)
		else
			qdel(rank)

/obj/cryo_spawner/patrol_craft/marine_med
	name = "patrol craft marine-medic"

/obj/cryo_spawner/patrol_craft/marine_med/equip_character(mob/living/carbon/human/H, is_admin)
	H.equip_to_slot_or_del(new /obj/item/clothing/under/solgov/utility/marine/urban(H), slot_w_uniform)
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/dutyboots(H), slot_shoes)
	H.equip_to_slot_or_del(new/obj/item/device/radio/headset/headset_sec(H), slot_l_ear)
	H.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack/satchel/leather/black(H), slot_back)

	var/obj/item/weapon/card/id/torch/crew/medical/W = new(H)
	W.name = "[H.real_name]'s ID Card"
	W.desc = "An identification card issued to SolGov crewmembers aboard the Patrol Craft."
	W.assignment = "Patrol Craft Combat Medic"
	W.registered_name = H.real_name
	H.equip_to_slot_or_del(W, slot_wear_id)

//	H.post_equip
	..()
	var/obj/item/clothing/under/uniform = H.w_uniform
	if(uniform)
		var/obj/item/clothing/accessory/solgov/rank/marine/enlisted/e3/rank = new()
		if(uniform.can_attach_accessory(rank))
			uniform.attach_accessory(null, rank)
		else
			qdel(rank)

/obj/cryo_spawner/patrol_craft/marine_lead
	name = "patrol craft marine-leader"

/obj/cryo_spawner/patrol_craft/marine_lead/equip_character(mob/living/carbon/human/H, is_admin)
	H.equip_to_slot_or_del(new /obj/item/clothing/under/solgov/utility/marine/urban(H), slot_w_uniform)
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/dutyboots(H), slot_shoes)
	H.equip_to_slot_or_del(new/obj/item/device/radio/headset/headset_sec(H), slot_l_ear)
	H.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack/satchel/leather/black(H), slot_back)

	var/obj/item/weapon/card/id/torch/crew/security/brigofficer/W = new(H)
	W.name = "[H.real_name]'s ID Card"
	W.desc = "An identification card issued to SolGov crewmembers aboard the Patrol Craft."
	W.assignment = "Patrol Craft Squad Leader"
	W.registered_name = H.real_name
	H.equip_to_slot_or_del(W, slot_wear_id)

//	H.post_equip
	..()
	var/obj/item/clothing/under/uniform = H.w_uniform
	if(uniform)
		var/obj/item/clothing/accessory/solgov/rank/marine/enlisted/e5/rank = new()
		if(uniform.can_attach_accessory(rank))
			uniform.attach_accessory(null, rank)
		else
			qdel(rank)

///////////
//CLOSETS//
///////////

/obj/structure/closet/secure_closet/patrol/
	name = "marine locker"
	req_access = list(access_brig)
	icon_state = "sec1"
	icon_closed = "sec"
	icon_locked = "sec1"
	icon_opened = "secopen"
	icon_off = "secoff"

/obj/structure/closet/secure_closet/patrol/WillContain()
	return list(
		/obj/item/weapon/storage/belt/security/troops/patrol,
		/obj/item/weapon/melee/baton/loaded,
		/obj/item/clothing/glasses/sunglasses/sechud/goggles,
		/obj/item/clothing/accessory/storage/black_vest,
		/obj/item/clothing/gloves/thick/combat/marine,
		/obj/item/device/flashlight/maglight,
		/obj/item/weapon/storage/firstaid/individual/military/troops
	)

/obj/structure/closet/secure_closet/patrol/marine_eng/WillContain()
	return list(
		/obj/item/weapon/storage/belt/utility/full_buy,
		/obj/item/clothing/glasses/sunglasses/sechud/goggles,
		/obj/item/clothing/accessory/storage/black_vest,
		/obj/item/clothing/gloves/insulated/combat,
		/obj/item/device/flashlight/maglight,
		/obj/item/weapon/storage/firstaid/individual/military/troops
	)

/obj/structure/closet/secure_closet/patrol/marine_med/WillContain()
	return list(
		/obj/item/weapon/defibrillator/compact/combat/loaded,
		/obj/item/clothing/glasses/hud/health/visor,
		/obj/item/clothing/accessory/storage/black_vest,
		/obj/item/clothing/gloves/insulated/combat,
		/obj/item/device/flashlight/maglight,
		/obj/item/weapon/storage/firstaid/individual/military/troops
	)

/obj/structure/closet/secure_closet/patrol/marine_lead/WillContain()
	return list(
		/obj/item/weapon/storage/belt/security/troops/patrol,
		/obj/item/weapon/melee/baton/loaded,
		/obj/item/clothing/glasses/sunglasses/sechud/goggles,
		/obj/item/clothing/accessory/storage/black_vest,
		/obj/item/clothing/gloves/thick/combat/marine,
		/obj/item/device/flashlight/maglight,
		/obj/item/weapon/storage/firstaid/individual/military/troops,
		/obj/item/device/megaphone
	)

/obj/item/weapon/storage/belt/security/troops/patrol/New()
	..()
	new /obj/item/weapon/gun/projectile/sec/lethal(src)
	new /obj/item/ammo_magazine/c45m(src)