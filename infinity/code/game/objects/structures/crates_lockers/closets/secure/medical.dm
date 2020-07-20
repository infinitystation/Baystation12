/obj/structure/closet/secure_closet/medical1_minimal
	name = "medical equipment closet"
	desc = "Filled with medical junk."
	closet_appearance = /decl/closet_appearance/secure_closet/medical
	req_access = list(access_medical_equip)

/obj/structure/closet/secure_closet/medical1_minimal/WillContain()
	return list(
		/obj/item/weapon/storage/box/autoinjectors,
		/obj/item/weapon/storage/box/syringes,
		/obj/item/weapon/reagent_containers/dropper = 1,
		/obj/item/weapon/reagent_containers/glass/beaker = 1,
		/obj/item/weapon/storage/firstaid/regular,
		/obj/item/weapon/storage/firstaid/adv,
		/obj/item/weapon/storage/firstaid/fire,
		/obj/item/weapon/storage/firstaid/o2,
		/obj/item/weapon/storage/firstaid/toxin,
		/obj/item/weapon/storage/box/masks,
		/obj/item/clothing/gloves/latex/nitrile,
		/obj/item/clothing/accessory/stethoscope
	)
