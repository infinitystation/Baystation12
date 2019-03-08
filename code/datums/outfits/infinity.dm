/decl/hierarchy/outfit/merchant/leader
	name = "Merchant Leader"
	shoes = /obj/item/clothing/shoes/black
	l_ear = /obj/item/device/radio/headset
	uniform = /obj/item/clothing/under/color/black
	id_slot = slot_wear_id
	id_type = /obj/item/weapon/card/id/merchant/leader
	pda_slot = slot_r_store
//	pda_type = /obj/item/modular_computer/pda/chef //cause I(?) like the look
	id_pda_assignment = "Merchant Leader"

/decl/hierarchy/outfit/merchant/vox_leader
	name = "Merchant - Vox Leader"
	id_type = /obj/item/weapon/card/id/merchant/leader
	shoes = /obj/item/clothing/shoes/jackboots/unathi
	uniform = /obj/item/clothing/under/vox/vox_robes
	id_pda_assignment = "Merchant Leader"

/*
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
*/

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
	suit = /obj/item/clothing/suit/armor/pcarrier/troops/heavy/pcrc
	head = /obj/item/clothing/head/helmet/pcrc
	belt = /obj/item/weapon/storage/belt/holster/security/tactical/troops
	r_hand = /obj/item/weapon/gun/projectile/automatic/wt550/lethal
	id_pda_assignment = "PCRC PMC"

/decl/hierarchy/outfit/pmc/saare
	name = "PMC SAARE"
	uniform = /obj/item/clothing/under/saare/tactical
	glasses = /obj/item/clothing/glasses/tacgoggles
	mask = /obj/item/clothing/mask/gas/half
	suit = /obj/item/clothing/suit/armor/pcarrier/green/heavy_saare
	head = /obj/item/clothing/head/helmet/saare/cover
	belt = /obj/item/weapon/storage/belt/holster/security/tactical/troops_sts
	r_hand = /obj/item/weapon/gun/projectile/automatic/sts35
	id_pda_assignment = "SAARE PMC"
	back = /obj/item/weapon/storage/backpack/satchel/pocketbook/khaki
	backpack_contents = list(/obj/item/weapon/storage/firstaid/individual/military/troops = 1,
							/obj/item/weapon/material/kitchen/utensil/knife/boot = 1,
							/obj/item/weapon/reagent_containers/food/snacks/candy/proteinbar = 1)


			//////////
			//CORPSES//
			//////////

/obj/effect/landmark/corpse/syndicate
	name = "Syndicate Operative"
	corpse_outfits = list(/decl/hierarchy/outfit/mercenary/syndicate)

/obj/effect/landmark/corpse/syndicate/commando
	name = "Syndicate Commando"
	corpse_outfits = list(/decl/hierarchy/outfit/mercenary/syndicate/commando)

/decl/hierarchy/outfit/pirat_inf
	name = "Dead Pirat Inf"
	uniform = /obj/item/clothing/under/pirate
	shoes = /obj/random/shoes/poor
	gloves = /obj/random/gloves/poor
	head = /obj/random/hat/poor
	l_pocket = /obj/item/device/radio/off

/obj/effect/landmark/corpse/inf_pirat
	name = "Pirat"
	corpse_outfits = list(/decl/hierarchy/outfit/pirat_inf)

/decl/hierarchy/outfit/pirat_inf/space
	name = "Dead Space Pirat Inf"
	suit = /obj/item/clothing/suit/space
	mask = /obj/item/clothing/mask/breath
	head = /obj/item/clothing/head/helmet/space
	back = /obj/item/weapon/tank/oxygen

/obj/effect/landmark/corpse/inf_pirat/space
	name = "Space Pirat"
	corpse_outfits = list(/decl/hierarchy/outfit/pirat_inf/space)
