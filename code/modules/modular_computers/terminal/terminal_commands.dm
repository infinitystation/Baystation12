// To cut down on unneeded creation/deletion, these are global.
GLOBAL_LIST_INIT(terminal_commands, init_subtypes(/datum/terminal_command))

/datum/terminal_command
	var/name                              // Used for man
	var/man_entry                         // Shown when man name is entered. Can be a list of strings, which will then be shown on separate lines.
	var/pattern                           // Matched using regex
	var/regex_flags                       // Used in the regex
	var/regex/regex                       // The actual regex, produced from above.
	var/core_skill = SKILL_COMPUTER       // The skill which is checked
	var/skill_needed = SKILL_EXPERT       // How much skill the user needs to use this. This is not for critical failure effects at unskilled; those are handled globally.
	var/req_access = list()               // Stores access needed, if any

/datum/terminal_command/New()
	regex = new (pattern, regex_flags)
	..()

/datum/terminal_command/proc/check_access(mob/user)
	return has_access(req_access, user.GetAccess())

// null return: continue. "" return will break and show a blank line. Return list() to break and not show anything.
/datum/terminal_command/proc/parse(text, mob/user, datum/terminal/terminal)
	if(!findtext(text, regex))
		return
	if(!user.skill_check(core_skill, skill_needed))
		return skill_fail_message()
	if(!check_access(user))
		return "[name]: ACCESS DENIED"
	return proper_input_entered(text, user, terminal)

//Should not return null unless you want parser to continue.
/datum/terminal_command/proc/proper_input_entered(text, mob/user, terminal)
	return list()

/datum/terminal_command/proc/skill_fail_message()
	var/message = pick(list(
		"Possible encoding mismatch detected.",
		"Update packages found; download suggested.",
		"No such option found.",
		"Flag mismatch."
	))
	return list("Command not understood.", message)
/*
Subtypes
*/
/datum/terminal_command/exit
	name = "exit"
	man_entry = list("Format: exit", "Exits terminal immediately.")
	pattern = "^exit$"
	skill_needed = SKILL_BASIC

/datum/terminal_command/exit/proper_input_entered(text, mob/user, terminal)
	qdel(terminal)
	return list()

/datum/terminal_command/man
	name = "man"
	man_entry = list("Format: man \[command\]", "Without command specified, shows list of available commands.", "With command, provides instructions on command use.")
	pattern = "^man"
	skill_needed = SKILL_ADEPT

/datum/terminal_command/man/proper_input_entered(text, mob/user, datum/terminal/terminal)
	if(text == "man")
		var/end_msg = "The following commands are available.<br>Some may require additional access.<br>"
		var/plus = ""
		for(var/datum/terminal_command/i in var/t_comms = GLOB.terminal_commands)
			if(copytext(plus, -1) && user.skill_check(i.core_skill, i.skill_needed))
				plus = i.name + "<br>"
				end_msg += plus
				plus = ""
				continue
			if(user.skill_check(i.core_skill, i.skill_needed))
				plus = i.name + " | "
				end_msg += plus
		return end_msg
	if(length(text) < 5)
		return "man: improper syntax. Use man \[command\]"
	text = copytext(text, 5)
	var/datum/terminal_command/command_datum = terminal.command_by_name(text)
	if(!command_datum)
		return "man: command '[text]' not found."
	return command_datum.man_entry

/datum/terminal_command/ifconfig
	name = "ifconfig"
	man_entry = list("Format: ifconfig", "Returns network adaptor information.")
	pattern = "^ifconfig$"

/datum/terminal_command/ifconfig/proper_input_entered(text, mob/user, datum/terminal/terminal)
	if(!terminal.computer.network_card)
		return "No network adaptor found."
	if(!terminal.computer.network_card.check_functionality())
		return "Network adaptor not activated."
	return "Visible tag: [terminal.computer.network_card.get_network_tag()]. Real nid: [terminal.computer.network_card.identification_id]."

/datum/terminal_command/hwinfo
	name = "hwinfo"
	man_entry = list("Format: hwinfo \[name\]", "If no slot specified, lists hardware.", "If slot is specified, runs diagnostic tests.")
	pattern = "^hwinfo"

