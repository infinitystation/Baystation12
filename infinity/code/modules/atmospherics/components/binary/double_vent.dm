/obj/machinery/atmospherics/binary/double_pump
	name = "Large Air Double-Vent"
	power_rating = 100000 //100 kW ~ 135 HP

	icon = 'icons/atmos/vent_pump.dmi'
	icon_state = "map_dp_vent"

	desc = "Has a valve and pump attached to it."
	use_power = POWER_USE_OFF
	idle_power_usage = 150		//internal circuitry, friction losses and stuff

	connect_types = CONNECT_TYPE_SUPPLY|CONNECT_TYPE_SCRUBBER //connects to supply pipes, and scrubber pipes
	level = 1
	identifier = "AVP"

	layer = ABOVE_TILE_LAYER

	var/hibernate = 0 //Do we even process?
	var/pump_direction = 1 //0 = siphoning, 1 = releasing

	var/external_pressure_bound = ONE_ATMOSPHERE	// EXTERNAL_PRESSURE_BOUND
	var/internal_pressure_bound = 0	// INTERNAL_PRESSURE_BOUND

	var/pressure_checks = 1	// PRESSURE_CHECKS
	//1: Do not pass external_pressure_bound
	//2: Do not pass internal_pressure_bound
	//3: Do not pass either

	// Used when handling incoming radio signals requesting default settings
	var/external_pressure_bound_default = ONE_ATMOSPHERE	// EXTERNAL_PRESSURE_BOUND
	var/internal_pressure_bound_default = 0	// INTERNAL_PRESSURE_BOUND
	var/pressure_checks_default = 1	// PRESSURE_CHECKS

	var/welded = 0 // Added for aliens -- TLE

	build_icon_state = "uvent"

	uncreated_component_parts = list(
		/obj/item/stock_parts/power/apc,
		/obj/item/stock_parts/radio/receiver,
		/obj/item/stock_parts/radio/transmitter/on_event,
	)
	public_variables = list(
		/decl/public_access/public_variable/input_toggle,
		/decl/public_access/public_variable/area_uid,
		/decl/public_access/public_variable/identifier,
		/decl/public_access/public_variable/use_power,
		/decl/public_access/public_variable/pump_dir/double,
		/decl/public_access/public_variable/pump_checks/double,
		/decl/public_access/public_variable/pressure_bound/double,
		/decl/public_access/public_variable/pressure_bound/external/double,
		/decl/public_access/public_variable/power_draw,
		/decl/public_access/public_variable/flow_rate,
		/decl/public_access/public_variable/name
	)
	public_methods = list(
		/decl/public_access/public_method/toggle_power,
		/decl/public_access/public_method/purge_pump/double,
		/decl/public_access/public_method/refresh
	)
	stock_part_presets = list(
		/decl/stock_part_preset/radio/receiver/vent_pump/airlock/double = 1,
		/decl/stock_part_preset/radio/event_transmitter/vent_pump/airlock/double = 1
	)

	frame_type = /obj/item/pipe
	construct_state = /decl/machine_construction/default/item_chassis
	base_type = /obj/machinery/atmospherics/unary/vent_pump

/obj/machinery/atmospherics/binary/double_pump/Initialize()
	. = ..()
	// air1.volume = ATMOS_DEFAULT_VOLUME_PUMP * 10
	air2.volume = ATMOS_DEFAULT_VOLUME_PUMP * 10
	icon = null

/obj/machinery/atmospherics/binary/double_pump/Destroy()
	var/area/A = get_area(src)
	if(A)
		A.air_vent_info -= id_tag
		A.air_vent_names -= id_tag
	. = ..()

/obj/machinery/atmospherics/binary/double_pump/on_update_icon(var/safety = 0)
	if(!check_icon_cache())
		return
	if (!node1 && !node2)
		return

	overlays.Cut()

	var/vent_icon = "vent"

	var/turf/T = get_turf(src)
	if(!istype(T))
		return

	if(!T.is_plating() && node1 && node1.level == 1 && istype(node1, /obj/machinery/atmospherics/pipe) && node2 && node2.level == 1 && istype(node2, /obj/machinery/atmospherics/pipe))
		vent_icon += "h"

	if(welded)
		vent_icon += "weld"
	else if(!powered())
		vent_icon += "off"
	else
		vent_icon += "[use_power ? "[pump_direction ? "out" : "in"]" : "off"]"

	overlays += icon_manager.get_atmos_icon("device", , , vent_icon)

