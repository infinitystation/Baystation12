//Well... That actualy just new uplink source...

/decl/uplink_source/usb
	name = "USB"
	desc = "Installs an uplink into a portable storage device. Has no TC cost."

/decl/uplink_source/usb/setup_uplink_source(var/mob/M, var/amount)
	var/obj/item/modular_computer/pda/P = find_in_mob(M, /obj/item/modular_computer/pda)
	var/obj/item/computer_hardware/hard_drive/portable/uplink = new()
	var/pda_pass = "[rand(100,999)] [pick(GLOB.greek_letters)]"
	var/obj/item/device/uplink/T = new(uplink, M.mind, amount)
	uplink.hidden_uplink = T
	var/datum/computer_file/program/uplink/program = new(pda_pass)
	if(!uplink.try_store_file(program))
		uplink.remove_file(uplink.find_file_by_name(program.filename))	//Maybe it already has a fake copy. //Nope, but who care
	if(!uplink.try_store_file(program))
		return TRUE		//SETUP FAILED //Not enough space or other issues.
	uplink.store_file(program)
	if(P)
		P.try_install_component(M, uplink)
		if(!P.hard_drive.try_store_file(program))	//Well, do u really want copy it from USB every round?
			P.hard_drive.remove_file(P.hard_drive.find_file_by_name(program.filename))	//Maybe it already has a fake copy.
		if(P.hard_drive.try_store_file(program))
			P.hard_drive.store_file(program)
		to_chat(M, "<span class='notice'>A portable object teleportation relay has been installed in [uplink.name], inside your [P.name]. Simply enter the code \"[pda_pass]\" in your new program to unlock its hidden features.</span>")
	else
		var/obj/item/storage/backpack = M.equip_to_storage(uplink)
		to_chat(M, "<span class='notice'>A portable object teleportation relay has been installed in [uplink.name], in your [backpack.name]. Simply enter the code \"[pda_pass]\" in your new program to unlock its hidden features.</span>")
	M.mind.StoreMemory("<B>Uplink passcode:</B> [pda_pass] ([uplink.name]).")
