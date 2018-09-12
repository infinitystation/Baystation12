/decl/hierarchy/outfit/scg
	name = "SCG"
	uniform = /obj/item/clothing/under/solgov

/decl/hierarchy/outfit/scg/troops
	name = "SCG MarineHolder"
	head = /obj/item/clothing/head/helmet/marine
	mask = /obj/item/clothing/mask/gas/half
	l_ear = /obj/item/device/radio/headset/specops
	suit = /obj/item/clothing/suit/armor/pcarrier/troops/heavy
	suit_store = /obj/item/weapon/gun/projectile/automatic/wt550/lethal
	gloves = /obj/item/clothing/gloves/thick/combat/marine
	belt = /obj/item/weapon/storage/belt/holster/security/tactical/troops
	uniform = /obj/item/clothing/under/solgov/utility/army/urban
	l_pocket = /obj/item/device/flashlight/maglight
	shoes = /obj/item/clothing/shoes/combat/marine
	id_slot = slot_wear_id
	id_desc = "An ID of SCG marine trooper."
	id_type = /obj/item/weapon/card/id/security

	back = /obj/item/weapon/storage/backpack/satchel/leather/black
	backpack_contents = list(
		/obj/item/weapon/storage/box/survival/troops = 1,
		/obj/item/weapon/storage/firstaid/individual/military/troops =1)
	flags = OUTFIT_HAS_BACKPACK

/decl/hierarchy/outfit/scg/troops/post_equip(var/mob/living/carbon/human/H)
	..()
	var/obj/item/clothing/uniform = H.w_uniform
	if(uniform)
		var/obj/item/clothing/accessory/badge/solgov/tags/tag = new()
		tag.stored_name = H.real_name
		tag.name = "[initial(tag.name)] ([tag.stored_name])"
		if(uniform.can_attach_accessory(tag))
			uniform.attach_accessory(null, tag)
		else
			qdel(tag)

/decl/hierarchy/outfit/scg/troops/standart
	name = "SCG Marine Standart"
	id_pda_assignment = "Marine Trooper"

/decl/hierarchy/outfit/scg/troops/standart/post_equip(var/mob/living/carbon/human/H)
	..()
	var/obj/item/clothing/uniform = H.w_uniform
	if(uniform)
		var/obj/item/clothing/accessory/solgov/rank/army/enlisted/e2/rank = new()
		if(uniform.can_attach_accessory(rank))
			uniform.attach_accessory(null, rank)
		else
			qdel(rank)

/decl/hierarchy/outfit/scg/troops/engineer
	name = "SCG Marine Combat Engineer"
	glasses = /obj/item/clothing/glasses/welding
	gloves = /obj/item/clothing/gloves/insulated/combat
	back = /obj/item/weapon/storage/backpack/satchel_eng
	belt = /obj/item/weapon/storage/belt/utility/full_buy
	id_pda_assignment = "Marine Combat Engineer"
	backpack_contents = list(
		/obj/item/weapon/storage/box/survival/troops = 1,
		/obj/item/weapon/storage/firstaid/individual/military/troops =1,
		/obj/item/weapon/plastique = 3)

/decl/hierarchy/outfit/scg/troops/engineer/New()
	..()
	BACKPACK_OVERRIDE_ENGINEERING

/decl/hierarchy/outfit/scg/troops/engineer/post_equip(var/mob/living/carbon/human/H)
	..()
	var/obj/item/clothing/uniform = H.w_uniform
	if(uniform)
		var/obj/item/clothing/accessory/solgov/rank/army/enlisted/e3/rank = new()
		if(uniform.can_attach_accessory(rank))
			uniform.attach_accessory(null, rank)
		else
			qdel(rank)

/decl/hierarchy/outfit/scg/troops/medic
	name = "SCG Marine Corpsman"
	glasses = /obj/item/clothing/glasses/hud/health
	back = /obj/item/weapon/storage/backpack/satchel_med
	suit = /obj/item/clothing/suit/armor/pcarrier/troops/medical
	belt = /obj/item/weapon/storage/belt/medical/emt/combat
	id_pda_assignment = "Marine Corpsman"
	backpack_contents = list(
		/obj/item/weapon/storage/box/survival/troops = 1,
		/obj/item/weapon/storage/firstaid/combat = 1,
		/obj/item/weapon/storage/firstaid/adv = 1,
		/obj/item/weapon/storage/firstaid/regular = 1,
		/obj/item/weapon/storage/firstaid/surgery = 1)

