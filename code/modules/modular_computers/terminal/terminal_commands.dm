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
	var/obj/item/weapon/stock_parts/computer/network_card/network_card = terminal.computer.get_component(PART_NETWORK)
	if(!istype(network_card))
		return "No network adaptor found."
	if(!network_card.check_functionality())
		return "Network adaptor not activated."
	return "Visible tag: [network_card.get_network_tag()]. Real nid: [network_card.identification_id]."

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
	. = list("Running diagnostic protocols...")
	. += ch.diagnostics()
	return

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
	var/datum/extension/interactive/ntos/origin = terminal.computer
	if(!origin || !origin.get_ntnet_status())
		return
	var/nid = text2num(copytext(text, 8))
	var/datum/extension/interactive/ntos/comp = ntnet_global.get_os_by_nid(nid)
	if(!comp || !comp.host_status() || !comp.get_ntnet_status())
		return
	return "... Estimating location: [get_area(comp.get_physical_host())]"

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
	var/datum/extension/interactive/ntos/origin = terminal.computer
	if(!origin || !origin.get_ntnet_status())
		. += "failed. Check network status."
		return
	var/nid = text2num(copytext(text, 6))
	var/datum/extension/interactive/ntos/comp = ntnet_global.get_os_by_nid(nid)
	if(!comp || !comp.host_status() || !comp.get_ntnet_status())
		. += "failed. Target device not responding."
		return
	. += "ping successful."
/*INF COMMENT, telnet replacing it, cuz IT-workers love to troll users though it //It can 'cause some balance.
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
	var/datum/extension/interactive/ntos/origin = terminal.computer
	if(!origin || !origin.get_ntnet_status())
		return "ssh: Check network connectivity."
	var/nid = text2num(copytext(text, 5))
	var/datum/extension/interactive/ntos/comp = ntnet_global.get_os_by_nid(nid)
	if(comp == origin)
		return "ssh: Error; can not open remote terminal to self."
	if(!comp || !comp.host_status() || !comp.get_ntnet_status())
		return "ssh: No active device with this nid found."
	if(comp.has_terminal(user))
		return "ssh: A remote terminal to this device is already active."
	var/datum/terminal/remote/new_term = new (user, comp, origin)
	LAZYADD(comp.terminals, new_term)
	LAZYADD(origin.terminals, new_term)
	return "ssh: Connection established."
*/
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
	var/datum/extension/interactive/ntos/comp = terminal.computer
	var/obj/item/weapon/stock_parts/computer/network_card/network_card = comp && comp.get_component(PART_NETWORK)
	if(!comp || !network_card || !network_card.check_functionality())
		return "proxy: Error; check networking hardware."
	if(text == "proxy")
		if(!network_card.proxy_id)
			return "proxy: This device is not using a proxy."
		return "proxy: This device is set to connect via proxy with nid [network_card.proxy_id]."
	if(text == "proxy -s")
		if(!network_card.proxy_id)
			return "proxy: Error; this device is not using a proxy."
		network_card.proxy_id = null
		return "proxy: Device proxy cleared."
	if(!network_card || !network_card.check_functionality() || !comp.get_ntnet_status())
		return "proxy: Error; check networking hardware."
	var/syntax_error = "proxy: Invalid input. Enter man proxy for syntax help."
	if(length(text) < 10)
		return syntax_error
	if(copytext(text, 1, 10) != "proxy -s ")
		return syntax_error
	var/id = text2num(copytext(text, 10))
	if(!id)
		return syntax_error
	var/datum/extension/interactive/ntos/target = ntnet_global.get_os_by_nid(id)
	if(target == comp) return "proxy: Cannot setup a device to be its own proxy"
	if(!target || !target.host_status() || !target.get_ntnet_status())
		return "proxy: Error; cannot locate target device."
	var/datum/computer_file/data/logfile/file = target.get_file("proxy")
	if(!istype(file))
		file = target.create_file("proxy")
	if(file)
		file.stored_data += "([time_stamp()]) Proxy routing request accepted from: [comp.get_network_tag()].\[br\]"
	network_card.proxy_id = id
	return "proxy: Device proxy set to [id]."

//[INFINITY]____________________________________________________________________________________________________________________

/datum/terminal_command/listdir
	name = "listdir"
	man_entry = list("Format: listdir", "State list of files in local memory.")
	pattern = "^listdir$"
	skill_needed = SKILL_ADEPT

