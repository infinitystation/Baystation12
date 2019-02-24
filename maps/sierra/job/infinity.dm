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
	back = /obj/item/weapon/storage/backpack/satchel/eng
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
	back = /obj/item/weapon/storage/backpack/satchel/med
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

/decl/hierarchy/outfit/marshal
	name = "OCIE tracker"
	shoes = /obj/item/clothing/shoes/jackboots
	uniform = /obj/item/clothing/under/rank/security/navyblue
	suit = /obj/item/clothing/suit/armor/pcarrier/light/sol
	l_ear = /obj/item/device/radio/headset/headset_sec
	belt = /obj/item/weapon/storage/belt/holster/security/ocei
	r_hand = /obj/item/clothing/accessory/badge/tracker
	l_hand = /obj/item/weapon/gun/energy/taser
	id_slot = slot_wear_id
	id_type = /obj/item/weapon/card/id/security
	id_desc = "An ID of SCG OCEI tracker."
	id_pda_assignment = "OCEI tracker"
