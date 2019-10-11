GLOBAL_LIST_EMPTY(mp_list)

#define PANEL_CLOSED 0
#define PANEL_UNSCREWED 1
#define PANEL_OPENED 2

/obj/item/music_player/custom_tape
	tape = /obj/item/music_tape/custom

/obj/item/music_player
	name = "music player"
	desc = "A little device which looks like a old radio. Can be used to play soft tunes."
	icon = 'infinity/icons/obj/music_player.dmi'
	icon_state = "radio"
	item_state = "radio"
	w_class = ITEM_SIZE_NORMAL
	obj_flags = OBJ_FLAG_CONDUCTIBLE
	slot_flags = SLOT_BELT
	throwforce = 2
	throw_speed = 4
	throw_range = 10

	matter = list(MATERIAL_STEEL = 75, MATERIAL_GLASS = 30)
	origin_tech = list(TECH_MAGNET = 2)

	var/const/OFF = 0
	var/const/PLAY = 1

	var/mode = 0
	var/volume = 20
	var/max_volume = 50
	var/frequency = 1

	var/datum/sound_token/sound_token
	var/sound_id

	var/break_chance = 3
	var/broken
	var/panel = PANEL_CLOSED

	var/obj/item/weapon/cell/device/cell = /obj/item/weapon/cell/device
	var/power_usage = 250
	var/obj/item/music_tape/tape = null

	var/serial_number

/obj/item/music_player/Initialize()
	. = ..()
	if(ispath(cell))
		cell = new cell(src)

	if(ispath(tape))
		tape = new tape(src)

	sound_id = "[type]_[sequential_id(type)]"
	serial_number = "[rand(1,999)]"
	GLOB.mp_list += src

	message_admins("MUSIC PLAYER: <a href='?_src_=holder;adminplayerobservefollow=\ref[src]'>#[serial_number]</a> has been created.")

	update_icon()

/obj/item/music_player/Destroy()
	set_mode(OFF)

	if(cell)
		QDEL_NULL(cell)

	if(tape)
		QDEL_NULL(tape)

	message_admins("MUSIC PLAYER: #[serial_number] is deleted.")
	GLOB.mp_list -= src
	. = ..()

/obj/item/music_player/examine(mob/user)
	. = ..(user)
	if(.)
		if(serial_number)
			to_chat(user, "A serial number \"#[serial_number]\" is generated on the cover.")
		if(tape?.track)
			to_chat(user, SPAN_NOTICE("You can see \a [tape] inside it. It's labeled as \"[tape.track.title]\"."))
		else if(tape)
			to_chat(user, SPAN_NOTICE("You can see \a [tape] inside it."))
		switch(panel)
			if(PANEL_OPENED)
				to_chat(user, "The front panel is unhinged.")
			if(PANEL_UNSCREWED)
				to_chat(user, "The front panel is unscrewed.")
		if(broken)
			to_chat(user, SPAN_WARNING("It's broken."))

/obj/item/music_player/on_update_icon()
	overlays.Cut()
	if(mode)
		overlays += image(icon, "[icon_state]_play")
	if(panel == PANEL_OPENED)
		overlays += image(icon, "[icon_state]_open")
		if(cell)
			overlays += image(icon, "[icon_state]_open-cell")

/obj/item/music_player/Process()
	if(!get_cell() || !cell.checked_use(power_usage * CELLRATE))
		StopPlaying()
		visible_message(SPAN_WARNING("\The [src]'s power meter flashes a battery warning and refuses to operate."))
		return PROCESS_KILL
//	to_world(cell.charge)

/obj/item/music_player/proc/set_mode(value)
	if(value == mode) return

	if(broken) return

	playsound(src.loc, "switch", 20)

	switch(value)
		if(OFF)
			StopPlaying()
		if(PLAY)
			if(!get_cell() || !cell.check_charge(power_usage * CELLRATE))
				visible_message(SPAN_NOTICE("\The [src]'s power meter flashes a battery warning and refuses to operate."))
				return
			StartPlaying()

/obj/item/music_player/attack_self(mob/user)
	switch(mode)
		if(OFF)
			set_mode(PLAY)
		if(PLAY)
			set_mode(OFF)
	user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)

