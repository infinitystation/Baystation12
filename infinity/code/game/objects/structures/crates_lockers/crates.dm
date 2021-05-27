/obj/structure/closet/crate/freezer/blood
	name = "blood freezer"
	desc = "A crate of O-minus blood packs. Don't drink it, please."

/obj/structure/closet/crate/freezer/blood/WillContain()
	return list(/obj/item/reagent_containers/ivbag/blood/OMinus = 4)

/obj/structure/closet/crate/freezer/blood/small
	name = "blood freezer"
	desc = "A crate of O-minus blood packs. Don't drink it, please."

/obj/structure/closet/crate/freezer/blood/small/WillContain()
	return list(/obj/item/reagent_containers/ivbag/blood/OMinus = 2)

/obj/structure/closet/crate/freezer/nanoblood
	name = "nanoblood freezer"
	desc = "A crate of nanoblood packs. Don't drink it."

/obj/structure/closet/crate/freezer/nanoblood/WillContain()
	return list(/obj/item/reagent_containers/ivbag/nanoblood = 4)

/obj/structure/closet/crate/freezer/nanoblood/small/WillContain()
	return list(/obj/item/reagent_containers/ivbag/nanoblood = 2)