/datum/terminal_command/hwinfo/proper_input_entered(text, mob/user, datum/terminal/terminal)
	if(text == "hwinfo")
		. = list("Hardware Detected:")
		for(var/obj/item/weapon/stock_parts/computer/ch in  terminal.computer.get_all_components())
			. += ch.name
		return
	if(length(text) < 8)
		return "hwinfo: Improper syntax. Use hwinfo \[name\]."
	text = copytext(text, 8)
	var/obj/item/weapon/stock_parts/computer/ch = terminal.computer.find_hardware_by_name(text)
	if(!ch)
		return "hwinfo: No such hardware found."
	ch.diagnostics(user)
	return "Running diagnostic protocols..."

// Sysadmin
/datum/terminal_command/relays
	name = "relays"
	man_entry = list("Format: relays", "Gives the number of active relays found on the network.")
	pattern = "^relays$"

/datum/terminal_command/relays/proper_input_entered(text, mob/user, terminal)
	return "Number of relays found: [ntnet_global.relays.len]"

/datum/terminal_command/banned
	name = "banned"
	man_entry = list("Format: banned", "Lists currently banned network ids.")
	pattern = "^banned$"
	req_access = list(access_network)

/datum/terminal_command/banned/proper_input_entered(text, mob/user, terminal)
	. = list()
	. += "The following ids are banned:"
	. += jointext(ntnet_global.banned_nids, ", ") || "No ids banned."

/datum/terminal_command/status
	name = "status"
	man_entry = list("Format: status", "Reports network status information.")
	pattern = "^status$"

/datum/terminal_command/status/proper_input_entered(text, mob/user, terminal)
	. = list()
	. += "NTnet status: [ntnet_global.check_function() ? "ENABLED" : "DISABLED"]"
	. += "Alarm status: [ntnet_global.intrusion_detection_enabled ? "ENABLED" : "DISABLED"]"
	if(ntnet_global.intrusion_detection_alarm)
		. += "NETWORK INCURSION DETECTED"

/datum/terminal_command/locate
	name = "locate"
	man_entry = list("Format: locate nid", "Attempts to locate the device with the given nid by triangulating via relays.")
	pattern = "locate"
	req_access = list(access_network)
	skill_needed = SKILL_PROF

/datum/terminal_command/locate/proper_input_entered(text, mob/user, datum/terminal/terminal)
	. = "Failed to find device with given nid. Try ping for diagnostics."
	if(length(text) < 8)
		return
	var/obj/item/modular_computer/origin = terminal.computer
	if(!origin || !origin.get_ntnet_status())
		return
	var/nid = text2num(copytext(text, 8))
	var/obj/item/modular_computer/comp = ntnet_global.get_computer_by_nid(nid)
	if(!comp || !comp.enabled || !comp.get_ntnet_status())
		return
	return "... Estimating location: [get_area(comp)]"

/datum/terminal_command/ping
	name = "ping"
	man_entry = list("Format: ping nid", "Checks connection to the given nid.")
	pattern = "^ping"
	skill_needed = SKILL_BASIC

/datum/terminal_command/ping/proper_input_entered(text, mob/user, datum/terminal/terminal)
	. = list("pinging ...")
	if(length(text) < 6)
		. += "ping: Improper syntax. Use ping nid."
		return
	var/obj/item/modular_computer/origin = terminal.computer
	if(!origin || !origin.get_ntnet_status())
		. += "failed. Check network status."
		return
	var/nid = text2num(copytext(text, 6))
	var/obj/item/modular_computer/comp = ntnet_global.get_computer_by_nid(nid)
	if(!comp || !comp.enabled || !comp.get_ntnet_status())
		. += "failed. Target device not responding."
		return
	. += "ping successful."

/datum/terminal_command/ssh
	name = "ssh"
	man_entry = list("Format: ssh nid", "Opens a remote terminal at the location of nid, if a valid device nid is specified.")
	pattern = "^ssh"
	req_access = list(access_network)

/datum/terminal_command/ssh/proper_input_entered(text, mob/user, datum/terminal/terminal)
	if(istype(terminal, /datum/terminal/remote))
		return "ssh is not supported on remote terminals."
	if(length(text) < 5)
		return "ssh: Improper syntax. Use ssh nid."
	var/obj/item/modular_computer/origin = terminal.computer
	if(!origin || !origin.get_ntnet_status())
		return "ssh: Check network connectivity."
	var/nid = text2num(copytext(text, 5))
	var/obj/item/modular_computer/comp = ntnet_global.get_computer_by_nid(nid)
	if(comp == origin)
		return "ssh: Error; can not open remote terminal to self."
	if(!comp || !comp.enabled || !comp.get_ntnet_status())
		return "ssh: No active device with this nid found."
	if(comp.has_terminal(user))
		return "ssh: A remote terminal to this device is already active."
	var/datum/terminal/remote/new_term = new (user, comp, origin)
	LAZYADD(comp.terminals, new_term)
	LAZYADD(origin.terminals, new_term)
	return "ssh: Connection established."

