///SCI TELEPAD///
/obj/machinery/telepad
	name = "telepad"
	desc = "A bluespace telepad used for teleporting objects to and from a location."
	icon = 'icons/obj/telescience.dmi'
	icon_state = "pad-idle"
	anchored = 1
	use_power = 1
	idle_power_usage = 200
	active_power_usage = 5000
	construct_state = /decl/machine_construction/default/panel_closed
	uncreated_component_parts = null
	stat_immune = 0

	var/efficiency

/obj/machinery/telepad/New()
	..()
	component_parts = list(
	new /obj/item/weapon/stock_parts/circuitboard/telesci_pad,
	new /obj/item/bluespace_crystal/artificial,
	new /obj/item/bluespace_crystal/artificial,
	new /obj/item/weapon/stock_parts/capacitor,
	new /obj/item/weapon/stock_parts/console_screen
	)
	RefreshParts()

/obj/machinery/telepad/RefreshParts()
	var/E
	for(var/obj/item/weapon/stock_parts/capacitor/C in component_parts)
		E += C.rating
	efficiency = E

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
