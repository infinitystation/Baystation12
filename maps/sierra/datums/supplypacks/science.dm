/decl/hierarchy/supply_pack/science/voidsuit
	name = "Excavation voidsuit"
	contains = list(/obj/item/clothing/suit/space/void/excavation,
					/obj/item/clothing/head/helmet/space/void/excavation,
					/obj/item/clothing/shoes/magboots)
	cost = 100
	containername = "\improper Excavation voidsuit crate"
	containertype = /obj/structure/closet/crate/secure/large


/decl/hierarchy/supply_pack/science/voidsuit_mining
	name = "Mining voidsuit"
	contains = list(/obj/item/clothing/suit/space/void/mining/alt,
					/obj/item/clothing/head/helmet/space/void/mining/alt,
					/obj/item/clothing/shoes/magboots)
	cost = 100
	containername = "\improper Mining voidsuit crate"
	containertype = /obj/structure/closet/crate/secure/large


/decl/hierarchy/supply_pack/science/voidsuit_explorer
	name = "GI-EXPL voidsuit - 1"
	containername = "\improper GI-EXPL voidsuit crate"
	containertype = /obj/structure/closet/crate/secure/large
	cost = 100
	access = access_explorer
	contains = list(
		/obj/item/clothing/suit/space/void/exploration/sierra/prepared/noboots,
		/obj/item/clothing/mask/gas/half
	)


/decl/hierarchy/supply_pack/science/voidsuit_explorer/triple
	name = "GI-EXPL voidsuits - 3"
	cost = 240
	contains = list(
		/obj/item/clothing/suit/space/void/exploration/sierra/prepared/noboots = 3,
		/obj/item/clothing/mask/gas/half = 3
	)


/decl/hierarchy/supply_pack/science/voidsuit_explorer/med
	name = "GI-EXPL-M voidsuit - 1"
	containername = "\improper GI-EXPL-M voidsuit crate"
	cost = 120
	contains = list(
		/obj/item/clothing/suit/space/void/exploration/sierra/med/prepared/noboots,
		/obj/item/clothing/mask/gas/half
	)


/decl/hierarchy/supply_pack/science/voidsuit_explorer/med/triple
	name = "GI-EXPL-M voidsuits - 3"
	containername = "\improper GI-EXPL-M voidsuit crate"
	cost = 288
	contains = list(
		/obj/item/clothing/suit/space/void/exploration/sierra/med/prepared/noboots = 3,
		/obj/item/clothing/mask/gas/half = 3
	)


/decl/hierarchy/supply_pack/science/voidsuit_explorer/eng
	name = "GI-EXPL-E voidsuit - 1"
	containername = "\improper GI-EXPL-E voidsuit crate"
	cost = 120
	contains = list(
		/obj/item/clothing/suit/space/void/exploration/sierra/med/prepared/noboots,
		/obj/item/clothing/mask/gas/half
	)


/decl/hierarchy/supply_pack/science/voidsuit_explorer/eng/triple
	name = "GI-EXPL-E voidsuits - 3"
	containername = "\improper GI-EXPL-E voidsuit crate"
	cost = 288
	contains = list(
		/obj/item/clothing/suit/space/void/exploration/sierra/eng/prepared/noboots = 3,
		/obj/item/clothing/mask/gas/half = 3
	)


/decl/hierarchy/supply_pack/science/voidsuit_explorer/rad
	name = "GI-EXPL-RP voidsuit - 1"
	containername = "\improper GI-EXPL-RP voidsuit crate"
	cost = 110
	contains = list(
		/obj/item/clothing/suit/space/void/exploration/sierra/rad/prepared/noboots,
		/obj/item/clothing/mask/gas/half
	)


/decl/hierarchy/supply_pack/science/voidsuit_explorer/rad/triple
	name = "GI-EXPL-RP voidsuits - 3"
	containername = "\improper GI-EXPL-RP voidsuit crate"
	cost = 264
	contains = list(
		/obj/item/clothing/suit/space/void/exploration/sierra/rad/prepared/noboots = 3,
		/obj/item/clothing/mask/gas/half = 3
	)


/decl/hierarchy/supply_pack/medical/blood
	name = "Refills - 4 Nanoblood Packs"
	contains = list(/obj/item/reagent_containers/ivbag/nanoblood = 4)
	cost = 60
	containername = "nanoblood crate"
