//This file was auto-corrected by findeclaration.exe on 25.5.2012 20:42:33
var/global/list/rad_collectors = list()

/obj/machinery/power/rad_collector
	name = "radiation collector array"
	desc = "A device which uses radiation and phoron to produce power."
	icon = 'infinity/icons/obj/singularity.dmi'
	icon_state = "ca"
	anchored = 0
	density = 1
	req_access = list(access_engine_equip)
	var/obj/item/weapon/tank/phoron/P = null

	var/health = 100
	var/max_safe_temp = 1000 + T0C
	var/melted

	var/last_power = 0
	var/last_power_new = 0
	var/active = 0
	var/locked = 0
	var/drainratio = 1
	var/recievepulse_mult = 0

/obj/machinery/power/rad_collector/Initialize()
	. = ..()
	rad_collectors += src
	component_parts = list(
		new /obj/item/weapon/circuitboard/rad_collector,
		new /obj/item/weapon/stock_parts/manipulator,
		new /obj/item/weapon/stock_parts/manipulator,
		new /obj/item/weapon/stock_parts/capacitor,
		new /obj/item/weapon/stock_parts/capacitor)
	RefreshParts()

/obj/machinery/power/rad_collector/RefreshParts()
	drainratio = initial(drainratio)
	recievepulse_mult = initial(recievepulse_mult)
	for(var/obj/item/weapon/stock_parts/manipulator/M in component_parts)
		drainratio -= M.rating * 0.1 - 0.1
	for(var/obj/item/weapon/stock_parts/capacitor/C in component_parts)
		recievepulse_mult += C.rating * 2.5

/obj/machinery/power/rad_collector/Destroy()
	rad_collectors -= src
	. = ..()

/obj/machinery/power/rad_collector/Process()
	if((stat & BROKEN) || melted)
		return
	var/turf/T = get_turf(src)
	if(T)
		var/datum/gas_mixture/our_turfs_air = T.return_air()
		if(our_turfs_air.temperature > max_safe_temp)
			health -= ((our_turfs_air.temperature - max_safe_temp) / 10)
			if(health <= 0)
				collector_break()

	//so that we don't zero out the meter if the SM is processed first.
	last_power = last_power_new
	last_power_new = 0

	if(P && active)
		var/rads = SSradiation.get_rads_at_turf(get_turf(src))
		if(rads)
			receive_pulse(rads * recievepulse_mult) //Maths is hard

	if(P)
		if(P.air_contents.gas["phoron"] == 0)
			investigate_log("<font color='red'>out of fuel</font>.","singulo")
			eject()
		else
			P.air_adjust_gas("phoron", -0.001*drainratio)

/obj/machinery/power/rad_collector/attack_hand(mob/user as mob)
	if(anchored)
		if((stat & BROKEN) || melted)
			to_chat(user, "<span class='warning'>The [src] is completely destroyed!</span>")
		if(!src.locked)
			toggle_power()
			user.visible_message("[user.name] turns the [src.name] [active? "on":"off"].", \
			"You turn the [src.name] [active? "on":"off"].")
			investigate_log("turned [active?"<font color='green'>on</font>":"<font color='red'>off</font>"] by [user.key]. [P?"Fuel: [round(P.air_contents.gas["phoron"]/0.29)]%":"<font color='red'>It is empty</font>"].","singulo")
			return
		else
			to_chat(user, "<span class='warning'>The controls are locked!</span>")
			return


