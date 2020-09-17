#define SET_MACHINE_ID 	var/inp = input("Set machine id.", "Id", id_tag);id_tag = inp;

#define GRAV_MODE_REVERSE "reverse"
#define GRAV_MODE_STABLE "stable"
GLOBAL_LIST_EMPTY(grav_genus)
/obj/machinery/gravity_generator
	icon = 'infinity/icons/obj/machines/gravity_gen.dmi'
	icon_state = "gravigen_off"
	var/mode = GRAV_MODE_STABLE

/obj/machinery/gravity_generator/Initialize()
	. = ..()
	GLOB.grav_genus.Add(src)
	update_icon()
	update_effectiverange()

/obj/machinery/gravity_generator/on_update_icon()
	. = ..()
	var/list/splited = splittext(icon_state, "_")
	if(length(splited) == 2)
		if(on == 1)
			icon_state = splited[1] + "_on"

		else if(on == -1)
			icon_state = splited[1] + "_reverse"
		else
			icon_state = splited[1] + "_off"
	else
		icon_state = initial(icon_state)
		update_icon()

/obj/machinery/gravity_generator/attackby(obj/item/I, mob/user)
	. = ..()
	if(isMultitool(I))
		SET_MACHINE_ID

/obj/machinery/gravity_generator/proc/toogle_on()
	if(length(localareas))
		on = 1
		for(var/area/A in localareas)
			create_gravity_in_area(A)
	update_effectiverange()
	update_icon()

/obj/machinery/gravity_generator/proc/create_gravity_in_area(area/A)
	for(var/obj/machinery/gravity_generator/G in GLOB.grav_genus)
		if((A in G.localareas) && (G.mode == GRAV_MODE_REVERSE))
			A.gravitychange(1)

/obj/machinery/gravity_generator/proc/toogle_off()
	on = 0
	for(var/area/A in localareas)
		var/need2continue
		for(var/obj/machinery/gravity_generator/G in GLOB.grav_genus)
			if((A in G.localareas) && (G.on))
				need2continue = TRUE
				continue
		if(need2continue)
			continue

		A.gravitychange(0)
	update_effectiverange()
	update_icon()

/obj/machinery/gravity_generator/proc/reverse_gravity()
	if(mode != GRAV_MODE_REVERSE)
		mode = GRAV_MODE_REVERSE
		for(var/area/A in localareas)
			A.gravitychange(0)

		update_effectiverange()
		update_icon()
	else
		mode = GRAV_MODE_STABLE
		toogle_on

/obj/machinery/gravity_generator/proc/set_effectiverange(value)
	effectiverange = clamp(value, 0, 100)
	update_effectiverange()

/obj/machinery/gravity_generator/proc/update_effectiverange()
	change_power_consumption(effectiverange * 40, POWER_USE_ACTIVE)
	change_power_consumption(effectiverange * 8, POWER_USE_ACTIVE)


/obj/machinery/computer/gravity_control_computer/emag_act()
	if(!emagged)
		. = 1
		emagged = TRUE
	else
		. = ..()

/obj/machinery/computer/gravity_control_computer/updatemodules()
	if(id_tag)
		for(var/obj/machinery/gravity_generator/i in GLOB.grav_genus)
			if(!QDELETED(i) && i.id_tag == id_tag && i.id_tag)
				gravity_generator = i
				continue
			gravity_generator = null

/obj/machinery/computer/gravity_control_computer/interface_interact(mob/user)
	ui_interact(user)
	return TRUE

/obj/machinery/computer/gravity_control_computer/ui_data()
	. = list()
	.["emagged"] = emagged
	updatemodules()
	if(gravity_generator)
		.["power_usage"] = gravity_generator.active_power_usage
		.["range"] = gravity_generator.effectiverange
		.["gravity_generator_loc"] = "[gravity_generator.x], [gravity_generator.y], [gravity_generator.z]"
		.["grav_on"] = gravity_generator.on ? TRUE : null

/obj/machinery/computer/gravity_control_computer/ui_interact(mob/user, ui_key = "main", datum/nanoui/ui = null, force_open = 1, var/master_ui = null, var/datum/topic_state/state = GLOB.default_state)
	var/list/data = list()
	data = ui_data()
	ui = SSnano.try_update_ui(user, src, ui_key, ui, data, force_open)
	if(!ui)
		ui = new(user, src, ui_key, "_inf.gravigen.tmpl", "Gravitational Generator Control", 600, 800)
		ui.set_initial_data(data)
		ui.open()

/obj/machinery/computer/gravity_control_computer/OnTopic(user, href_list)
	. = ..()
	if(href_list["set_grav_id"])
		SET_MACHINE_ID
	if(gravity_generator)
		if(href_list["set_range"])
			var/inp = input("Effective range of gravitational generator.") as num
			if(isnum(inp))
				gravity_generator.set_effectiverange()

		if(href_list["shutdown_gen"])
			gravity_generator.shutdown()

		if(href_list["enable_gen"])
			gravity_generator.enable()

		if(href_list["reverse_gravity"] && emagged)
			gravity_generator.reverse_gravity()
