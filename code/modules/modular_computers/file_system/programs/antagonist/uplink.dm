/datum/computer_file/program/uplink
	filename = "taxquickly"
	filedesc = "TaxQuickly 1.45b"
	program_icon_state = "uplink"
	extended_desc = "An online tax filing software. It is a few years out of date."
	size = 0 // it is cloud based
	requires_ntnet = 1
	available_on_ntnet = 1
	usage_flags = PROGRAM_PDA | PROGRAM_TABLET
	nanomodule_path = /datum/nano_module/program/uplink

	var/password
	var/authenticated = 0

/datum/computer_file/program/uplink/New(var/password)
	src.password = password

/datum/nano_module/program/uplink
	name = "TaxQuickly 1.45b"
/*//[INF] //LAXESH REWORK YOUR UPLINK AGAIN .-.
/datum/computer_file/program/uplink/clone()
	var/datum/computer_file/program/uplink/temp = ..()
	temp.password = password
	return temp

/datum/nano_module/program/uplink/ui_interact(var/mob/user)
	if (!isliving(user))
		return
	var/datum/computer_file/program/uplink/prog = program
	var/obj/item/modular_computer/computer = host
	var/obj/item/weapon/stock_parts/computer/hard_drive/portable/uplink = computer.portable_drive
	if(istype(computer) && istype(prog))
		if(computer.hidden_uplink && prog.password)
			if(prog.authenticated)
				if(alert(user, "Resume or close and secure?", name, "Resume", "Close") == "Resume")
					computer.hidden_uplink.trigger(user)
					return
			else
				if(computer.hidden_uplink.check_trigger(user, input(user, "Please enter your unique tax ID:", "Authentication"), prog.password))
					prog.authenticated = 1
					return
		else if(uplink && istype(uplink))		//uplink_sources_inf.dm
			if(uplink.hidden_uplink && prog.password)
				if(prog.authenticated)
					if(alert(user, "Resume or close and secure?", name, "Resume", "Close") == "Resume")
						uplink.hidden_uplink.forceMove(computer)
						uplink.hidden_uplink.trigger(user)
						return
					else
						uplink.hidden_uplink.forceMove(uplink)
				else
					uplink.hidden_uplink.forceMove(computer)
					if(uplink.hidden_uplink.check_trigger(user, input(user, "Please enter your unique tax ID:", "Authentication"), prog.password))
						prog.authenticated = 1
						return
					else
						uplink.hidden_uplink.forceMove(uplink)
		else
			input(user, "Please enter your unique tax ID:", "Authentication")
	to_chat(user, "<span class='warning'>[computer.holder] displays an \"ID not found\" error.</span>")
	prog.authenticated = 0
	computer.kill_program()
*/ //[/INF]

/datum/nano_module/program/uplink/ui_interact(var/mob/user, var/ui_key = "main", datum/nanoui/ui = null, var/force_open = 1, var/master_ui = null, var/datum/topic_state/state = GLOB.default_state)
	var/datum/computer_file/program/uplink/prog = program
	var/obj/item/holder = program.computer.get_physical_host()
	if(istype(holder) && holder.hidden_uplink && prog.password)
		if(prog.authenticated)
			if(!CanInteract(user, state))
				return
			if(alert(user, "Resume or close and secure?", name, "Resume", "Close") == "Resume")
				holder.hidden_uplink.trigger(user)
				return
		else if(holder.hidden_uplink.check_trigger(user, input(user, "Please enter your unique tax ID:", "Authentication"), prog.password))
			prog.authenticated = 1
			return
	else
		program.computer.show_error(user, "ID not found")

	prog.authenticated = 0
	program.computer.kill_program(program)
