/obj/item/modular_computer/verb/open_terminal_b()
	set name = "Open Terminal"
	set category = "Object"
	set src in view(1)

	var/datum/extension/interactive/ntos/os = get_extension(src, /datum/extension/interactive/ntos)
	var/sil_check = istype(usr, /mob/living/silicon)
	if(usr.incapacitated() || !istype(usr, /mob/living))
		to_chat(usr, "<span class='warning'>You can't do that.</span>")
		return

	if(!Adjacent(usr) && !sil_check)
		to_chat(usr, "<span class='warning'>You can't reach it.</span>")
		return

	if(sil_check)
		set src in view(10)

	if(enabled)
		if(os.has_terminal(usr))
			to_chat(usr, "<span class='warning'>You already use terminal of this device.</span>")
			return
		if(sil_check)
			to_chat(usr, "<span class='notice'>You send signal to device and call NTOS terminal.</span>")
		else
			to_chat(usr, "<span class='notice'>You press special button and call NTOS terminal.</span>")
		os.open_terminal(usr)
		return
	else
		if(sil_check)
			to_chat(usr, "<span class='warning'>You send signal to device, but it does not respond.</span>")
		else
			to_chat(usr, "<span class='warning'>You press special button, but device does not respond.</span>")
