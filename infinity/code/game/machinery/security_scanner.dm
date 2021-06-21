#define SCANNER_THREAT_RESET -50
#define SCANNER_THREAT_TRIGGER 4

/obj/machinery/security_scanner
	name = "Security Scanner"
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
	var/list/banned_items = list(/obj/item/gun, /obj/item/melee, /obj/item/grenade)
	var/list/storage_types = list(/obj/item/storage, /obj/item/clothing/suit/storage, /obj/structure/closet)

	var/report_scans = FALSE

//	var/last_perp = 0
//	var/last_contraband = 0

/obj/machinery/security_scanner/unwrenched
	anchored = FALSE

/obj/machinery/security_scanner/Initialize(mapload)
	if(mapload)
		if(anchored)
			on = TRUE
		bypass_filter = TRUE
		check_items = TRUE
		check_records = TRUE
		check_arrests = TRUE
		report_scans = TRUE
	. = ..()

/obj/machinery/security_scanner/power_change()
	if(powered())
		stat &= ~NOPOWER
		update_icon()
	else
		on = FALSE
		stat |= NOPOWER
		update_icon()

/obj/machinery/security_scanner/attackby(obj/item/W, mob/user)
	if(emagged)
		to_chat(user, SPAN_WARNING("ERROR"))
		return

	if(on)
		to_chat(user, SPAN_WARNING("It must be turned off first!"))
		return

	if(istype(W, /obj/item/card/id))
		if(check_access(user, req_access))
			locked = !locked
			to_chat(user, SPAN_NOTICE("You [locked ? "lock" : "unlock"] \the [src] interface."))
		else
			to_chat(user, SPAN_WARNING("Access denied."))
		return

	if(istype(W, /obj/item/wrench))
		visible_message(
			SPAN_NOTICE("You begin [anchored ? "un" : ""]securing [src]..."),
			SPAN_NOTICE("[user] begin [anchored ? "un" : ""]securing [src]..."))
		playsound(src, 'sound/items/Ratchet.ogg', 50, 1)
		if(do_after(user, 20))
			visible_message(
				SPAN_NOTICE("You [anchored ? "un" : ""]secure [src]."),
				SPAN_NOTICE("[user] [anchored ? "un" : ""]secure [src]."))
			anchored = !anchored
			playsound(src, 'sound/items/Deconstruct.ogg', 50, 1)
		return

	if(istype(W, /obj/item/card/emag))
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
			Use <b>security bypass</b> filter: <a href='?src=\ref[src];bypass_filter=1'>[bypass_filter ? "Yes" : "No"]</a><br>
			Use <b>banned items</b> filter: <a href='?src=\ref[src];check_items=1'>[check_items ? "Yes" : "No"]</a><br>
			<br>
			Check for <b>records</b>: <a href='?src=\ref[src];check_records=1'>[check_records ? "Yes" : "No"]</a><br>
			Check for <b>arrests</b>: <a href='?src=\ref[src];check_arrests=1'>[check_arrests ? "Yes" : "No"]</a><br>
			<br>
			Radio reports mode: <a href='?src=\ref[src];report_scans=1'>[report_scans ? "Yes" : "No"]</a><br>
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
	else if(href_list["report_scans"])
		report_scans = !report_scans

	updateUsrDialog()
	return

/obj/machinery/security_scanner/on_update_icon()
	icon_state = "scanner_[on ? "on" : "off"]"

/obj/machinery/security_scanner/Crossed(atom/movable/A)
	if(anchored && on && !stat)
		if(isbot(A) || isanimal(A))		// Ignore that small shit
			trigger(FALSE)
			return ..()
		else if(isliving(A))
			// Stop shouting on mechas
			if(istype(A, /mob/living/exosuit))
				var/mob/living/exosuit/exo = A
				for(var/mob/living/L in exo.pilots)
					// did you know, that ALL mobs can be in pilots? huh?
					if(isliving(L))
						do_scan(L)
			else
				do_scan(A)
		else if(isobserver(A))
			if(emagged)
				trigger(TRUE)
		else if(check_items && isobj(A))
			var/list/items = do_scan_item(A)
			if(items && items.len)
				trigger(TRUE)
				if(A in items)
					report(list("Item" = A))
				else
					report(list("guns" = items, "Violator" = A))
			else
				trigger(FALSE)
	return ..()

/obj/machinery/security_scanner/proc/trigger(num)
	switch(num)
		if(FALSE)
			playsound(src, success_sound, 10, 1)
			flick("scanner_green", src)
		if(TRUE)
			playsound(src, fail_sound, 10, 0)
			flick("scanner_red", src)

