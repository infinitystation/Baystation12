/obj/structure/closet/secure_closet/medical1_minimal
	name = "medical equipment closet"
	desc = "Filled with medical junk."
	closet_appearance = /decl/closet_appearance/secure_closet/medical
	req_access = list(access_medical_equip)

/obj/structure/closet/secure_closet/medical1_minimal/WillContain()
	return list(
		/obj/item/storage/box/autoinjectors,
		/obj/item/storage/box/syringes,
		/obj/item/reagent_containers/dropper = 1,
		/obj/item/reagent_containers/glass/beaker = 1,
		/obj/item/storage/firstaid/regular,
		/obj/item/storage/firstaid/adv,
		/obj/item/storage/firstaid/fire,
		/obj/item/storage/firstaid/o2,
		/obj/item/storage/firstaid/toxin,
		/obj/item/storage/box/masks,
		/obj/item/clothing/gloves/latex/nitrile,
		/obj/item/clothing/accessory/stethoscope
	)