/decl/hierarchy/outfit/scg/troops/medic/New()
	..()
	BACKPACK_OVERRIDE_MEDICAL

/decl/hierarchy/outfit/scg/troops/medic/post_equip(var/mob/living/carbon/human/H)
	..()
	var/obj/item/clothing/uniform = H.w_uniform
	if(uniform)
		var/obj/item/clothing/accessory/solgov/rank/army/enlisted/e4/rank = new()
		if(uniform.can_attach_accessory(rank))
			uniform.attach_accessory(null, rank)
		else
			qdel(rank)

//evil things

/decl/hierarchy/outfit/scg/troops/sergeant
	name = "SCG Marine Sergeant"
	back = /obj/item/weapon/storage/backpack/security
	id_type = /obj/item/weapon/card/id/security/head
	id_pda_assignment = "Marine Squad Leader"
	backpack_contents = list(
		/obj/item/weapon/storage/box/survival/troops = 1,
		/obj/item/weapon/storage/firstaid/individual/military/troops =1)

/decl/hierarchy/outfit/scg/troops/sergeant/New()
	..()
	BACKPACK_OVERRIDE_SECURITY

/decl/hierarchy/outfit/scg/troops/sergeant/post_equip(var/mob/living/carbon/human/H)
	..()
	var/obj/item/clothing/uniform = H.w_uniform
	if(uniform)
		var/obj/item/clothing/accessory/solgov/rank/army/enlisted/e5/rank = new()
		if(uniform.can_attach_accessory(rank))
			uniform.attach_accessory(null, rank)
		else
			qdel(rank)

/obj/structure/closet/gimmick/marine
	name = "heavy marine gear closet"
	desc = "It's a storage unit for Marine gear."
	icon_state = "syndicate1"
	icon_closed = "syndicate1"
	icon_opened = "syndicate1open"

/obj/structure/closet/gimmick/marine/WillContain()
	return list(
		/obj/item/clothing/glasses/sunglasses/sechud,
		/obj/item/clothing/under/solgov/utility/army/urban,
		/obj/item/clothing/mask/gas/half,
		/obj/item/clothing/accessory/storage/black_vest,
		/obj/item/device/radio/headset/specops,
		/obj/item/device/radio/off,
		/obj/item/weapon/combitool)

/decl/hierarchy/outfit/marshal
	name = "OCIE hunter"
	shoes = /obj/item/clothing/shoes/jackboots
	uniform = /obj/item/clothing/under/rank/security/navyblue
	suit = /obj/item/clothing/suit/armor/pcarrier/light/sol
	l_ear = /obj/item/device/radio/headset/headset_sec
	belt = /obj/item/weapon/storage/belt/holster/security/ocei
	r_hand = /obj/item/clothing/accessory/badge/tracker
	l_hand = /obj/item/weapon/gun/energy/taser
	id_slot = slot_wear_id
	id_type = /obj/item/weapon/card/id/security
	id_desc = "An ID of SCG OCEI officer."
	id_pda_assignment = "OCEI Officer"


/decl/hierarchy/outfit/pmc
	name = "PMC aUnknown"
	shoes = /obj/item/clothing/shoes/combat/marine
	uniform = /obj/item/clothing/under/syndicate/combat
	l_ear = /obj/item/device/radio/headset/raider
	gloves = /obj/item/clothing/gloves/thick/combat/marine
	r_pocket = /obj/item/weapon/tank/emergency/oxygen/double
	id_slot = slot_wear_id
	id_type = /obj/item/weapon/card/id/centcom/station
	id_pda_assignment = "PMC"
	back = /obj/item/weapon/storage/backpack/satchel/pocketbook
	backpack_contents = list(/obj/item/weapon/storage/firstaid/individual/military/troops = 1,
							/obj/item/weapon/material/kitchen/utensil/knife/boot = 1,
							/obj/item/weapon/reagent_containers/food/snacks/candy/proteinbar = 1)

/decl/hierarchy/outfit/pmc/pcrc
	name = "PMC PCRC"
	uniform = /obj/item/clothing/under/pcrc/tactical
	glasses = /obj/item/clothing/glasses/tacgoggles
	mask = /obj/item/clothing/mask/gas/half
	suit = /obj/item/clothing/suit/armor/pcarrier/troops/heavy_pcrc
	head = /obj/item/clothing/head/helmet/pcrc
	belt = /obj/item/weapon/storage/belt/holster/security/tactical/troops
	r_hand = /obj/item/weapon/gun/projectile/automatic/wt550/lethal
	id_pda_assignment = "PCRC PMC"

