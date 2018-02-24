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
	H.equip_to_slot_or_del(new /obj/item/clothing/under/solgov/utility/marine/urban(H), slot_w_uniform)
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/dutyboots(H), slot_shoes)
	H.equip_to_slot_or_del(new /obj/item/device/radio/headset/rescue(H), slot_l_ear)
	H.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack/ert/security(H), slot_back)

	var/obj/item/weapon/card/id/patrol/marine/W = new(H)
	if(!W) return
	H.set_id_info(W)
	W.assignment = "Trooper"
	W.name = "[H.real_name]'s ID Card ([W.assignment])"
	H.equip_to_slot_or_del(W, slot_wear_id)

//	H.post_equip
	..()
	var/obj/item/clothing/under/uniform = H.w_uniform
	if(uniform)
		var/obj/item/clothing/accessory/solgov/rank/marine/enlisted/e2/marine = new()
		if(uniform.can_attach_accessory(marine))
			uniform.attach_accessory(null, marine)
		else
			qdel(marine)

/obj/cryo_spawner/patrol_craft/marine_eng
	name = "patrol craft marine-engineer"
	species_can_only_use = list(SPECIES_HUMAN)

/obj/cryo_spawner/patrol_craft/marine_eng/equip_character(mob/living/carbon/human/H, is_admin)
	H.equip_to_slot_or_del(new /obj/item/clothing/under/solgov/utility/marine/urban(H), slot_w_uniform)
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/dutyboots(H), slot_shoes)
	H.equip_to_slot_or_del(new /obj/item/device/radio/headset/rescue(H), slot_l_ear)
	H.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack/ert/engineer(H), slot_back)

	var/obj/item/weapon/card/id/patrol/marine/W = new(H)
	if(!W) return
	H.set_id_info(W)
	W.assignment = "Combat Engineer"
	W.name = "[H.real_name]'s ID Card ([W.assignment])"
	H.equip_to_slot_or_del(W, slot_wear_id)

//	H.post_equip
	..()
	var/obj/item/clothing/under/uniform = H.w_uniform
	if(uniform)
		var/obj/item/clothing/accessory/solgov/rank/marine/enlisted/e3/ceng = new()
		if(uniform.can_attach_accessory(ceng))
			uniform.attach_accessory(null, ceng)
		else
			qdel(ceng)

/obj/cryo_spawner/patrol_craft/marine_med
	name = "patrol craft marine-medic"
	species_can_only_use = list(SPECIES_HUMAN)

/obj/cryo_spawner/patrol_craft/marine_med/equip_character(mob/living/carbon/human/H, is_admin)
	H.equip_to_slot_or_del(new /obj/item/clothing/under/solgov/utility/marine/urban(H), slot_w_uniform)
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/dutyboots(H), slot_shoes)
	H.equip_to_slot_or_del(new /obj/item/device/radio/headset/rescue(H), slot_l_ear)
	H.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack/ert/medical(H), slot_back)

	var/obj/item/weapon/card/id/patrol/marine/W = new(H)
	if(!W) return
	H.set_id_info(W)
	W.assignment = "Combat Medic"
	W.name = "[H.real_name]'s ID Card ([W.assignment])"
	H.equip_to_slot_or_del(W, slot_wear_id)

//	H.post_equip
	..()
	var/obj/item/clothing/under/uniform = H.w_uniform
	if(uniform)
		var/obj/item/clothing/accessory/solgov/rank/marine/enlisted/e3/medic = new()
		if(uniform.can_attach_accessory(medic))
			uniform.attach_accessory(null, medic)
		else
			qdel(medic)

/obj/cryo_spawner/patrol_craft/marine_lead
	name = "patrol craft marine-leader"
	species_can_only_use = list(SPECIES_HUMAN)

/obj/cryo_spawner/patrol_craft/marine_lead/equip_character(mob/living/carbon/human/H, is_admin)
	H.equip_to_slot_or_del(new /obj/item/clothing/under/solgov/utility/marine/urban(H), slot_w_uniform)
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/dutyboots(H), slot_shoes)
	H.equip_to_slot_or_del(new /obj/item/device/radio/headset/rescue/leader(H), slot_l_ear)
	H.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack/ert/commander(H), slot_back)

	var/obj/item/weapon/card/id/patrol/marine/leader/W = new(H)
	if(!W) return
	H.set_id_info(W)
	W.assignment = "Squad Leader"
	W.name = "[H.real_name]'s ID Card ([W.assignment])"
	H.equip_to_slot_or_del(W, slot_wear_id)

