#define BOOMBOX_PANEL 1
#define BOOMBOX_BROKEN 2

/obj/item/boombox
	name = "boombox"
	desc = "A device used to emit rhythmic sounds, colloquialy refered to as a 'boombox'. It's in a retro style (massive), and absolutely unwieldy."
	icon = 'icons/obj/boombox.dmi'
	icon_state = "off"
	item_state = "boombox"
	force = 7
	w_class = ITEM_SIZE_HUGE //forbid putting something that emits loud sounds forever into a backpack
	origin_tech = list(TECH_MAGNET = 2, TECH_COMBAT = 1)

	var/jukebox/jukebox
	var/boombox_flags


/obj/item/boombox/Initialize()
	. = ..()
	jukebox = new(src, "boombox.tmpl", "HEXABEATRON&trade;", 400, 150)


/obj/item/boombox/Destroy()
	QDEL_NULL(jukebox)
	. = ..()


/obj/item/boombox/on_update_icon()
	icon_state = jukebox?.playing ? "on" : "off"


/obj/item/boombox/attack_self(mob/user)
	playsound(src, "switch", 30)
	if (GET_FLAGS(boombox_flags, BOOMBOX_BROKEN))
		return
	jukebox.ui_interact(user)


/obj/item/boombox/MouseDrop(mob/user)
	jukebox.ui_interact(user)


/obj/item/boombox/emp_act(severity)
	if (GET_FLAGS(boombox_flags, BOOMBOX_BROKEN))
		return
	audible_message(SPAN_WARNING("\The [src]'s speakers pop with a sharp crack!"))
	playsound(src, 'sound/effects/snap.ogg', 100, 1)
	SET_FLAGS(boombox_flags, BOOMBOX_BROKEN)
	jukebox.Stop()


/obj/item/boombox/examine(mob/user, distance)
	. = ..()
	if (distance > 3)
		return
	var/message
	if (GET_FLAGS(boombox_flags, BOOMBOX_PANEL))
		message = "[message?" ":""]The front panel is open."
		if (GET_FLAGS(boombox_flags, BOOMBOX_BROKEN))
			message += "[message?" ":""]It's broken."
	if (!message)
		return
	to_chat(user, SPAN_ITALIC(message))


/obj/item/boombox/attackby(obj/item/item, mob/user)
	set waitfor = FALSE
	if(isScrewdriver(item))
		var/item_loc = item.loc
		if (GET_FLAGS(boombox_flags, BOOMBOX_PANEL))
			user.visible_message(
				SPAN_ITALIC("\The [user] closes the service panel on \the [src]."),
				SPAN_NOTICE("You close the service panel on \the [src]."),
				range = 3
			)
			CLEAR_FLAGS(boombox_flags, BOOMBOX_PANEL)
		else if (!GET_FLAGS(boombox_flags, BOOMBOX_BROKEN))
			if (jukebox.playing)
				to_chat(user, SPAN_WARNING("You can't adjust the player head while it's in use."))
				return TRUE
			var/data = input(user, "Adjust player head screw?", "Adjust Head") as null | anything in list("tighten", "loosen")
			if (item_loc == item.loc)
				var/old_frequency = jukebox.frequency
				switch (data)
					if ("tighten") jukebox.frequency = max(jukebox.frequency - 0.1, 0.5)
					if ("loosen") jukebox.frequency = min(jukebox.frequency + 0.1, 1.5)
				if (jukebox.frequency == old_frequency)
					to_chat(user, SPAN_WARNING("Try as you might, the screw won't turn further."))
					return TRUE
				user.visible_message(
					SPAN_ITALIC("\The [user] uses \the [item] to fiddle with \the [src]."),
					SPAN_NOTICE("You [data] the player head screw inside \the [src]."),
					range = 3
				)
		else if (!GET_FLAGS(boombox_flags, BOOMBOX_PANEL))
			user.visible_message(
				SPAN_ITALIC("\The [user] opens the service panel on \the [src]."),
				SPAN_NOTICE("You open the service panel on \the [src]."),
				range = 3
			)
			SET_FLAGS(boombox_flags, BOOMBOX_PANEL)
		playsound(src, 'sound/items/Screwdriver.ogg', 50, 1)
		return TRUE
	if (istype(item, /obj/item/stack/nanopaste))
		if (!GET_FLAGS(boombox_flags, BOOMBOX_PANEL))
			to_chat(user, SPAN_WARNING("The panel on \the [src] is not open."))
			return TRUE
		if (!GET_FLAGS(boombox_flags, BOOMBOX_BROKEN))
			to_chat(user, SPAN_WARNING("\The [src] is not broken."))
			return TRUE
