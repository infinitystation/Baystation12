/obj/item/modular_computer/verb/open_terminal_b()
	set name = "Open Terminal"
	set category = "Object"
	set src in view(1)

	if(usr.incapacitated() || !istype(usr, /mob/living))
		to_chat(usr, "<span class='warning'>You can't do that.</span>")
		return
	if(usr.incapacitated() || !istype(usr, /mob/living))
		to_chat(usr, "<span class='warning'>You can't do that.</span>")
		return

	if(!Adjacent(usr) && !istype(usr, /mob/living/silicon))
		to_chat(usr, "<span class='warning'>You can't reach it.</span>")
		return

	if(istype(usr, /mob/living/silicon))
		set src in view(10)

	if(enabled)
		to_chat(usr, "<span class='warning'>You press special button and call NTOS terminal.</span>")
		src.open_terminal(usr)