/obj/machinery/atmospherics/binary/double_pump/update_underlays()
	if(..())
		underlays.Cut()
		var/turf/T = get_turf(src)
		if(!istype(T))
			return
		if(!T.is_plating() && node1 && node1.level == 1 && istype(node1, /obj/machinery/atmospherics/pipe) && node2 && node2.level == 1 && istype(node2, /obj/machinery/atmospherics/pipe))
			return
		else
			if(node1)
				add_underlay(T, node1, turn(dir, 180), node1.icon_connect_type)
			else
				add_underlay(T,, turn(dir, 180))
			if(node2)
				add_underlay(T, node2, dir, node2.icon_connect_type)
			else
				add_underlay(T,, dir)

/obj/machinery/atmospherics/binary/double_pump/hide()
	update_icon()
	update_underlays()

/obj/machinery/atmospherics/binary/double_pump/proc/can_pump()
	if(stat & (NOPOWER|BROKEN))
		return 0
	if(!use_power)
		return 0
	if(welded)
		return 0
	return 1


/obj/machinery/atmospherics/binary/double_pump/Process()
	..()

	if (hibernate > world.time)
		return 1

	if (!node1 || !node2)
		update_use_power(POWER_USE_OFF)
	if(!can_pump())
		return 0

	var/datum/gas_mixture/environment = loc.return_air()

	var/power_draw = -1

	//Figure out the target pressure difference
	var/pressure_delta = get_pressure_delta(environment)

	if((environment.temperature || air1.temperature || air2.temperature) && pressure_delta > 0.5)
		if(pump_direction) //internal -> external
			var/transfer_moles = calculate_transfer_moles(air1, environment, pressure_delta)
			power_draw = pump_gas(src, air1, environment, transfer_moles, power_rating)
		else //external -> internal
			var/transfer_moles = calculate_transfer_moles(environment, air2, pressure_delta, (network2)? network2.volume : 0)

			//limit flow rate from turfs
			transfer_moles = min(transfer_moles, environment.total_moles*air2.volume/environment.volume)	//group_multiplier gets divided out here
			power_draw = pump_gas(src, environment, air2, transfer_moles, power_rating)

	else
		//If we're in an area that is fucking ideal, and we don't have to do anything, chances are we won't next tick either so why redo these calculations?
		//JESUS FUCK.  THERE ARE LITERALLY 250 OF YOU MOTHERFUCKERS ON ZLEVEL ONE AND YOU DO THIS SHIT EVERY TICK WHEN VERY OFTEN THERE IS NO REASON TO
		if(pump_direction && pressure_checks == 1) //99% of all vents	// PRESSURE_CHECK_EXTERNAL
			hibernate = world.time + (rand(100,200))


	if (power_draw >= 0)
		last_power_draw = power_draw
		use_power_oneoff(power_draw)
		if(pump_direction && network1)
			network1.update = 1
		if(!pump_direction && network2)
			network2.update = 1

	return 1

/obj/machinery/atmospherics/binary/double_pump/proc/get_pressure_delta(datum/gas_mixture/environment)
	var/pressure_delta = 10000	// DEFAULT_PRESSURE_DELTA
	var/environment_pressure = environment.return_pressure()

	if(pump_direction) //internal -> external
		if(pressure_checks & 1)	// PRESSURE_CHECK_EXTERNAL
			pressure_delta = min(pressure_delta, external_pressure_bound - environment_pressure) //increasing the pressure here
		if(pressure_checks & 2)	// PRESSURE_CHECK_INTERNAL
			pressure_delta = min(pressure_delta, air1.return_pressure() - internal_pressure_bound) //decreasing the pressure here
	else //external -> internal
		if(pressure_checks & 1)	// PRESSURE_CHECK_EXTERNAL
			pressure_delta = min(pressure_delta, environment_pressure - external_pressure_bound) //decreasing the pressure here
		if(pressure_checks & 2)	// PRESSURE_CHECK_INTERNAL
			pressure_delta = min(pressure_delta, internal_pressure_bound - air2.return_pressure()) //increasing the pressure here

	return pressure_delta

