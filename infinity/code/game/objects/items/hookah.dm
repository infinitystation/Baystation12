/*
 by hacso#9577
 bugs send in discord
*/

/obj/item/hookah
	name = "Hookah"
	icon = 'infinity/icons/obj/item/hookah.dmi'
	desc = "A hookah with a jar of water at the bottom. AMOUNT tubes come out through it.\n"
	w_class = ITEM_SIZE_LARGE
	icon_state = "hookah_0"
	item_state = "hookah_0"
	randpixel = 0
	health = 30
	matter = list(MATERIAL_IRON = 65)
	var/smoketime = 0
	var/maxsmoketime = 5000
	var/tobacco_lit = 0
	var/chem_volume = 50
	var/icon_on = "hookah"
	var/lit = 0 // litghted status
	var/tubes_amount = 3
	var/list/tubes = list()
	var/list/tubes_archive = list()
	var/genericmes = "<span class='info'>USER lights NAME with the FLAME.</span>"
	var/matchmes = "<span class='info'>USER lights NAME with FLAME.</span>"
	var/lightermes = "<span class='info'>USER manages to light NAME with FLAME.</span>"
	var/zippomes = "<span class='rose'>With much care, USER lights NAME with FLAME.</span>"
	var/weldermes = "<span class='info'>USER recklessly lights NAME with FLAME.</span>"
	var/ignitermes = "<span class='info'>USER fiddles with FLAME, and manages to light NAME with the power of science.</span>"
	var/list/filling
	var/gas_consumption = 0.04
	var/list/item_status = list("There is very little coal inside", "Here is a quarter of the full tobacco", "Half full of coal", "Almost full of coal", "Full of coal")

/obj/item/hookah/New()
	..()
	atom_flags |= ATOM_FLAG_NO_REACT // so it doesn't react until you light it
	create_reagents(chem_volume) // making the cigarrete a chemical holder with a maximum volume of 100
	desc = replacetext(desc, "AMOUNT", "[tubes_amount]")

	var/obj/item/tube/T
	for(var/i in 1 to tubes_amount)
		T = new(src)
		tubes.Add(T)

	tubes_archive = tubes

	for(var/R in filling)
		reagents.add_reagent(R, filling[R])

/obj/item/hookah/throw_impact(atom/hit_atom)
	if(QDELETED(src))
		return

	if(reagents.reagent_list.len > 0)
		reagents.splash(hit_atom, reagents.total_volume)
	visible_message(
		SPAN_DANGER("\The [src] shatters from the impact!"),
		SPAN_DANGER("You hear the sound of glass shattering!")
	)
	playsound(src.loc, pick(GLOB.shatter_sound), 100)
	new /obj/item/material/shard(src.loc)
	qdel(src)


/obj/item/hookah/examine(mob/user, distance)
	. = ..()
	to_chat(user, lit ? "It looks lit up" : "It looks unlit")
	if(distance <= 1)
		to_chat(user, smoketime < 500 ? "There is no coal inside" : item_status[round(smoketime/(maxsmoketime/5), 1)])
		to_chat(user, reagents.total_volume > 0 ? "There's tobacco here" : "There is no tobacco here")


/obj/item/hookah/proc/extinguish(var/mob/user, var/no_message = FALSE)
	if(!no_message && !user)
		visible_message(SPAN_INFO("Hookah stop's to make the smoke. Maybe coal in hookah is gone?"))
	else if (!no_message)
		user.visible_message(SPAN_INFO("[user] shut off the hookah"))

	lit = 0
	icon_state = "hookah_0"
	item_state = "hookah_0"
	remove_extension(src, /datum/extension/scent)
	STOP_PROCESSING(SSobj, src)

/obj/item/hookah/verb/ejectcoal()
	set src in view(1)
	set category = "Object"
	set name = "Eject coal"
	set desc = "Eject coal from hookah"

	if(lit)
		to_chat(usr, SPAN_WARNING("You try to eject coal, but they are too hot!"))
		return

	// если вы поменяли значение volume в угле, то так же смените цифру 500
	var/obj/item/coal/C
	for(var/i in 1 to round(smoketime/500))
		C = new
		C.dropInto(get_turf(loc))

	usr.visible_message(SPAN_INFO("[usr] ejects the coal from hookah."), SPAN_INFO("You ejected coal from the hookah."))

	smoketime -= round(smoketime/500)*500

	if(smoketime > 0)
		to_chat(usr, SPAN_WARNING("There are small coal crumbs left in the hookah, which it is not possible to extract!"))