/decl/hierarchy/outfit/pmc/saare
	name = "PMC SAARE"
	uniform = /obj/item/clothing/under/saare/tactical
	glasses = /obj/item/clothing/glasses/tacgoggles
	mask = /obj/item/clothing/mask/balaclava/tactical
	suit = /obj/item/clothing/suit/armor/pcarrier/green/heavy_saare
	head = /obj/item/clothing/head/helmet/saare/cover
	belt = /obj/item/weapon/storage/belt/holster/security/tactical/troops_sts
	r_hand = /obj/item/weapon/gun/projectile/automatic/sts35
	id_pda_assignment = "SAARE PMC"
	back = /obj/item/weapon/storage/backpack/satchel/pocketbook/khaki
	backpack_contents = list(/obj/item/weapon/storage/firstaid/individual/military/troops = 1,
							/obj/item/weapon/material/kitchen/utensil/knife/boot = 1,
							/obj/item/clothing/mask/gas/half = 1,
							/obj/item/weapon/reagent_containers/food/snacks/candy/proteinbar = 1)


			//////////
			//CORPSE//
			//////////

/obj/effect/landmark/corpse/syndicate
	name = "Syndicate Operative"
	corpse_outfits = list(/decl/hierarchy/outfit/mercenary/syndicate)
	spawn_flags = CORPSE_SPAWNER_NO_RANDOMIZATION

/obj/effect/landmark/corpse/syndicate/commando
	name = "Syndicate Commando"
	corpse_outfits = list(/decl/hierarchy/outfit/mercenary/syndicate/commando)


/obj/effect/landmark/corpse/crewman
	name = "Crewman"
	corpse_outfits = list(/decl/hierarchy/outfit/corpse/crewman)

/obj/effect/landmark/corpse/bridgeofficer/scg
	name = "Bridge Officer"
	corpse_outfits = list(/decl/hierarchy/outfit/corpse/bridgeofficer)

/obj/effect/landmark/corpse/inf_pirat
	name = "Pirat"
	corpse_outfits = list(/decl/hierarchy/outfit/corpse/pirat_inf)

/obj/effect/landmark/corpse/inf_pirat/space
	name = "Space Pirat"
	corpse_outfits = list(/decl/hierarchy/outfit/corpse/pirat_inf/space)

					///////////
					//Outfits//
					///////////

/decl/hierarchy/outfit/corpse/crewman
	name = "Dead crewmember"
	l_ear = /obj/item/device/radio/headset
	uniform = /obj/item/clothing/under/solgov/utility/fleet
	back = /obj/item/weapon/storage/backpack/satchel/leather/navy
	head = /obj/item/clothing/head/beret/solgov/fleet
	shoes = /obj/item/clothing/shoes/dutyboots
	id = 1
	id_type = /obj/item/weapon/card/id/torch/crew
	id_desc = "Crewman"
	id_slot = slot_wear_id

/decl/hierarchy/outfit/corpse/bridgeofficer
	name = "Dead bridge officer"
	l_ear = /obj/item/device/radio/headset
	uniform = /obj/item/clothing/under/solgov/utility/fleet/command
	head = /obj/item/clothing/head/beret/solgov/fleet/command
	shoes = /obj/item/clothing/shoes/dutyboots
	back = /obj/item/weapon/storage/backpack/satchel/pocketbook/navy
	id_type = /obj/item/weapon/card/id/torch/crew
	id_desc = "Bridge Officer"
	id_slot = slot_wear_id

/decl/hierarchy/outfit/corpse/pirat_inf
	name = "Dead Pirat"
	uniform = /obj/item/clothing/under/pirate
	shoes = /obj/random/shoes/poor
	gloves = /obj/random/gloves/poor
	head = /obj/random/hat/poor
	l_pocket = /obj/item/device/radio/off

/decl/hierarchy/outfit/corpse/pirat_inf/space
	name = "Dead Space Pirat"
	suit = /obj/item/clothing/suit/space
	mask = /obj/item/clothing/mask/breath
	head = /obj/item/clothing/head/helmet/space
	back = /obj/item/weapon/tank/oxygen