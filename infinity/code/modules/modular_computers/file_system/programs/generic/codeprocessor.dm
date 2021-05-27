/datum/computer_file/program/codeprocessor
	filename = "codeprocessor"
	filedesc = "DAIS Text 3"
	extended_desc = "This program allows the editing and preview of text documents and code, this is advanced NanoWord."
	program_icon_state = "word"
	program_key_state = "atmos_key"
	size = 5
	requires_ntnet = 0
	available_on_ntnet = 1
	nanomodule_path = /datum/nano_module/program/computer_codeprocessor/
	var/browsing
	var/open_file
	var/loaded_data
	var/open_filetype
	var/list/allowed_filetypes = list("TXT", "BAT", "CFG", "DAT")
	var/code_lang
	var/code_lang_desc
	var/error
	var/is_edited
	usage_flags = PROGRAM_ALL
	category = PROG_OFFICE

/datum/computer_file/program/codeprocessor/proc/open_file(var/filename)
	var/datum/computer_file/data/F = get_file(filename)
	if(F)
		open_file = F.filename
		loaded_data = F.stored_data
		filetype = F.filetype
		return 1

/datum/computer_file/program/codeprocessor/proc/save_file(var/filename)
	var/datum/computer_file/data/F = get_file(filename)
	if(!F) //try to make one if it doesn't exist
		F = create_file(filename, loaded_data, /datum/computer_file/data/text)
		return !isnull(F)
	var/datum/computer_file/data/backup = F.clone()
	var/obj/item/stock_parts/computer/hard_drive/HDD = computer.get_component(PART_HDD)
	if(!HDD)
		return
	HDD.remove_file(F)
	F.stored_data = loaded_data
	F.calculate_size()
	if(!HDD.store_file(F))
		HDD.store_file(backup)
		return 0
	is_edited = 0
	return 1

