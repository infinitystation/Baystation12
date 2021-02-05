// Blackout tool, used to trigger massive electricity outttage on ship or station, including connected levels.
// It may have additional shots to use, but currently balanced to one shot.

/datum/uplink_item/item/tools/blackout
	name = "High Pulse Electricity Outage Tool"
	item_cost = 24
	path = /obj/item/device/blackout
	desc = "A device which can create power surge in terminal, spread it in power network and temporally creating blackout."

/obj/item/device/blackout
	name = "high pulse electricity outage tool"
	desc = "A unknown device, probably only cool electrics can know what this can do."
	icon = 'infinity/icons/obj/items.dmi'
	icon_state = "device_blackout-off"

	var/severity = 2
	var/shots = 1
	var/lastUse = 0
	var/Cooldown = (20 MINUTES)

/obj/item/device/blackout/afterattack(var/obj/target as obj, mob/user as mob, proximity)
	if(!proximity)
		return
	if(!istype(target))
		return

	target.add_fingerprint(user)

	if(istype(target, /obj/machinery/power/terminal))
		var/obj/machinery/power/terminal/terminal = target

		if(!terminal.powernet)
			to_chat(user, SPAN_WARNING("This power station isn't connected to power net."))
			return

		if(check_to_use())
			to_chat(user, SPAN_WARNING("Device does not respond. Perhaps you need to try later."))
			return

		if(!shots)
			to_chat(user, SPAN_WARNING("Device does not respond."))
			return

		hacktheenergy(terminal, user)

/obj/item/device/blackout/proc/hacktheenergy(var/obj/machinery/power/terminal/terminal_in, mob/user)
	if(!istype(terminal_in) || !user) return // security

	src.audible_message("<font color=Maroon><b>HackTheEnergy.exe Assistant</b></font> says, \"-- Начало. Подключаемся к терминалу. --\"")
	if(!do_after(user, 30, terminal_in)) return

	src.audible_message("<font color=Maroon><b>HackTheEnergy.exe Assistant</b></font> says, \"-- Подключение к терминалу успешно. Получаем информацию о электросети... --\"")
	if(!do_after(user, 80, terminal_in)) return

	src.audible_message("<font color=Maroon><b>HackTheEnergy.exe Assistant</b></font> says, \"-- Сканирование электросети успешно. Начинаем процедуру пульсации. --\"")
	icon_state = "device_blackout-on"
	playsound(src, 'sound/items/goggles_charge.ogg', 50, 1)

	if(do_after(user, 40, terminal_in))
		src.audible_message("<font color=Maroon><b>HackTheEnergy.exe Assistant</b></font> says, \"-- Готово. Пульсация завершена. \
			Спасибо за пользование нашими услугами, желаем Вам удачной и продуктивной миссии. --\"")

		shots--
		Cooldown = world.time

	//	power_failure(1, 2, GetConnectedZlevels(P.z))

		var/datum/powernet/powernet = terminal_in.powernet
		for(var/obj/machinery/power/terminal/terminal_out in powernet.nodes)
			if(istype(terminal_out.master, /obj/machinery/power/apc))
				var/obj/machinery/power/apc/A = terminal_out.master
				A.energy_fail(rand(30 * severity,60 * severity))
			if(istype(terminal_out.master, /obj/machinery/power/smes/buildable))
				var/obj/machinery/power/smes/buildable/S = terminal_out.master
				S.energy_fail(rand(15 * severity,30 * severity))

		log_and_message_admins("[key_name(usr)] used \the [src.name] on \the [admin_jump_link(terminal_in, src)] to shutdown entire ship.")

	icon_state = "device_blackout-off"

/obj/item/device/blackout/proc/check_to_use()
	return lastUse <= (world.time - Cooldown)
