//Personal firstaid kit

/obj/item/weapon/storage/firstaid/individual
	name = "master kit"
	icon = 'infinity/icons/obj/items.dmi'
	icon_state = "survivalmed"
	slot_flags = SLOT_BELT
	w_class = ITEM_SIZE_SMALL
	storage_slots  = 10
	can_hold = list(
		/obj/item/weapon/reagent_containers/hypospray/autoinjector,
		/obj/item/stack/medical/bruise_pack,
		/obj/item/stack/medical/ointment,
		/obj/item/weapon/reagent_containers/pill,
		/obj/item/weapon/storage/pill_bottle,
		/obj/item/stack/medical/advanced,
		/obj/item/weapon/reagent_containers/syringe
		)

/obj/item/weapon/storage/firstaid/individual/all
	name = "individual medical kit"
	desc = "A small box decorated in warning colors that contains a limited supply of medical reagents."
	startswith = list(
		/obj/item/weapon/reagent_containers/hypospray/autoinjector/inaprovaline,
		/obj/item/stack/medical/bruise_pack,
		/obj/item/stack/medical/ointment
		)

/obj/item/weapon/storage/firstaid/individual/military
	name = "military individual medical kit"
	desc = "A small box decorated in dark colors that contains a limited supply of medical reagents."
	icon_state = "survivalmilmed"
	startswith = list(
		/obj/item/weapon/reagent_containers/hypospray/autoinjector/burn = 2,
		/obj/item/weapon/reagent_containers/hypospray/autoinjector/brute = 2,
		/obj/item/weapon/reagent_containers/hypospray/autoinjector/pain,
		/obj/item/weapon/reagent_containers/hypospray/autoinjector/detox,
		/obj/item/weapon/reagent_containers/hypospray/autoinjector/inaprovaline,
		/obj/item/weapon/reagent_containers/hypospray/autoinjector/antirad,
		/obj/item/stack/medical/bruise_pack,
		/obj/item/stack/medical/ointment
		)

/obj/item/weapon/storage/firstaid/individual/military/troops
	startswith = list(
		/obj/item/weapon/reagent_containers/hypospray/autoinjector/burn,
		/obj/item/weapon/reagent_containers/hypospray/autoinjector/brute,
		/obj/item/weapon/reagent_containers/hypospray/autoinjector/inaprovaline,
		/obj/item/weapon/reagent_containers/hypospray/autoinjector/pain = 2,
		/obj/item/stack/medical/bruise_pack,
		/obj/item/stack/medical/ointment
		)
