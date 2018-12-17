/obj/structure/bed/sofa
	name = "leather sofa"
	desc = "A wide and comfy sofa - no one assistant was ate by it due production! It's made of steel and covered with synthetic leather."
	icon_state = "sofa_right"
	buckle_dir = 0
	buckle_lying = 0

/obj/structure/bed/sofa/left
	icon_state = "sofa_left"

/obj/structure/bed/sofa/New(var/newloc)
	base_icon = icon_state
	..(newloc,MATERIAL_LEATHER)

/obj/structure/bed/sofa/post_buckle_mob()
	update_icon()
	return ..()

/obj/structure/bed/sofa/on_update_icon()
	overlays.Cut()
	var/image/I = image('icons/obj/furniture_inf.dmi', "[base_icon]_over")
	I.plane = ABOVE_HUMAN_PLANE
	I.layer = ABOVE_HUMAN_LAYER
	overlays |= I
	if(buckled_mob)
		var/image/D = image('icons/obj/furniture_inf.dmi', "[base_icon]_armrest")
		D.plane = ABOVE_HUMAN_PLANE
		D.layer = ABOVE_HUMAN_LAYER
		overlays |= D

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