/obj/machinery/security_scanner/proc/do_scan_item(obj/I)
	var/list/ret = list()
	if(icon_state != "scanner_on" && istype(I))
		return

	if(subtype_check(I, banned_items))
		ret.Add(I)
		return ret
	else if(subtype_check(I, storage_types) && I.contents)
		for(var/obj/item/thing in I.contents)
			ret.Add(do_scan_item(thing))
	return ret


/obj/machinery/security_scanner/proc/do_scan(mob/target)
	if(!on)
		return

//	to_chat(target, SPAN_NOTICE("You feel [pick("funny", "wrong", "confused", "dangerous", "sickly", "puzzled", "happy")]."))
	var/output = check_target(target)

	if(output["level"] >= SCANNER_THREAT_TRIGGER)
		trigger(TRUE)
		report(output)
	else
		trigger(FALSE)

/obj/machinery/security_scanner/proc/subtype_check(var/I, var/list)
	if(is_type_in_list(I, list))
		return TRUE
	for(var/A in list)
		if(I in subtypesof(A))
			return TRUE
	return FALSE

/obj/machinery/security_scanner/proc/check_target(mob/living/target)
	. = list()
//DEFAULTS
	if(!target || !istype(target))
		.["level"] = 0
		return

	if(emagged)
		.["level"] = 10
		return

	// Agent cards lower threatlevel.
	var/obj/item/card/id/id = target.GetIdCard()
	if(id && istype(id, /obj/item/card/id/syndicate))
		.["level"] -= 2
	// A proper CentCom id is hard currency.
	else if(id && istype(id, /obj/item/card/id/centcom))
		.["level"] = SCANNER_THREAT_RESET
		return

//MEDICAL SCANS

//CYBORG SCANS
	// Cyborg scanning feature will start here... someday
	if(issilicon(target))
		.["level"] = SCANNER_THREAT_RESET
		return

//SECURITY SCANS
	.["guns"] = list()
	if(check_items && ((!pass_access) in target.GetAccess()) && bypass_filter || !bypass_filter)
		for(var/obj/item/I in target.contents)
			if(subtype_check(I, banned_items))
				.["level"] += 4
				.["guns"] += I.name
				break

			else if(subtype_check(I, storage_types) && I.contents)
				for(var/obj/item/thing in I.contents)
					if(subtype_check(thing, banned_items))
						.["level"] += 4
						.["guns"] += thing.name
						break

	if(check_records || check_arrests)
		var/perpname = target.name
		if(id)
			perpname = id.registered_name
		.["Violator"] += perpname

		var/datum/computer_file/report/crew_record/CR = RecordByName(perpname)
		if(check_records && !CR && !target.is_species(SPECIES_MONKEY))
			.["level"] += 4
			.["Unknown"] += TRUE

		if(check_arrests && CR && (CR.get_criminalStatus() == GLOB.arrest_security_status))
			.["level"] += 4
			.["Criminal"] += TRUE

	return

/obj/machinery/security_scanner/proc/report(var/list/list)
	if(!report_scans)	return
//Triggered? Inform security
	GLOB.global_announcer.autosay("Violation detected at [x]:[y]:[z] in [get_area(src)]", name, "Security", z)
	if(!list)	return
//SECURITY REPORTS
	if(list["Item"])
		GLOB.global_announcer.autosay("Detected <b>[list["Item"]]</b>.", name, "Security", z)
		return
	var/violator
	var/criminal
	var/unknown
	if(!list["Violator"])
		violator = "Unknown"
	else
		violator = list["Violator"]
	if(list["Criminal"])
		criminal = TRUE
	if(list["Unknown"])
		unknown = TRUE
	var/list/guns = list()
	if(list["guns"])
		guns.Add(list["guns"])
	if(guns.len)
		GLOB.global_announcer.autosay("Scan result of <b><i>[list["Violator"]]</i></b>.", name, "Security", z)
		GLOB.global_announcer.autosay("Detected next illegal objects: [jointext(guns, ", ")].", name, "Security", z)
	else if(unknown)
		GLOB.global_announcer.autosay("Non registered subject found!", name, "Security", z)
	else if(criminal)
		GLOB.global_announcer.autosay("Found <b><i>[violator]</i></b>, that currently is under arrest!", name, "Security", z)
//MEDICAL REPORTS

//UNKNOWN REPORTS
	else
		GLOB.global_announcer.autosay("Unknown violation.", name, "Security", z)

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
	name = "Security Scanner"
	desc = "The latest innovation in invasive imagery, the programmable NT-X100 will scan anyone who walks through it with fans to simulate being patted down. <em>Nanotrasen is not to be held responsible for any deaths caused by the results the machine gives, or the machine itself. ... Is this one even working properly?</em>"
	icon = 'infinity/icons/obj/machines/security_scanner.dmi'
	icon_state = "scanner_on"