/obj/item/hookah/verb/ejecttobacco()
	set src in view(1)
	set category = "Object"
	set name = "Eject tobacco"
	set desc = "Eject tobacco leaves from hookah"

	if(tobacco_lit || lit)
		to_chat(usr, SPAN_WARNING("You can't eject lighted tobacco!"))
		return

	for(var/obj/item/tobacco/i in contents)
		for(var/R in i.filling)
			i.reagents.add_reagent(R, i.filling[R])
		i.dropInto(get_turf(loc))

	reagents.clear_reagents()
	usr.visible_message(SPAN_INFO("[usr] take's tobacco leaves from hookah."), SPAN_INFO("You'r take tobacco leaves from hookah."))

/obj/item/hookah/verb/removetobacco()
	set src in view(1)
	set category = "Object"
	set name = "Empty the hookah from leaves"
	set desc = "Empty the hookah with the loss of tobacco leaves"

	tobacco_lit = 0

	reagents.clear_reagents()
	usr.visible_message(SPAN_WARNING("[usr] empties the hookah from tobacco leaves!"), SPAN_WARNING("You have emptied the hookah!"))

/obj/item/hookah/verb/removecoal()
	set src in view(1)
	set category = "Object"
	set name = "Empty the hookah from coal"
	set desc = "Empty the hookah with the loss of coal"

	smoketime = 0

	usr.visible_message(SPAN_WARNING("[usr] empties the hookah from coal!"), SPAN_WARNING("You have emptied the hookah!"))

/obj/item/hookah/verb/turnofff()
	set src in view(1)
	set category = "Object"
	set name = "Extinguish"
	set desc = "Extinguish the hookah"

	if(!lit)
		to_chat(usr, SPAN_WARNING("You can't extinguish not lighted hookah!"))
		return

	extinguish(usr)

/obj/item/hookah/Process()
	var/turf/location = get_turf(src)
	if(submerged() || smoketime < 1)
		extinguish()
		return
	smoketime -= 1
	if(location)
		location.hotspot_expose(700, 5)

/obj/item/hookah/attackby(obj/W, mob/user)
	if(isflamesource(W) || is_hot(W))
		var/text = matchmes
		if(istype(W, /obj/item/flame/match))
			text = matchmes
		else if(istype(W, /obj/item/flame/lighter/zippo))
			text = zippomes
		else if(istype(W, /obj/item/flame/lighter))
			text = lightermes
		else if(isWelder(W))
			text = weldermes
		else if(istype(W, /obj/item/device/assembly/igniter))
			text = ignitermes
		else
			text = genericmes
		text = replacetext(text, "USER", "[user]")
		text = replacetext(text, "NAME", "[name]")
		text = replacetext(text, "FLAME", "[W.name]")
		light(text)
	else if(istype(W, /obj/item/tube))
		var/obj/item/tube/T = W
		if(T.par != src)
			to_chat(user, SPAN_WARNING("This tube not from this hookah!"))
			return
		tubes.Add(T)
		user.unEquip(T, src)
		STOP_PROCESSING(SSobj, T)
		to_chat(user, SPAN_INFO("You put the tube in hookah."))
	else if(istype(W, /obj/item/coal))
		var/obj/item/coal/M = W
		if(smoketime + M.volume > maxsmoketime)
			to_chat(user, SPAN_WARNING("Hookah is full of coal!"))
			return
		qdel(M)
		smoketime += M.volume
		user.visible_message(SPAN_INFO("[user] add's coal in hookah."), SPAN_INFO("You added coal in hookah."))

	else if(istype(W, /obj/item/tobacco) || istype(W, /obj/item/reagent_containers/food/snacks/grown/dried_tobacco))
		if(W.reagents)
			if(reagents.total_volume == 0)
				tobacco_lit = 0
			W.reagents.trans_to_obj(src, W.reagents.total_volume)
			user.unEquip(W, src)
			user.visible_message(SPAN_INFO("[user] put tobacco in hookah."), SPAN_INFO("You put tobacco in hookah."))
			if(lit || tobacco_lit)
				to_chat(usr, SPAN_WARNING("Immediately after you put the leave in the tray, it lit up."))
				qdel(W)
	else if(istype(W, /obj/item/storage/box/large/coal))
		var/obj/item/storage/box/large/coal/B = W
		var/k = round((maxsmoketime-smoketime)/500)
		if(k==0)
			return
		smoketime += 500*k
		for(var/i, i<k, i++)
			qdel(B.contents[1])

		src.visible_message(SPAN_INFO("[user] puts [k] coal in hookah"), SPAN_INFO("You put [k] coal in hookah"))

	..()

