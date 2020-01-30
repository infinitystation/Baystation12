/obj/machinery/bssilk_hub
	name = "bluespace snare hub"
	icon = 'infinity/icons/obj/stationobjs.dmi'
	icon_state = "silk_hub"
	w_class = ITEM_SIZE_NO_CONTAINER
	density = 0
	core_skill = SKILL_DEVICES //The skill used for skill checks for this machine (mostly so subtypes can use different skills).

	var/silk_id = ""

	var/console_id = ""
	var/obj/machinery/computer/bssilk_control/connected_console = null

	//animations
	var/animation_icon = 'infinity/icons/effects/bs_silk.dmi'
	var/back_animation = "silc_teleport_back"
	var/onhub_animation = "silc_get_hub"

	construct_state = /decl/machine_construction/default/panel_closed
	uncreated_component_parts = null

/obj/machinery/bssilk_hub/attackby(obj/item/I, mob/user)
	. = ..()
	if(!(stat & (NOPOWER|BROKEN)))
		sync_with_parts()
		if(isMultitool(I))
			switch(alert("What you want to configure console ID or snare ID?", "BS Snare Hub ID system", "Snare", "Console"))
				if("Snare")
					var/input_id = input("Enter new BS Snare ID", "Snare ID", silk_id)
					silk_id = input_id
					return silk_id

				if("Console")
					var/input_c_id = input("Enter new BS Snare ID", "Snare ID", console_id)
					console_id = input_c_id
					return console_id
	sync_with_parts()

/obj/machinery/bssilk_hub/proc/sync_with_parts()
	. = list()
	connected_console = null
	for(var/obj/machinery/computer/bssilk_control/CON in SSmachines.machinery)
		if(!CON.connected_hub && CON.hub_id && CON.hub_id == console_id)
			connected_console = CON
			CON.connected_hub = src
	. += connected_console

/obj/machinery/bssilk_hub/proc/get_linked_mob()
	sync_with_parts()
	if(!(stat & (NOPOWER|BROKEN)))
		var/list/mobs = list()
		for(var/mob/living/carbon/human/M in world)
			var/obj/item/clothing/U = M.w_uniform
			if(U && length(U.accessories))
				for(var/obj/item/clothing/accessory/bs_silk/silk in U.accessories)
					if(M && silk.silk_id && silk.silk_id == silk_id)
						spawn(0)
							teleport_back(M)
						mobs += M
		if(length(mobs) == 0)
			playsound(src.loc, 'sound/machines/buzz-sigh.ogg')
			audible_message(SPAN_WARNING("The [src.name] buzzes and state \'SNARE EITHER DISABLED OR NOT AVAILABLE, TRY TO PROBE IT AGAIN, IF YOU ARE SURE THAT THE SNARE IN A GOOD CONDITION OR CONNECTED TO USER.\'"),
							SPAN_WARNING("The [src.name] buzzes and state something."),
							hearing_distance = 5
							)
		return mobs

/obj/machinery/bssilk_hub/Destroy()
	. = ..()
	if(connected_console) connected_console.connected_hub = null
	connected_console = null

/obj/machinery/bssilk_hub/proc/teleport_back(mob/target)
	to_chat(target, SPAN_WARNING("You feel like something pull you in bluespace."))
	//Creat animation and move  mob into it and mob will not walking. Camera will follow animation.
	var/obj/effect/temporary/A = new(get_turf(target), 24.5, animation_icon, back_animation)
	target.dir = 2
	target.forceMove(A)
	sleep(23)
	target.forceMove(src)
	target.dir = 2
	new /obj/effect/temporary(get_turf(src), 26.5, animation_icon, onhub_animation)
	sleep(24)
	target.forceMove(loc)

/obj/machinery/computer/bssilk_control
	name = "bluespace snare control"
	icon = 'icons/obj/computer.dmi'
	icon_state = "computer"

	icon_keyboard = "tech_key"
	icon_screen = "ascent_screen"

	var/hub_id = ""
	var/obj/machinery/bssilk_hub/connected_hub = null

/obj/machinery/computer/bssilk_control/Destroy()
	. = ..()
	if(connected_hub) connected_hub.connected_console = null
	connected_hub = null

/obj/machinery/computer/bssilk_control/physical_attack_hand(mob/user)
	ui_interact(user)

/obj/machinery/computer/bssilk_control/ui_interact(mob/user, ui_key = "main", var/datum/nanoui/ui = null, var/force_open = 1)
	if(connected_hub) connected_hub.sync_with_parts()
	var/list/data = list()

	if(!connected_hub)
		data["fail_connect"] = TRUE
	else
		data["hub_id"] = hub_id
		data["snare_id"] = length(connected_hub.silk_id) ? (connected_hub.silk_id) : null

	ui = SSnano.try_update_ui(user, src, ui_key, ui, data, force_open)
	if (!ui)
		ui = new(user, src, ui_key, "_inf.bs_snare_controller.tmpl", "BS Snare Control", 440, 600)
		ui.set_initial_data(data)
		ui.open()

/obj/machinery/computer/bssilk_control/proc/find_hub()
	. = list()
	connected_hub = null
	for(var/obj/machinery/bssilk_hub/HUB in SSmachines.machinery)
		if(!HUB.connected_console && HUB.console_id && HUB.console_id == hub_id)
			connected_hub = HUB
			HUB.connected_console = src
	. += connected_hub

/obj/machinery/computer/bssilk_control/OnTopic(mob/user, list/href_list, state)
	. = ..()

	if(href_list["resync"])
		connected_hub?.sync_with_parts()

	if(href_list["get_snaring"])
		connected_hub?.get_linked_mob()

	if(href_list["set_id"])
		var/new_id = input("Enter HUB id.", "HUB ID", hub_id)
		Adjacent(user) ? (hub_id = new_id) : null
		if(connected_hub) connected_hub.sync_with_parts()

	if(href_list["set_id"])
		var/new_id = input("Enter HUB id.", "HUB ID", hub_id)
		hub_id = new_id
		if(connected_hub) connected_hub.sync_with_parts()
		find_hub()
	return TOPIC_REFRESH