/datum/terminal_command/listdir/proper_input_entered(text, mob/user, datum/terminal/terminal)
	var/datum/extension/interactive/ntos/CT = terminal.computer
	if(length(text) < 6)
		return "listdir: Improper syntax. Use listdir."
	if(!CT.get_component(PART_HDD).check_functionality())
		return "listdir: Access attempt to local storage failed. Check integrity of your hard drive"
	for(var/datum/computer_file/F in CT.get_component(PART_HDD).stored_files)
		if(F.is_illegal == 0)
			var/prog_size = num2text(F.size)
			. += F.filename + "." + F.filetype + "	|	" + prog_size + " GQ<br>"
		else
			. += "\[ENCRYPTED]" + "." + "\[ENCRYPTED]" + "	|	" + "\[ENCRYPTED]" + " GQ<br>"
	return

/datum/terminal_command/shutdown
	name = "shutdown"
	man_entry = list("Format: shutdown.", "Shutdown device.")
	pattern = "^shutdown$"
	skill_needed = SKILL_ADEPT

/datum/terminal_command/shutdown/proper_input_entered(text, mob/user, datum/terminal/terminal)
	var/datum/extension/interactive/ntos/CT = terminal.computer
	var/obj/item/modular_computer/H = CT.get_physical_host()
	if(H)
		if(length(text) < 8)
			return "shutdown: Improper syntax. shutdown."
		CT.system_shutdown()
		if(istype(H))
			H.bsod = 0
		CT.update_host_icon()
		return "Shutdown successful."
	else
		return "<font color='#f00'>UNDEFINED ERROR</font>"

/datum/terminal_command/session
	name = "session"
	man_entry = list("Format: session; session -kill",
					"Utilite for manipulations with active programs",
					"As session return list of active PRG programs.",
					"Option -kill kill all active PRG programs",
					//"Option -restore open interface of devise.",
					//"-restore manual: if you use -restore to open programs in remote console, duplicate input of command with -restore option after open of program interface."
					)
	pattern = "^session"
	skill_needed = SKILL_ADEPT

/datum/terminal_command/session/proper_input_entered(text, mob/user, datum/terminal/terminal)
	var/datum/computer_file/program/PRG = /datum/computer_file/program
	var/datum/extension/interactive/ntos/CT = terminal.computer
	if(length(text) > 18 || length(text) < 6)
		return "session: Invalid input. Enter man session for syntax help."
	if(!CT.get_component(PART_CPU).check_functionality())
		return "session: Access attempt to RAM failed. Check integrity of your CPU."
	var/ermsg = " programs is absent"
	/*if(copytext(text, 8) == " -restore")
		CT.is_remote_ui = 1
		CT.ui_interact(user)
		return "session: interface restored."*/

	if(copytext(text,8) == " -kill")
		if(CT.running_programs)
			for(PRG in CT.running_programs)
				CT.kill_program(PRG)
			CT.kill_program(CT.active_program)
			CT.update_host_icon()
			return "session: Active background and current programs killed."

		else
			ermsg = "background" + ermsg
		if(CT.active_program)
			CT.kill_program(CT.active_program)
		else
			if(copytext(ermsg, 1, 10) == "background")
				ermsg = "Curent and " + ermsg
			else
				ermsg = "Curent" + ermsg
			ermsg = "session: " + ermsg
			return ermsg
	for(PRG in CT.running_programs)
		. = list()
		if(PRG.is_illegal)
			. += "\[ENCRYPTED]"
		else
			. += PRG.filename
	if(CT.active_program)
		. += CT.active_program.filename
	if(.)
		. = jointext(., "<br>")
		return
	return "session: Wrong input. Enter man session for syntax help."

/datum/terminal_command/telnet
	name = "telnet"
	man_entry = list("Format: telnet \[NID] \[LOGIN] \[PASSWORD].",
					"Access remote terminal with login and password",
					"If NID < 100 write NID like 001.",
					"Use `telnet` to README and config security of your devise.")
	pattern = "^telnet"

