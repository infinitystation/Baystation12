/proc/is_bsd_fine()
	for(var/obj/machinery/bluespacedrive/M in SSmachines.machinery)
		if(M.stat != 0)
			return 0
		if(M.setup_state <= 4)
			return 0
	return 1

/obj/machinery/bluespacedrive
	name = "bluespace drive"
	desc = "A machine which allows you see ghosts."
	icon = 'infinity/icons/obj/machines/bluespace_drive.dmi'
	icon_state = "bsd"
	anchored = TRUE
	density = TRUE
	idle_power_usage = 2500
	construct_state = /decl/machine_construction/tcomms/panel_closed/cannot_print
	var/setup_state = 0
	var/busy = 0
	var/radiation_power_minimal = 3
	var/hallucination_power_minimal = 2
	var/produces_heat = 0

	maximum_component_parts = list(/obj/item/stock_parts = 15)


/obj/machinery/bluespacedrive/Initialize()
	. = ..()
	on_update_icon()

/obj/machinery/bluespacedrive/Destroy()
	if(evacuation_controller.state != 0)
		// Не вызывать функции со sleep() напрямую в Destroy() ~bear1ake
		addtimer(CALLBACK(evacuation_controller, /datum/evacuation_controller/proc/cancel_evacuation), 1 SECONDS)
		addtimer(CALLBACK(src, /obj/machinery/bluespacedrive/proc/lastAnnounce), 10 SECONDS)
	. = ..()

/obj/machinery/bluespacedrive/proc/lastAnnounce()
	minor_announcement.Announce(message = "Внимание! Обнаружен сбой в работе БСД. Аварийное прекращение работы БСД.")

/obj/machinery/bluespacedrive/attackby(var/obj/item/W as obj, var/mob/user as mob)
	user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
	if(busy)
		return
	if(!user.skill_check(SKILL_ENGINES, SKILL_ADEPT))
		to_chat(user, "You don't know how to work with [src].")
		return
	switch(setup_state)
		if(0)
			if(isWrench(W))
				busy = 1
				user.visible_message("[user] untightens \the [src]'s bolts.", "You untighten \the [src]'s bolts.")
				playsound(src.loc, 'sound/items/Ratchet.ogg', 75, 1)
				if(!do_after(user, 5 SECONDS, src))
					busy = 0
					return
				radiation_power_minimal = 7
				hallucination_power_minimal = 6
				busy = 0
				setup_state++
				to_chat(user, "You finish untighting bolts.")
				return
		if(1)
			if(isCrowbar(W))
				busy = 1
				user.visible_message(SPAN_WARNING("[user] removes a plate from \the [src]!"), "You remove \the [src]'s protecting plate.")
				playsound(src.loc, 'sound/items/Crowbar.ogg', 50, 1)
				if(!do_after(user, 5 SECONDS, src))
					busy = 0
					return
				radiation_power_minimal = 25
				hallucination_power_minimal = 30
				busy = 0
				setup_state++
				to_chat(user, "You finish removing the plate from [src].")
				return
		if(2)
			if(isWirecutter(W))
				busy = 1
				user.visible_message("[user] cuts some cables in \the [src].", "You cut burned out cables in \the [src].")
				playsound(src.loc, 'sound/items/Crowbar.ogg', 50, 1)
				if(!do_after(user, 5 SECONDS, src))
					busy = 0
					return
				busy = 0
				setup_state++
				to_chat(user, "You replaced cables in [src].")
				return
		if(3)
			if(isCoil(W))
				var/obj/item/stack/S = W
				if(!S.use(5))
					return
				busy = 1
				user.visible_message("[user] replaces cables in \the [src].", "You replace cables in \the [src].")
				shock(user, 66, 0.7)
				if(!do_after(user, 5 SECONDS, src))
					busy = 0
					return
				busy = 0
				setup_state++
				to_chat(user, "You replaced cables in [src].")
				return
		if(4)
			if(isMultitool(W))
				busy = 1
				user.visible_message("[user] does something in \the [src] with [W].", "You calibrate \the [src]'s settings.")
				playsound(src.loc, 'sound/effects/compbeep2.ogg', 75, 1)
				if(!do_after(user, 5 SECONDS, src))
					busy = 0
					return
				busy = 0
				playsound(src.loc, 'sound/effects/compbeep5.ogg', 75, 1)
				src.audible_message("[src] beeps 4 times.")
				setup_state++
				to_chat(user, "You finished calibrating.")
				return
		if(5)
			if(isCrowbar(W))
				busy = 1
				user.visible_message("[user] puts back the plate to \the [src].", "You readding \the [src]'s protecting plate.")
				playsound(src.loc, 'sound/items/Crowbar.ogg', 50, 1)
				if(!do_after(user, 5 SECONDS, src))
					busy = 0
					return
				radiation_power_minimal = 7
				hallucination_power_minimal = 6
				busy = 0
				setup_state++
				to_chat(user, "You fixed the plate.")
				return
		if(6)
			if(isWrench(W))
				busy = 1
				user.visible_message("[user] tightens \the [src] bolts.", "You tighten \the [src]'s bolts.")
				playsound(src.loc, 'sound/items/Ratchet.ogg', 75, 1)
				if(!do_after(user, 5 SECONDS, src))
					busy = 0
					return
				radiation_power_minimal = 3
				hallucination_power_minimal = 2
				busy = 0
				setup_state++
				to_chat(user, "You finished tighting [src]'s bolts.")
				return
	if(..())
		return TRUE

