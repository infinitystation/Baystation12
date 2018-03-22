/obj/structure/sign/double/barsign	// The sign is 64x32, so it needs two tiles. ;3
	name = "a bar sign"
	desc = "A jumbo-sized LED sign."
	icon = 'icons/obj/barsigns.dmi'
	icon_state = "empty"
	plane = -10 //Above humans
	appearance_flags = 0
	anchored = 1

	req_access = list(access_bar)

	var/sign_name = ""
	var/list/barsigns = list()

/obj/structure/sign/double/barsign/attack_ai(mob/user as mob)
	return src.attack_hand(user)

/obj/structure/sign/double/barsign/attack_hand(mob/user as mob)
	if (!src.allowed(user))
		to_chat(user, "<span class='warning'>Access denied.</span>")
		return

	barsigns.len = 0
	for(var/bartype in typesof(/datum/barsign))
		var/datum/barsign/signinfo = new bartype
		barsigns[signinfo.name] = signinfo

	pick_sign()

/obj/structure/sign/double/barsign/proc/pick_sign()
	var/picked_name = input("Available Signage", "Bar Sign", "Cancel") as null|anything in barsigns
	if(!picked_name)
		return

	var/datum/barsign/picked = barsigns[picked_name]
	icon_state = picked.icon
	name = picked.name
	if(picked.pixel_x && picked.pixel_y)
		pixel_x = picked.pixel_x * PIXEL_MULTIPLIER
		pixel_y = picked.pixel_y * PIXEL_MULTIPLIER
	else if(!picked.pixel_x && !picked.pixel_y)
		pixel_x = 0
		pixel_y = 0
	if(picked.desc)
		desc = picked.desc
	else
		desc = "It displays \"[name]\"."

/datum/barsign
	var/icon = "empty"
	var/name = "A jumbo-sized LED sign."
	var/desc = null
	var/pixel_x = 0
	var/pixel_y = 0

/datum/barsign/maltesefalcon
	name = "Maltese Falcon"
	icon = "maltesefalcon"
	desc = "Play it again, sam."

/obj/structure/sign/double/barsign/emp_act()
	icon_state = "empbarsign"
	name = "ERROR"
	desc = "ERROR ER0RR $R0RRO$!R41.%%!!(%$^^__+ @#F0E4#*?"
	pixel_x = 0
	pixel_y = 0
	return ..()