/obj/machinery/atmospherics/binary/double_pump/proc/purge()
	pressure_checks &= ~1	// PRESSURE_CHECK_EXTERNAL
	pump_direction = 0

/obj/machinery/atmospherics/binary/double_pump/refresh()
	..()
	hibernate = FALSE
	toggle_input_toggle()

/obj/machinery/atmospherics/binary/double_pump/RefreshParts()
	. = ..()
	toggle_input_toggle()

/obj/machinery/atmospherics/binary/double_pump/attackby(obj/item/W, mob/user)
	if(isWelder(W))

		var/obj/item/weldingtool/WT = W

		if(!WT.isOn())
			to_chat(user, "<span class='notice'>The welding tool needs to be on to start this task.</span>")
			return 1

		if(!WT.remove_fuel(0,user))
			to_chat(user, "<span class='warning'>You need more welding fuel to complete this task.</span>")
			return 1

		to_chat(user, "<span class='notice'>Now welding \the [src].</span>")
		playsound(src, 'sound/items/Welder.ogg', 50, 1)

		if(!do_after(user, 20, src))
			to_chat(user, "<span class='notice'>You must remain close to finish this task.</span>")
			return 1

		if(!src)
			return 1

		if(!WT.isOn())
			to_chat(user, "<span class='notice'>The welding tool needs to be on to finish this task.</span>")
			return 1

		welded = !welded
		update_icon()
		playsound(src, 'sound/items/Welder2.ogg', 50, 1)
		user.visible_message("<span class='notice'>\The [user] [welded ? "welds \the [src] shut" : "unwelds \the [src]"].</span>", \
			"<span class='notice'>You [welded ? "weld \the [src] shut" : "unweld \the [src]"].</span>", \
			"You hear welding.")
		return 1

	else
		..()

/obj/machinery/atmospherics/binary/double_pump/examine(mob/user, distance)
	. = ..()
	if(distance <= 1)
		to_chat(user, "A small gauge in the corner reads [round(last_flow_rate, 0.1)] L/s; [round(last_power_draw)] W")
	else
		to_chat(user, "You are too far away to read the gauge.")
	if(welded)
		to_chat(user, "It seems welded shut.")

/obj/machinery/atmospherics/binary/double_pump/attackby(var/obj/item/W as obj, var/mob/user as mob)
	if(isWrench(W))
		if (!(stat & NOPOWER) && use_power)
			to_chat(user, "<span class='warning'>You cannot unwrench \the [src], turn it off first.</span>")
			return 1
		var/turf/T = src.loc
		if (node1 && node1.level==1 && node2 && node2.level==1 && isturf(T) && !T.is_plating())
			to_chat(user, "<span class='warning'>You must remove the plating first.</span>")
			return 1
		var/datum/gas_mixture/int_air = return_air()
		var/datum/gas_mixture/env_air = loc.return_air()
		if ((int_air.return_pressure()-env_air.return_pressure()) > 2*ONE_ATMOSPHERE)
			to_chat(user, "<span class='warning'>You cannot unwrench \the [src], it is too exerted due to internal pressure.</span>")
			add_fingerprint(user)
			return 1
		playsound(src.loc, 'sound/items/Ratchet.ogg', 50, 1)
		to_chat(user, "<span class='notice'>You begin to unfasten \the [src]...</span>")
		if (do_after(user, 40, src))
			user.visible_message( \
				"<span class='notice'>\The [user] unfastens \the [src].</span>", \
				"<span class='notice'>You have unfastened \the [src].</span>", \
				"You hear a ratchet.")
			new /obj/item/pipe(loc, src)
			qdel(src)
	if(isMultitool(W))
		var/datum/browser/popup = new(user, "Vent Configuration Utility", "[src] Configuration Panel", 600, 200)
		popup.set_content(jointext(get_console_data(),"<br>"))
		popup.open()
		return
	else
		return ..()

