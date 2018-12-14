/obj/structure/bed/sofa
	name = "comfy sofa"
	desc = "So lovely, uh."
	icon_state = "sofa_right"
	buckle_dir = 0
	buckle_lying = 0
	color = null

/obj/structure/bed/sofa/left
	icon_state = "sofa_left"

/obj/structure/bed/sofa/New(var/newloc)
	base_icon = icon_state
	..(newloc,"plastic")

/obj/structure/bed/sofa/post_buckle_mob()
	update_icon()
	return ..()

/obj/structure/bed/sofa/on_update_icon()
	..()
	if(src.dir == NORTH)
		src.layer = 5
	else
		src.layer = OBJ_LAYER
	var/cache_key = "[base_icon]-[material.name]-over"
	if(isnull(stool_cache[cache_key]))
		var/image/I = image('icons/obj/furniture_inf.dmi', "[base_icon]_over")
		if(material_alteration & MATERIAL_ALTERATION_COLOR)
			I.color = material.icon_colour
		I.plane = ABOVE_HUMAN_PLANE
		I.layer = ABOVE_HUMAN_LAYER
		stool_cache[cache_key] = I
	overlays |= stool_cache[cache_key]
	if(buckled_mob)
//		if(isnull(stool_cache[cache_key]))
		var/image/I = image('icons/obj/furniture_inf.dmi', "[base_icon]_armrest")
		I.plane = ABOVE_HUMAN_PLANE
		I.layer = ABOVE_HUMAN_LAYER
		if(material_alteration & MATERIAL_ALTERATION_COLOR)
			I.color = material.icon_colour
		stool_cache[cache_key] = I
		overlays |= stool_cache[cache_key]

/obj/structure/bed/sofa/black
	icon_state = "couchblack_middle"

/obj/structure/bed/sofa/black/left
	icon_state = "couchblack_left"

/obj/structure/bed/sofa/black/right
	icon_state = "couchblack_right"

/obj/structure/bed/sofa/beige
	icon_state = "couchbeige_middle"

/obj/structure/bed/sofa/beige/left
	icon_state = "couchbeige_left"

/obj/structure/bed/sofa/beige/right
	icon_state = "couchbeige_right"

/obj/structure/bed/sofa/brown
	icon_state = "couchbrown_middle"

/obj/structure/bed/sofa/brown/left
	icon_state = "couchbrown_left"

/obj/structure/bed/sofa/brown/right
	icon_state = "couchbrown_right"
