/obj/item/reagent_containers/glass/beaker/vial/random/toxin/bioterror
	random_reagent_list = list(
		list(/datum/reagent/mindbreaker = 10, /datum/reagent/space_drugs = 20) = 2,
		list(/datum/reagent/toxin/carpotoxin = 30)                             = 2,
		list(/datum/reagent/mutagen = 30)                                      = 2,
		list(/datum/reagent/toxin/amatoxin = 30)                               = 2,
		list(/datum/reagent/toxin/phoron = 30)                                 = 2,
		list(/datum/reagent/impedrezene = 30)                                  = 2,
		list(/datum/reagent/toxin/potassium_chlorophoride = 30)                = 2,
		list(/datum/reagent/acid/polyacid = 30)                                = 2,
		list(/datum/reagent/radium = 30)                                       = 2,
		list(/datum/reagent/toxin/zombiepowder = 30)                           = 1)

/obj/item/reagent_containers/spray/chemsprayer/bioterror
	name = "bioterror chem sprayer"
	desc = "This chem sprayer is filled with mix, that will melt, mutate and irradiate everything."

/obj/item/reagent_containers/spray/chemsprayer/bioterror/Initialize()
	. = ..()
	reagents.add_reagent(/datum/reagent/space_drugs, volume / 10)
	reagents.add_reagent(/datum/reagent/mindbreaker, volume / 10)
	reagents.add_reagent(/datum/reagent/toxin/carpotoxin, volume / 10)
	reagents.add_reagent(/datum/reagent/mutagen, volume / 10)
	reagents.add_reagent(/datum/reagent/toxin/amatoxin, volume / 10)
	reagents.add_reagent(/datum/reagent/toxin/phoron, volume / 10)
	reagents.add_reagent(/datum/reagent/impedrezene, volume / 10)
	reagents.add_reagent(/datum/reagent/toxin/potassium_chlorophoride, volume / 10)
	reagents.add_reagent(/datum/reagent/acid/polyacid, volume / 10)
	reagents.add_reagent(/datum/reagent/radium, volume / 10)
