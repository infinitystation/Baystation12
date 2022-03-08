/obj/structure/bed/sofa
	name = "sofa"
	desc = "A wide and comfy sofa - no one assistant was ate by it due production! It's made of wood and covered with synthetic leather."
	icon = 'icons/obj/furniture.dmi'
	icon_state = "sofa_preview"
	base_icon = "sofa"
	buckle_dir = FALSE
	buckle_lying = FALSE
	obj_flags = OBJ_FLAG_ROTATABLE

/obj/structure/bed/sofa/do_simple_ranged_interaction(var/mob/user)
	if(!buckled_mob && user)
		rotate(user)
	return TRUE

/obj/structure/bed/sofa/set_dir()
	..()
	if(buckled_mob)
		buckled_mob.set_dir(dir)

/obj/structure/bed/sofa/post_buckle_mob()
	update_icon()
	return ..()

/obj/structure/bed/attackby(obj/item/W as obj, mob/user as mob)
	. = ..()
	if(.)
		return
	if(!isWrench(W))
		return
	playsound(src.loc, 'sound/items/Ratchet.ogg', 50, 1)
	anchored = !anchored
	if(anchored)
		to_chat(user, "You disanchored \the [src].")
	else
		to_chat(user, "You anchored \the [src].")

/obj/structure/bed/sofa/on_update_icon()
	..()

	cache_key = "[base_icon]-[material.name]-over"
	if(isnull(stool_cache[cache_key]))
		var/image/I = image('icons/obj/furniture.dmi', "[base_icon]_over")
		if(material_alteration & MATERIAL_ALTERATION_COLOR)
			I.color = material.icon_colour
		I.layer = ABOVE_HUMAN_LAYER
		stool_cache[cache_key] = I
	overlays |= stool_cache[cache_key]
	// Padding overlay.
	if(padding_material)
		padding_cache_key = "[base_icon]-padding-[padding_material.name]-over"
		if(isnull(stool_cache[padding_cache_key]))
			var/image/I =  image(icon, "[base_icon]_padding_over")
			if(material_alteration & MATERIAL_ALTERATION_COLOR)
				I.color = padding_material.icon_colour
			I.layer = ABOVE_HUMAN_LAYER
			stool_cache[padding_cache_key] = I
		overlays |= stool_cache[padding_cache_key]

	if(buckled_mob)
		cache_key = "[base_icon]-armrest-[material.name]"
		if(isnull(stool_cache[cache_key]))
			var/image/I = image(icon, "[base_icon]_armrest")
			I.layer = ABOVE_HUMAN_LAYER
			if(material_alteration & MATERIAL_ALTERATION_COLOR)
				I.color = material.icon_colour
			stool_cache[cache_key] = I
		overlays |= stool_cache[cache_key]
		if(padding_material)
			padding_cache_key = "[base_icon]-padding-armrest-[padding_material.name]"
			if(isnull(stool_cache[padding_cache_key]))
				var/image/I = image(icon, "[base_icon]_padding_armrest")
				I.layer = ABOVE_HUMAN_LAYER
				if(material_alteration & MATERIAL_ALTERATION_COLOR)
					I.color = padding_material.icon_colour
				stool_cache[padding_cache_key] = I
			overlays |= stool_cache[padding_cache_key]

/obj/structure/bed/sofa/m/rotate(mob/user)
	if(!CanPhysicallyInteract(user) || anchored)
		to_chat(user, SPAN_NOTICE("You can't interact with \the [src] right now!"))
		return

	set_dir(turn(dir, 45))
	update_icon()

/obj/structure/bed/sofa/rotate(mob/user)
	if(!CanPhysicallyInteract(user) || anchored)
		to_chat(user, SPAN_NOTICE("You can't interact with \the [src] right now!"))
		return

	set_dir(turn(dir, 90))
	update_icon()

/obj/structure/bed/sofa/m/hard/New(newloc, newmaterial = MATERIAL_WOOD)
	..(newloc, newmaterial, padding_material)
	anchored = FALSE

/obj/structure/bed/sofa/m/red/New(newloc, newmaterial = MATERIAL_WOOD)
	..(newloc, newmaterial, MATERIAL_RED_CLOTH)

/obj/structure/bed/sofa/m/brown/New(newloc, newmaterial = MATERIAL_WOOD)
	..(newloc, newmaterial, MATERIAL_LEATHER_GENERIC)

/obj/structure/bed/sofa/m/teal/New(newloc, newmaterial = MATERIAL_WOOD)
	..(newloc, newmaterial, MATERIAL_TEAL_CLOTH)

/obj/structure/bed/sofa/m/black/New(newloc, newmaterial = MATERIAL_WOOD)
	..(newloc, newmaterial, MATERIAL_BLACK_CLOTH)

/obj/structure/bed/sofa/m/green/New(newloc, newmaterial = MATERIAL_WOOD)
	..(newloc, newmaterial, MATERIAL_GREEN_CLOTH)

/obj/structure/bed/sofa/m/purple/New(newloc, newmaterial = MATERIAL_WOOD)
	..(newloc, newmaterial, MATERIAL_PURPLE_CLOTH)

/obj/structure/bed/sofa/m/blue/New(newloc, newmaterial = MATERIAL_WOOD)
	..(newloc, newmaterial, MATERIAL_BLUE_CLOTH)

/obj/structure/bed/sofa/m/beige/New(newloc, newmaterial = MATERIAL_WOOD)
	..(newloc, newmaterial, MATERIAL_BEIGE_CLOTH)