/datum/terminal_command/proxy
	name = "proxy"
	man_entry = list(
		"Format: proxy \[-s <nid>\]",
		"Without options, displays the proxy state of network device.",
		"With -s option and no further arguments, clears proxy settings.",
		"With -s followed by nid (number), sets proxy to nid.",
		"A set proxy will tunnel all network connections through the designated device.",
		"It is recommended that the user ensure that the target device is accessible."
	)
	pattern = "^proxy"

/datum/terminal_command/proxy/proper_input_entered(text, mob/user, datum/terminal/terminal)
	var/obj/item/modular_computer/comp = terminal.computer
	if(!comp || !comp.network_card || !comp.network_card.check_functionality())
		return "proxy: Error; check networking hardware."
	if(text == "proxy")
		if(!comp.network_card.proxy_id)
			return "proxy: This device is not using a proxy."
		return "proxy: This device is set to connect via proxy with nid [comp.network_card.proxy_id]."
	if(text == "proxy -s")
		if(!comp.network_card.proxy_id)
			return "proxy: Error; this device is not using a proxy."
		comp.network_card.proxy_id = null
		return "proxy: Device proxy cleared."
	if(!comp.network_card || !comp.network_card.check_functionality() || !comp.get_ntnet_status())
		return "proxy: Error; check networking hardware."
	var/syntax_error = "proxy: Invalid input. Enter man proxy for syntax help."
	if(length(text) < 10)
		return syntax_error
	if(copytext(text, 1, 10) != "proxy -s ")
		return syntax_error
	var/id = text2num(copytext(text, 10))
	if(!id)
		return syntax_error
	var/obj/item/modular_computer/target = ntnet_global.get_computer_by_nid(id)
	if(target == comp) return "<font color = '#ff0000'>proxy: Cannot setup a device to be its own proxy.</font>"
	if(!target || !target.enabled || !target.get_ntnet_status())
		return "proxy: Error; cannot locate target device."
	if(target.hard_drive)
		var/datum/computer_file/data/logfile/file = target.hard_drive.find_file_by_name("proxy")
		if(!istype(file))
			file = new()
			file.filename = "proxy"
			target.hard_drive.store_file(file) // May fail, which is fine with us.
		file.stored_data += "([time_stamp()]) Proxy routing request accepted from: [comp.network_card.get_network_tag()].\[br\]"
	comp.network_card.proxy_id = id
	return "proxy: Device proxy set to [id]."

//[INFINITY]____________________________________________________________________________________________________________________

/datum/terminal_command/listdir
	name = "listdir"
	man_entry = list("Format: listdir", "State list of files in local memory.")
	pattern = "^listdir$"
	skill_needed = SKILL_ADEPT

/datum/terminal_command/listdir/proper_input_entered(text, mob/user, datum/terminal/terminal)
	if(length(text) < 6)
		return "listdir: Improper syntax. Use listdir."
	if(!terminal.computer.hard_drive.check_functionality())
		return "listdir: Access attempt to local storage failed. Check integrity of your hard drive"
	//var/list/massive_of_program_names = list()
	for(var/datum/computer_file/F in terminal.computer.hard_drive.stored_files)
		if(F.is_illegal == 0)
			var/prog_size = num2text(F.size)
			. += F.filename + "." + F.filetype + "	|	" + prog_size + " GQ<br>"
			//massive_of_program_names.Add(prg_data)
		else
			//var/prg_data = "\[ENCRYPTED\]" + "." + "\[ENCRYPTED\]" + "	|	" + "\[ENCRYPTED\]" + " GQ"
			. += "\[ENCRYPTED\]" + "." + "\[ENCRYPTED\]" + "	|	" + "\[ENCRYPTED\]" + " GQ<br>"
			//massive_of_program_names.Add(prg_data)
	return

/datum/terminal_command/shutdown
	name = "shutdown"
	man_entry = list("Format: shutdown.", "Shutdown device.")
	pattern = "^shutdown$"
	skill_needed = SKILL_ADEPT