/*		else if(panel)
			user.visible_message(SPAN_NOTICE("\The [user] unhinges \the [src]'s front panel with \the [W]."), SPAN_NOTICE("You unhinge \the [src]'s front panel."))
			playsound(src.loc, 'sound/items/Screwdriver.ogg', 50, 1)
			panel = FALSE */
	if(istype(item,/obj/item/stack/nanopaste))
		var/obj/item/stack/S = item
		if(GET_FLAGS(boombox_flags, BOOMBOX_BROKEN)/* && !panel*/)
			if(S.use(1))
				user.visible_message(SPAN_NOTICE("\The [user] pours some of \the [S] onto \the [src]."), SPAN_NOTICE("You pour some of \the [S] over \the [src]'s internals and watch as it retraces and resolders paths."))
				CLEAR_FLAGS(boombox_flags, BOOMBOX_BROKEN)
			else
				to_chat(user, SPAN_NOTICE("\The [S] is empty."))
	if(istype(item,/obj/item/stack/cable_coil))
		var/obj/item/stack/S = item
		if(GET_FLAGS(boombox_flags, BOOMBOX_BROKEN)/* && !panel*/)
			if(user.skill_check(SKILL_ELECTRICAL, SKILL_BASIC))
				if(S.use(5))
					user.visible_message(SPAN_NOTICE("\The [user] starts replace burned out wires in \the [src]."), SPAN_NOTICE("You are replacing burned out wires in \the [src]'."))
					if(!do_after(user, 60, src))
						return
					user.visible_message(SPAN_NOTICE("\The [user] replaces burned out wires in \the [src]."), SPAN_NOTICE("You replace burned out wires in \the [src]."))
					CLEAR_FLAGS(boombox_flags, BOOMBOX_BROKEN)
				else
					to_chat(user, SPAN_NOTICE("You need more [S] to fix \the [src]."))

			else
				to_chat(user, SPAN_NOTICE("You don't know how to fix \the [src]."))
	else
		. = ..()

/* /obj/item/device/boombox/proc/AdjustFrequency(var/obj/item/W, var/mob/user)
	var/const/MIN_FREQUENCY = 0.5
	var/const/MAX_FREQUENCY = 1.5

	if(!MayAdjust(user))
		return FALSE

	var/list/options = list()
	var/tighten = "Tighten (play slower)"
	var/loosen  = "Loosen (play faster)"

	if(frequency > MIN_FREQUENCY)
		options += tighten
	if(frequency < MAX_FREQUENCY)
		options += loosen

	var/operation = input(user, "How do you wish to adjust the player head?", "Adjust player", options[1]) as null|anything in options
	if(!operation)
		return FALSE
	if(!MayAdjust(user))
		return FALSE
	if(W != user.get_active_hand())
		return FALSE

	if(!CanPhysicallyInteract(user))
		return FALSE

	if(operation == loosen)
		frequency += 0.1
	else if(operation == tighten)
		frequency -= 0.1
	frequency = Clamp(frequency, MIN_FREQUENCY, MAX_FREQUENCY)

	user.visible_message(SPAN_NOTICE("\The [user] adjusts \the [src]'s player head."), SPAN_NOTICE("You adjust \the [src]'s player head."))
	playsound(src.loc, 'sound/items/Screwdriver.ogg', 50, 1)

	if(frequency > 1.0)
		to_chat(user, SPAN_NOTICE("\The [src] should be playing faster than usual."))
	else if(frequency < 1.0)
		to_chat(user, SPAN_NOTICE("\The [src] should be playing slower than usual."))
	else
		to_chat(user, SPAN_NOTICE("\The [src] should be playing as fast as usual."))

	return TRUE

/obj/item/device/boombox/proc/MayAdjust(var/mob/user)
	if(playing)
		to_chat(user, "<span class='warning'>You can only adjust \the [src] when it's not playing.</span>")
		return FALSE
	return TRUE

/obj/item/device/boombox/on_update_icon()
	icon_state = playing ? "on" : "off"

/obj/item/device/boombox/proc/stop()
	playing = 0
	update_icon()
	QDEL_NULL(sound_token)

/obj/item/device/boombox/proc/start()
	QDEL_NULL(sound_token)
	var/datum/track/T = tracks[track_num]
	sound_token = GLOB.sound_player.PlayLoopingSound(src, sound_id, T.GetTrack(), volume = volume, frequency = frequency, range = 7, falloff = 4, prefer_mute = TRUE, preference = /datum/client_preference/play_boomboxes)
	playing = 1
	update_icon()
	if(prob(break_chance))
		boombox_break() 

/obj/item/device/boombox/proc/boombox_break()
	audible_message(SPAN_WARNING("\The [src]'s speakers pop with a sharp crack!"))
	playsound(src.loc, 'sound/effects/snap.ogg', 100, 1)
	broken = TRUE
	stop() */


/obj/random_multi/single_item/boombox
	name = "boombox spawnpoint"
	id = "boomtastic"
	item_path = /obj/item/boombox



#undef BOOMBOX_PANEL
#undef BOOMBOX_BROKEN
