/obj/machinery/button
	name = "button"
	icon = 'icons/obj/objects.dmi'
	icon_state = "launcherbtt"
	desc = "A remote control switch for something."
	anchored = TRUE
	power_channel = ENVIRON
	idle_power_usage = 10
	public_variables = list(
		/decl/public_access/public_variable/button_active,
		/decl/public_access/public_variable/input_toggle
	)
	public_methods = list(/decl/public_access/public_method/toggle_input_toggle)
	stock_part_presets = list(/decl/stock_part_preset/radio/basic_transmitter/button = 1)
	uncreated_component_parts = list(
		/obj/item/stock_parts/power/apc,
		/obj/item/stock_parts/radio/transmitter/basic
	)

	var/active = FALSE
	var/operating = FALSE
	var/cooldown = 1 SECOND
	var/image/overlay

/obj/machinery/button/Initialize()
	. = ..()
	update_icon()

/obj/machinery/button/attackby(obj/item/W, mob/user as mob)
	return attack_hand(user)

/obj/machinery/button/interface_interact(user)
	if(!CanInteract(user, DefaultTopicState()))
		if(!allowed(user))
			if(CanPhysicallyInteract(user))
				operating = 2
				playsound(src, "button", 60)
				update_icon()
				sleep(cooldown)
				operating = FALSE
				update_icon()
		return FALSE
	if(istype(user, /mob/living/carbon))
		playsound(src, "button", 60)
	activate(user)
	return TRUE

/obj/machinery/button/emag_act()
	if(req_access)
		req_access.Cut()

/obj/machinery/button/proc/activate(mob/living/user)
	set waitfor = FALSE
	if(operating)
		return
	operating = TRUE
	var/decl/public_access/public_variable/variable = decls_repository.get_decl(/decl/public_access/public_variable/button_active)
	variable.write_var(src, !active)
	use_power_oneoff(500)
	update_icon()

	sleep(cooldown)
	operating = FALSE
	update_icon()

/obj/machinery/button/on_update_icon()
	if(operating)
		icon_state = "launcheract"
	else
		icon_state = "launcherbtt"

/decl/public_access/public_variable/button_active
	expected_type = /obj/machinery/button
	name = "button active"
	desc = "Whether the button is currently in the on state."
	can_write = FALSE
	has_updates = TRUE

/decl/public_access/public_variable/button_active/access_var(obj/machinery/button/button)
	return button.active

/decl/public_access/public_variable/button_active/write_var(obj/machinery/button/button, new_val)
	. = ..()
	if(.)
		button.active = new_val

/decl/stock_part_preset/radio/basic_transmitter/button
	transmit_on_change = list("button_active" = /decl/public_access/public_variable/button_active)
	frequency = BUTTON_FREQ

//alternate button with the same functionality, except has a lightswitch sprite instead
/obj/machinery/button/switch
	icon = 'icons/obj/buttons.dmi'
	icon_state = "light0"

/obj/machinery/button/switch/on_update_icon()
	if(!overlay)
		overlay = image(icon, "light0-overlay")
		overlay.plane = EFFECTS_ABOVE_LIGHTING_PLANE
		overlay.layer = ABOVE_LIGHTING_LAYER

	overlays.Cut()
	if(stat & (NOPOWER|BROKEN))
		icon_state = "light-p"
		set_light(0)
	else
		icon_state = "light[operating]"
		overlay.icon_state = "light[operating]-overlay"
		overlays += overlay
		set_light(0.3, 0.1, 1, 2, operating ? "#82ff4c" : "#f86060")

//alternate button with the same functionality, except has a door control sprite instead
/obj/machinery/button/alternate
	icon = 'icons/obj/buttons.dmi'
	icon_state = "doorctrl0"

/obj/machinery/button/alternate/on_update_icon()
	if(!overlay)
		overlay = image(icon, "doorctrl0-overlay")
		overlay.plane = EFFECTS_ABOVE_LIGHTING_PLANE
		overlay.layer = ABOVE_LIGHTING_LAYER

	overlays.Cut()
	if(stat & (NOPOWER|BROKEN))
		icon_state = "doorctrl-p"
		set_light(0)
	else
		icon_state = "doorctrl[operating]"
		overlay.icon_state = "doorctrl[operating]-overlay"
		overlays += overlay
		switch(operating)
			if(0) set_light(0.3, 0.1, 1, 2, "#F2FF00")
			if(1) set_light(0.3, 0.1, 1, 2, "#a1FF00")
			else set_light(0.3, 0.1, 1, 2,"#f86060")

