/obj/item/tobacco
	name = "Peace of tobacco"
	desc = "Tobacco who used in hookah's for make smoke"
	w_class = ITEM_SIZE_TINY

	icon = 'icons/obj/hydroponics_products.dmi'
	icon_state = "tobacco-product"
	item_state = "tobacco-product"
	var/volume = 10
	var/list/filling = list(/datum/reagent/tobacco = 10)


/obj/item/tobacco/New()
	..()
	create_reagents(volume)
	for(var/R in filling)
		reagents.add_reagent(R, filling[R])

/obj/item/tobacco/perception
	name = "perception tobacco"
	desc = "Cut and process tobacco leaves along with herbal preparations."
	w_class = ITEM_SIZE_TINY

	volume = 10
	filling = list(/datum/reagent/tobacco/perception = 10)

/obj/item/tobacco/medical
	name = "medical tobacco"
	desc = "Medicinal tobacco used for relaxation and concentration."
	w_class = ITEM_SIZE_TINY

	volume = 10
	filling = list(/datum/reagent/tobacco/medical = 10)

/obj/item/tobacco/strong
	name = "strong tobacco"
	desc = "Strong tobacco for strong men... or women, perhaps."
	w_class = ITEM_SIZE_TINY

	volume = 10
	filling = list(/datum/reagent/tobacco/strong = 10)

/obj/item/tobacco/female
	name = "female tobacco"
	desc = "Female tobacco for good lady's."
	w_class = ITEM_SIZE_TINY

	volume = 10
	filling = list(/datum/reagent/tobacco/female = 10)

/obj/item/tobacco/honey
	name = "tobacco with honey"
	desc = "Tobacco that has been processed in honey."
	w_class = ITEM_SIZE_TINY

	volume = 10
	filling = list(/datum/reagent/tobacco/honey = 10)

/obj/item/tobacco/coffee
	name = "tobacco with coffee"
	desc = "Tobacco leaves that have been mixed with coffee powder."
	w_class = ITEM_SIZE_TINY

	volume = 10
	filling = list(/datum/reagent/tobacco/coffee = 10)

/obj/item/tobacco/attackby(obj/item/I, mob/user)
	if(is_type_in_list(I, list(/obj/item/paper/cig/, /obj/item/paper/, /obj/item/teleportation_scroll)))
		if(user.unEquip(I))
			var/obj/item/clothing/mask/smokable/cigarette/rolled/R = new(get_turf(src))
			R.chem_volume = reagents.total_volume
			R.brand = "[src] handrolled in \the [I]."
			reagents.trans_to_holder(R.reagents, R.chem_volume)
			to_chat(user, "<span class='notice'>You roll \the [src] into \the [I]</span>")
			user.put_in_active_hand(R)
			qdel(I)
			qdel(src)
			return
	..()