/datum/terminal_command/telnet/proper_input_entered(text, mob/user, datum/terminal/terminal)
	var/datum/extension/interactive/ntos/CT = terminal.computer

	if(!copytext(text,7))
		if(CT.get_component(PART_HDD))
			if(!CT.get_component(PART_HDD).find_file_by_name("TNet_CONFIG") && !CT.get_component(PART_HDD).find_file_by_name("TNet_CONFIG_README"))
				var/datum/computer_file/data/config/file = CT.get_component(PART_HDD).find_file_by_name("TNet_CONFIG")
				if(!istype(file))
					file = new()
					file.filename = "TNet_CONFIG"
					CT.get_component(PART_HDD).store_file(file) // May fail, which is fine with us.
					file.stored_data += "ROOT : [round(rand(1000, 9999))]" //LOGIN : PASSWORD
				var/datum/computer_file/data/text/file_README = CT.get_component(PART_HDD).find_file_by_name("TNet_CONFIG_README")
				if(!istype(file_README))
					file_README = new()
					file_README.filename = "TNet_CONFIG_README"
					CT.get_component(PART_HDD).store_file(file_README) // May fail, which is fine with us.
					file_README.stored_data += "\[large]\[b]DO NOT DELETE FILE TNet_CONFIG IF YOU DO NOT WANT TO PUT YOUR DEVICE AT RISK \[/b]\[/large]\[br]" //LOGIN : PASSWORD
					file_README.stored_data += "Format login and password in TNet_CONFIG: \[LOGIN] : \[PASSWORD].\[br]"
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
	var/datum/extension/interactive/ntos/comp = ntnet_global.get_os_by_nid(nid)
	if(comp == CT)
		return "telnet: Error; can not open remote terminal to self."
	if(!comp || !comp.host_status() || !comp.get_ntnet_status())
		return "telnet: No active device with this nid found."
	if(comp.has_terminal(user))
		return "telnet: A remote terminal to this device is already active."

	var/datum/computer_file/data/config/cfg_file = comp.get_component(PART_HDD).find_file_by_name("TNet_CONFIG")
	if(comp.get_component(PART_HDD).find_file_by_name("TNet_CONFIG"))
		var/login = copytext(cfg_file.stored_data, 1, 5)
		var/password = copytext(cfg_file.stored_data, 8)
		if(copytext(text, 12,16) == login)
			if(copytext(text, 17) == password)
				var/datum/terminal/remote/new_term = new (user, comp, CT)
				LAZYADD(comp.terminals, new_term)
				LAZYADD(CT.terminals, new_term)
				ntnet_global.add_log("[CT.get_component(PART_NETWORK).get_network_tag()] open telnet tunnel to [comp.get_component(PART_NETWORK).get_network_tag()]")
				return "telnet: <font color='#00ff00'>Connection established with login: [login], and password: [password].</font>"
			else
				return "<font color='#ff0000'>telnet: INCORRECT PASSWORD.</font>"
		else
			return "<font color='#ff0000'>telnet: INCORRECT LOGIN.</font>"
	var/datum/terminal/remote/new_term = new (user, comp, CT)
	LAZYADD(comp.terminals, new_term)
	LAZYADD(CT.terminals, new_term)
	ntnet_global.add_log("[CT.get_component(PART_NETWORK).get_network_tag()] open telnet tunnel to [comp.get_component(PART_NETWORK).get_network_tag()]")
	return "telnet: Connection established."

/datum/terminal_command/remove
	name = "remove"
	man_entry = list("Format: remove \[FILENAME].", "Delete file from local storage.")
	pattern = "^remove"
	skill_needed = SKILL_ADEPT

/datum/terminal_command/remove/proper_input_entered(text, mob/user, datum/terminal/terminal)
	var/datum/extension/interactive/ntos/CT = terminal.computer
	var/file_name = copytext(text, 8)
	var/file_obj = CT.get_component(PART_HDD).find_file_by_name(file_name)
	if(file_obj in CT.get_component(PART_HDD).stored_files)
		CT.get_component(PART_HDD).remove_file(file_obj)
		return "<font color='#00ff00'>remove: [file_name] removed.</font>"
	else if(!copytext(text, 7))
		return "<font color='#ffa000'>remove: input filename.</font>"
	else
		return"<font color = '#ff0000'>remove: file not found.</font>"
	return "remove: something wrong"

/datum/terminal_command/echo
	name = "echo"
	man_entry = list("Format: echo \[FILENAME].",
					"Read stored data of file and return it in terminal.",
					"Use 'echo -a \[Your data]' to write in file. Before it you must set editing file, use 'echo -s \[filename]'"
					)
	pattern = "^echo"
	skill_needed = SKILL_ADEPT

/datum/terminal_command/echo/proper_input_entered(text, mob/user, datum/terminal/terminal)
	var/datum/extension/interactive/ntos/CT = terminal.computer
	var/option = copytext(text, 6, 8)
	if(!terminal.computer.get_component(PART_HDD).check_functionality()) return "<font color='#ff0000'>echo: check integrity of your hard drive.</font>"

	if(option == "-s")
		var/datum/computer_file/setted_file_by_command = CT.get_component(PART_HDD).find_file_by_name(copytext(text, 9))
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
	var/file = CT.get_component(PART_HDD).find_file_by_name(file_name)
	if(!file in CT.get_component(PART_HDD).stored_files) return "<font color='#ffa000'>echo: file not found.</font>"
	if(!istype(file, /datum/computer_file/data)) return "<font color='#ffa000'>echo: file is binary.</font>"
	var/datum/computer_file/data/end_file = file
	if(!end_file.stored_data) return "<font color='#ff0000'>echo: file empty.</font>"
	var/echo_data = end_file.stored_data
	return "echo: file store: [echo_data]"

