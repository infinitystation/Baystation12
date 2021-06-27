// lockdown b_doors
/obj/machinery/door/blast/regular/lockdown
	name = "Security Lockdown"
	desc = "That looks like it doesn't open easily. \
	But that one has NFC sign. May be my ID can help?"
	req_access = list(list(access_sec_doors, access_engine, access_medical))
	begins_closed = FALSE
	icon_state = "pdoor0"
	// Дальше только ад.
	min_force = 50
	maxhealth = 5000

// Как я и обещал, бронестворки можно емагать.
/obj/machinery/door/blast/regular/lockdown/emag_act(remaining_charges)
	. = ..(remaining_charges, TRUE)
	if(.)
		// Если уж емагаются, то все сразу
		for(var/obj/machinery/door/blast/regular/lockdown/door in SSmachines.machinery)
			if(door.id_tag == id_tag && door.density && door.operable())
				INVOKE_ASYNC(door, /obj/machinery/door/proc/do_animate, "emag")
				addtimer(CALLBACK(door, /obj/machinery/door/proc/emag_open), 6)

/obj/machinery/door/blast/regular/lockdown/attackby(obj/item/C as obj, mob/user as mob)
	. = ..(C, user)
	if(isid(C) || istype(C, /obj/item/modular_computer/pda))
		if(allowed(user))
			for(var/obj/machinery/door/blast/regular/lockdown/door in SSmachines.machinery)
				if(door.id_tag == id_tag)
					INVOKE_ASYNC(door, /obj/machinery/door/proc/open)
		return

/obj/machinery/door/blast/regular/lockdown/attack_ai()
	for(var/obj/machinery/door/blast/regular/lockdown/door in SSmachines.machinery)
		if(door.id_tag == id_tag)
			if(door.density)
				INVOKE_ASYNC(door, /obj/machinery/door/proc/open)
			else
				INVOKE_ASYNC(door, /obj/machinery/door/proc/close)

/obj/machinery/door/blast/regular/lockdown/AIMiddleClick(var/mob/AI)
	return attack_ai(AI)

/obj/machinery/door/blast/regular/lockdown/BorgCtrlClick(var/mob/AI)
	return AIMiddleClick(AI)