/obj/machinery/bluespacedrive/Process()
	for(var/mob/living/carbon/human/subject in view(src, 3)) //supermatter copy-paste
		var/obj/item/organ/internal/eyes/eyes = subject.internal_organs_by_name[BP_EYES]
		if(!eyes)
			continue
		if(BP_IS_ROBOTIC(eyes))
			continue
		if(subject.has_meson_effect())
			continue
		subject.adjust_hallucination(hallucination_power_minimal * 2, hallucination_power_minimal)

	SSradiation.radiate(src, radiation_power_minimal)
	if(produces_heat)
		produce_heat()

	return 1

/obj/machinery/bluespacedrive/on_update_icon()
	if(produces_heat)
		icon_state = "[initial(icon_state)]_charge"
		set_light(0.9, 3, 8, 1, COLOR_CYAN)
		return
	if(stat & (BROKEN|NOPOWER))
		icon_state = "[initial(icon_state)]"
		set_light(0)
	else
		icon_state = "[initial(icon_state)]_on"
		set_light(0.8, 1, 5, 2, COLOR_CYAN)


/obj/machinery/bluespacedrive/proc/charge()
	radiation_power_minimal = 30
	hallucination_power_minimal = 40
	produces_heat = 1
	idle_power_usage = 50000
	on_update_icon()

/obj/machinery/bluespacedrive/proc/discharge()
	radiation_power_minimal = initial(radiation_power_minimal)
	hallucination_power_minimal = initial(hallucination_power_minimal)
	produces_heat = 0
	idle_power_usage = initial(idle_power_usage)
	on_update_icon()

/obj/machinery/bluespacedrive/proc/produce_heat()
	if(!(stat & (NOPOWER|BROKEN)))
		var/turf/simulated/L = loc
		if(istype(L))
			var/datum/gas_mixture/env = L.return_air()

			var/transfer_moles = 0.25 * env.total_moles

			var/datum/gas_mixture/removed = env.remove(transfer_moles)

			if(removed)

				var/heat_produced = idle_power_usage	//obviously can't produce more heat than the machine draws from it's power source

				removed.add_thermal_energy(heat_produced)

			env.merge(removed)
			if(env.temperature > 350)
				evacuation_controller.cancel_evacuation()
				discharge()
				minor_announcement.Announce(message = "Внимание! Обнаружен сбой в работе БСД. Аварийное прекращение работы БСД.")
	else
		evacuation_controller.cancel_evacuation()
		discharge()
		minor_announcement.Announce(message = "Внимание! Обнаружен сбой в работе БСД. Аварийное прекращение работы БСД.")
