/obj/machinery/cargopad
	name = "cargo telepad"
	desc = "A telepad used by the Rapid Crate Sender."
	icon = 'icons/obj/telescience.dmi'
	icon_state = "cpad-idle"
	var/pad_type = "cpad"
	var/stage = 0
	layer = 2
	anchored = 1
	use_power = 1
	idle_power_usage = 200
	active_power_usage = 5000

/obj/machinery/cargopad/attackby(obj/item/weapon/W as obj, mob/user as mob)
	if(istype(W, /obj/item/weapon/wrench))
		playsound(src, 'sound/items/Ratchet.ogg', 50, 1)
		if(do_after(user, 20, src))
			anchored = !anchored
			to_chat(user, "<span class='notice'>The [src] is now [anchored == 1 ? "" : "un"]secured.</span>")
		return

	if(istype(W, /obj/item/weapon/screwdriver))
		playsound(src, 'sound/items/Screwdriver.ogg', 50, 1)
		stage = !stage
		to_chat(user, "<span class = 'notice'>You [stage == 1 ? "un" : ""]screw the telepad's tracking beacon.</span>")
		return

	if(istype(W, /obj/item/weapon/weldingtool) && stage == 1)
		playsound(src, 'sound/items/Welder.ogg', 50, 1)
		if(do_after(user, 50, src))
			to_chat(user, "<span class = 'notice'> You disassemble the telepad.</span>")
			new /obj/item/stack/material/steel(get_turf(src))
			new /obj/item/stack/material/glass(get_turf(src))
			qdel(src)

/obj/machinery/cargopad/attackby(obj/item/weapon/W as obj, mob/user as mob)
	if(istype(W, /obj/item/weapon/rcs))
		var/obj/item/weapon/rcs/rcs = W
		if(isnull(rcs.pad) || rcs.emagged)
			rcs.pad = src
			playsound(W.loc, 'sound/machines/twobeep.ogg', 30, 1)
			to_chat(user, "<span class='notice'>You connect \the [rcs] to [src]</span>.")
		else
			to_chat(user, "<span class='warning'>Your device is already was linked to [rcs.pad == src ? "this" : "another"] cardo telepad.</span>")
		return
	..()

///TELEPAD CALLER///
/obj/item/device/telepad_beacon
	name = "telepad beacon"
	desc = "Use to warp in a cargo telepad."
	icon = 'icons/obj/radio.dmi'
	icon_state = "beacon"
	item_state = "signaler"
	origin_tech = "bluespace=3"

/obj/item/device/telepad_beacon/attack_self(mob/user as mob)
	if(user)
		to_chat(user, "<span class = 'notice'>Locked In</span>")
		new /obj/machinery/cargopad(user.loc)
		playsound(src, 'sound/effects/pop.ogg', 100, 1, 1)
		user.drop_item()
		qdel(src)
	return

///HANDHELD TELEPAD USER///
# define RPS_MAXCHARGE 100
/obj/item/weapon/rcs
	name = "rapid-crate-sender (RCS)"
	desc = "Use this to send crates and closets to cargo telepads."
	icon = 'icons/obj/telescience.dmi'
	icon_state = "rcs"
	item_state = "rcd"
	obj_flags = OBJ_FLAG_CONDUCTIBLE
	item_flags = ITEM_FLAG_NO_PRINT
	pass_flags = PASS_FLAG_TABLE
	force = 5
	throwforce = 10
	throw_speed = 1
	throw_range = 5
	var/charge = 100
	var/obj/machinery/cargopad/pad = null
	var/mode = 0
	var/emagged = FALSE
	var/teleporting = FALSE

/obj/item/weapon/rcs/Initialize()
	. = ..()
	START_PROCESSING(SSobj, src)

/obj/item/weapon/rcs/examine()
	..()
	to_chat(usr, "<span class='notice'>There are [charge]% charges left.</span>")

/obj/item/weapon/rcs/Destroy()
	START_PROCESSING(SSobj, src)
	. = ..()

/obj/item/weapon/rcs/Process()
	if(charge < RPS_MAXCHARGE)
		charge += 0.25

/obj/item/weapon/rcs/afterattack(var/obj/target as obj, mob/user as mob, proximity)
	if(!proximity)
		return

	if(!istype(target))
		return

	if(istype(target, /obj/machinery/cargopad))
		return

	if(teleporting)
		return

	var/turf/T = get_turf(src)
	if(isnull(pad))
		T.audible_message("<font color=Maroon><b>Rapid Crate Sender Assistant</b></font> says, \"ERROR - Cargo pad is not linked with device.\"")
		return

	if(!(locate(pad) in SSmachines.machinery))
		T.audible_message("<font color=Maroon><b>Rapid Crate Sender Assistant</b></font> says, \"ERROR - Unable to locate linked cargo pad.\"")
		return

	if(!istype(target, /obj/structure/closet))
		T.audible_message("<font color=Maroon><b>Rapid Crate Sender Assistant</b></font> says, \"ERROR - This object is blacklisted and can't be send.\"")
		return

	if(target.anchored)
		T.audible_message("<font color=Maroon><b>Rapid Crate Sender Assistant</b></font> says, \"ERROR - This object is immovable and can't be send.\"")
		return

	if(charge < 25)
		T.audible_message("<font color=Maroon><b>Rapid Crate Sender Assistant</b></font> says, \"ERROR - Charge is too low to use send function.\"")
		return
	else
		teleporting = TRUE
		var/time_to_send = 30 + (10 * w_class)
		if(do_after(user, time_to_send, target))
			T.audible_message("<font color=Maroon><b>Rapid Crate Sender Assistant</b></font> says, \"The marking was successful, the target will be sent in a few seconds.\"")
			if(send(target))
				charge -= 50
		teleporting = FALSE
		return

/obj/item/weapon/rcs/proc/send(var/obj/target as obj)
	if(target)
		var/turf/T = get_turf(pad)
		T.audible_message("<font color=Maroon><b>Cargo Pad System</b></font> says, \"Warning, incoming package detected.\"")
		sleep(25)

		playsound(get_turf(target), 'sound/items/goggles_charge.ogg', 50)
		sleep(40)

		playsound(get_turf(target), 'sound/weapons/emitter2.ogg', 25, 1, extrarange = 3, falloff = 5)
		playsound(T, 'sound/weapons/emitter2.ogg', 25, 1, extrarange = 3, falloff = 5)
		flick("[pad.pad_type]-beam", pad)
		do_teleport(target, pad)
		return 1
	return 0

/obj/item/weapon/rcs/attack_self(mob/user)
	if(emagged)
		if(mode == 0)
			mode = 1
			playsound(src.loc, 'sound/effects/pop.ogg', 50, 0)
			to_chat(user, "<span class = 'danger'>The telepad locator has become uncalibrated.</span>")
		else
			mode = 0
			playsound(src.loc, 'sound/effects/pop.ogg', 50, 0)
			to_chat(user, "<span class = 'notice'>You calibrate the telepad locator.</span>")

/obj/item/weapon/rcs/attackby(obj/item/W, mob/user)
	if(istype(W,  /obj/item/weapon/card/emag) && emagged == 0)
		emagged = TRUE
		var/datum/effect/effect/system/spark_spread/s = new /datum/effect/effect/system/spark_spread
		s.set_up(5, 1, src)
		s.start()
		to_chat(user, "<span class = 'notice'>You emag the RCS. Click on it to toggle between modes.</span>")
		return
