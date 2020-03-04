//Let's get some REAL contraband stuff in here. Because come on, getting brigged for LIPSTICK is no fun.

//Illicit drugs~
/obj/item/weapon/storage/pill_bottle/happy
	name = "bottle of Happy pills"
	desc = "Highly illegal drug. When you want to see the rainbow."
	wrapper_color = COLOR_PINK
	startswith = list(/obj/item/weapon/reagent_containers/pill/happy = 10)

/obj/item/weapon/storage/pill_bottle/zoom
	name = "bottle of Zoom pills"
	desc = "Highly illegal drug. Trade brain for speed."
	wrapper_color = COLOR_BLUE
	startswith = list(/obj/item/weapon/reagent_containers/pill/zoom = 10)

/obj/item/weapon/storage/pill_bottle/three_eye
	name = "bottle of Three Eye pills"
	desc = "Highly illegal drug. Stimulates rarely used portions of the brain."
	wrapper_color = COLOR_BLUE
	startswith = list(/obj/item/weapon/reagent_containers/pill/three_eye = 10)

/obj/item/weapon/reagent_containers/glass/beaker/vial/random
	atom_flags = 0
	var/list/random_reagent_list = list(list(/datum/reagent/water = 15) = 1, list(/datum/reagent/space_cleaner = 15) = 1)

/obj/item/weapon/reagent_containers/glass/beaker/vial/random/toxin
	random_reagent_list = list(
		list(/datum/reagent/mindbreaker = 10, /datum/reagent/space_drugs = 20) = 3,
		list(/datum/reagent/toxin/carpotoxin = 15)                             = 2,
		list(/datum/reagent/impedrezene = 15)                                  = 2,
		list(/datum/reagent/toxin/zombiepowder = 10)                           = 1)

/obj/item/weapon/reagent_containers/glass/beaker/vial/random/New()
	..()
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

//[INF]

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
	..()
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

//[/INF]