/obj/item/music_player/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/music_tape))
		var/obj/item/music_tape/C = I
		if(tape)
			to_chat(user, SPAN_NOTICE("There is already \a [tape] inside."))
			return

		if(C.ruined)
			to_chat(user, SPAN_WARNING("\The [C] is ruined, you can't use it."))
			return

		if(!user.unEquip(C))
			return

		I.forceMove(src)
		tape = C
		visible_message(
			SPAN_NOTICE("[user] insert \a [tape] into \the [src]."),
			SPAN_NOTICE("You insert \a [tape] into \the [src]."))
		playsound(src.loc, 'sound/weapons/TargetOn.ogg', 35, 1)
		update_icon()
		return

	if(istype(I, /obj/item/weapon/cell/device))
		var/obj/item/weapon/cell/device/C = I
		if(panel == PANEL_OPENED)
			if(cell)
				to_chat(user, SPAN_NOTICE("[src] already has \a [cell] installed."))
				return

			if(!user.unEquip(C))
				return

			I.forceMove(src)
			cell = C
			to_chat(user, SPAN_NOTICE("You insert \a [cell] into \the [src]."))
			update_icon()
		return

	if(isScrewdriver(I))
		switch(panel)
			if(PANEL_UNSCREWED)
				user.visible_message(SPAN_NOTICE("\The [user] screw \the [src]'s front panel with \the [I]."), SPAN_NOTICE("You screw \the [src]'s front panel."))
				playsound(src.loc, 'sound/items/Screwdriver.ogg', 50, 1)
				panel = PANEL_CLOSED
				return TRUE

			if(PANEL_CLOSED)
				user.visible_message(SPAN_NOTICE("\The [user] unscrew \the [src]'s front panel with \the [I]."), SPAN_NOTICE("You unscrew \the [src]'s front panel."))
				playsound(src.loc, 'sound/items/Screwdriver.ogg', 50, 1)
				panel = PANEL_UNSCREWED
				return TRUE

			if(PANEL_OPENED)
				var/choices = list()
				if(cell)
					choices += "Remove cell"
				if(!broken)
					choices += "Adjust player"

				var/response = input(user, "What do you want to do?", "[src]") as null|anything in choices

				if(!Adjacent(user) || !response)	//moved away or cancelled
					return

				switch(response)
					if("Remove cell")
						if(cell)
							if(!MayAdjust(user))
								return FALSE
							playsound(src.loc, 'sound/items/Screwdriver.ogg', 45, 1)
							to_chat(user, SPAN_NOTICE("You pulled out [cell] out of [src] with [I]."))
							user.put_in_hands(cell)
							cell = null
							update_icon()
						else
							to_chat(user, SPAN_WARNING("\The [src] doesn't have a cell installed."))
					if("Adjust player")
						if(!broken)
							AdjustFrequency(I, user)
							return TRUE
		return

	if(isCrowbar(I))
		switch(panel)
			if(PANEL_OPENED)
				user.visible_message(SPAN_NOTICE("\The [user] re-attaches \the [src]'s front panel with \the [I]."), SPAN_NOTICE("You re-attach \the [src]'s front panel."))
				playsound(src.loc, 'sound/items/Crowbar.ogg', 100, 1)
				panel = PANEL_UNSCREWED
				update_icon()
				return TRUE

			if(PANEL_UNSCREWED)
				user.visible_message(SPAN_NOTICE("\The [user] unhinges \the [src]'s front panel with \the [I]."), SPAN_NOTICE("You unhinge \the [src]'s front panel."))
				playsound(src.loc, 'sound/items/Crowbar.ogg', 100, 1)
				panel = PANEL_OPENED
				update_icon()
				return TRUE
		return

	if(istype(I,/obj/item/stack/nanopaste))
		var/obj/item/stack/S = I
		if(broken && panel == PANEL_OPENED)
			if(S.use(1))
				user.visible_message(SPAN_NOTICE("\The [user] pours some of \the [S] onto \the [src]."), SPAN_NOTICE("You pour some of \the [S] over \the [src]'s internals and watch as it retraces and resolders paths."))
				broken = FALSE
			else
				to_chat(user, SPAN_NOTICE("\The [S] is empty."))
		return
	if(isCoil(I))
		var/obj/item/stack/S = I
		if(broken && panel == PANEL_OPENED)
			if(user.skill_check(SKILL_ELECTRICAL, SKILL_BASIC))
				if(S.use(5))
					user.visible_message(SPAN_NOTICE("\The [user] starts replace burned out wires in \the [src]."), SPAN_NOTICE("You are replacing burned out wires in \the [src]'."))
					if(!do_after(user, 60, src))
						return
					user.visible_message(SPAN_NOTICE("\The [user] replaces burned out wires in \the [src]."), SPAN_NOTICE("You replace burned out wires in \the [src]."))
					broken = FALSE
				else
					to_chat(user, SPAN_NOTICE("You need more [I] to fix \the [src]."))

			else
				to_chat(user, SPAN_NOTICE("You don't know how to fix \the [src]."))
	else
		. = ..()

