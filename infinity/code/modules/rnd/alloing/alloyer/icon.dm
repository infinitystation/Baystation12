/obj/machinery/alloyer/on_update_icon()
	. = ..()
	LAZY_LIST_CLEAR(overlays)
	if(!(stat & (NOPOWER|BROKEN)) && on && !panel_open)
		overlays += image(icon, "[base_icon_state]_on")
	if(alloing_in_progress && on && !loading_materials_in_progress)
		/*
		var/image/alloy = image(icon, "alloyer_material_overlay", layer+0.2)
		alloy.color = result_alloy.icon_colour
		var/image/ray = image(icon, "alloyer_ray_overlay", layer+0.1)
		overlays += alloy
		overlays += ray
		MCR_SPAWN(34)
			alloing_in_progress = 0
			overlays -= alloy
			overlays -= ray
			qdel(alloy)
			qdel(ray)
		*/
		flick("[base_icon_state]_processing", src)
		MCR_SPAWN(39)
			alloing_in_progress = 0
	if(loading_materials_in_progress)
		flick("[base_icon_state]_mat_animation", src)
		MCR_SPAWN(33)
			loading_materials_in_progress = 0
	if(panel_open)
		flick("[base_icon_state]_panel_animation", src)
		MCR_SPAWN(4)
			overlays += image(icon, "[base_icon_state]_panel_overlay")
/*
		var/image/pa = image(icon, "[base_icon_state]_panel_overlay-animation")
		overlays += pa
		MCR_SPAWN(4)
			overlays += image(icon, "[base_icon_state]_panel_overlay")
			qdel(pa)
*/