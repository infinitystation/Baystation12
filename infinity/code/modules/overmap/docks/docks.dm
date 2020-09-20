// Ported from Halo Station 13 Project
/* todo:
make it machinery
add wires
*/

#define TDP_CROSS_DELAY 3 SECONDS
#define TDP_PANEL_INTERRACT_DELAY 8 SECONDS
#define TDP_DOCKING_DELAY 20 SECONDS
#define TDP_UNBREAKABLE -1
#define TDP_BREAK_TYPE_EXPLOSION 1
#define TDP_BREAK_TYPE_MOVEMENT 0

/obj/docking_port
	name = "telescopic docking port"
	desc = "A structure, also known as telescopic bridge (telebridge) with integrated life support module. Allows create \"safe\" way to other space objects with same speed. It has pretty small moving area inside, so you cannot transfer objects like exosuits through it. (Доступно описание на русском в кодексе)"
	icon = 'infinity/icons/obj/overmap/docking_port.dmi'
	icon_state = "dock_contracted"

	plane = DEFAULT_PLANE
	layer = BELOW_TABLE_LAYER
	pixel_x = -32

	opacity = FALSE
	density = FALSE
	anchored = TRUE

	var/obj/effect/overmap/our_ship
	var/obj/docking_port/current_connected
	var/obj/item/device/radio/radio = new /obj/item/device/radio()

	var/side  = null //NORTH SOUTH EAST WEST are valid values for this. Setting this causes side-restrictions to apply
	var/broke = FALSE //Use TDP_UNBREAKABLE to stop breaking.

	var/repair_step = 0

	var/movement_cooldown = 0
	var/docking_cooldown  = 0

	var/locked        = FALSE //if TRUE, other ports can't connect to it
	var/announce       = TRUE //if TRUE, all connection and disconnection procedures will be announced in radio
	var/busy_to_cross = FALSE //if TRUE, someone is moving through
	var/repair_busy   = FALSE
	var/emagged       = FALSE

	req_access = list() //"ACCESS_BRIDGE" and so

/obj/docking_port/Initialize()
	. = ..()
	if(initial(broke) == TDP_UNBREAKABLE)
		broke = FALSE
	START_PROCESSING(SSobj, src)

/obj/docking_port/LateInitialize()
	. = ..()
	if(!GLOB.using_map.use_overmap)
		return INITIALIZE_HINT_QDEL

/obj/docking_port/Destroy()
	. = ..()
	QDEL_NULL(radio)
	if(is_processing)
		STOP_PROCESSING(SSobj, src)

/obj/docking_port/Process()
	if(isnull(our_ship))
		ship_setup()
		STOP_PROCESSING(SSobj, src)

/obj/docking_port/examine(mob/user)
	. = ..()
	if(broke)
		to_chat(user, SPAN_WARNING("The dock exchanges smoke from a hatch and the bridge looks broken. Seems like it was busted."))
		to_chat(user, SPAN_WARNING("The status display is blank. Repair the dock to reactivate it."))
		return
	if(issilicon(user) || Adjacent(user) || isghost(user))
		to_chat(user, SPAN_NOTICE("You can see next information from the status panel:\
		<br>Lockdown Protocol: [locked ? "ON" : "OFF"]\
		<br>Announce Protocol: [announce ? "ON" : "OFF"]"))
		if(emagged)
			to_chat(user, SPAN_WARNING("Access Restriction Protocol: malfunction, electromagnetic hack detected. Please report to dry dock security."))
		else
			to_chat(user, SPAN_NOTICE("Access Restriction Protocol: [req_access.len ? "ON" : "UNSET"]"))
	else
		to_chat(user, SPAN_NOTICE("You need to get closer if you want to check the status panel."))
		return

/obj/docking_port/ex_act(severity)
	if(current_connected)
		visible_message(SPAN_WARNING("The explosion disconnects [src]!"))
		current_connected.visual_dock_change(1)
		current_connected.current_connected = null
		visual_dock_change(1)
		current_connected = null
	if(!broke)
		switch(severity)
			if(1)
				dock_break(TDP_BREAK_TYPE_EXPLOSION)
			if(2)
				if(prob(50))
					dock_break(TDP_BREAK_TYPE_EXPLOSION)

/obj/docking_port/emag_act(var/remaining_charges, var/mob/user)
	if(!req_access.len)
		to_chat(user, SPAN_DANGER("No access restriction. Aborted."))
		return
	if(emagged)
		to_chat(user, SPAN_DANGER("Already Hacked"))
		return
	else
		emagged = 1
		req_access = list()
		to_chat(user, SPAN_NOTICE("You use the cryptographic sequencer on the [src]. Access restriction was hacked. Have a nice dock."))
		return 1
