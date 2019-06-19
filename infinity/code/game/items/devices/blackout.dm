// Blackout tool, used to trigger massive electricity outttage on ship or station, including connected levels.
// It may have additional shots to use, but currently balanced to one shot.

/obj/item/device/blackout
	name = "high pulse electricity outage tool"
	desc = "A unknown device, probably only cool electrics can know what this can do."
	icon = 'icons/obj/items_inf.dmi'
	icon_state = "device_blackout-off"

	var/shots = 1
	var/lastUse = 0
	var/Cooldown = (20 MINUTES)

/obj/item/device/blackout/afterattack(var/obj/target as obj, mob/user as mob, proximity)
	if(!proximity)
		return
	if(!istype(target))
		return

	target.add_fingerprint(user)
	if(istype(target, /obj/machinery/power/apc) || istype(target, /obj/machinery/power/smes)) // bit tricky
		if(istype(target, /obj/machinery/power/apc))
			var/obj/machinery/power/apc/A = target
			if(!A.wiresexposed)
				return

			if(!A.terminal)
				to_chat(user, SPAN_WARNING("This power station isn't connected to global power channel."))
				return

		if(istype(target, /obj/machinery/power/smes))
			var/obj/machinery/power/smes/S = target
			if(!S.panel_open)
				return

			if(S.outputting != 2)
				to_chat(user, SPAN_WARNING("This power station isn't connected to global power channel."))
				return

		if(check_to_use())
			to_chat(user, SPAN_WARNING("Device does not respond. Perhaps you need to try later."))
			return

		if(!shots)
			to_chat(user, SPAN_WARNING("Device does not respond."))
			return

		hacktheenergy(target, user)

/obj/item/device/blackout/proc/hacktheenergy(var/obj/target, mob/user)
	if(!target || !user) return // security

	src.audible_message("<font color=Maroon><b>Blackout Assistant</b></font> says, \"-- START -- Connecting to power supply... --\"")

	if(do_after(user, 80, target))
		icon_state = "device_blackout-on"
		src.audible_message("<font color=Maroon><b>Blackout Assistant</b></font> says, \"-- PROCESS -- Connected. Sending pulse... --\"")
		playsound(get_turf(target), 'sound/items/goggles_charge.ogg', 50, 1)

		if(do_after(user, 40, target))
			src.audible_message("<font color=Maroon><b>Blackout Assistant</b></font> says, \"-- DONE -- Pulsing procedure done. \
				Thank you, and have a very safe, and productive day. --\"")

			shots--
			Cooldown = world.time

			power_failure(1, 2, GetConnectedZlevels(target.z))

			log_and_message_admins("[key_name(usr)] used \the [src.name] on \the [admin_jump_link(target, src)] to shutdown entire ship.")

	icon_state = "device_blackout-off"

/obj/item/device/blackout/proc/check_to_use()
	return lastUse <= (world.time - Cooldown)