/datum/terminal_command/shutdown/proper_input_entered(text, mob/user, datum/terminal/terminal)
	var/obj/item/modular_computer/CT = terminal.computer
	if(length(text) < 8)
		return "shutdown: Improper syntax. shutdown."
	CT.shutdown_computer()
	CT.bsod = 0
	CT.update_icon()
	return "Shutdown successful."

/datum/terminal_command/session
	name = "session"
	man_entry = list("Format: session; session -kill",
					"Utilite for manipulations with active programs",
					"As session return list of active PRG programs.",
					"Option -kill kill all active PRG programs",
					"Option -restore open interface of devise.",
					"-restore manual: if you use -restore to open programs in remote console, duplicate input of command with -restore option after open of program interface.")
	pattern = "^session"
	skill_needed = SKILL_ADEPT

/datum/terminal_command/session/proper_input_entered(text, mob/user, datum/terminal/terminal)
	var/datum/computer_file/program/PRG = /datum/computer_file/program
	var/obj/item/modular_computer/CT = terminal.computer
	if(length(text) > 18 || length(text) < 6)
		return "session: Invalid input. Enter man session for syntax help."
	if(!CT.processor_unit.check_functionality())
		return "session: Access attempt to RAM failed. Check integrity of your CPU."
	var/ermsg = " programs is absent"
	if(copytext(text, 8) == " -restore")
		//var/TS = new /datum/topic_state/remote(src, CT)
		CT.is_remote_ui = 1
		CT.ui_interact(user)//, topic_state = TS)
		return "session: interface restored."

	if(copytext(text,8) == " -kill")
		if(CT.idle_threads)
			for(PRG in CT.idle_threads)
				PRG.kill_program(1)
			CT.active_program.kill_program(1)
			CT.update_icon()
			return "session: Active background and current programs killed."

		else
			ermsg = "background" + ermsg
		if(CT.active_program)
			CT.active_program.kill_program(1)
		else
			if(copytext(ermsg, 1, 10) == "background")
				ermsg = "Curent and " + ermsg
			else
				ermsg = "Curent" + ermsg
			ermsg = "session: " + ermsg
			return ermsg
	//var/list/massive_of_active_progs = list()
	for(PRG in CT.idle_threads)
		if(PRG.is_illegal)
			var/act_prog = "\[ENCRYPTED\]"
			//massive_of_active_progs.Add(act_prog)
			. += act_prog + "<br>"
		else
			var/act_prog = PRG.filename
			//massive_of_active_progs.Add(act_prog)
			. += act_prog
	if(CT.active_program)
		//massive_of_active_progs.Add(CT.active_program.filename)
		. += CT.active_program.filename
	if(.)
		return
	return "session: Wrong input. Enter man session for syntax help."

/datum/terminal_command/telnet
	name = "telnet"
	man_entry = list("Format: telnet \[NID\] \[LOGIN\] \[PASSWORD\].",
					"Access remote terminal with login and password",
					"If NID \< 100 write NID like 001.",
					"Use `telnet` to README and config security of your devise.")
	pattern = "^telnet"

