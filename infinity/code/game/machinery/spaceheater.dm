/obj/machinery/space_heater/stationary
	name = "stationary space heater"
	icon = 'infinity/icons/obj/atmos.dmi'
	icon_state = "stheater-off"
	anchored = 1
	density = 0
	heating_power = 120 KILOWATTS
	atom_flags = ATOM_FLAG_NO_TEMP_CHANGE

/obj/machinery/space_heater/stationary/on_update_icon(var/rebuild_overlay = 0)
	if(!on)
		icon_state = "stheater-off"
		set_light(0)
	else if(active > 0)
		icon_state = "stheater-heat"
		set_light(0.7, 1, 2, 3, COLOR_SEDONA)
	else if(active < 0)
		icon_state = "stheater-cool"
		set_light(0.7, 1, 2, 3, COLOR_DEEP_SKY_BLUE)
	else
		icon_state = "stheater-standby"
		set_light(0)

	if(rebuild_overlay)
		overlays.Cut()
		if(panel_open)
			overlays  += "stheater-open"

/obj/machinery/space_heater/stationary/on
	on = 1