/obj/machinery/atmospherics/binary/double_pump/proc/get_console_data()
	. = list()
	. += "<table>"
	. += "<tr><td><b>Name:</b></td><td>[name]</td>"
	. += "<tr><td><b>Pump Status:</b></td><td>[pump_direction?("<font color = 'green'>Releasing</font>"):("<font color = 'red'>Siphoning</font>")]</td><td><a href='?src=\ref[src];switchMode=\ref[src]'>Toggle</a></td></tr>"
	. = JOINTEXT(.)

/obj/machinery/atmospherics/binary/double_pump/OnTopic(mob/user, href_list, datum/topic_state/state)
	if((. = ..()))
		return
	if(href_list["switchMode"])
		pump_direction = !pump_direction
		to_chat(user, "<span class='notice'>The multitool emits a short beep confirming the change.</span>")
		queue_icon_update() //force the icon to refresh after changing directional mode.
		return TOPIC_REFRESH



/obj/machinery/atmospherics/binary/double_pump/area_uid()
	return "NONE"

/decl/public_access/public_variable/pump_dir/double
	expected_type = /obj/machinery/atmospherics/binary/double_pump

/decl/public_access/public_variable/pump_dir/double/access_var(obj/machinery/atmospherics/binary/double_pump/machine)
	. = ..()

/decl/public_access/public_variable/pump_dir/double/write_var(obj/machinery/atmospherics/binary/double_pump/machine, new_value)
	. = ..()

/decl/public_access/public_variable/pump_checks/double
	expected_type = /obj/machinery/atmospherics/binary/double_pump

/decl/public_access/public_variable/pump_checks/double/access_var(obj/machinery/atmospherics/binary/double_pump/machine)
	. = ..()

/decl/public_access/public_variable/pump_checks/double/write_var(obj/machinery/atmospherics/binary/double_pump/machine, new_value)
	. = ..()

/decl/public_access/public_variable/pressure_bound/double
	expected_type = /obj/machinery/atmospherics/binary/double_pump

/decl/public_access/public_variable/pressure_bound/double/access_var(obj/machinery/atmospherics/binary/double_pump/machine)
	. = ..()

/decl/public_access/public_variable/pressure_bound/double/write_var(obj/machinery/atmospherics/binary/double_pump/machine, new_value)
	. = ..()

/decl/public_access/public_variable/pressure_bound/external/double
	expected_type = /obj/machinery/atmospherics/binary/double_pump

/decl/public_access/public_variable/pressure_bound/external/double/access_var(obj/machinery/atmospherics/binary/double_pump/machine)
	. = ..()

/decl/public_access/public_variable/pressure_bound/external/double/write_var(obj/machinery/atmospherics/binary/double_pump/machine, new_value)
	. = ..()

/decl/public_access/public_method/purge_pump/double
	call_proc = /obj/machinery/atmospherics/binary/double_pump/proc/purge

/decl/stock_part_preset/radio/event_transmitter/vent_pump/airlock/double
	transmit_on_event = list(
		"area" = /decl/public_access/public_variable/area_uid,
		"device" = /decl/public_access/public_variable/identifier,
		"power" = /decl/public_access/public_variable/use_power,
		"direction" = /decl/public_access/public_variable/pump_dir/double,
		"checks" = /decl/public_access/public_variable/pump_checks/double,
		"internal" = /decl/public_access/public_variable/pressure_bound/double,
		"external" = /decl/public_access/public_variable/pressure_bound/external/double,
		"power_draw" = /decl/public_access/public_variable/power_draw,
		"flow_rate" = /decl/public_access/public_variable/flow_rate
	)

/decl/stock_part_preset/radio/receiver/vent_pump/airlock/double
	receive_and_call = list(
		"power_toggle" = /decl/public_access/public_method/toggle_power,
		"purge" = /decl/public_access/public_method/purge_pump/double,
		"status" = /decl/public_access/public_method/refresh
	)
	receive_and_write = list(
		"set_power" = /decl/public_access/public_variable/use_power,
		"set_direction" = /decl/public_access/public_variable/pump_dir/double,
		"set_checks" = /decl/public_access/public_variable/pump_checks/double,
		"set_internal_pressure" = /decl/public_access/public_variable/pressure_bound/double,
		"set_external_pressure" = /decl/public_access/public_variable/pressure_bound/external/double,
		"init" = /decl/public_access/public_variable/name
	)
