#define SCANNER_THREAT_RESET -50
#define SCANNER_THREAT_TRIGGER 4

/obj/machinery/security_scanner
	name = "security scanner"
	desc = "The latest innovation in invasive imagery, the programmable NT-X100 will scan anyone who walks through it with fans to simulate being patted down. <em>Nanotrasen is not to be held responsible for any deaths caused by the results the machine gives, or the machine itself.</em>"
	icon = 'infinity/icons/obj/machines/security_scanner.dmi'
	icon_state = "scanner_on"
	density = FALSE
//	opacity = FALSE // wait... we should able to use it somehow..
	anchored = TRUE
	layer = BELOW_DOOR_LAYER
	appearance_flags = TILE_BOUND
	atmos_canpass = CANPASS_DENSITY

	var/on = FALSE
	var/locked = TRUE

	// Access to operating this machine
	req_access = list(access_security, access_forensics_lockers)
	// Access to pass alarm trigger
	var/pass_access = list(access_security, access_forensics_lockers)

//	var/timeBetweenUses = 2 SECONDS // I can see this being fun
	var/success_sound = 'sound/machines/chime.ogg'
	var/fail_sound = 'infinity/sound/machines/alarm_a.ogg'

	var/bypass_filter = FALSE    // bypass filter: preventing alarm if we have enough access
	var/check_items = FALSE     // check if checking weapons
	var/check_records = FALSE  // check if checking records
	var/check_arrests = FALSE // check if we checking for arrests in record

	// Banned items
	var/banned_items = list(/obj/item/weapon/gun, /obj/item/weapon/melee)
	var/storage_types = list(/obj/item/weapon/storage, /obj/item/clothing/suit/storage)

//	var/report_scans = FALSE

//	var/last_perp = 0
//	var/last_contraband = 0

/obj/machinery/security_scanner/power_change()
	if(powered())
		stat &= ~NOPOWER
		update_icon()
	else
		on = 0
		stat |= NOPOWER
		update_icon()

/obj/machinery/security_scanner/attackby(obj/item/weapon/W, mob/user)
	if(emagged)
		to_chat(user, SPAN_WARNING("ERROR"))
		return

	if(on)
		to_chat(user, SPAN_WARNING("It must be turned off first!"))
		return

	if(istype(W, /obj/item/weapon/card/id))
		if(check_access(user, req_access))
			locked = !locked
			to_chat(user, SPAN_NOTICE("You [locked ? "lock" : "unlock"] \the [src] interface."))
		else
			to_chat(user, SPAN_WARNING("Access denied."))
		return

	if(istype(W, /obj/item/weapon/wrench))
		visible_message(
			SPAN_NOTICE("You begin [anchored ? "un" : ""]securing [src]..."),
			SPAN_NOTICE("[user] begin [anchored ? "un" : ""]securing [src]..."))
		playsound(src., 'sound/items/Ratchet.ogg', 50, 1)
		if(do_after(user, 20))
			visible_message(
				SPAN_NOTICE("You [anchored ? "un" : ""]secure [src]."),
				SPAN_NOTICE("[user] [anchored ? "un" : ""]secure [src]."))
			anchored = !anchored
			playsound(src, 'sound/items/Deconstruct.ogg', 50, 1)
		return

	if(istype(W, /obj/item/weapon/card/emag))
		emag_act()
		return

/obj/machinery/security_scanner/physical_attack_hand(mob/user as mob)
	if(stat & NOPOWER)
		to_chat(user, SPAN_WARNING("\The [src] seems unpowered."))
		return
	if(!anchored)
		to_chat(user, SPAN_WARNING("It must be secured first!"))
		return
	if(emagged)
		to_chat(user, SPAN_WARNING("ERROR"))
		return

	interact(user)
	usr.set_machine(src)

/obj/machinery/security_scanner/attack_ai(mob/user as mob)
	return physical_attack_hand(user)

