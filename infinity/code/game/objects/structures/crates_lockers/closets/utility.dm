/obj/structure/closet/medical_wall/filled/regular/WillContain()
	return list(
		/obj/item/weapon/storage/firstaid/regular,
		/obj/item/stack/medical/splint,
		/obj/item/bodybag/cryobag = 1,
		/obj/random/medical/lite = 6)

/obj/structure/closet/medical_wall/filled/engineering/WillContain()
	return list(
		/obj/item/weapon/storage/firstaid/regular,
		/obj/item/weapon/reagent_containers/hypospray/autoinjector/rad = 4,
		/obj/item/stack/medical/splint,
		/obj/random/medical/lite = 6)

/obj/structure/closet/medical_wall/filled/security/WillContain()
	return list(
		/obj/item/weapon/storage/firstaid/regular,
		/obj/item/weapon/storage/pill_bottle/kelotane,
		/obj/item/weapon/storage/pill_bottle/bicaridine,
		/obj/item/stack/medical/splint,
		/obj/item/bodybag/cryobag = 2,
		/obj/random/medical/lite = 4)

/obj/structure/closet/medical_wall/filled/shuttle/WillContain()
	return list(
		/obj/item/weapon/storage/firstaid/regular,
		/obj/item/bodybag/cryobag = 2,
		/obj/item/stack/medical/splint = 2,
		/obj/random/medical/lite = 8)

/obj/structure/closet/medical_wall/filled/small_shuttle/WillContain()
	return list(
		/obj/item/weapon/storage/firstaid/regular,
		/obj/item/weapon/storage/pill_bottle/inaprovaline,
		/obj/item/weapon/storage/pill_bottle/paracetamol,
		/obj/item/stack/medical/splint,
		/obj/item/bodybag/cryobag = 1,
		/obj/random/medical/lite = 4)
