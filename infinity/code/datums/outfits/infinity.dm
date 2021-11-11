/decl/hierarchy/outfit/merchant/leader
	name = "Inf - Merchant Leader"
	shoes = /obj/item/clothing/shoes/black
	l_ear = /obj/item/device/radio/headset
	uniform = /obj/item/clothing/under/color/black
	id_slot = slot_wear_id
	id_types = list(/obj/item/card/id/merchant/leader)
	pda_slot = slot_r_store
//	pda_type = /obj/item/modular_computer/pda/chef //cause I(?) like the look
	id_pda_assignment = "Merchant Leader"

/decl/hierarchy/outfit/merchant/vox_leader
	name = "Inf - Merchant - Vox Leader"
	id_types = list(/obj/item/card/id/merchant/leader)
	shoes = /obj/item/clothing/shoes/jackboots/unathi
	uniform = /obj/item/clothing/under/vox/vox_robes
	id_pda_assignment = "Merchant Leader"

/*
/decl/hierarchy/outfit/daft_punk
	name = "Inf - Daft Punk"
	shoes = /obj/item/clothing/shoes/laceup
	uniform = /obj/item/clothing/under/suit_jacket/charcoal
	suit = /obj/item/clothing/suit/storage/toggle/suit/black
	head = /obj/item/clothing/head/helmet/daft_punk
	gloves = /obj/item/clothing/gloves/daft_punk
	id_slot = slot_wear_id
	id_types = list(/obj/item/card/id/centcom/NtPass/station)
	id_pda_assignment = "DJ"
*/

/decl/hierarchy/outfit/pmc
	name = "Inf - PMC aUnknown"
	shoes = /obj/item/clothing/shoes/combat/marine
	uniform = /obj/item/clothing/under/syndicate/combat
	l_ear = /obj/item/device/radio/headset/raider
	gloves = /obj/item/clothing/gloves/thick/combat/marine
	r_pocket = /obj/item/tank/emergency/oxygen/double
	id_slot = slot_wear_id
	id_types = list(/obj/item/card/id/centcom/NtPass/station)
	id_pda_assignment = "PMC"
	back = /obj/item/storage/backpack/satchel/pocketbook
	backpack_contents = list(/obj/item/storage/firstaid/individual/military/troops = 1,
							/obj/item/material/knife/folding/tacticool = 1,
							/obj/item/reagent_containers/food/snacks/proteinbar = 1)

/decl/hierarchy/outfit/pmc/pcrc
	name = "Inf - PMC PCRC"
	uniform = /obj/item/clothing/under/pcrc/tactical
	glasses = /obj/item/clothing/glasses/tacgoggles
	mask = /obj/item/clothing/mask/gas/half
	suit = /obj/item/clothing/suit/armor/pcarrier/troops/heavy/pcrc
	head = /obj/item/clothing/head/helmet/pcrc
	belt = /obj/item/storage/belt/holster/security/tactical/troops
	r_hand = /obj/item/gun/projectile/automatic/sec_smg/lethal
	id_pda_assignment = "PCRC PMC"

/decl/hierarchy/outfit/pmc/saare
	name = "Inf - PMC SAARE"
	uniform = /obj/item/clothing/under/saare/tactical
	glasses = /obj/item/clothing/glasses/tacgoggles
	mask = /obj/item/clothing/mask/gas/half
	suit = /obj/item/clothing/suit/armor/pcarrier/green/heavy_saare
	head = /obj/item/clothing/head/helmet/saare/cover
	belt = /obj/item/storage/belt/holster/security/tactical/troops_sts
	r_hand = /obj/item/gun/projectile/automatic/assault_rifle
	id_pda_assignment = "SAARE PMC"
	back = /obj/item/storage/backpack/satchel/pocketbook/khaki
	backpack_contents = list(/obj/item/storage/firstaid/individual/military/troops = 1,
							/obj/item/material/knife/folding/tacticool = 1,
							/obj/item/reagent_containers/food/snacks/proteinbar = 1)


/decl/hierarchy/outfit/alien
	name = "Abductor Agent Outfit"
	shoes = /obj/item/clothing/shoes/black
	l_ear = /obj/item/device/radio/headset/abductor
	uniform = /obj/item/clothing/under/thermal/heat/abductor/white
	belt = /obj/item/storage/belt/utility/alien
	suit = /obj/item/clothing/suit/armor/abductor
	head = /obj/item/clothing/head/helmet/abductor
	r_hand = /obj/item/gun/energy/decloner
	l_hand = /obj/item/melee/adv_baton

/decl/hierarchy/outfit/alien_sci
	name = "Abductor Scientist Outfit"
	shoes = /obj/item/clothing/shoes/black
	l_ear = /obj/item/device/radio/headset/abductor
	uniform = /obj/item/clothing/under/thermal/heat/abductor/white
	belt = /obj/item/storage/belt/utility/alien
	r_hand = /obj/item/scitool
	gloves = /obj/item/clothing/gloves/latex

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
	name = "Inf - Dead Pirat Inf"
	uniform = /obj/item/clothing/under/pirate
	shoes = /obj/random/shoes/poor
	gloves = /obj/random/gloves/poor
	head = /obj/random/hat/poor
	l_pocket = /obj/item/device/radio/off

/obj/effect/landmark/corpse/inf_pirat
	name = "Inf - Pirat"
	corpse_outfits = list(/decl/hierarchy/outfit/pirat_inf)

/decl/hierarchy/outfit/pirat_inf/space
	name = "Inf - Dead Space Pirat Inf"
	suit = /obj/item/clothing/suit/space
	mask = /obj/item/clothing/mask/breath
	head = /obj/item/clothing/head/helmet/space
	back = /obj/item/tank/oxygen

/obj/effect/landmark/corpse/inf_pirat/space
	name = "Inf - Space Pirat"
	corpse_outfits = list(/decl/hierarchy/outfit/pirat_inf/space)