/obj/machinery/security_scanner/interact(mob/user as mob)
	var/dat
	dat += "<br>Lock behaviour controls: <a href='?src=\ref[src];locked=1'>[locked ? "Yes" : "No"]</a><br><br>"

	if(!locked)
		dat += text({"
			Status: <a href='?src=\ref[src];on=1'>[on ? "On" : "Off"]</a><br>
			Use <b>security bypass filter</b>: <a href='?src=\ref[src];bypass_filter=1'>[bypass_filter ? "Yes" : "No"]</a><br>
			Use <b>banned items</b> filter: <a href='?src=\ref[src];check_items=1'>[check_items ? "Yes" : "No"]</a><br>
			<br>
			Check for <b>records</b>: <a href='?src=\ref[src];check_records=1'>[check_records ? "Yes" : "No"]</a><br>
			Check for <b>arrests</b>: <a href='?src=\ref[src];check_arrests=1'>[check_arrests ? "Yes" : "No"]</a><br>
			</tt>"})

	var/datum/browser/popup = new(user, "security_scanner", "Security Scanner")
	popup.set_content(dat)
	popup.open()
	return

/obj/machinery/security_scanner/Topic(href, href_list)
	..()
	if(href_list["locked"] && check_access(usr, req_access))
		locked = !locked
	else if(href_list["on"])
		on = !on
		update_icon()
	else if(href_list["bypass_filter"])
		bypass_filter = !bypass_filter
	else if(href_list["check_items"])
		check_items = !check_items
	else if(href_list["check_records"])
		check_records = !check_records
	else if(href_list["check_arrests"])
		check_arrests = !check_arrests

	updateUsrDialog()
	return

/obj/machinery/security_scanner/on_update_icon()
	icon_state = "scanner_[on ? "on" : "off"]"

/obj/machinery/security_scanner/Crossed(atom/movable/A)
	if(anchored && on && !stat)
		if(isliving(A))
			do_scan(A)
		if(istype(A, /obj/item))
			do_scan_item(A)
	return ..()

/obj/machinery/security_scanner/proc/trigger(num)
	switch(num)
		if(FALSE)
			playsound(src, success_sound, 10, 1)
			flick("scanner_green", src)
		if(TRUE)
			playsound(src, fail_sound, 10, 0)
			flick("scanner_red", src)
		//	if(report_scans) todo - make special autoannounce to security channel

/obj/machinery/security_scanner/proc/do_scan_item(obj/item/I)
	if(icon_state != "scanner_on")
		return

	if(istype(I, banned_items))
		return trigger(TRUE)

	else if(istype(I, storage_types) && I.contents)
		for(var/obj/item/thing in I.contents)
			if(istype(thing, banned_items))
				return trigger(TRUE)

/obj/machinery/security_scanner/proc/do_scan(mob/target)
	if(!on)
		return

	to_chat(target, SPAN_NOTICE("You feel [pick("funny", "wrong", "confused", "dangerous", "sickly", "puzzled", "happy")]."))

	if((check_target(target) >= SCANNER_THREAT_TRIGGER))
		trigger(TRUE)

	else
		trigger(FALSE)

/obj/machinery/security_scanner/proc/check_target(mob/living/target)
	if(!target || !istype(target))
		return 0

	var/threatcount = 0

	if(emagged)
		return 10

	// Agent cards lower threatlevel.
	var/obj/item/weapon/card/id/id = target.GetIdCard()
	if(id && istype(id, /obj/item/weapon/card/id/syndicate))
		threatcount -= 2
	// A proper CentCom id is hard currency.
	else if(id && istype(id, /obj/item/weapon/card/id/centcom))
		return SCANNER_THREAT_RESET

	if(check_items && ((!pass_access in target.GetAccess()) && bypass_filter) || !bypass_filter)
		for(var/obj/item/I in target.contents)
			if(istype(I, banned_items))
				threatcount += 4
				break

			else if(istype(I, storage_types) && I.contents)
				for(var/obj/item/thing in I.contents)
					if(istype(thing, banned_items))
						threatcount += 4
						break

	if(check_records || check_arrests)
		var/perpname = target.name
		if(id)
			perpname = id.registered_name

		var/datum/computer_file/report/crew_record/CR = get_crewmember_record(perpname)
		if(check_records && !CR && !target.isMonkey())
			threatcount += 4

		if(check_arrests && CR && (CR.get_criminalStatus() == GLOB.arrest_security_status))
			threatcount += 4

	return threatcount

/obj/machinery/security_scanner/emag_act()
	if(!emagged)
		emagged = TRUE
		playsound(src, 'sound/effects/sparks4.ogg', 50, 1)
		var/datum/effect/effect/system/spark_spread/s = new /datum/effect/effect/system/spark_spread
		s.set_up(5, 1, src)
		s.start()
		desc += SPAN_WARNING("<br>It seems malfunctioning.")
		return

/obj/machinery/fake_scanner
	name = "security scanner"
	desc = "The latest innovation in invasive imagery, the programmable NT-X100 will scan anyone who walks through it with fans to simulate being patted down. <em>Nanotrasen is not to be held responsible for any deaths caused by the results the machine gives, or the machine itself. ... Is this one even working properly?</em>"
	icon = 'infinity/icons/obj/machines/security_scanner.dmi'
	icon_state = "scanner_on"