/obj/item/music_player/get_cell()
	return cell

/obj/item/music_player/proc/AdjustFrequency(var/obj/item/W, var/mob/user)
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

/obj/item/music_player/proc/MayAdjust(var/mob/user)
	if(mode)
		to_chat(user, SPAN_WARNING("You can only adjust \the [src] when it's not playing."))
		return FALSE
	return TRUE

/obj/item/music_player/attack_ai(mob/user)
	return

/obj/item/music_player/MouseDrop(var/obj/over_object)
	if(!over_object)
		return

	//makes sure that the clothing is equipped so that we can't drag it into our hand from miles away.
	if(!(src.loc == usr))
		return

	if(usr.incapacitated())
		return

	switch(over_object.name)
		if("r_hand")
			eject(usr)
		if("l_hand")
			eject(usr)
	update_icon()

/obj/item/music_player/proc/eject(mob/user)
	if(!tape)
		to_chat(user, SPAN_NOTICE("There's no tape in \the [src]."))
		return

	if(mode)
		StopPlaying()

	playsound(src, GLOB.machinery_exposed_sound[1], 20, 1)
	if(user)
		visible_message(
			SPAN_NOTICE("[user] eject \the [tape]."),
			SPAN_NOTICE("You eject \the [tape]."))
	if(user)
		user.put_in_hands(tape)
	else
		tape.dropInto(loc)
	tape = null

/obj/item/music_player/verb/volume()
	set name = "Change Volume"
	set category = "Object"
	set src in view(1)

	if(usr.incapacitated())
		return

	var/vol = input(usr, "What volume would you like the sound to play at?",, volume) as null|num
	if(vol)
		AdjustVolume(vol)
	return

/obj/item/music_player/proc/AdjustVolume(var/new_volume)
	volume = Clamp(new_volume, 0, max_volume)
	if(sound_token)
		sound_token.SetVolume(volume)

/obj/item/music_player/proc/explode()
	walk_to(src, 0)
	src.visible_message("<span class='danger'>\The [src] blows apart!</span>", 1)

	explosion(src.loc, 0, 0, 1, rand(1, 2), 1)

	var/datum/effect/effect/system/spark_spread/s = new /datum/effect/effect/system/spark_spread
	s.set_up(3, 1, src)
	s.start()

	new /obj/effect/decal/cleanable/blood/oil(src.loc)
	qdel(src)

/obj/item/music_player/proc/break_act()
	audible_message("<span class='warning'>\The [src]'s speakers pop with a sharp crack!</span>")
	playsound(src.loc, 'sound/effects/snap.ogg', 100, 1)
	broken = TRUE
	StopPlaying()

/obj/item/music_player/proc/StartPlaying()
	if(!get_cell())
		return

	if(broken)
		return

	if(isnull(tape))
		return

	if(!tape.CanPlay())
		src.visible_message(SPAN_WARNING("The [tape] is unusable to play."), 1)
		return

	mode = PLAY

	QDEL_NULL(sound_token)
	sound_token = GLOB.sound_player.PlayLoopingSound(src, sound_id, tape.track.GetTrack(), volume = volume, frequency = frequency, range = 7, falloff = 4, prefer_mute = TRUE, preference = /datum/client_preference/play_pmps)
	START_PROCESSING(SSobj, src)
	log_and_message_admins("launched [src] <a href='?_src_=holder;adminplayerobservefollow=\ref[src]'>#[serial_number]</a> with the song \"[tape.track.title]\".")

	if(prob(break_chance))
		break_act()

	update_icon()

/obj/item/music_player/proc/StopPlaying()
	mode = OFF
	QDEL_NULL(sound_token)
	STOP_PROCESSING(SSobj, src)

	update_icon()

/obj/item/music_player/fire_act()
	break_act()
	if(tape)
		tape.ruin()
	return ..()

#undef PANEL_CLOSED
#undef PANEL_UNSCREWED
#undef PANEL_OPENED
