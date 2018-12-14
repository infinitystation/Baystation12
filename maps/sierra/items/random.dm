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
