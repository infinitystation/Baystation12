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
	suit = /obj/item/clothing/suit/storage/toggle/internalaffairs
	head = /obj/item/clothing/head/helmet/daft_punk
	gloves = /obj/item/clothing/gloves/daft_punk
	id_slot = slot_wear_id
	id_type = /obj/item/weapon/card/id/centcom/station
	id_pda_assignment = "DJ"

/decl/hierarchy/outfit/marshal
	name = "SCG Marshal"
	shoes = /obj/item/clothing/shoes/jackboots
	uniform = /obj/item/clothing/under/rank/security/navyblue
	suit = /obj/item/clothing/suit/armor/vest/solgov
	l_ear = /obj/item/device/radio/headset/headset_sec
	belt = /obj/item/weapon/storage/belt/security/marshal
	l_pocket = /obj/item/clothing/accessory/holster/thigh
	r_pocket = /obj/item/clothing/accessory/solgov/rank/marine/enlisted/e4
	r_hand = /obj/item/clothing/accessory/badge/marshal
	l_hand = /obj/item/weapon/gun/energy/taser
	id_slot = slot_wear_id
	id_type = /obj/item/weapon/card/id/security
	id_desc = "An ID of SCG police marshals."
	id_pda_assignment = "Colonial Bureau Officer"
/*
/decl/hierarchy/outfit/army/private
	name = "SCG Marine Private"
	shoes = /obj/item/clothing/shoes/jungleboots
	uniform = /obj/item/clothing/under/solgov/utility/marine/tan
	suit = /obj/item/clothing/suit/storage/vest/tactical
	head = /obj/item/clothing/head/helmet/tactical
	l_ear = /obj/item/device/radio/headset/specops
	belt = /obj/item/weapon/storage/belt/security/tactical
	r_pocket = /obj/item/device/flashlight/maglight


/decl/hierarchy/outfit/army/private/post_equip(var/mob/living/carbon/human/H)
	..()
	var/obj/item/clothing/under = H.w_uniform
	if(uniform)
		var/obj/random/rank/marine/private/rank = new()
		if(under.can_attach_accessory(rank))
			under.attach_accessory(null, rank)

/decl/hierarchy/outfit/army/sergeant
	name = "SCG Marine Sergeant"
	shoes = /obj/item/clothing/shoes/jungleboots
	uniform = /obj/item/clothing/under/solgov/utility/marine/tan
	suit = /obj/item/clothing/suit/storage/vest/tactical
	head = /obj/item/clothing/head/helmet/tactical
	l_ear = /obj/item/device/radio/headset/specops
	belt = /obj/item/weapon/storage/belt/security/tactical
	r_pocket = /obj/item/device/flashlight/maglight


/decl/hierarchy/outfit/army/sergeant/post_equip(var/mob/living/carbon/human/H)
	..()
	var/obj/item/clothing/under/uniform = H.w_uniform
	if(uniform)
		var/obj/random/rank/marine/sergeant/rank = new()
		if(uniform.can_attach_accessory(rank))
			uniform.attach_accessory(null, rank)
*/
