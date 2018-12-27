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
