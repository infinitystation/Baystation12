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

/decl/hierarchy/outfit/pmc
	name = "PMC"
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
	belt = /obj/item/weapon/storage/belt/security/troops
	r_hand = /obj/item/weapon/gun/projectile/automatic/wt550/lethal
	id_pda_assignment = "PCRC PMC"

/decl/hierarchy/outfit/pmc/saare
	name = "PMC SAARE"
	uniform = /obj/item/clothing/under/saare/tactical
	glasses = /obj/item/clothing/glasses/tacgoggles
	mask = /obj/item/clothing/mask/balaclava/tactical
	suit = /obj/item/clothing/suit/armor/pcarrier/green/heavy_saare
	head = /obj/item/clothing/head/helmet/saare/cover
	belt = /obj/item/weapon/storage/belt/security/troops/sts
	r_hand = /obj/item/weapon/gun/projectile/automatic/sts35
	id_pda_assignment = "SAARE PMC"
	back = /obj/item/weapon/storage/backpack/satchel/pocketbook/khaki
	backpack_contents = list(/obj/item/weapon/storage/firstaid/individual/military/troops = 1,
							/obj/item/weapon/material/kitchen/utensil/knife/boot = 1,
							/obj/item/clothing/mask/gas/half = 1,
							/obj/item/weapon/reagent_containers/food/snacks/candy/proteinbar = 1)
