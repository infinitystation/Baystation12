/obj/machinery/stasis
	name = "stasis pod"
	desc = "A comfortable pod for stasing of wounded occupants. Similar pods were on first humanity's colonial ships. Now days, you can see them in EMT centers with stasis setting from 20x to 22x."
	icon = 'icons/obj/Cryogenic2.dmi'
	icon_state = "stasis_0"
	density = 1
	anchored = 1
	clicksound = 'sound/machines/buttonbeep.ogg'
	clickvol = 30
	var/mob/living/carbon/human/occupant = null
	var/stasis = 20

	use_power = 1
	idle_power_usage = 15
	active_power_usage = 550 //builtin health analyzer, dialysis machine, injectors.

/obj/machinery/stasis/Process()
	if(stat & (NOPOWER|BROKEN))
		return
	if(iscarbon(occupant) && stasis > 1)
		occupant.SetStasis(stasis)

/obj/machinery/stasis/update_icon()
	icon_state = "stasis_[occupant ? "1" : "0"]"

/obj/machinery/stasis/attack_hand(var/mob/user)
	if(..())
		return 1

	ui_interact(user)

/obj/machinery/stasis/ui_interact(var/mob/user, var/ui_key = "main", var/datum/nanoui/ui = null, var/force_open = 1, var/datum/topic_state/state = GLOB.outside_state)
	var/data[0]

	data["power"] = stat & (NOPOWER|BROKEN) ? 0 : 1

	if(occupant)
		var/scan = medical_scan_results(occupant)
		scan = replacetext(scan,"'notice'","'white'")
		scan = replacetext(scan,"'warning'","'average'")
		scan = replacetext(scan,"'danger'","'bad'")
		data["occupant"] =scan
	else
		data["occupant"] = 0

	ui = GLOB.nanomanager.try_update_ui(user, src, ui_key, ui, data, force_open)
	if(!ui)
		ui = new(user, src, ui_key, "stasis.tmpl", "Stasis Pod UI", 600, 600, state = state)
		ui.set_initial_data(data)
		ui.open()
		ui.set_auto_update(1)

/obj/machinery/stasis/CanUseTopic(user)
	if(user == occupant)
		to_chat(usr, "<span class='warning'>You can't reach the controls from the inside.</span>")
		return STATUS_CLOSE
	return ..()

/obj/machinery/stasis/OnTopic(user, href_list)
	if(href_list["eject"])
		go_out()
		return TOPIC_REFRESH

/obj/machinery/stasis/attack_ai(var/mob/user)
	return attack_hand(user)

/obj/machinery/stasis/MouseDrop_T(var/mob/target, var/mob/user)
	if(!CanMouseDrop(target, user))
		return
	if(!istype(target))
		return
	if(target.buckled)
		to_chat(user, "<span class='warning'>Unbuckle the subject before attempting to move them.</span>")
		return
	go_in(target, user)

/obj/machinery/stasis/relaymove(var/mob/user)
	..()
	go_out()

/obj/machinery/stasis/emp_act(var/severity)

	if(stat & (BROKEN|NOPOWER))
		..(severity)
		return

	if(occupant)
		go_out()

	..(severity)

/obj/machinery/stasis/proc/go_in(var/mob/M, var/mob/user)
	if(!M)
		return
	if(stat & (BROKEN|NOPOWER))
		return
	if(occupant)
		to_chat(user, "<span class='warning'>\The [src] is already occupied.</span>")
		return

	if(M == user)
		visible_message("\The [user] starts climbing into \the [src].")
	else
		visible_message("\The [user] starts putting [M] into \the [src].")

	if(do_after(user, 20, src))
		if(occupant)
			to_chat(user, "<span class='warning'>\The [src] is already occupied.</span>")
			return
		M.stop_pulling()
		if(M.client)
			M.client.perspective = EYE_PERSPECTIVE
			M.client.eye = src
		M.forceMove(src)
		update_use_power(2)
		occupant = M
		update_icon()

/obj/machinery/stasis/proc/go_out()
	if(!occupant)
		return
	if(occupant.client)
		occupant.client.eye = occupant.client.mob
		occupant.client.perspective = MOB_PERSPECTIVE
	if(occupant.loc == src)
		occupant.dropInto(loc)
	occupant = null
	update_use_power(1)
	update_icon()