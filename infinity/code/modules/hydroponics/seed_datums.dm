// Alien weeds.
/datum/seed/xenomorph
	name = "xenomorph"
	seed_name = "alien weed"
	display_name = "alien weeds"
	force_layer = OBJ_LAYER
	chems = list(/datum/reagent/toxin/phoron = list(1,3))

/datum/seed/xenomorph/New()
	..()
	set_trait(TRAIT_PLANT_ICON,"vine2")
	set_trait(TRAIT_IMMUTABLE,1)
	set_trait(TRAIT_PRODUCT_COLOUR,"#3d1934")
	set_trait(TRAIT_FLESH_COLOUR,"#3d1934")
	set_trait(TRAIT_PLANT_COLOUR,"#3d1934")
	set_trait(TRAIT_PRODUCTION,1)
	set_trait(TRAIT_YIELD,-1)
	set_trait(TRAIT_SPREAD,2)
	set_trait(TRAIT_POTENCY,50)
	set_trait(TRAIT_ENDURANCE,30)
	set_trait(TRAIT_LIGHT_TOLERANCE, 6)
	set_trait(TRAIT_REQUIRES_NUTRIENTS,0)
	set_trait(TRAIT_REQUIRES_WATER,0)

/datum/seed/citrus/mandarin
	name = "mandarin"
	seed_name = "mandarin"
	display_name = "mandarin trees"
//	mutants = list("berries","poisonberries","glowberries") unused
	chems = list(/datum/reagent/nutriment = list(1,10), /datum/reagent/drink/juice/mandarin = list(10,10))
	kitchen_tag = "mandarin"

/datum/seed/citrus/mandarin/New()
	..()
	set_trait(TRAIT_PRODUCT_COLOUR,"#ffbc1f")
	set_trait(TRAIT_FLESH_COLOUR,"#ffbc1f")
