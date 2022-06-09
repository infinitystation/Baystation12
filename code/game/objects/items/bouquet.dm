/obj/item/bouquet
	name = "Glass bouquet"
	desc = "Beautiful bouquet with flowers. It smells indescribably delicious!"
	icon = 'icons/obj/bouquet.dmi'
	icon_state = "bouquet_base"
	item_state = "bouquet_base"
	var/list/allowedplants = list(
		"harebells",
		"poppies",
		"lavender",
		"sunflowers"
	)
	var/list/contentflovers = list()
	var/filled = FALSE

/obj/item/bouquet/on_update_icon()
	for(var/flower as anything in contentflovers)
		switch (flower)
			if ("harebells")	overlays += image(icon, "flower_1")
			if ("poppies")		overlays += image(icon, "flower_2")
			if ("lavender")		overlays += image(icon, "flower_3")
			if ("sunflowers")	overlays += image(icon, "flower_4")
	. = ..()

/obj/item/bouquet/attackby(obj/item/weapon, mob/user)
	if(!istype(weapon, /obj/item/reagent_containers/food/snacks/grown) || filled)
		return ..()

	var/obj/item/reagent_containers/food/snacks/grown/flower = weapon

	if(flower.plantname in contentflovers)
		to_chat(user, SPAN_WARNING("There is already this flower here."))
		return

	if(!(flower.plantname in allowedplants))
		to_chat(user, SPAN_WARNING("This flower will look to strange in bouquet..."))
		return

	contentflovers.Add(flower.plantname)
	qdel(flower)
	update_icon()
	visible_message(SPAN_INFO("[user] put's [flower.plantname] in the bouquet."))
	if(length(contentflovers) >= 4) filled = TRUE

/obj/item/bouquet/throw_impact(atom/hit_atom)
	if(QDELETED(src))
		return

	visible_message(
		SPAN_DANGER("\The [src] shatters from the impact!"),
		SPAN_DANGER("You hear the sound of glass shattering!")
	)
	playsound(src.loc, pick(GLOB.shatter_sound), 100)
	new /obj/item/material/shard(src.loc)
	qdel(src)

/obj/item/bouquet/premaded
	icon_state = "bouquet_preview"
	item_state = "bouquet_preview"
	filled = TRUE

/obj/item/reagent_containers/food/drinks/glass2/carafe/attackby(obj/item/I, mob/user)
	if(!istype(I, /obj/item/reagent_containers/food/snacks/grown))
		return ..()

	if(reagents.total_volume)
		to_chat(user, SPAN_WARNING("The pitcher must be empty!"))
		return

	var/obj/item/reagent_containers/food/snacks/grown/flower = I
	if(flower.plantname != "grass")
		return
	qdel(flower)
	var/obj/item/bouquet/B = new(get_turf(src))
	qdel(src)
	user.put_in_hands(B)
	to_chat(user, SPAN_INFO("You placed grass into the pitcher."))