/datum/terminal_command/probenet
	name = "probenet"
	man_entry = list("Format: probenet.", "Read online NIDs in your network.")
	pattern = "^probenet$"

/datum/terminal_command/probenet/proper_input_entered(text, mob/user, datum/terminal/terminal)
	var/datum/extension/interactive/ntos/CT = terminal.computer
	if(!CT.get_component(PART_NETWORK)) return "<font color='#ffa000'>probenet: network card not found.</font>"
	if(!CT.get_component(PART_NETWORK).check_functionality()) return "<font color='#ff0000'>probenet: check network card interity.</font>"
	if(!CT.get_ntnet_status()) return "probenet: network card can't connect to network."

	var/list/NIDS = list()
	var/total = 0
	for(var/datum/extension/interactive/ntos/comp in GLOB.CreatedOSes)
		if(comp.get_ntnet_status() && comp.host_status())
			NIDS += "[comp.get_component(PART_NETWORK).identification_id]"
			total += 1
	. += "<font color='#00ff00'>probenet: online NIDs:</font> | [NIDS.Join(" | ")] |<br><font color='00ff00'>Total online:</font> [total]."

//BATCH Compilator
/datum/terminal_command/alias
	name = "alias"
	man_entry = list("Format: alias -ex \[filename]",
					"Read and compile batch code from local files.",
					"Use 'alias -cr -bat \[filename]' to create bat file. To write code from terminal use 'man echo'.",
					"Use 'alias -mn -bat' to get help about batch."
					)
	pattern = "^alias"

/datum/terminal_command/alias/proper_input_entered(text, mob/user, datum/terminal/terminal)
	var/datum/extension/interactive/ntos/CT = terminal.computer
	var/option = copytext(text, 7, 10)

	if(option == "-cr")
		if(copytext(text, 11, 15) == "-bat")
			var/ent_filename = copytext(text, 16)
			if(length(ent_filename) != 0)
				var/datum/computer_file/data/coding/batch/B = new()
				B.filename = ent_filename
				CT.get_component(PART_HDD).store_file(B)
				return "<font color='00ff00'>alias: file '[B.filename]' was created.</font>"
			else
				return "<font color='#ffa000'>alias: error, expected file name.</font>"
		return "<font color='#ffa000'>alias: language marking option not found.</font>"


	if(option == "-mn")
		if(copytext(text, 11, 15) == "-bat")
			var/datum/computer_file/data/text/README/coding/batch/BRM = new()
			CT.get_component(PART_HDD).store_file(BRM)
			return "alias: batch manual created."


	if(option == "-ex")
		var/inp_file_name = copytext(text, 11)
		if(length(inp_file_name) != 0)
			var/datum/computer_file/data/coding/batch/F = CT.get_component(PART_HDD).find_file_by_name(inp_file_name)
			if(F.filetype != "BAT") return "<font color='#ffa000'>alias: incorrect file. Expected batch file.</font>"
			var/code = F.stored_data
			if(!";" in code) return "<font color='ff0000'>alias: compile error, lack this ';'.</font>"
			code = replacetext_char(code, " \[br]","")
			code = replacetext_char(code, "\[br]","")

			var/list/code_list = splittext(code, ";")

			for(var/i in code_list)
				var/output = terminal.parse(i, user)
				terminal.history += "<br>alias << [i]"
				terminal.history += "terminal >> [output]"
			return "<font color='00ff00'>alias: execution complite.</font>"

	return "alias: options not found."
///BATCH Compilator

//remote door control
/datum/terminal_command/connect
	name = "connect"
	man_entry = list("Format: connect \[door id].",
					"Standard format show you data about door, it needn't access of door.",
					"Open format: connect \[door id] -open. To close door, replace '-open' by '-close'. Need airlock accessible",
					"Locking (bolting) format: connect \[door id] -lock. To unlock use -unlock. Need airlock access.",
					"In red and orange code you can override airlock access by using override key. Like this: 'connect y421 -open -override Yota11'"
					)
	pattern = "^connect"

