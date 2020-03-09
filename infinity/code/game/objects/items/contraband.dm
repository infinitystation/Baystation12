/obj/item/weapon/reagent_containers/glass/beaker/vial/random/toxin/bioterror
	random_reagent_list = list(
		list(/datum/reagent/mindbreaker = 10, /datum/reagent/space_drugs = 20) = 2,
		list(/datum/reagent/toxin/carpotoxin = 30)                             = 2,
		list(/datum/reagent/toxin/methyl_bromide = 30)                         = 2,
		list(/datum/reagent/toxin/amatoxin = 30)                               = 2,
		list(/datum/reagent/toxin/phoron = 30)                                 = 2,
		list(/datum/reagent/toxin/cyanide = 30)                                = 2,
		list(/datum/reagent/toxin/potassium_chlorophoride = 30)                = 2,
		list(/datum/reagent/acid/polyacid = 30)                                = 2,
		list(/datum/reagent/radium = 30)                                       = 2,
		list(/datum/reagent/toxin/zombiepowder = 30)                           = 1)

/obj/item/weapon/reagent_containers/glass/beaker/random
	atom_flags = 0
	var/list/random_reagent_list = list(list(/datum/reagent/water = 30) = 1, list(/datum/reagent/space_cleaner = 30) = 1)

/obj/item/weapon/reagent_containers/glass/beaker/random/toxin/bioterror
	random_reagent_list = list(
		list(/datum/reagent/mindbreaker = 20, /datum/reagent/space_drugs = 40) = 2,
		list(/datum/reagent/toxin/carpotoxin = 60)                             = 2,
		list(/datum/reagent/toxin/methyl_bromide = 60)                         = 2,
		list(/datum/reagent/toxin/amatoxin = 60)                               = 2,
		list(/datum/reagent/toxin/phoron = 60)                                 = 2,
		list(/datum/reagent/toxin/cyanide = 60)                                = 2,
		list(/datum/reagent/toxin/potassium_chlorophoride = 60)                = 2,
		list(/datum/reagent/acid/polyacid = 60)                                = 2,
		list(/datum/reagent/radium = 60)                                       = 2,
		list(/datum/reagent/toxin/zombiepowder = 60)                           = 1)

/obj/item/weapon/reagent_containers/glass/beaker/random/Initialize()
	. = ..()
	if(is_open_container())
		atom_flags ^= ATOM_FLAG_OPEN_CONTAINER

	var/list/picked_reagents = pickweight(random_reagent_list)
	for(var/reagent in picked_reagents)
		reagents.add_reagent(reagent, picked_reagents[reagent])

	var/list/names = new
	for(var/datum/reagent/R in reagents.reagent_list)
		names += R.name

	desc = "Contains [english_list(names)]."
	update_icon()