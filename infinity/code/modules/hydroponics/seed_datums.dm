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

/datum/seed/mandragora
	name = "mandragora"
	seed_name = "mandragora"
	display_name = "mandragora"
	chems = list(/datum/reagent/mindbreaker = list(10,10))
	kitchen_tag = "mandragora"
	force_product_replacing = /obj/item/weapon/reagent_containers/food/snacks/mandragora

/datum/seed/mandragora/New()
	..()
	set_trait(TRAIT_IMMUTABLE,				1)
	set_trait(TRAIT_PRODUCT_ICON,			"flower4")
	set_trait(TRAIT_PLANT_ICON,				"flower3")
	set_trait(TRAIT_PRODUCT_COLOUR,			"#ababab")
	set_trait(TRAIT_TOXINS_TOLERANCE,		40)
	set_trait(TRAIT_IDEAL_LIGHT,			2)
	set_trait(TRAIT_HEAT_TOLERANCE,			5)
	set_trait(TRAIT_IDEAL_HEAT,				288)
	set_trait(TRAIT_ENDURANCE,				50)

	set_trait(TRAIT_MATURATION,				5)
	set_trait(TRAIT_PRODUCTION,				5)
	set_trait(TRAIT_YIELD,					1)
	set_trait(TRAIT_POTENCY,				20)
	set_trait(TRAIT_NUTRIENT_CONSUMPTION,	0.5)

	set_trait(TRAIT_PLANT_COLOUR,			"#4f4f4f")
	set_trait(TRAIT_ON_HARVEST,				/datum/hydroponics_effect/halucination/mandragora_scream)

	/*set_trait(TRAIT_HALUCINTIONS_ON_ATTACKBY,		-1)
	set_trait(TRAIT_HALUCINTIONS_ON_ATTACKBY_VIEW, 	6)
	set_trait(TRAIT_ATTACKBY_SOUNDS,			list(
														'sound/effects/bonebreak1.ogg',
														'sound/effects/bonebreak2.ogg',
														'sound/effects/bonebreak3.ogg',
														'sound/effects/bonebreak4.ogg',
													)
	set_trait(TRAIT_HALO_PSY_IMUNE,					1)
	set_trait(TRAIT_ATTACKBY_SOUNDS_PSY,		list(	'infinity/sounds/voice/agony_female_1.ogg',
														'infinity/sounds/voice/agony_female_2.ogg',
														'infinity/sounds/voice/agony_female_3.ogg',
														'infinity/sounds/voice/bug_screech.ogg',
														'infinity/sounds/voice/pain_female_1.ogg',
														'infinity/sounds/voice/pain_female_2.ogg',
														'infinity/sounds/voice/pain_female_3.ogg',
														'infinity/sounds/voice/pain_female_4.ogg',
														'infinity/sounds/voice/pain_male_1.ogg',
														'infinity/sounds/voice/pain_male_2.ogg',
														'infinity/sounds/voice/pain_male_3.ogg',
														'infinity/sounds/voice/scream_male_1.ogg',
														'infinity/sounds/voice/scream_male_2.ogg',
														'infinity/sounds/voice/scream_male_3.ogg',
														'infinity/sounds/voice/scream_female_2.ogg',
														'sound/effects/Heart Beat.ogg',
														'sound/effects/ghost.ogg'
													)*/

	update_growth_stages()