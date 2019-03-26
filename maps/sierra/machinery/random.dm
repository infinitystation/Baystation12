/*******************
Random item spawning
*******************/

/obj/random/solgov
	name = "random solgov equipment"
	desc = "This is a random piece of solgov equipment or clothing."
	icon = 'icons/obj/clothing/hats.dmi'
	icon_state = "m_helmet"

/obj/random/solgov/spawn_choices()
	return list(/obj/item/clothing/head/solgov/utility/fleet = 4,
				/obj/item/clothing/head/soft/solgov/expedition = 2,
				/obj/item/clothing/head/soft/solgov/fleet = 4,
				/obj/item/clothing/head/helmet/solgov = 1,
				/obj/item/clothing/suit/storage/vest/solgov = 2,
				/obj/item/clothing/under/solgov/utility = 5,
				/obj/item/clothing/under/solgov/utility/fleet = 3,
				/obj/item/clothing/under/solgov/pt/expeditionary = 4,
				/obj/item/clothing/under/solgov/pt/fleet = 4
				)

/obj/random/maintenance/solgov
	name = "random maintenance item"
	desc = "This is a random maintenance item."
	icon = 'icons/obj/items.dmi'
	icon_state = "gift1"

/obj/random/maintenance/solgov/spawn_choices()
	return list(/obj/random/junk = 4,
				/obj/random/trash = 4,
				/obj/random/maintenance/solgov/clean = 5)

/obj/random/maintenance/solgov/clean
	name = "random maintenance item"
	desc = "This is a random maintenance item."
	icon = 'icons/obj/items.dmi'
	icon_state = "gift2"

/obj/random/maintenance/solgov/clean/spawn_choices()
	return list(/obj/random/solgov = 3,
				/obj/random/maintenance/clean = 800)

/obj/random/hostile/xenobio
	name = "Random Mob"
	desc = "This is a random mob."
	icon = 'icons/mob/amorph.dmi'
	icon_state = "standing"
	spawn_nothing_percentage = 50

obj/random/hostile/xenobio/spawn_choices()
	return list(/mob/living/simple_animal/slime,
				/mob/living/simple_animal/hostile/carp,
				/mob/living/simple_animal/hostile/carp/shark,
				/mob/living/simple_animal/crab,
				/mob/living/simple_animal/thinbug,
				/mob/living/simple_animal/yithian)

/obj/random/material_rnd_steel
	name = "random steel"
	desc = "This is a random metal ammout for RND's storage."
	icon = 'icons/obj/items.dmi'
	icon_state = "sheet-metal"
	spawn_nothing_percentage = 50

/obj/random/material_rnd_steel/spawn_choices()
	return list(/obj/item/stack/material/steel/ten = 1,
				/obj/item/stack/material/steel/fifty = 2)

/obj/random/material_rnd_glass
	name = "random glass"
	desc = "This is a random glass ammout for RND's storage."
	icon = 'icons/obj/items.dmi'
	icon_state = "sheet-glass"
	spawn_nothing_percentage = 50

/obj/random/material_rnd_glass/spawn_choices()
	return list(/obj/item/stack/material/glass/ten = 1,
				/obj/item/stack/material/glass/fifty = 2)

/obj/random/blood_packs
	name = "random blood"
	desc = "This is random ammout of blood packs for medical bay."
	icon = 'icons/obj/bloodpack.dmi'
	icon_state = "empty"
	spawn_nothing_percentage = 0

/obj/random/blood_packs/spawn_choices()
	return list(/obj/item/weapon/reagent_containers/ivbag/blood/OMinus = 5,
	/obj/item/weapon/reagent_containers/ivbag/blood = 3,
	/obj/item/weapon/reagent_containers/ivbag/blood/BMinus = 2)
