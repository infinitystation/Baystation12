/obj/machinery/door/airlock/autoname/command
	door_color = COLOR_COMMAND_BLUE

/obj/machinery/door/airlock/autoname/engineering
	door_color = COLOR_AMBER

/obj/machinery/door/airlock/autoname/centcom
	airlock_type = "centcomm"
	name = "\improper Airlock"
	icon = 'icons/obj/doors/centcomm/door.dmi'
	fill_file = 'icons/obj/doors/centcomm/fill_steel.dmi'
	paintable = AIRLOCK_PAINTABLE|AIRLOCK_STRIPABLE

/obj/machinery/door/airlock/autoname/civilian
	stripe_color = COLOR_CIVIE_GREEN

/obj/machinery/door/airlock/autoname/medical
	door_color = COLOR_WHITE
	stripe_color = COLOR_DEEP_SKY_BLUE

/obj/machinery/door/airlock/autoname/mining
	door_color = COLOR_PALE_ORANGE
	stripe_color = COLOR_BEASTY_BROWN

/obj/machinery/door/airlock/autoname/maintenance
	name = "Maintenance Access"
	stripe_color = COLOR_AMBER

/obj/machinery/door/airlock/security/striped
	stripe_color = COLOR_ORANGE

/obj/machinery/door/airlock/engineering/striped
	stripe_color = COLOR_RED

/obj/machinery/door/airlock/centcom
	name = "Airlock"
	icon = 'icons/obj/doors/centcomm/door.dmi'


/obj/machinery/door/airlock/glass/command/no_stripe
	stripe_color = null

/obj/machinery/door/airlock/glass/security/no_stripe
	stripe_color = null

/obj/machinery/door/airlock/glass/engineering/no_stripe
	stripe_color = null

/obj/machinery/door/airlock/glass/medical/no_stripe
	stripe_color = null

/obj/machinery/door/airlock/vault
	name = "Vault"
	icon = 'icons/obj/doors/vault/door.dmi'
	explosion_resistance = 20
	opacity = 1
	secured_wires = 1
	assembly_type = /obj/structure/door_assembly/door_assembly_highsecurity //Until somebody makes better sprites.

/obj/machinery/door/airlock/proc/get_new_ntnet_id()
	t_ntnet_id = pick(alphabet) + num2text(rand(100,999))
	//var/obj/machinery/door/airlock/TEST
	//if(TEST in world)
	for(var/obj/machinery/door/airlock/A in SSmachines.machinery)
		if(t_ntnet_id == A.t_ntnet_id)
			get_new_ntnet_id()

/client/proc/debug_airlocks_id()
	set name = "Debug Airlocks ID"
	set category = "Debug"

	var/IDS = ""
	//var/list/bugged_airlocks = list()
	var/data = ""
	for(var/obj/machinery/door/airlock/TEST in SSmachines.machinery)
/*
		for(var/obj/machinery/door/airlock/I in SSmachines.machinery)
			if(TEST.t_ntnet_id == I.t_ntnet_id && I != TEST)
				bugged_airlocks += "[I.name] | ID: [I.t_ntnet_id] | Location: [I.loc]"
				continue
*/
		IDS += "[TEST.name] | ID: [TEST.t_ntnet_id] | Location: [TEST.loc]<br>"

	//data = "<center><h1>Airlocks with same ID's:</h1></center><br>"
/*
	for(var/obj/machinery/door/airlock/i in bugged_airlocks)
		for(var/obj/machinery/door/airlock/b in bugged_airlocks)
			if(b == i)
				continue
			if(b.t_ntnet_id == i.t_ntnet_id)
				data += "[b.name] ID: [b.t_ntnet_id] [b.loc] | [i.name]  ID: [i.t_ntnet_id] [i.loc] : <font color = '#fffa29'>Have same IDs (Maybe players set them up the same).</font><br>"
*/
	data += "<center><h1>All airlocks:</h1></center><br>"
	data += IDS
	//show_browser(src, data, "airlocks_ntnet_id_debug")
	var/datum/browser/popup = new(src, "autolathenew", "Airlock ID Debug", 450, 600)
	popup.set_content(data)
	popup.open()
	return 1