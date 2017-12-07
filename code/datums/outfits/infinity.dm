/decl/hierarchy/outfit/merchant/leader
	name = "Merchant Leader"
	shoes = /obj/item/clothing/shoes/black
	l_ear = /obj/item/device/radio/headset
	uniform = /obj/item/clothing/under/color/black
	id_slot = slot_wear_id
	id_type = /obj/item/weapon/card/id/merchant/leader
	pda_slot = slot_r_store
	pda_type = /obj/item/device/pda/chef //cause I like the look
	id_pda_assignment = "Merchant Leader"

/decl/hierarchy/outfit/merchant/vox_leader
	name = "Merchant - Vox Leader"
	id_type = /obj/item/weapon/card/id/merchant/leader
	shoes = /obj/item/clothing/shoes/jackboots/unathi
	uniform = /obj/item/clothing/under/vox/vox_robes
	id_pda_assignment = "Merchant Leader"

/decl/hierarchy/outfit/daft_punk
	name = "Daft Punk"
	shoes = /obj/item/clothing/shoes/laceup
	uniform = /obj/item/clothing/under/suit_jacket/charcoal
	suit = /obj/item/clothing/suit/storage/toggle/suit/black
	head = /obj/item/clothing/head/helmet/daft_punk
	gloves = /obj/item/clothing/gloves/daft_punk
	id_slot = slot_wear_id
	id_type = /obj/item/weapon/card/id/centcom/station
	id_pda_assignment = "DJ"

/decl/hierarchy/outfit/scg/troops
	name = "SCG MarineHolder"
	head = /obj/item/clothing/head/helmet/marine
	mask = /obj/item/clothing/mask/balaclava
	l_ear = /obj/item/device/radio/headset/specops
	suit = /obj/item/clothing/suit/armor/pcarrier/troops
	suit_store = /obj/item/weapon/gun/projectile/automatic/wt550/lethal
	gloves = /obj/item/clothing/gloves/thick/combat/marine
	belt = /obj/item/weapon/storage/belt/security/troops
	uniform = /obj/item/clothing/under/solgov/utility/marine/urban
	l_pocket = /obj/item/device/flashlight/maglight
	shoes = /obj/item/clothing/shoes/combat/marine
	back = /obj/item/weapon/storage/backpack/satchel/black
	backpack_contents = list(
		/obj/item/weapon/storage/box/survival/troops = 1,
		/obj/item/weapon/storage/firstaid/individual/military_individual/troops =1)

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

/decl/hierarchy/outfit/scg/troops/standart/post_equip(var/mob/living/carbon/human/H)
	..()
	var/obj/item/clothing/uniform = H.w_uniform
	if(uniform)
		var/obj/item/clothing/accessory/solgov/rank/marine/enlisted/e2/rank = new()
		if(uniform.can_attach_accessory(rank))
			uniform.attach_accessory(null, rank)
		else
			qdel(rank)

/decl/hierarchy/outfit/scg/troops/engineer
	name = "SCG Marine Combat Engineer"
	glasses = /obj/item/clothing/glasses/welding
	mask = /obj/item/clothing/mask/gas/half
	gloves = /obj/item/clothing/gloves/insulated/combat
	back = /obj/item/weapon/storage/backpack/satchel_eng
	belt = /obj/item/weapon/storage/belt/utility/full_buy
	backpack_contents = list(
		/obj/item/weapon/storage/box/survival/troops = 1,
		/obj/item/weapon/storage/firstaid/individual/military_individual/troops =1,
		/obj/item/weapon/plastique = 3)

/decl/hierarchy/outfit/scg/troops/engineer/post_equip(var/mob/living/carbon/human/H)
	..()
	var/obj/item/clothing/uniform = H.w_uniform
	if(uniform)
		var/obj/item/clothing/accessory/solgov/rank/marine/enlisted/e3/rank = new()
		if(uniform.can_attach_accessory(rank))
			uniform.attach_accessory(null, rank)
		else
			qdel(rank)

/decl/hierarchy/outfit/scg/troops/medic
	name = "SCG Marine Corpsman"
	glasses = /obj/item/clothing/glasses/hud/health
	back = /obj/item/weapon/storage/backpack/satchel_med
	mask = /obj/item/clothing/mask/gas/half
	suit = /obj/item/clothing/suit/armor/pcarrier/troops/medical
	belt = /obj/item/weapon/storage/belt/medical/emt/combat
	backpack_contents = list(
		/obj/item/weapon/storage/box/survival/troops = 1,
		/obj/item/weapon/storage/firstaid/combat = 1,
		/obj/item/weapon/storage/firstaid/adv = 1,
		/obj/item/weapon/storage/firstaid/regular = 1,
		/obj/item/weapon/storage/firstaid/surgery = 1)

/decl/hierarchy/outfit/scg/troops/medic/post_equip(var/mob/living/carbon/human/H)
	..()
	var/obj/item/clothing/uniform = H.w_uniform
	if(uniform)
		var/obj/item/clothing/accessory/solgov/rank/marine/enlisted/e4/rank = new()
		if(uniform.can_attach_accessory(rank))
			uniform.attach_accessory(null, rank)
		else
			qdel(rank)


/decl/hierarchy/outfit/scg/troops/sergeant
	name = "SCG Marine Sergeant"
	back = /obj/item/weapon/storage/backpack/security
	mask = /obj/item/clothing/mask/gas/half
	suit = /obj/item/clothing/suit/armor/pcarrier/troops/heavy
	belt = /obj/item/weapon/storage/belt/security/troops
	backpack_contents = list(
		/obj/item/weapon/storage/box/survival/troops = 1,
		/obj/item/weapon/storage/firstaid/individual/military_individual/troops =1)

/decl/hierarchy/outfit/scg/troops/sergeant/post_equip(var/mob/living/carbon/human/H)
	..()
	var/obj/item/clothing/uniform = H.w_uniform
	if(uniform)
		var/obj/item/clothing/accessory/solgov/rank/marine/enlisted/e5/rank = new()
		if(uniform.can_attach_accessory(rank))
			uniform.attach_accessory(null, rank)
		else
			qdel(rank)