/obj/structure/bed/sofa/m/lime/New(newloc, newmaterial = MATERIAL_WOOD)
	..(newloc, newmaterial, MATERIAL_LIME_CLOTH)

/obj/structure/bed/sofa/m/yellow/New(newloc, newmaterial = MATERIAL_WOOD)
	..(newloc, newmaterial, MATERIAL_YELLOW_CLOTH)

/obj/structure/bed/sofa/m/light/New(newloc, newmaterial = MATERIAL_WOOD)
	..(newloc, newmaterial, MATERIAL_CLOTH)

/obj/structure/bed/sofa/r
	name = "sofa"
	desc = "A wide and comfy sofa - no one assistant was ate by it due production! It's made of wood and covered with synthetic leather."
	icon_state = "sofa_r_preview"
	base_icon = "sofa_r"

/obj/structure/bed/sofa/r/hard/New(newloc, newmaterial = MATERIAL_WOOD)
	..(newloc, newmaterial, padding_material)
	anchored = FALSE

/obj/structure/bed/sofa/r/red/New(newloc, newmaterial = MATERIAL_WOOD)
	..(newloc, newmaterial, MATERIAL_RED_CLOTH)

/obj/structure/bed/sofa/r/brown/New(newloc, newmaterial = MATERIAL_WOOD)
	..(newloc, newmaterial, MATERIAL_LEATHER_GENERIC)

/obj/structure/bed/sofa/r/teal/New(newloc, newmaterial = MATERIAL_WOOD)
	..(newloc, newmaterial, MATERIAL_TEAL_CLOTH)

/obj/structure/bed/sofa/r/black/New(newloc, newmaterial = MATERIAL_WOOD)
	..(newloc, newmaterial, MATERIAL_BLACK_CLOTH)

/obj/structure/bed/sofa/r/green/New(newloc, newmaterial = MATERIAL_WOOD)
	..(newloc, newmaterial, MATERIAL_GREEN_CLOTH)

/obj/structure/bed/sofa/r/purple/New(newloc, newmaterial = MATERIAL_WOOD)
	..(newloc, newmaterial, MATERIAL_PURPLE_CLOTH)

/obj/structure/bed/sofa/r/blue/New(newloc, newmaterial = MATERIAL_WOOD)
	..(newloc, newmaterial, MATERIAL_BLUE_CLOTH)

/obj/structure/bed/sofa/r/beige/New(newloc, newmaterial = MATERIAL_WOOD)
	..(newloc, newmaterial, MATERIAL_BEIGE_CLOTH)

/obj/structure/bed/sofa/r/lime/New(newloc, newmaterial = MATERIAL_WOOD)
	..(newloc, newmaterial, MATERIAL_LIME_CLOTH)

/obj/structure/bed/sofa/r/yellow/New(newloc, newmaterial = MATERIAL_WOOD)
	..(newloc, newmaterial, MATERIAL_YELLOW_CLOTH)

/obj/structure/bed/sofa/r/light/New(newloc, newmaterial = MATERIAL_WOOD)
	..(newloc, newmaterial, MATERIAL_CLOTH)

/obj/structure/bed/sofa/l
	name = "sofa"
	desc = "A wide and comfy sofa - no one assistant was ate by it due production! It's made of wood and covered with synthetic leather."
	icon_state = "sofa_l_preview"
	base_icon = "sofa_l"

/obj/structure/bed/sofa/l/hard/New(newloc, newmaterial = MATERIAL_WOOD)
	..(newloc, newmaterial, padding_material)
	anchored = FALSE

/obj/structure/bed/sofa/l/red/New(newloc, newmaterial = MATERIAL_WOOD)
	..(newloc, newmaterial, MATERIAL_RED_CLOTH)

/obj/structure/bed/sofa/l/brown/New(newloc, newmaterial = MATERIAL_WOOD)
	..(newloc, newmaterial, MATERIAL_LEATHER_GENERIC)

/obj/structure/bed/sofa/l/teal/New(newloc, newmaterial = MATERIAL_WOOD)
	..(newloc, newmaterial, MATERIAL_TEAL_CLOTH)

/obj/structure/bed/sofa/l/black/New(newloc, newmaterial = MATERIAL_WOOD)
	..(newloc, newmaterial, MATERIAL_BLACK_CLOTH)

/obj/structure/bed/sofa/l/green/New(newloc, newmaterial = MATERIAL_WOOD)
	..(newloc, newmaterial, MATERIAL_GREEN_CLOTH)

/obj/structure/bed/sofa/l/purple/New(newloc, newmaterial = MATERIAL_WOOD)
	..(newloc, newmaterial, MATERIAL_PURPLE_CLOTH)

/obj/structure/bed/sofa/l/blue/New(newloc, newmaterial = MATERIAL_WOOD)
	..(newloc, newmaterial, MATERIAL_BLUE_CLOTH)

/obj/structure/bed/sofa/l/beige/New(newloc, newmaterial = MATERIAL_WOOD)
	..(newloc, newmaterial, MATERIAL_BEIGE_CLOTH)

/obj/structure/bed/sofa/l/lime/New(newloc, newmaterial = MATERIAL_WOOD)
	..(newloc, newmaterial, MATERIAL_LIME_CLOTH)

/obj/structure/bed/sofa/l/yellow/New(newloc, newmaterial = MATERIAL_WOOD)
	..(newloc, newmaterial, MATERIAL_YELLOW_CLOTH)

/obj/structure/bed/sofa/l/light/New(newloc, newmaterial = MATERIAL_WOOD)
	..(newloc, newmaterial, MATERIAL_CLOTH)
