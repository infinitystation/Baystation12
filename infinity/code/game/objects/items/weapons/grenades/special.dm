/obj/item/grenade/chem_grenade/bioterror
	name = "bioterror grenade"
	desc = "Used for clearing rooms of living things."
	path = 1
	stage = 2

/obj/item/grenade/chem_grenade/bioterror/Initialize()
		. = ..()
		var/obj/item/reagent_containers/glass/beaker/large/B1 = new(src)
		var/obj/item/reagent_containers/glass/beaker/large/B2 = new(src)

		B1.reagents.add_reagent(/datum/reagent/phosphorus, 26)
		B1.reagents.add_reagent(/datum/reagent/sugar, 14)
		B2.reagents.add_reagent(/datum/reagent/sugar, 14)
		B2.reagents.add_reagent(/datum/reagent/potassium, 26)
		B1.reagents.add_reagent(/datum/reagent/space_drugs,20)
		B2.reagents.add_reagent(/datum/reagent/toxin/carpotoxin, 20)
		B1.reagents.add_reagent(/datum/reagent/mindbreaker, 20)
		B2.reagents.add_reagent(/datum/reagent/toxin/amatoxin, 20)
		B2.reagents.add_reagent(/datum/reagent/acid/polyacid, 20)
		B1.reagents.add_reagent(/datum/reagent/toxin/phoron, 20)
		B1.reagents.add_reagent(/datum/reagent/mutagen, 20)
		B2.reagents.add_reagent(/datum/reagent/acid/polyacid, 20)
		B2.reagents.add_reagent(/datum/reagent/impedrezene, 20)

		detonator = new/obj/item/device/assembly_holder/timer_igniter(src)

		beakers += B1
		beakers += B2
		icon_state = initial(icon_state) +"_locked"

/obj/item/grenade/chem_grenade/fuelspray
	name = "napalm mix release grenade"
	desc = "Used for reliasing lots of napalm mix."
	path = 1
	stage = 2

/obj/item/grenade/chem_grenade/fuelspray/Initialize()
		. = ..()
		var/obj/item/reagent_containers/glass/beaker/large/B1 = new(src)
		var/obj/item/reagent_containers/glass/beaker/large/B2 = new(src)

		B1.reagents.add_reagent(/datum/reagent/potassium, 26)
		B1.reagents.add_reagent(/datum/reagent/sugar, 14)
		B2.reagents.add_reagent(/datum/reagent/sugar, 14)
		B2.reagents.add_reagent(/datum/reagent/phosphorus, 26)
		B1.reagents.add_reagent(/datum/reagent/napalm, 40)
		B2.reagents.add_reagent(/datum/reagent/napalm, 40)
		B1.reagents.add_reagent(/datum/reagent/toxin/phoron/oxygen, 40)
		B2.reagents.add_reagent(/datum/reagent/fuel, 40)

		detonator = new/obj/item/device/assembly_holder/timer_igniter(src)

		beakers += B1
		beakers += B2
		icon_state = initial(icon_state) +"_locked"

/obj/item/grenade/spawnergrenade/banana
	name = "banana delivery grenade"
	spawner_type = /obj/item/bananapeel
	deliveryamt = 4
	origin_tech = list(TECH_MATERIAL = 3, TECH_MAGNET = 2, TECH_ESOTERIC = 3)

/obj/item/grenade/chem_grenade/gluon
	name = "gluon grenade"
	desc = "This grenade can literraly freeze the whole room."
	path = 1
	stage = 2

/obj/item/grenade/chem_grenade/gluon/Initialize()
		. = ..()
		var/obj/item/reagent_containers/glass/beaker/B1 = new(src)
		var/obj/item/reagent_containers/glass/beaker/B2 = new(src)

		B1.reagents.add_reagent(/datum/reagent/coolant, 60)
		B2.reagents.add_reagent(/datum/reagent/coolant, 60)

		detonator = new/obj/item/device/assembly_holder/timer_igniter(src)

		beakers += B1
		beakers += B2
		icon_state = initial(icon_state) +"_locked"
