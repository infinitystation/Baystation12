/obj/machinery/alloyer
	name = "atomic furnace"
	desc = "This is an atomic furnace.<br>It deconstruct materials and merge them, creating alloy."

	icon = 'infinity/icons/obj/rnd/alloing/new.alloyer.dmi'
	icon_state = "alloyer"
	var/base_icon_state

	density = 1
	anchored = 1


	var/list/materials2alloy = list() //materials to alloy
	var/material/result_alloy = null
	var/alloy_temperature = 293

	var/alloing_in_progress = 0
	var/loading_materials_in_progress = 0
	var/on = 1

/obj/machinery/alloyer/Initialize()
	. = ..()
	if(!base_icon_state) base_icon_state = icon_state

	update_icon()

#include "icon.dm"
#include "interaction.dm"
#include "ui.dm"
