/*
 * Sierra Medical
 */

/obj/structure/closet/secure_closet/CMO_sierra
	name = "chief medical officer's locker"
	req_access = list(access_cmo)
	closet_appearance = /decl/closet_appearance/secure_closet/cmo

/obj/structure/closet/secure_closet/CMO_sierra/WillContain()
	return list(
		/obj/item/clothing/suit/bio_suit/cmo,
		/obj/item/clothing/head/bio_hood/cmo,
		/obj/item/clothing/suit/storage/toggle/labcoat/cmo,
		/obj/item/clothing/suit/storage/toggle/labcoat/cmoalt,
		/obj/item/device/radio/headset/heads/cmo,
		/obj/item/device/radio/headset/heads/cmo/alt,
		/obj/item/device/flash,
		/obj/item/device/megaphone,
		/obj/item/weapon/reagent_containers/hypospray/vial,
		/obj/item/device/flashlight/pen,
		/obj/item/weapon/storage/belt/medical,
		/obj/item/device/remote_device/chief_medical_officer,
		/obj/item/clothing/suit/armor/pcarrier/medium,
		/obj/item/clothing/head/helmet,
		/obj/item/clothing/glasses/hud/health,
		/obj/item/weapon/storage/firstaid/adv,
		/obj/item/clothing/accessory/stethoscope,
		/obj/item/weapon/storage/fancy/vials,
	)

/obj/structure/closet/secure_closet/medical_sierrasenior
	name = "surgeon's locker"
	req_access = list(access_senmed)
	closet_appearance = /decl/closet_appearance/secure_closet/medical/alt

/obj/structure/closet/secure_closet/medical_sierrasenior/WillContain()
	return list(
		/obj/item/clothing/suit/surgicalapron,
		/obj/item/clothing/accessory/storage/white_vest,
		/obj/item/device/radio/headset/headset_med,
		/obj/item/device/radio/headset/headset_med/alt,
		/obj/item/weapon/storage/belt/medical,
		/obj/item/device/flashlight/pen,
		/obj/item/device/healthanalyzer,
		/obj/item/clothing/accessory/stethoscope,
		/obj/item/clothing/glasses/hud/health,
		/obj/item/weapon/storage/firstaid/adv,
	)

/obj/structure/closet/secure_closet/medical_sierra
	name = "doctor's locker"
	req_access = list(access_medical_equip)
	closet_appearance = /decl/closet_appearance/secure_closet/medical

/obj/structure/closet/secure_closet/medical_sierra/WillContain()
	return list(
		/obj/item/clothing/accessory/storage/white_vest,
		/obj/item/device/radio/headset/headset_med,
		/obj/item/device/radio/headset/headset_med/alt,
		/obj/item/weapon/storage/belt/medical,
		/obj/item/taperoll/medical,
		/obj/item/device/flashlight/pen,
		/obj/item/weapon/storage/box/autoinjectors,
		/obj/item/device/healthanalyzer,
		/obj/item/clothing/accessory/stethoscope,
		/obj/item/clothing/glasses/hud/health,
		/obj/item/weapon/storage/firstaid/adv,
	)

/obj/structure/closet/wardrobe/medic_sierra
	name = "medical wardrobe"
	closet_appearance = /decl/closet_appearance/wardrobe/white

/obj/structure/closet/wardrobe/medic_sierra/WillContain()
	return list(
		RANDOM_SCRUBS = 3,
		/obj/item/clothing/shoes/white = 3,
		/obj/item/clothing/suit/storage/toggle/labcoat = 3,
		/obj/item/clothing/under/sterile = 3,
		new /datum/atom_creator/weighted(list(/obj/item/weapon/storage/backpack/medic, /obj/item/weapon/storage/backpack/satchel/med)),
		new /datum/atom_creator/weighted(list(/obj/item/weapon/storage/backpack/dufflebag/med, /obj/item/weapon/storage/backpack/messenger/med))
	)

/obj/structure/closet/secure_closet/chemical_sierra
	name = "chemical closet"
	desc = "Store dangerous chemicals in here."
	closet_appearance = /decl/closet_appearance/secure_closet/medical
	req_access = list(access_chemistry)

/obj/structure/closet/secure_closet/chemical_sierra/WillContain()
	return list(
		/obj/item/weapon/storage/box/pillbottles = 2,
		/obj/item/device/radio/headset/headset_med,
		/obj/item/weapon/storage/box/freezer,
		/obj/item/weapon/storage/box/syringes,
		/obj/item/weapon/storage/box/beakers,
		/obj/item/weapon/storage/box/beakers/insulated,
		/obj/item/weapon/reagent_containers/glass/beaker/large,
		/obj/item/weapon/reagent_containers/glass/beaker/insulated/large
	)