/obj/item/hookah/proc/light(var/flavor_text = "[usr] lights the [name].")
	if(!lit && smoketime)
		if(submerged())
			to_chat(usr, SPAN_WARNING("You cannot light \the [src] underwater."))
			return

		lit = 1
		tobacco_lit = 1
		for(var/obj/item/tobacco/i in contents)
			qdel(i)
		damtype = "burn"
		var/turf/T = get_turf(src)
		T.visible_message(flavor_text)
		icon_state = "hookah_1"
		item_state = "hookah_1"
		START_PROCESSING(SSobj, src)
		set_scent_by_reagents(src)


/obj/item/hookah/Destroy()
	. = ..()
	if(lit)
		STOP_PROCESSING(SSobj, src)
	for(var/obj/item/tube/T in tubes_archive)
		qdel(T)

/obj/item/hookah/water_act(var/depth)
	..()
	if(!waterproof && lit)
		if(submerged(depth))
			extinguish(no_message = TRUE)

/obj/item/hookah/attack_hand(mob/user)
	if(tubes.len <= 0)
		to_chat(user, SPAN_WARNING("Here is no tubes."))
		return

	var/obj/item/tube/T = tubes[1]

	if(!user.put_in_active_hand(T))
		to_chat(user, SPAN_WARNING("Your active hand must be empty!"))
		return

	START_PROCESSING(SSobj, T)
	tubes.Remove(T)

	to_chat(user, SPAN_INFO("You take's the smoking tube."))

/obj/item/hookah/MouseDrop(atom/over)
	if(over == usr && !usr.restrained() && !usr.stat && (list_find(usr.contents, src) || in_range(src, usr)))
		if(ishuman(over))
			if(!usr.get_active_hand())		//if active hand is empty
				var/mob/living/carbon/human/H = over
				var/obj/item/organ/external/temp = H.organs_by_name[BP_R_HAND]

				if(H.hand)
					temp = H.organs_by_name[BP_L_HAND]
				if(temp && !temp.is_usable())
					to_chat(over, SPAN_INFO("You try to move your [temp.name], but cannot!"))
					return

				to_chat(over, SPAN_INFO("You pick up the [src]."))
				usr.put_in_hands(src)
	return

/obj/effect/effect/smoke/hookah
	time_to_live = 30
	icon = 'infinity/icons/effects/smoke_hookah.dmi'
	pixel_x = 0
	pixel_y = 0

/datum/effect/effect/system/smoke_spread/hookah
	smoke_type = /obj/effect/effect/smoke/hookah


/obj/item/tube
	name = "Hookah tube"
	desc = "Large tube connected to the hookah"
	icon_state = "hookah_tube"
	item_state = "hookah_tube"
	icon = 'infinity/icons/obj/item/hookah.dmi'

	w_class = ITEM_SIZE_NO_CONTAINER

	throw_range = 0
	var/obj/item/hookah/par
	var/ready = TRUE
	var/datum/effect/effect/system/smoke_spread/hookah/smoke_map

/obj/item/tube/New(var/obj/item/hookah/W)
	par = W
	smoke_map = new
	smoke_map.attach(src)
	smoke_map.set_up(1, 0)
	. = ..()

/obj/item/tube/proc/set_ready()
	ready = TRUE
	return