/obj/machinery/power/rad_collector/attackby(obj/item/W, mob/user)
	if(istype(W, /obj/item/weapon/tank/phoron))
		if(!anchored)
			to_chat(user, "<span class='warning'>The [src] needs to be secured to the floor first.</span>")
			return
		if(P)
			to_chat(user, "<span class='warning'>There's already a phoron tank loaded.</span>")
			return
		if(panel_open)
			to_chat(user, "<span class='notice'>Close the panel first.</span>")
			return
		if(!user.unEquip(W, src))
			return
		P = W
		update_icon()
		return
	if(isCrowbar(W) && P && !locked)
		eject()
		return
	if(isWrench(W))
		if(P)
			to_chat(user, "<span class='notice'>Remove the phoron tank first.</span>")
			return
		if(panel_open)
			to_chat(user, "<span class='notice'>Close the panel first.</span>")
			return
		if(active)
			to_chat(user, "<span class='notice'>Turn \the [src] first.</span>")
			return
		for(var/obj/machinery/power/rad_collector/R in get_turf(src))
			if(R != src)
				to_chat(user, "<span class='warning'>You cannot install more than one collector on the same spot.</span>")
				return
		playsound(src.loc, 'sound/items/Ratchet.ogg', 75, 1)
		anchored = !src.anchored
		user.visible_message("[user.name] [anchored? "secures":"unsecures"] the [src.name].", \
			"You [anchored? "secure":"undo"] the external bolts.", \
			"You hear a ratchet")
		if(anchored && !(stat & BROKEN))
			connect_to_network()
		else
			disconnect_from_network()
		return
	if(istype(W, /obj/item/weapon/card/id)||istype(W, /obj/item/modular_computer) && allowed(user))
		if(allowed(user))
			if(active)
				locked = !src.locked
				to_chat(user, "The controls are now [locked ? "locked." : "unlocked."]")
			else
				locked = 0 //just in case it somehow gets locked
				to_chat(user, "<span class='warning'>The controls can only be locked when the [src] is active</span>")
		else
			to_chat(user, "<span class='warning'>Access denied!</span>")
		return
	if(active)
		to_chat(user, "<span class='notice'>Turn \the [src] first.</span>")
		return
	if(anchored)
		to_chat(user, "<span class='warning'>The [src] needs to be unsecured from the floor first.</span>")
		return
	if(default_deconstruction_screwdriver(user, W))
		return
	if(default_deconstruction_crowbar(user, W))
		return
	if(default_part_replacement(user, W))
		return
	return

/obj/machinery/power/rad_collector/examine(mob/user)
	if (..(user, 3) && !(stat & BROKEN))
		to_chat(user, "The meter indicates that \the [src] is collecting [last_power] W.")
		return 1

/obj/machinery/power/rad_collector/ex_act(severity)
	switch(severity)
		if(2, 3)
			eject()
	return ..()

/obj/machinery/power/rad_collector/proc/collector_break()
	if(P && P.air_contents)
		var/turf/T = get_turf(src)
		if(T)
			T.assume_air(P.air_contents)
			audible_message(SPAN_DANGER("\The [P] detonates, sending shrapnel flying!"))
			fragmentate(T, 2, 4, list(/obj/item/projectile/bullet/pellet/fragment/tank/small = 3, /obj/item/projectile/bullet/pellet/fragment/tank = 1))
			explosion(T, -1, -1, 0)
			QDEL_NULL(P)
	disconnect_from_network()
	stat |= BROKEN
	melted = TRUE
	anchored = FALSE
	active = FALSE
	desc += " This one is destroyed beyond repair."
	update_icon()

/obj/machinery/power/rad_collector/return_air()
	if(P)
		return P.return_air()

/obj/machinery/power/rad_collector/proc/eject()
	locked = 0
	var/obj/item/weapon/tank/phoron/Z = src.P
	if (!Z)
		return
	Z.dropInto(loc)
	Z.reset_plane_and_layer()
	src.P = null
	if(active)
		toggle_power()
	else
		update_icon()

/obj/machinery/power/rad_collector/proc/receive_pulse(var/pulse_strength)
	if(P && active)
		var/power_produced = 0
		power_produced = P.air_contents.gas["phoron"]*pulse_strength*20
		add_avail(power_produced)
		last_power_new = power_produced
		return
	return


/obj/machinery/power/rad_collector/on_update_icon()
	if(melted)
		icon_state = "ca_melt"
	else if(active)
		icon_state = "ca_on"
	else
		icon_state = "ca"

	overlays.Cut()
	if(P)
		overlays += image('infinity/icons/obj/singularity.dmi', "ptank")
	if(stat & (NOPOWER|BROKEN))
		return
	if(active)
		overlays += image('infinity/icons/obj/singularity.dmi', "on")


/obj/machinery/power/rad_collector/proc/toggle_power()
	active = !active
	if(active)
		flick("ca_active", src)
	else
		flick("ca_deactive", src)
	update_icon()
