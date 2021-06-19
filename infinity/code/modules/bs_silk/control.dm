GLOBAL_LIST_EMPTY(hubs_id)
/obj/machinery/bs_snare_hub
	name = "bluespace snare hub"
	icon = 'infinity/icons/obj/stationobjs.dmi'
	icon_state = "silk_hub"
	density = FALSE

	var/snare_id = ""
	id_tag = ""
	//animations
	var/animation_icon = 'infinity/icons/effects/bs_silk.dmi'
	var/back_animation = "silc_teleport_back"
	var/onhub_animation = "silc_get_hub"

	construct_state = /decl/machine_construction/default/panel_closed
	uncreated_component_parts = null

/obj/machinery/bs_snare_hub/proc/set_id_tag(nId)
	if(nId in GLOB.hubs_id)
		audible_message(SPAN_WARNING("ERROR, unable to set on this bluespace highway another hub use \"[nId]\" highway."))
		return
	else
		GLOB.hubs_id.Remove(id_tag)
		id_tag = nId
		GLOB.hubs_id.Add(nId)

/obj/machinery/bs_snare_hub/attackby(obj/item/I, mob/user)
	. = ..()
	if(!(stat & (NOPOWER|BROKEN)) && isMultitool(I))
		set_id_tag(input("Enter HUB id", "HUB ID", id_tag))

/obj/machinery/bs_snare_hub/proc/get_snaring()
	. = list()
	for(var/mob/living/carbon/human/M in SSmobs.mob_list)
		var/obj/item/clothing/U = M?.w_uniform
		if(length(U?.accessories))
			for(var/obj/item/clothing/accessory/bs_silk/snare in U.accessories)
				if(snare?.id_tag == snare_id)
					. += M

/obj/machinery/bs_snare_hub/proc/teleport_mobs()
	if(!(stat & (NOPOWER|BROKEN)))
		var/list/mobs = get_snaring()
		for(var/mob/living/carbon/human/M in mobs)
			spawn(0)
				animated_teleportation(M, get_turf(src))
		return mobs

/obj/machinery/computer/bs_snare_control
	name = "bluespace snare control"
	icon = 'icons/obj/computer.dmi'
	icon_state = "computer"

	icon_keyboard = "tech_key"
	icon_screen = "ascent_screen"

	var/list/hubs = list()

/obj/machinery/computer/bs_snare_control/physical_attack_hand(mob/user)
	ui_interact(user)

/obj/machinery/computer/bs_snare_control/proc/ui_data4hubs()
	var/list/L = hubs
	var/list/dot[L?.len]
	if(L?.len) for(var/i = 1; i <= L?.len; i++)
		dot[i] = list("myId" = L[i], "sId" = "")
		var/obj/machinery/bs_snare_hub/h = find_hub_by_ID(L[i])
		if(istype(h)) dot[i]["sId"] = h.snare_id
	return dot

/obj/machinery/computer/bs_snare_control/proc/find_hub_by_ID(id)
	for(var/obj/machinery/bs_snare_hub/h in SSmachines.machinery) if(id == h.id_tag)
		return h

/obj/machinery/computer/bs_snare_control/ui_interact(mob/user, ui_key = "main", var/datum/nanoui/ui = null, var/force_open = 1)
	var/list/data = list()
	data["hubs"] = ui_data4hubs()
	ui = SSnano.try_update_ui(user, src, ui_key, ui, data, force_open)
	if(!ui)
		ui = new(user, src, ui_key, "_inf.bs_snare_controller.tmpl", "BS Snare Control", 440, 600)
		ui.set_initial_data(data)
		ui.open()
/*
/obj/machinery/computer/bs_snare_control/proc/find_hubs_ID()
	. = list()
	for(var/obj/machinery/bs_snare_hub/HUB in SSmachines.machinery) if(HUB.id_tag in hubs)
		. += HUB.id_tag
*/
/obj/machinery/computer/bs_snare_control/proc/find_hubs()
	. = list()
	for(var/id in hubs)
		. += find_hub_by_ID(id)
/obj/machinery/computer/bs_snare_control/OnTopic(mob/user, list/href_list, state)
	. = ..()
	if(href_list["catch_snaring"])
		var/obj/machinery/bs_snare_hub/hub = find_hub_by_ID(href_list["catch_snaring"])
		if(!hub || !length(hub.teleport_mobs()))
			playsound(loc, 'sound/machines/buzz-sigh.ogg', 50, 1, -1)
			audible_message(SPAN_WARNING("The [src.name] buzzes and state \"SNARE EITHER DISABLED OR NOT AVAILABLE, TRY TO PROBE IT AGAIN, IF YOU ARE SURE THAT THE SNARE IN A GOOD CONDITION OR CONNECTED TO USER.\""),
							SPAN_WARNING("The [src.name] buzzes and state something."),
							hearing_distance = 5
						)

	if(href_list["add_id"])
		var/new_id = input(user, "Enter HUB id.", "HUB ID")
		if(length(new_id)) Adjacent(user) ? (hubs += new_id) : to_chat(user, "You are too far from [src].")

	if(href_list["remove_id"])
		hubs.Remove(href_list["remove_id"])

	if(href_list["set_id"])
		var/obj/machinery/bs_snare_hub/h = find_hub_by_ID(href_list["set_id"])
		if(h)
			var/i = input(user, "Enter new BS Snare ID", "Snare ID", h.snare_id)
			Adjacent(user) ? (h.snare_id = i) : to_chat(user, "You are too far from [src].")
	return TOPIC_REFRESH
