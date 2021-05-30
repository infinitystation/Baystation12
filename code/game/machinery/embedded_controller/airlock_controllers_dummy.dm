// Provides remote access to a controller (since they must be unique).
/obj/machinery/dummy_airlock_controller
	name = "airlock control terminal"
	icon = 'icons/obj/airlock_machines.dmi'
	icon_state = "airlock_control_off"
	layer = ABOVE_OBJ_LAYER

	var/datum/topic_state/remote/remote_state
	var/obj/machinery/embedded_controller/radio/airlock/master_controller
	// [INF]
	var/my_pixel_x
	var/my_pixel_y
	var/my_dir
	var/my_name
	// [/INF]

/obj/machinery/dummy_airlock_controller/Process()
	if(master_controller)
		appearance = master_controller
		// [INF]
		pixel_x = my_pixel_x
		pixel_y = my_pixel_y
		dir = my_dir
		name = my_name
		// [/INF]

/obj/machinery/dummy_airlock_controller/Initialize()
	. = ..()
	// [INF]
	my_pixel_x = pixel_x
	my_pixel_y = pixel_y
	my_dir = dir
	my_name = name
	// [/INF]
	if(id_tag)
		for(var/obj/machinery/embedded_controller/radio/airlock/_master in SSmachines.machinery)
			if(_master.id_tag == id_tag)
				master_controller = _master
				master_controller.dummy_terminals += src
				break
	if(!master_controller)
		qdel(src)
	else
		remote_state = new /datum/topic_state/remote(src, master_controller)

/obj/machinery/dummy_airlock_controller/Destroy()
	if(master_controller)
		master_controller.dummy_terminals -= src
	if(remote_state)
		qdel(remote_state)
		remote_state = null
	return ..()

/obj/machinery/dummy_airlock_controller/interface_interact(var/mob/user)
	open_remote_ui(user)
	return TRUE

/obj/machinery/dummy_airlock_controller/proc/open_remote_ui(var/mob/user)
	if(master_controller)
		if(master_controller.remote_access)
			return master_controller.ui_interact(user, state = remote_state)
		to_chat(user, "ОШИБКА: Невозможно подключиться к контроллеру.")

/obj/machinery/dummy_airlock_controller/powered(var/chan = -1, var/area/check_area = null)
	if(master_controller)
		var/area/A = get_area(master_controller)
		return master_controller.powered(chan, A)
	return ..()

// [INF]
/obj/machinery/embedded_controller/radio/airlock
	var/remote_access = TRUE

/obj/machinery/embedded_controller/radio/airlock/examine(mob/user)
	. = ..()
	if(dummy_terminals.len && !remote_access)
		to_chat(user, "Индикатор удаленного управления мигает красным.")

/obj/machinery/embedded_controller/radio/airlock/attackby(obj/item/I, mob/user)
	if(isMultimeter(I) && dummy_terminals.len)
		if(do_after(user, 100, src))
			if(remote_access)
				to_chat(user, SPAN_NOTICE("Ты отключил удаленное управление контролером с терминалов. Это не касается синтетиков."))
			else
				to_chat(user, SPAN_NOTICE("Удаленное управление востановлено"))
			remote_access = !remote_access
	. = ..()
// [/INF]