//Toggle button determines icon state from active, not operating
/obj/machinery/button/toggle/on_update_icon()
	if(active)
		icon_state = "launcheract"
	else
		icon_state = "launcherbtt"

//alternate button with the same toggle functionality, except has a lightswitch sprite instead
/obj/machinery/button/toggle/switch
	icon = 'icons/obj/buttons.dmi'
	icon_state = "light0"

/obj/machinery/button/toggle/switch/on_update_icon()
	if(!overlay)
		overlay = image(icon, "light0-overlay")
		overlay.plane = EFFECTS_ABOVE_LIGHTING_PLANE
		overlay.layer = ABOVE_LIGHTING_LAYER

	overlays.Cut()
	if(stat & (NOPOWER|BROKEN))
		icon_state = "light-p"
		set_light(0)
	else
		icon_state = "light[active]"
		overlay.icon_state = "light[active]-overlay"
		overlays += overlay
		set_light(0.3, 0.1, 1, 2, active ? "#82ff4c" : "#f86060")



//alternate button with the same toggle functionality, except has a door control sprite instead
/obj/machinery/button/toggle/alternate
	icon = 'icons/obj/buttons.dmi'
	icon_state = "blastctrl-nonactive"

/obj/machinery/button/toggle/alternate/on_update_icon()
	if(!overlay)
		overlay = image(icon, "big-switch-red-ol")
		overlay.plane = EFFECTS_ABOVE_LIGHTING_PLANE
		overlay.layer = ABOVE_LIGHTING_LAYER

	overlays.Cut()
	if(stat & (NOPOWER|BROKEN))
		icon_state = "blastctrl-p"
		set_light(0)
	if(active)
		icon_state = "blastctrl-active"
		overlay.icon_state = "big-switch-green-ol"
		overlays += overlay
		set_light(0.3, 0.1, 1, 2,"#a1FF00")
	else
		icon_state = "blastctrl-nonactive"
		overlay.icon_state = "big-switch-red-ol"
		overlays += overlay
		set_light(0.3, 0.1, 1, 2,"#C50022")


//-------------------------------
// Mass Driver Button
//  Passes the activate call to a mass driver wifi sender
//-------------------------------
/obj/machinery/button/mass_driver
	name = "mass driver button"

//-------------------------------
// Door Buttons
//-------------------------------

/obj/machinery/button/alternate/door
	icon = 'icons/obj/buttons.dmi'
	icon_state = "doorctrl0"
	stock_part_presets = list(/decl/stock_part_preset/radio/basic_transmitter/button/door)

/obj/machinery/button/alternate/door/on_update_icon()
	if(!overlay)
		overlay = image(icon, "doorctrl0-overlay")
		overlay.plane = EFFECTS_ABOVE_LIGHTING_PLANE
		overlay.layer = ABOVE_LIGHTING_LAYER

	overlays.Cut()
	if(stat & (NOPOWER|BROKEN))
		icon_state = "doorctrl-p"
		set_light(0)
	else
		icon_state = "doorctrl[operating]"
		overlay.icon_state = "doorctrl[operating]-overlay"
		overlays += overlay
		switch(operating)
			if(0) set_light(0.3, 0.1, 1, 2, "#F2FF00")
			if(1) set_light(0.3, 0.1, 1, 2, "#a1FF00")
			else set_light(0.3, 0.1, 1, 2,"#f86060")

/decl/stock_part_preset/radio/basic_transmitter/button/door
	frequency = AIRLOCK_FREQ
	transmit_on_change = list("toggle_door" = /decl/public_access/public_variable/button_active)

/obj/machinery/button/alternate/door/bolts
	stock_part_presets = list(/decl/stock_part_preset/radio/basic_transmitter/button/airlock_bolt)

/decl/stock_part_preset/radio/basic_transmitter/button/airlock_bolt
	frequency = AIRLOCK_FREQ
	transmit_on_change = list("toggle_bolts" = /decl/public_access/public_variable/button_active)

// Valve control

/obj/machinery/button/toggle/valve
	name = "remote valve control"
	stock_part_presets = list(/decl/stock_part_preset/radio/basic_transmitter/button/atmosia)

/obj/machinery/button/toggle/valve/on_update_icon()
	if(!active)
		icon_state = "launcherbtt"
	else
		icon_state = "launcheract"

/decl/stock_part_preset/radio/basic_transmitter/button/atmosia
	transmit_on_change = list("valve_toggle" = /decl/public_access/public_variable/button_active)
	frequency = FUEL_FREQ
	filter = RADIO_ATMOSIA
