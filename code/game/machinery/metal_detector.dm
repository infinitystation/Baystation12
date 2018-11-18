/obj/machinery/metal_detector
	name = "weapon detector"
	desc = "...Don't pass it with weapon or grenade if you don't want to be spotted..."
	icon = 'icons/obj/machines/metal_detector.dmi'
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
	var/check_guns = 1
	var/check_grenades = 1
	var/cooldown = 0 //Uses to pervent spamming

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
		to_chat(user, "<span class='warning'>ERROR</span>")
		return
	if(on)
		to_chat(user, "<span class='warning'>It must be turned off first!</span>")
		return

	if(istype(W, /obj/item/weapon/card/id))
		if(allowed(usr))
			locked = !locked
			to_chat(user, "<span class='notice'>You [ locked ? "lock" : "unlock"] the metal detector interface.</span>")
		else
			to_chat(user, "<span class='warning'>Access denied.</span>")
			return

	if(istype(W, /obj/item/weapon/wrench))
		visible_message(
			"<span class='notice'>You begin [anchored ? "un" : ""]securing [name]...</span>",
			"<span class='notice'>[user] begin [anchored ? "un" : ""]securing [name]...</span>")
		playsound(src.loc, 'sound/items/Ratchet.ogg', 50, 1)
		if(do_after(user, 20))
			visible_message(
				"<span class='notice'>You [anchored ? "un" : ""]secure [name].</span>",
				"<span class='notice'>[user] [anchored ? "un" : ""]secure [name].</span>")
			anchored = !anchored
			playsound(src.loc, 'sound/items/Deconstruct.ogg', 50, 1)
		return

	if(istype(W, /obj/item/weapon/card/emag))
		emag_act()
		return

/obj/machinery/metal_detector/attack_hand(mob/user as mob)
	if(stat & NOPOWER)
		to_chat(user, "<span class='warning'>The [src] seems unpowered.</span>")
		return
	if(!anchored)
		to_chat(user, "<span class='warning'>It must be secured first!</span>")
		return
	if(emagged)
		to_chat(user, "<span class='warning'>ERROR</span>")
		return

	interact(user)
	usr.set_machine(src)

/obj/machinery/metal_detector/attack_ai(mob/user as mob)
	return attack_hand(user)

/obj/machinery/metal_detector/interact(mob/user as mob)
	var/dat
	dat += "<br>Lock behaviour controls: <a href='?src=\ref[src];locked=1'>[locked ? "Yes" : "No"]</a><br>"

	if(!locked)
		dat += text({"
			Status: <a href='?src=\ref[src];on=1'>[on ? "On" : "Off"]</a><br>
			Ignore access: <a href='?src=\ref[src];ignore_access=1'>[ignore_access ? "Yes" : "No"]</a><br>
			Check guns: <a href='?src=\ref[src];check_guns=1'>[check_guns ? "Yes" : "No"]</a><br>
			Check grenades: <a href='?src=\ref[src];check_grenades=1'>[check_grenades ? "Yes" : "No"]</a><br>
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
	else if(href_list["check_guns"])
		check_guns = !check_guns
	else if(href_list["check_grenades"])
		check_grenades = !check_grenades

	updateUsrDialog()
	return

/obj/machinery/metal_detector/on_update_icon()
	if(anchored && on && !stat)
		icon_state = "metal-detector-working"
	else
		icon_state = "metal-detector"

/obj/machinery/metal_detector/proc/try_detect_banned(obj/item/I) //meh
	if(cooldown)
		return 0
	if((check_guns && istype(I,/obj/item/weapon/gun)) || (check_grenades && istype(I,/obj/item/weapon/grenade)))
		icon_state = "metal-detector-warning"
		visible_message("<span class='warning'>[src] triggers!</span>")
		playsound(loc, 'sound/effects/alert.ogg', 50, 1)
		cooldown = 1
		spawn(15)
			update_icon()
			sleep(30)
			cooldown = 0
			return 1
	else return 0

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
				else
					if(try_detect_banned(O))
						return

/obj/machinery/metal_detector/emag_act()
	if(!emagged)
		emagged = 1
		playsound(loc, 'sound/effects/sparks4.ogg', 50, 1)
		var/datum/effect/effect/system/spark_spread/s = new /datum/effect/effect/system/spark_spread
		s.set_up(5, 1, src)
		s.start()
		desc += "<span class='warning'>It seems malfunctioning.</span>"
		return

/obj/machinery/metal_detector/emp_act(severity)
	return emag_act()