/obj/item/tube/Process()
	if(QDELETED(src))
		STOP_PROCESSING(SSobj, src)
		return

	var/turf/T0 = get_turf(par)
	var/turf/T1 = get_turf(src)
	if(T0 != T1 && get_dist(T1, T0) > 1)
		if(istype(loc, /mob/living/carbon))
			var/mob/living/carbon/M = loc
			visible_message(SPAN_WARNING("Tube placed back to hookah because [loc] go out"))
			M.unEquip(src, par)
		else
			visible_message(SPAN_WARNING("The tube go back to hookah because it was too far away"))
			par.contents.Add(src)

		par.tubes.Add(src)
		return PROCESS_KILL

/obj/item/tube/Destroy()
	STOP_PROCESSING(SSobj,src)
	. = ..()

/obj/item/tube/attack(mob/living/carbon/human/H, mob/user, def_zone)
	if (!par.lit)
		to_chat(user, SPAN_WARNING("You try to drug the smoke, but feel only air from the room. Look's like hookah is'nt lighted."))
		return
	if(H == user && istype(H) && ready && H.check_has_mouth())
		var/obj/item/blocked = H.check_mouth_coverage()
		if(blocked)
			to_chat(H, SPAN_WARNING("\The [blocked] is in the way!"))
			return 1
		to_chat(H, SPAN_INFO("You take a drag on your [name]."))

		playsound(H, 'infinity/sound/effects/hookah.ogg', 50, 0, -1)
		smoke(5)
		add_trace_DNA(H)
		ready = FALSE
		addtimer(CALLBACK(src, .proc/set_ready), 4 SECONDS, TIMER_NO_HASH_WAIT)
		return 1
	return ..()

/obj/item/tube/proc/smoke(amount)
	par.smoketime -= amount
	if(par.reagents && par.reagents.total_volume) // check if it has any reagents at all
		if(ishuman(loc))
			var/mob/living/carbon/human/C = loc
			par.reagents.trans_to_mob(C, REM, CHEM_INGEST, 0.2)
			add_trace_DNA(C)
		else
			reagents.remove_any(REM)
	else
		to_chat(usr, SPAN_WARNING("You cant feel somethink inside of hookah smoke. Maybe tobacco is gone?"))
		return
	var/turf/T = get_turf(src)
	if(T)
		var/datum/gas_mixture/environment = T.return_air()
		if(ishuman(loc))
			var/mob/living/carbon/human/C = loc
			if (src == C.wear_mask && C.internal)
				environment = C.internal.return_air()
		if(environment.get_by_flag(XGM_GAS_OXIDIZER) < par.gas_consumption)
			par.extinguish()
		else
			var/datum/gas_mixture/produced = new
			environment.remove_by_flag(XGM_GAS_OXIDIZER, par.gas_consumption)
			produced.adjust_gas(GAS_CO2, 0.5*par.gas_consumption,0)
			produced.adjust_gas(GAS_SMOKE, 1, 0)
			produced.temperature = T20C+60
			environment.merge(produced)

	smoke_map.start()

/obj/item/coal
	name = "Coal"
	desc = "Coal used in hookah's for make smoke"
	w_class = ITEM_SIZE_SMALL
	icon = 'infinity/icons/obj/item/hookah.dmi'
	icon_state = "coal"
	item_state = "coal"

	var/volume = 500

// code/datums/supplypacks/galley.dm
/decl/hierarchy/supply_pack/galley/hookah
	name = "Bar - Hookah"
	contains = list(
		/obj/item/hookah,
		/obj/item/storage/box/large/coal = 2
	)
	cost = 20
	containername = "Hookah crate"

/obj/item/storage/box/large/coal
	name = "coal for hookah"
	desc = "A box with coals for a hookah."
	icon_state = "largebox"
	startswith = list(/obj/item/coal = 10)
	can_hold = list(/obj/item/coal)
	w_class = ITEM_SIZE_LARGE
	max_w_class = ITEM_SIZE_NORMAL
	max_storage_space = DEFAULT_LARGEBOX_STORAGE
	use_sound = 'sound/effects/storage/box.ogg'
