/obj/machinery/metal_detector
	name = "weapon detector"
	desc = "Don't pass it with weapon or grenade if you don't want to be spotted..."
	icon = 'infinity/icons/obj/machines/metal_detector.dmi'
	icon_state = "metal-detector"
	anchored = 1
	var/on = 0
	var/locked = 1
	idle_power_usage = 10
	active_power_usage = 120 // No idea what the realistic amount would be.
	use_power = 1
	density = 0
	layer = 3
	req_access = list(access_security)
	var/ignore_access = 1 // It won't check persons who have security access
	var/cooldown = 0 //Uses to pervent spamming

	var/list/banned_items = list(/obj/item/weapon/gun, /obj/item/weapon/grenade)
	var/list/banned_materials = list(MATERIAL_STEEL)

/obj/machinery/metal_detector/power_change()
	if(powered())
		stat &= ~NOPOWER
		update_icon()
	else
		on = 0
		stat |= NOPOWER
		update_icon()

/obj/machinery/metal_detector/attackby(obj/item/weapon/W, mob/user)
	if(emagged)
		to_chat(user, SPAN_WARNING("ERROR"))
		return
	if(on)
		to_chat(user, SPAN_WARNING("It must be turned off first!"))
		return

	if(istype(W, /obj/item/weapon/card/id))
		if(allowed(usr))
			locked = !locked
			to_chat(user, SPAN_NOTICE("You [locked ? "lock" : "unlock"] the metal detector interface."))
		else
			to_chat(user, SPAN_WARNING("Access denied."))
			return

	if(istype(W, /obj/item/weapon/wrench))
		visible_message(
			SPAN_NOTICE("You begin [anchored ? "un" : ""]securing [name]..."),
			SPAN_NOTICE("[user] begin [anchored ? "un" : ""]securing [name]..."))
		playsound(src.loc, 'sound/items/Ratchet.ogg', 50, 1)
		if(do_after(user, 20))
			visible_message(
				SPAN_NOTICE("You [anchored ? "un" : ""]secure [name]."),
				SPAN_NOTICE("[user] [anchored ? "un" : ""]secure [name]."))
			anchored = !anchored
			playsound(src.loc, 'sound/items/Deconstruct.ogg', 50, 1)
		return

	if(istype(W, /obj/item/weapon/card/emag))
		emag_act()
		return

/obj/machinery/metal_detector/physical_attack_hand(mob/user as mob)
	if(stat & NOPOWER)
		to_chat(user, SPAN_WARNING("The [src] seems unpowered."))
		return
	if(!anchored)
		to_chat(user, SPAN_WARNING("It must be secured first!"))
		return
	if(emagged)
		to_chat(user, SPAN_WARNING("ERROR"))
		return

	interact(user)
	usr.set_machine(src)

/obj/machinery/metal_detector/attack_ai(mob/user as mob)
	return physical_attack_hand(user)

/obj/machinery/metal_detector/interact(mob/user as mob)
	var/dat
	dat += "<br>Lock behaviour controls: <a href='?src=\ref[src];locked=1'>[locked ? "Yes" : "No"]</a><br>"

	if(!locked)
		dat += text({"
			Status: <a href='?src=\ref[src];on=1'>[on ? "On" : "Off"]</a><br>
			Ignore access: <a href='?src=\ref[src];ignore_access=1'>[ignore_access ? "Yes" : "No"]</a><br>
			</tt>"})

	var/datum/browser/popup = new(user, "metal_detector", "Security Metal Detector")
	popup.set_content(dat)
	popup.open()
	return

/obj/machinery/metal_detector/Topic(href, href_list)
	..()

	if(href_list["locked"] && allowed(usr))
		locked = !locked
	else if(href_list["on"])
		on = !on
		update_icon()
	else if(href_list["ignore_access"])
		ignore_access = !ignore_access

	updateUsrDialog()
	return

/obj/machinery/metal_detector/on_update_icon()
	if(anchored && on && !stat)
		icon_state = "metal-detector-working"
	else
		icon_state = "metal-detector"

/obj/machinery/metal_detector/proc/try_detect_banned(obj/item/I) //meh
	if(cooldown) return FALSE
	var/triggered
	if(istype(I, banned_items))
		triggered = TRUE
	if(istype(I, /obj/item/weapon/material))
		var/obj/item/weapon/material/M = I
		if(M.default_material in banned_materials)
			triggered = TRUE

	if(triggered)
		icon_state = "metal-detector-warning"
		visible_message(SPAN_WARNING("[src] triggers!"))
		playsound(loc, 'sound/effects/alert.ogg', 50, 1)
		cooldown = 1
		spawn(15)
			update_icon()
			sleep(30)
			cooldown = 0
			return 1
	else return FALSE

/obj/machinery/metal_detector/Crossed(var/mob/living/carbon/M)
	if(anchored && on && !(stat & NOPOWER))
		if(emagged && M)
			if (electrocute_mob(M, get_area(src), src))
				var/datum/effect/effect/system/spark_spread/s = new /datum/effect/effect/system/spark_spread
				s.set_up(5, 1, src)
				s.start()
				playsound(loc, 'sound/effects/sparks1.ogg', 100, 0)
			return

		if((M && ignore_access && !allowed(M)) || (M && !ignore_access))
			for(var/obj/item/O in M.contents)
				if(istype(O, /obj/item/weapon/storage))
					var/obj/item/weapon/storage/S = O
					for(var/obj/item/I in S.contents)
						if(try_detect_banned(I))
							return
				if(istype(O, /obj/item/clothing/suit/storage))
					var/obj/item/clothing/S = O
					for(var/obj/item/I in S.contents)
						if(try_detect_banned(I))
							return
				else
					if(try_detect_banned(O))
						return

/obj/machinery/metal_detector/emag_act()
	if(!emagged)
		emagged = TRUE
		playsound(loc, 'sound/effects/sparks4.ogg', 50, 1)
		var/datum/effect/effect/system/spark_spread/s = new /datum/effect/effect/system/spark_spread
		s.set_up(5, 1, src)
		s.start()
		desc += SPAN_WARNING("<br>It seems malfunctioning.")
		return

/obj/machinery/metal_detector/emp_act(severity)
	return emag_act()