/datum/terminal_command/telnet/proper_input_entered(text, mob/user, datum/terminal/terminal)
	var/obj/item/modular_computer/CT = terminal.computer

	if(!copytext(text,7))
		if(CT.hard_drive)
			if(!CT.hard_drive.find_file_by_name("TNet_CONFIG") && !CT.hard_drive.find_file_by_name("TNet_CONFIG_README"))
				var/datum/computer_file/data/config/file = CT.hard_drive.find_file_by_name("TNet_CONFIG")
				if(!istype(file))
					file = new()
					file.filename = "TNet_CONFIG"
					CT.hard_drive.store_file(file) // May fail, which is fine with us.
					file.stored_data += "ROOT : [round(rand(1000, 9999))]" //LOGIN : PASSWORD
				var/datum/computer_file/data/text/file_README = CT.hard_drive.find_file_by_name("TNet_CONFIG_README")
				if(!istype(file_README))
					file_README = new()
					file_README.filename = "TNet_CONFIG_README"
					CT.hard_drive.store_file(file_README) // May fail, which is fine with us.
					file_README.stored_data += "\[large\]\[b\]DO NOT DELETE FILE TNet_CONFIG IF YOU DO NOT WANT TO PUT YOUR DEVICE AT RISK \[/b\]\[/large\]\[br\]" //LOGIN : PASSWORD
					file_README.stored_data += "Format login and password in TNet_CONFIG: \[LOGIN\] : \[PASSWORD\].\[br\]"
					file_README.stored_data += "Login must contain only 4 characters, password may be anything."
				return "Config file created. Check config README to study how to change the login and password."
			else
				return "Config and config README already created."

	if(istype(terminal, /datum/terminal/remote))
		return "telnet is not supported on remote terminals."
	if(!CT || !CT.get_ntnet_status())
		return "telnet: Check network connectivity."

	var/nid = text2num(copytext(text, 8, 11))
	if(copytext(nid, 1,3) == "00")
		nid = copytext(nid, 3,4)
	else if(copytext(nid, 1,2) == "0")
		nid = copytext(nid, 2,3)
	var/obj/item/modular_computer/comp = ntnet_global.get_computer_by_nid(nid)

	if(comp == CT)
		return "telnet: Error; can not open remote terminal to self."
	if(!comp || !comp.enabled || !comp.get_ntnet_status())
		return "telnet: No active device with this nid found."
	if(comp.has_terminal(user))
		return "telnet: A remote terminal to this device is already active."

	var/datum/computer_file/data/config/cfg_file = comp.hard_drive.find_file_by_name("TNet_CONFIG")
	if(comp.hard_drive.find_file_by_name("TNet_CONFIG"))
		var/login = copytext(cfg_file.stored_data, 1, 5)
		var/password = copytext(cfg_file.stored_data, 8)
		if(copytext(text, 12,16) == login)
			if(copytext(text, 17) == password)
				var/datum/terminal/remote/new_term = new (user, comp, CT)
				LAZYADD(comp.terminals, new_term)
				LAZYADD(CT.terminals, new_term)
				ntnet_global.add_log("[CT.network_card.get_network_tag()] open telnet tunnel to [comp.network_card.get_network_tag()]")
				return "<font color='#00ff00'>telnet: Connection established with login: [login], and password: [password].</font>"
			else
				return "<font color='#ff0000'>telnet: INCORRECT PASSWORD.</font>"
		else
			return "<font color='#ff0000'>telnet: INCORRECT LOGIN.</font>"
	var/datum/terminal/remote/new_term = new (user, comp, CT)
	LAZYADD(comp.terminals, new_term)
	LAZYADD(CT.terminals, new_term)
	ntnet_global.add_log("[CT.network_card.get_network_tag()] open telnet tunnel to [comp.network_card.get_network_tag()]")
	return "telnet: Connection established."

/datum/terminal_command/remove
	name = "remove"
	man_entry = list("Format: remove \[FILENAME\].", "Delete file from local storage.")
	pattern = "^remove"
	skill_needed = SKILL_ADEPT

/datum/terminal_command/remove/proper_input_entered(text, mob/user, datum/terminal/terminal)
	var/obj/item/modular_computer/CT = terminal.computer
	var/file_name = copytext(text, 8)
	var/file_obj = CT.hard_drive.find_file_by_name(file_name)
	if(file_obj in CT.hard_drive.stored_files)
		CT.hard_drive.remove_file(file_obj)
		return "<font color='#00ff00'>remove: [file_name] removed.</font>"
	else if(!copytext(text, 7))
		return "<font color='#ffa000'>remove: input filename.</font>"
	else
		return"<font color = '#ff0000'>remove: file not found.</font>"
	return "remove: something wrong"

/datum/terminal_command/echo
	name = "echo"
	man_entry = list("Format: echo \[FILENAME\].",
					"Read stored data of file and return it in terminal.",
					"Use 'echo -a \[Your data\]' to write in file. Before it you must set editing file, use 'echo -s \[filename\]'"
					)
	pattern = "^echo"
	skill_needed = SKILL_ADEPT

