///SCI TELEPAD///
/obj/machinery/telepad
	name = "telepad"
	desc = "A bluespace telepad used for teleporting objects to and from a location."
	icon = 'icons/obj/telescience.dmi'
	icon_state = "pad-idle"
	anchored = TRUE
	use_power = 1
	idle_power_usage = 200
	active_power_usage = 5000
	construct_state = /decl/machine_construction/default/panel_closed
	uncreated_component_parts = null
	stat_immune = 0

	var/efficiency

/obj/machinery/telepad/RefreshParts()
	efficiency = total_component_rating_of_type(/obj/item/stock_parts/capacitor)


/obj/machinery/telepad/components_are_accessible(path)
	return panel_open


/obj/machinery/telepad/attackby(obj/item/I, mob/user, params)
	if(component_attackby(I, user)) return TRUE
	if(panel_open)
		if(istype(I, /obj/item/device/multitool))
			var/obj/item/device/multitool/M = I
			M.buffer = src
			to_chat(user, "<span class='caution'>You save the data in the [I.name]'s buffer.</span>")
			return
		// Алмазная фокусирующая линза. Гы-гы
		if(istype(I, /obj/item/material/coin/diamond))
			var/obj/item/stock_parts/building_material/material = get_component_of_type(/obj/item/stock_parts/building_material, TRUE)
			if(material && material.number_of_type(/obj/item/material/coin/diamond)>0)
				to_chat(user, "<span class='caution'>Machine have already installed \an [I.name]</span>")
				return
			if(user.drop_from_inventory(I))
				install_component(I)
			return

	else
		if(istype(I, /obj/item/device/multitool))
			to_chat(user, "<span class='caution'>You should open [src]'s maintenance panel first.</span>")
			return

/obj/machinery/telepad/on_update_icon()
	switch (panel_open)
		if (1)
			icon_state = "pad-idle-o"
		if (0)
			icon_state = "pad-idle"