//	H.post_equip
	..()
	var/obj/item/clothing/under/uniform = H.w_uniform
	if(uniform)
		var/obj/item/clothing/accessory/solgov/rank/marine/enlisted/e5/leader = new()
		if(uniform.can_attach_accessory(leader))
			uniform.attach_accessory(null, leader)
		else
			qdel(leader)

///////////
//CLOSETS//
///////////

/obj/structure/closet/secure_closet/patrol
	name = "marine locker"
	req_access = list(access_barracks)
	icon_state = "sec1"
	icon_closed = "sec"
	icon_locked = "sec1"
	icon_opened = "secopen"
	icon_off = "secoff"

/obj/structure/closet/secure_closet/patrol/WillContain()
	return list(
		/obj/item/weapon/storage/belt/security/patrol,
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

/obj/structure/closet/secure_closet/patrol/marine_lead
	name = "marine leader locker"
	req_access = list(access_barracks)

/obj/structure/closet/secure_closet/patrol/marine_lead/WillContain()
	return list(
		/obj/item/weapon/storage/belt/security/patrol,
		/obj/item/weapon/melee/baton/loaded,
		/obj/item/clothing/glasses/sunglasses/sechud/goggles,
		/obj/item/clothing/accessory/storage/black_vest,
		/obj/item/clothing/gloves/thick/combat/marine,
		/obj/item/device/flashlight/maglight,
		/obj/item/weapon/storage/firstaid/individual/military/troops,
		/obj/item/device/megaphone
	)

/obj/item/weapon/storage/belt/security/patrol/New()
	..()
	new /obj/item/weapon/gun/projectile/sec/lethal(src)
	new /obj/item/ammo_magazine/c45m(src)



/obj/item/clothing/accessory/storage/bandolier/patrol/New()
	..()

	for(var/i = 0, i < slots, i++)
		new /obj/item/ammo_casing/shotgun/pellet(hold)

/obj/item/clothing/suit/space/void/military/prepared/patrol
	starting_accessories = list(/obj/item/clothing/accessory/solgov/fleet_patch/fifth)





/obj/item/weapon/card/id/patrol/marine
	desc = "An identification card issued to SolGov crewmembers aboard the Sol Patrol Craft."
	icon_state = "solgov"
	access = list(access_maint_tunnels, access_external_airlocks, access_emergency_storage,
	 access_solgov_crew, access_barracks)

/obj/item/weapon/card/id/patrol/marine/leader
	desc = "An identification card issued to SolGov crewmembers aboard the Sol Patrol Craft."
	icon_state = "solgov"
	access = list(access_maint_tunnels, access_external_airlocks, access_emergency_storage,
	 access_solgov_crew, access_barracks, access_troopsarm, access_heads, access_keycard_auth, access_albatross)

/obj/item/weapon/card/id/patrol/officer
	desc = "An identification card issued to SolGov crewmembers aboard the Sol Patrol Craft."
	icon_state = "solgov"
	access = list(access_security, access_medical, access_engine, access_maint_tunnels, access_emergency_storage,
			            access_heads, access_janitor, access_kitchen, access_cargo, access_RC_announce, access_keycard_auth,
			            access_solgov_crew, access_albatross)

/obj/item/weapon/card/id/patrol/captain
	desc = "An identification card issued to SolGov crewmembers aboard the Sol Patrol Craft."
	icon_state = "solgov"
	access = list(access_security, access_brig, access_armory,
			            access_medical, access_engine, access_maint_tunnels, access_external_airlocks,
			            access_heads, access_atmospherics, access_kitchen, access_network, access_surgery, access_RC_announce, access_keycard_auth, access_tcomsat,
			            access_solgov_crew, access_gun, access_albatross, access_barracks, access_troopsarm)


/var/const/access_albatross = 301
/datum/access/albatross
	id = access_albatross
	desc = "Albatross"
	region = ACCESS_TYPE_NONE

/var/const/access_barracks = 302
/datum/access/barracks
	id = access_barracks
	desc = "Barracks"
	region = ACCESS_TYPE_NONE

/var/const/access_troopsarm = 303
/datum/access/troopsarm
	id = access_troopsarm
	desc = "Troops Armory"
	region = ACCESS_TYPE_NONE