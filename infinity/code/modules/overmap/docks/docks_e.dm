/obj/docking_port/enterence
	name = "telescopic docking port"
	desc = "A structure, also known as telescopic bridge (telebridge) with integrated life support module. Allows create \"safe\" way to other space objects with same speed. It has pretty small moving area inside, so you cannot transfer objects like exosuits through it. (ƒоступно описание на русском в кодексе)"
	icon_state = "enter"

	var/obj/effect/overmap/visitable/our_ship
	var/obj/docking_port/enterence/current_connected
	var/obj/docking_port/control/control_panel
	var/obj/item/device/radio/radio = new /obj/item/device/radio()

	var/side  = null //NORTH SOUTH EAST WEST are valid values for this. Setting this causes side-restrictions to apply
	var/list/pipes = list() //bridge pipes

	var/repair_step = 0

	var/movement_cooldown = 0
	var/docking_cooldown  = 0

	var/locked        = FALSE //if TRUE, other ports can't connect to it
	var/announce       = TRUE //if TRUE, all connection and disconnection procedures will be announced in radio

	var/busy_to_cross = FALSE //if TRUE, someone is moving through
	var/busy_bridge   = FALSE //if TRUE, the bridge is being built
	var/repair_busy   = FALSE
	var/emagged       = FALSE
	var/broken        = FALSE //Use TDP_UNBREAKABLE to stop breaking.

/obj/docking_port/enterence/Initialize()
	. = ..()
	if(initial(broken) == -1)
		broken = FALSE
	START_PROCESSING(SSobj, src)

/obj/docking_port/enterence/LateInitialize()
	. = ..()
	if(!GLOB.using_map.use_overmap)
		return INITIALIZE_HINT_QDEL

/obj/docking_port/enterence/Destroy()
	. = ..()
	QDEL_NULL(radio)
	remove_bridge()
	if(is_processing)
		STOP_PROCESSING(SSobj, src)
	if(our_ship)
		our_ship.connectors -= src

/obj/docking_port/enterence/Process()
	if(isnull(our_ship))
		ship_setup()
		STOP_PROCESSING(SSobj, src)

/obj/docking_port/enterence/examine(mob/user)
	. = ..()
	if(broken)
		to_chat(user, SPAN_WARNING("The dock exchanges smoke from a hatch and the bridge looks broken. Seems like it was busted."))
		return

/obj/docking_port/enterence/ex_act(severity)
	if(current_connected)
		visible_message(SPAN_WARNING("The explosion disconnects [src]!"))
		current_connected.remove_bridge(TRUE)
		current_connected.current_connected = null
		remove_bridge(TRUE)
		current_connected = null
	if(!broken)
		switch(severity)
			if(1)
				dock_break(TDP_BREAK_TYPE_EXPLOSION)
			if(2)
				if(prob(50))
					dock_break(TDP_BREAK_TYPE_EXPLOSION)