/datum/terminal_command/connect/proper_input_entered(text, mob/user, datum/terminal/terminal)
	var/list/txt = splittext(text, " ")
	if(length(txt) == 1)
		return "connect: syntax error. Use 'man connect'"
	var/override = 0
	var/airlock_override_code = ""
	var/decl/security_state/sec_code = decls_repository.get_decl(GLOB.using_map.security_state)
	var/datum/extension/interactive/ntos/CT = terminal.computer

	var/obj/machinery/door/airlock/DOOR = terminal.get_airlock_by_ID(txt[2])
	if(DOOR && CT.get_component(PART_NETWORK).check_functionality())
		if(!DOOR.aiControlDisabled)
			if(length(txt) == 2)
				. += "Outputting data about airlock([txt[2]]):<hr>"
				. += "Energy: [DOOR.main_power_lost_until ? "<font color = '#ff0000'>OFFLINE</font>" : "<font color = '#00ff00'>ONLINE</font>"]"
				. += "<pre>Network data:<br>"
				. += "	NTNet connection: [DOOR.aiControlDisabled ? "<font color = '#ff0000'>ERROR</font>" : "<font color = '#00ff00'>STABLE</font>"].<br>"
				. += "	AI cover: [DOOR.hackProof ? "<font color = '#00ff00'>ACTIVE</font>" : "<font color = '#ff0000'>OUT OF SERVICE</font>"].<hr></pre>"
				var/electrified_state
				switch(DOOR.electrified_until)
					if(-1)
						electrified_state = "<font color = '#fffa29'>PERMANENT</font>"
					if(0)
						electrified_state = "<font color ='#00ff00'>FALSE</font>"
					else
						electrified_state = "<font color = '#ff0000'>TRUE</font>"
				. += "<pre>Local functional data:<br>"
				. += "	Electrified: [electrified_state].<br>"
				. += "	Bolts: [DOOR.locked ? "<font color = '#ff0000'>LOCKED DOWN</font>" : "<font color = '#00ff00'>OUT OF SERVICE</font>"].<br>"
				. += "	Lights: [DOOR.lights ? "<font color = '#00ff00'>STABLE</font>" : "<font color = '#ff0000'>OUT OF SERVICE</font>"].<br><hr>"
				. += "	<font color = '#ff0000' size = 2>SAFETY DATA</font>:<br>"
				. += "		Airlock timing: [DOOR.normalspeed ? "<font color = '#00ff00'>STABLE</font>" : "<font color = '#ff0000'>OVERRIDEN</font>"].<br>"
				. += "		Safety protocols: [DOOR.safe ? "<font color = '#00ff00'>STABLE</font>" : "<font color = '#ff0000'>OVERRIDEN</font>"].<br></pre>"
				/*var/ac = ""
				if(DOOR.req_access)
					ac = "(
					for(var/i in DOOR.req_access)
						ac += i + ", "
					ac += ")"*/
				. += "Required Access: [DOOR.req_access ? "([jointext(DOOR.req_access, ", ") ])" : "ACCESS NOT REQUIRED"].<hr>"
				return
			else
				//OVERRIDE CHECK
				if(length(txt) >= 5)
					if(txt[length(txt) - 1] == "-override")
						airlock_override_code = ntnet_global.airlock_override_key
						if(txt[length(txt)] == airlock_override_code && sec_code.current_security_level.airlock_override)
							override = 1
							. += "<font color = '#ff0000'>ACCESS OVERRIDEN</font><br>"

				//ACCESS CHECK
				if(!has_access(DOOR.req_access, user.GetAccess()) && !override)
					return "connect: <font color = '#ff0000'>ACCESS ERROR.</font>"
				else
					switch(txt[3])
						//density
						if("-open")
							if(!DOOR.open())
								. += "connect: unable to open airlock, maybe it bolted or already opened or lack for energy."
								return
							. += "connect: Airlock with id([txt[2]]) was opened."
							return
						if("-close")
							DOOR.close()
							if(!DOOR.density)
								. += "connect: unable to close airlock, maybe it bolted or already closed or lack for energy."
								return
							. += "connect: Airlock with id([txt[2]]) was closed."
							return

						//bolts
						if("-lock")
							if(!DOOR.lock())
								. += "connect: unable to close airlock, maybe it bolted or already locked or lack for energy."
								return
							. += "connect: Airlock with id([txt[2]]) was locked."
							return
						if("-unlock")
							if(!DOOR.unlock())
								. += "connect: unable to close airlock, maybe it bolted or already unlocked or lack for energy."
								return
							. += "connect: Airlock with id([txt[2]]) was unlocked."
							return
		else
			return "connect: <font color = '#ff0000'>ERROR</font>: Unable to establish a stable NTNet connection with airlock."
	else
		return "connect: <font color = '#ff0000'>ERROR 404:</font>: Unable to found airlock."
//[/INFINITY]_______________________________________________________________________________________________________________