/datum/computer_file/program/codeprocessor/Topic(href, href_list)
	if(..())
		return 1

	if(href_list["PRG_txtrpeview"])
		show_browser(usr,"<HTML><HEAD><TITLE>[open_file]</TITLE></HEAD>[pencode2html(loaded_data)]</BODY></HTML>", "window=[open_file]")
		return 1

	if(href_list["PRG_taghelp"])
		to_chat(usr, "<span class='notice'>The hologram of a googly-eyed paper clip helpfully tells you:</span>")
		var/help = {"
		\[br\] : Creates a linebreak.
		\[center\] - \[/center\] : Centers the text.
		\[h1\] - \[/h1\] : First level heading.
		\[h2\] - \[/h2\] : Second level heading.
		\[h3\] - \[/h3\] : Third level heading.
		\[b\] - \[/b\] : Bold.
		\[i\] - \[/i\] : Italic.
		\[u\] - \[/u\] : Underlined.
		\[small\] - \[/small\] : Decreases the size of the text.
		\[large\] - \[/large\] : Increases the size of the text.
		\[field\] : Inserts a blank text field, which can be filled later. Useful for forms.
		\[date\] : Current station date.
		\[time\] : Current station time.
		\[list\] - \[/list\] : Begins and ends a list.
		\[*\] : A list item.
		\[hr\] : Horizontal rule.
		\[table\] - \[/table\] : Creates table using \[row\] and \[cell\] tags.
		\[grid\] - \[/grid\] : Table without visible borders, for layouts.
		\[row\] - New table row.
		\[cell\] - New table cell.
		\[logo\] - Inserts EXO logo.
		\[sierralogo\] - Inserts the NSV Sierra logo.
		\[ntlogo\] - Inserts the NT logo.
		\[bluelogo\] - Inserts the blue NT logo.
		\[solcrest\] - Inserts the SCG crest.
		\[eclogo\] - Inserts the Expeditionary Corps logo.
		\[foundlogo\] - Inserts the Cuchulain Foundation logo.
		\[daislogo\] - Inserts the Deimos Advanced Information Systems logo.
		\[xynlogo\] - Inserts the Xynergy logo.
		\[iccgseal\] - Inserts the ICCG seal
		\[fleetlogo\] - Inserts the SCG Fleet logo.
		\[ocielogo\] - Inserts the Office of Civil Investigation and Enforcement logo."}

		to_chat(usr, help)
		return 1

	if(href_list["PRG_closebrowser"])
		browsing = 0
		return 1

	if(href_list["PRG_backtomenu"])
		error = null
		return 1

	if(href_list["PRG_loadmenu"])
		browsing = 1
		return 1

	if(href_list["PRG_openfile"])
		. = 1
		if(is_edited)
			if(alert("Would you like to save your changes first?",,"Yes","No") == "Yes")
				save_file(open_file)
		browsing = 0
		if(!open_file(href_list["PRG_openfile"]))
			error = "I/O error: Unable to open file '[href_list["PRG_openfile"]]'."

	if(href_list["PRG_newfile"])
		. = 1
		if(is_edited)
			if(alert("Would you like to save your changes first?",,"Yes","No") == "Yes")
				save_file(open_file)

		var/newfiletype = input(usr, "Choose file type.", "New File") in list("TXT", "BAT", "CFG", "DAT")
		var/newname = sanitize(input(usr, "Enter file name:", "New File") as text|null)
		if(!newname)
			return 1
		var/datum/computer_file/data/F
		switch(newfiletype)
			if("BAT")
				F = create_file(newname, "", /datum/computer_file/data/coding/batch)
				var/datum/computer_file/data/coding/batch/FT = F
				code_lang = FT.code_lang
				code_lang_desc = FT.code_lang_desc
			if("TXT")
				F = create_file(newname, "", /datum/computer_file/data/text)
			if("CFG")
				F = create_file(newname, "", /datum/computer_file/data/config)
			if("DAT")
				F = create_file(newname, "", /datum/computer_file/data)
		F.filetype = newfiletype
		if(F)
			open_file = F.filename
			loaded_data = ""
			open_filetype = newfiletype
			return 1
		else
			error = "I/O error: Unable to create file '[href_list["PRG_saveasfile"]]'."

	if(href_list["PRG_saveasfile"])
		. = 1
		var/newname = sanitize(input(usr, "Enter file name:", "Save As") as text|null)
		if(!newname)
			return 1
		var/datum/computer_file/data/F = create_file(newname, loaded_data, /datum/computer_file/data/text)
		if(F)
			open_file = F.filename
		else
			error = "I/O error: Unable to create file '[href_list["PRG_saveasfile"]]'."
		return 1

	if(href_list["PRG_savefile"])
		. = 1
		if(!open_file)
			open_file = sanitize(input(usr, "Enter file name:", "Save As") as text|null)
			filetype = input(usr, "Choose file type.", "Save As") in list("TXT", "BAT", "CFG", "DAT")
			if(!open_file)
				return 0
		if(!save_file(open_file))
			error = "I/O error: Unable to save file '[open_file]'."
		return 1

	if(href_list["PRG_editfile"])
		var/oldtext = html_decode(loaded_data)
		oldtext = replacetext(oldtext, "\[br\]", "\n")

		var/newtext = sanitize(replacetext(input(usr, "Editing file '[open_file]'. You may use most tags used in paper formatting:", "Text Editor", oldtext) as message|null, "\n", "\[br\]"), MAX_TEXTFILE_LENGTH)
		if(!newtext)
			return
		loaded_data = newtext
		is_edited = 1
		return 1

	if(href_list["PRG_printfile"])
		. = 1
		var/obj/item/stock_parts/computer/nano_printer/P = computer.get_component(PART_PRINTER)
		if(!P)
			error = "Missing Hardware: Your computer does not have the required hardware to complete this operation."
			return 1
		if(!P.print_text(pencode2html(loaded_data)))
			error = "Hardware error: Printer was unable to print the file. It may be out of paper."
			return 1

/datum/nano_module/program/computer_codeprocessor
	name = "Code Processor"

/datum/nano_module/program/computer_codeprocessor/ui_interact(mob/user, ui_key = "main", var/datum/nanoui/ui = null, var/force_open = 1, var/datum/topic_state/state = GLOB.default_state)
	var/list/data = host.initial_data()
	var/datum/computer_file/program/codeprocessor/PRG
	PRG = program

	var/obj/item/stock_parts/computer/hard_drive/HDD
	var/obj/item/stock_parts/computer/hard_drive/portable/RHDD
	if(PRG.error)
		data["error"] = PRG.error
	if(PRG.browsing)
		data["browsing"] = PRG.browsing
		if(!PRG.computer || !PRG.computer.has_component(PART_HDD))
			data["error"] = "I/O ERROR: Unable to access hard drive."
		else
			HDD = PRG.computer.get_component(PART_HDD)
			var/list/files[0]
			for(var/datum/computer_file/data/F in HDD.stored_files)
				if(F.filetype in PRG.allowed_filetypes)
					files.Add(list(list(
						"name" = F.filename,
						"size" = F.size,
						"type" = F.filetype)))

			data["files"] = files

			RHDD = PRG.computer.get_component(PART_DRIVE)
			if(RHDD)
				data["usbconnected"] = 1
				var/list/usbfiles[0]
				for(var/datum/computer_file/F in RHDD.stored_files)
					if(F.filetype in PRG.allowed_filetypes)
						files.Add(list(list(
							"name" = F.filename,
							"size" = F.size,
							"type" = F.filetype)))

				data["usbfiles"] = usbfiles
	else if(PRG.open_file)
		data["open_file"] = PRG.open_file
		data["filedata"] = pencode2html(PRG.loaded_data)
		data["filename"] = PRG.is_edited ? "[PRG.open_file]*" : PRG.open_file
		data["filetype"] = PRG.open_filetype
		if(PRG.open_filetype == "BAT")
			data["code_lang"] = PRG.code_lang
			data["code_lang_desc"] = PRG.code_lang_desc
	else
		data["open_file"] = PRG.open_file
		data["filedata"] = pencode2html(PRG.loaded_data)
		data["filename"] = "UNNAMED"
		data["filetype"] = PRG.open_filetype
		if(PRG.open_filetype == "BAT")
			data["code_lang"] = PRG.code_lang
			data["code_lang_desc"] = PRG.code_lang_desc

	ui = SSnano.try_update_ui(user, src, ui_key, ui, data, force_open)
	if (!ui)
		ui = new(user, src, ui_key, "code_processor.tmpl", "DAIS Text 3", 575, 700, state = state)
		ui.auto_update_layout = 1
		ui.set_initial_data(data)
		ui.open()