/datum/terminal_command/echo/proper_input_entered(text, mob/user, datum/terminal/terminal)
	var/obj/item/modular_computer/CT = terminal.computer
	var/option = copytext(text, 6, 8)
	if(!terminal.computer.hard_drive.check_functionality()) return "<font color='#ff0000'>echo: check integrity of your hard drive.</font>"

	if(option == "-s")
		var/datum/computer_file/setted_file_by_command = CT.hard_drive.find_file_by_name(copytext(text, 9))
		if(!istype(setted_file_by_command, /datum/computer_file/data)) return "<font color='#ffa000'>Can't set on binary files.</font>"
		if(length(setted_file_by_command.filename) != 0)
			terminal.setted_file = setted_file_by_command
			return "<font color='#00ff00'>echo: file [terminal.setted_file.filename] successfuly setted.</font>"
		return "<font color='#ffa000'>echo: file not found.</font>"

	if(option == "-a")
		if(terminal.setted_file)
			var/writening_data = copytext(text, 9)
			terminal.setted_file.stored_data += writening_data
			return "<font color='#00ff00'>echo: '[writening_data]' successfuly writen in [terminal.setted_file.filename].</font><br>Now file contain: [terminal.setted_file.stored_data]"
		else return "<font color='#ffa000'>echo: file is not setted.</font>"

	var/file_name = copytext(text, 6)
	if(!file_name) return "<font color='#ffa000'>echo: enter filename.</font>"
	var/file = CT.hard_drive.find_file_by_name(file_name)
	if(!istype(file, /datum/computer_file/data)) return "<font color='#ffa000'>echo: file is binary.</font>"
	if(!file in CT.hard_drive.stored_files) return "<font color='#ffa000'>echo: file not fund</font>"
	var/datum/computer_file/data/end_file = file
	if(!end_file.stored_data) return "<font color='#ff0000'>echo: file empty.</font>"
	var/echo_data = end_file.stored_data
	return "echo: file store: [echo_data]"

/datum/terminal_command/probenet
	name = "probenet"
	man_entry = list("Format: probenet.", "Read online NIDs in your network.")
	pattern = "^probenet$"

/datum/terminal_command/probenet/proper_input_entered(text, mob/user, datum/terminal/terminal)
	var/obj/item/modular_computer/CT = terminal.computer
	if(!CT.network_card) return "<font color='#ffa000'>probenet: network card not found.</font>"
	if(!CT.network_card.check_functionality()) return "<font color='#ff0000'>probenet: check network card interity.</font>"
	if(!CT.get_ntnet_status()) return "probenet: network card can't connect to network."

	var/end_msg = ""
	var/total = 0
	for(var/obj/item/modular_computer/comp in SSobj.processing)
		if(comp.get_ntnet_status() && comp.enabled)
			end_msg += " " + num2text(comp.network_card.identification_id) + " |"
			total += 1
	. += "<font color='#00ff00'>probenet: online NIDs:</font> |[end_msg]<br>"
	. += "<font color='00ff00'>Total online:</font> [total]."

//BATCH Compilator
/datum/terminal_command/alias
	name = "alias"
	man_entry = list("Format: alias -ex \[filename\]",
					"Read and compile batch code from local files.",
					"Use \'alias -cr -bat \[filename\]\' to create bat file. To write code from terminal use \'man echo\'.",
					"Use \'alias -mn -bat\' to get help about batch."
					)
	pattern = "^alias"

/datum/terminal_command/alias/proper_input_entered(text, mob/user, datum/terminal/terminal)
	var/obj/item/modular_computer/CT = terminal.computer
	var/option = copytext(text, 7, 10)

	if(option == "-cr")
		if(copytext(text, 11, 15) == "-bat")
			var/ent_filename = copytext(text, 16)
			if(length(ent_filename) != 0)
				var/datum/computer_file/data/coding/batch/B = new()
				B.filename = ent_filename
				CT.hard_drive.store_file(B)
				return "<font color='00ff00'>alias: file \'[B.filename]\' was created.</font>"
			else
				return "<font color='#ffa000'>alias: error, expected file name.</font>"
		return "<font color='#ffa000'>alias: language marking option not found.</font>"


	if(option == "-mn")
		if(copytext(text, 11, 15) == "-bat")
			var/datum/computer_file/data/text/README/coding/batch/BRM = new()
			CT.hard_drive.store_file(BRM)
			return "alias: batch manual created."


	if(option == "-ex")
		var/inp_file_name = copytext(text, 11)
		if(length(inp_file_name) != 0)
			var/datum/computer_file/data/coding/batch/F = CT.hard_drive.find_file_by_name(inp_file_name)
			if(F.filetype != "BAT") return "<font color='#ffa000'>alias: incorrect file. Expected batch file.</font>"
			var/code = F.stored_data
			if(!";" in code) return "<font color='ff0000'>alias: compile error, lack this \';\'.</font>"
			code = replacetext(code, " \[br\]","")
			code = replacetext(code, "\[br\]","")

			var/list/code_list = splittext(code, ";")

			for(var/i in code_list)
				var/output = terminal.parse(i, user)
				terminal.history += "<br>alias << [i]"
				terminal.history += "terminal >> [output]"
			return "<font color='00ff00'>alias: execution complite.</font>"

	return "alias: options not found."
///BATCH Compilator

//[/INFINITY]_______________________________________________________________________________________________________________
