/obj/machinery/bssilk_hub
	name = "bluespace snare hub"
	icon = 'infinity/icons/obj/stationobjs.dmi'
	icon_state = "silk_hub"
	w_class = ITEM_SIZE_NO_CONTAINER
	density = 0
	interact_offline = 1 // Can the machine be interacted with while de-powered.
	core_skill = SKILL_DEVICES //The skill used for skill checks for this machine (mostly so subtypes can use different skills).

	var/silk_id = ""
	var/mob/living/linked_mob = null

	var/console_id = ""
	var/connected_console = null

	//animations
	var/animation_icon = 'infinity/icons/effects/bs_silk.dmi'
	var/back_animation = "silc_teleport_back"
	var/onhub_animation = "silc_get_hub"

	construct_state = /decl/machine_construction/default/panel_closed
	uncreated_component_parts = null

/obj/machinery/bssilk_hub/attackby(obj/item/I, mob/user)
	if(isMultitool(I))
		switch(alert("What you want to configure console ID or snare ID?", "BS Snare Hub ID system", "Snare", "Console"))
			if("Snare")
				var/input_id = input("Enter new BS Snare ID", "Snare ID", silk_id)
				silk_id = input_id
				linked_mob = null
				return silk_id
			if("Console")
				var/input_c_id = input("Enter new BS Snare ID", "Snare ID", console_id)
				console_id = input_c_id
				connected_console = null
				return console_id

/obj/machinery/bssilk_hub/proc/sync_with_parts()
	for(var/mob/living/carbon/human/L in GLOB.player_list)
		var/obj/item/clothing/U = L.w_uniform
		if(length(U?.accessories))
			for(var/obj/item/clothing/accessory/bs_silk/silk in U.accessories)
				if(L && silk.silk_id && silk.silk_id == silk_id)
					linked_mob = L
					silk.silk_hub = src
					break
				else linked_mob = null
			if(linked_mob)
				break

	for(var/obj/machinery/computer/bssilk_control/CON in SSmachines.machinery)
		if(!CON.connected_hub && CON.hub_id && CON.hub_id == console_id)
			connected_console = CON
			CON.connected_hub = src
		else
			connected_console = null
	. += linked_mob
	. += connected_console

/obj/machinery/bssilk_hub/Process()
	..()
	sync_with_parts()

/obj/machinery/bssilk_hub/proc/get_linked_mob()
	if(!linked_mob)
		audible_message(SPAN_WARNING("The [src.name] buzzes and state \'SNARE EITHER DISABLED OR NOT AVAILABLE, TRY TO PROBE IT AGAIN, IF YOU ARE SURE THAT THE SNARE IN A GOOD CONDITION OR CONNECTED TO USER.\'"), SPAN_WARNING("The [src.name] buzzes and state something."), hearing_distance = 5)
		return 0
	else
		var/mob/living/M = linked_mob
		var/mob_turf = get_turf(M)
		//M.forceMove(src)
		//Creat animation and move  mob into it and mob will not walking. Camera will follow animation.
		var/obj/effect/temporary/A = new(mob_turf, 24.5, animation_icon, back_animation)
		M.forceMove(A)
		sleep(23)
		M.forceMove(src)
		M.dir = 2

		new /obj/effect/temporary(get_turf(src), 26.5, animation_icon, onhub_animation)
		sleep(24)
		M.dropInto(loc)

		return M

/obj/machinery/computer/bssilk_control
	name = "bluespace snare control"
	icon = 'icons/obj/computer.dmi'
	icon_state = "computer"
	//circuit = /obj/item/weapon/stock_parts/circuitboard/bssilk/console

	icon_keyboard = "rd_key"
	icon_screen = "ai-fixer-404"

	var/hub_id = ""
	var/obj/machinery/bssilk_hub/connected_hub = null

/obj/machinery/computer/bssilk_control/physical_attack_hand(mob/user)
	. = ..()
	ui_interact(user)

/obj/machinery/computer/bssilk_control/ui_interact(mob/user, ui_key = "main", var/datum/nanoui/ui = null, var/force_open = 1)
	var/list/data = list()

	if(!connected_hub)
		data["fail_connect"] = TRUE
	else
		data["hub_id"] = hub_id
		data["snare_id"] = connected_hub.silk_id
		//data["snared_mob"] = connected_hub.linked_mob
		//TODO@INF
		//data["snaring_mob_loc"] = list("x" = connected_hub.linked_mob.x, "y" = connected_hub.linked_mob.y, "z" = connected_hub.linked_mob.z)

	ui = SSnano.try_update_ui(user, src, ui_key, ui, data, force_open)
	if (!ui)
		ui = new(user, src, ui_key, "bs_snare_controller.tmpl", "BS Snare Control", 440, 600)
		ui.set_initial_data(data)
		ui.open()

/obj/machinery/computer/bssilk_control/OnTopic(mob/user, list/href_list, state)
	. = ..()

	if(href_list["resync"])
		connected_hub.sync_with_parts()

	if(href_list["get_snaring"])
		connected_hub.get_linked_mob()

	if(href_list["set_id"])
		var/new_id = input("Enter HUB id.", "HUB ID", hub_id)
		hub_id = new_id

	return TOPIC_REFRESH
/*
	icon = 'infinity\icons\effects\bs_silk.dmi'
*/
/*
/obj/effect/silc/bs
	icon = 'infinity/icons/effects/bs_silk.dmi'

/obj/effect/temporary/silc/bs/teleport_back
	icon_state = "silc_teleport_back"

/obj/effect/silc/bs/teleport_get_hub
	icon_state = "silc_get_hub"
*/