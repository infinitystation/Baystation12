//Weapon control and monitoring console
/obj/machinery/computer/weapons
	name = "fire control console"
	icon_keyboard = "syndie_key"
	icon_screen = "tactical"
	icon_state = "thick"
	req_access = list(access_heads)
	var/obj/effect/overmap/ship/linked
	var/datum/console_program/fire_control/control_system = /datum/console_program/fire_control

/obj/machinery/computer/weapons/Initialize()
	. = ..()
	linked = map_sectors["[z]"]
	if(ispath(control_system))
		control_system = new control_system(src)

/obj/machinery/computer/weapons/attack_hand(user as mob)
	if(..(user))
		return
	if(!allowed(user))
		to_chat(user, "<span class='warning'>Access denied.</span>")
		return 1
	interact(user)

/obj/machinery/computer/weapons/interact(user)
	if(!istype(user, /mob/living/silicon))
		add_fingerprint(user)
		playsound(loc, "keyboard", 50)
	control_system.Run(user)

/obj/machinery/computer/weapons/Topic(href, href_list)
	if(..())
		return 1
	if(href_list["fire"])
		var/obj/machinery/power/ship_weapon/W = locate(href_list["fire"]) in linked.weapons
		W.fire()
		. = 1
	interact(usr)
/*
//Weapon control and monitoring console
/obj/machinery/computer/weapons
	name = "weaponry systems console"
	icon_keyboard = "syndie_key"
	icon_screen = "tactical"
	icon_state = "thick"
	var/obj/effect/overmap/ship/linked

/obj/machinery/computer/weapons/Initialize()
	. = ..()
	linked = map_sectors["[z]"]

/obj/machinery/computer/weapons/attack_hand(var/mob/user as mob)
	if(..())
		user.unset_machine()
		return

	if(!isAI(user))
		user.set_machine(src)

	ui_interact(user)

/obj/machinery/computer/weapons/ui_interact(mob/user, ui_key = "main", var/datum/nanoui/ui = null, var/force_open = 1)
	if(!linked)
		to_chat(user, "<span class='warning'>Unable to connect to ship weapon control systems.</span>")
		return

	var/data[0]
	data["weapons_status"] = list(linked.weapons)

	for(var/obj/machinery/power/ship_weapon/E in linked.weapons)
		data["weap_type"] = E.name
		data["weap_location"] = E.get_status() ? data.["location"] : "Unknown"
		data["weap_status"] =  E.get_status() ? data.["status"] : "ERROR"

	ui = GLOB.nanomanager.try_update_ui(user, src, ui_key, ui, data, force_open)
	if (!ui)
		ui = new(user, src, ui_key, "ship_weapon_control.tmpl", "[linked.name] Firing Control", 380, 530)
		ui.set_initial_data(data)
		ui.open()
		ui.set_auto_update(1)

/obj/machinery/computer/weapons/Topic(href, href_list)
	if(..())
		return 1
	if(href_list["fire"])
		for(var/obj/machinery/power/ship_weapon/E in linked.weapons)
			E.fire()

	updateUsrDialog()
*/