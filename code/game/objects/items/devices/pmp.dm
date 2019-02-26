GLOBAL_LIST_EMPTY(pmp_list)

/datum/admins/proc/pmp_control_panel()
	set category = "Fun"
	set name = "PMP Panel"
	set desc = "Lists all the current portable media players and control it."

	if(!check_rights(R_ADMIN|R_FUN, 0, usr))
		return

	var/list/dat = list("<div align='center'><h1>PMP Control Panel</h1><br>")

	dat += "<b>Current portable media players in world ([GLOB.pmp_list.len]):</b></div><br>"
	dat += "<hr>"

	if(GLOB.pmp_list.len == 0)
		dat += "<div class='statusDisplay'><center>At the moment there are no devices in this world session.</center></div>"
	else
		for(var/a in GLOB.pmp_list)
			var/obj/item/device/pmp/p = a
			dat += "<div class='statusDisplay'>"
			dat += "PMP #[p.serial_number] : <a href='?_src_=holder;pmp_play=\ref[p]'>[p.playing ? "<font color=cc5555>Stop</font>" : "<font color=55cc55>Play</font>"]</a> | "
			dat += "<a href='?_src_=holder;pmp_volume=\ref[p]'>Volume</a> | "
			dat += "<a href='?_src_=holder;adminplayerobservefollow=\ref[p]'>Current location</a> | "
			dat += "<a href='?_src_=vars;Vars=\ref[p]'>VV</a> | "
			dat += "<a href='?_src_=holder;pmp_explode=\ref[p]'><font color=cc5555>\[X\]</font></a><br>"
			dat += "</div>"

	var/datum/browser/popup = new(usr, "pmp_panel",, 455, 325, src)
	popup.set_content(jointext(dat, null))
	popup.open()

	feedback_add_details("admin_verb","LCPMP") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

#define PANEL_CLOSED 0
#define PANEL_UNSCREWED 1
#define PANEL_OPENED 2

// I could study to make my life better, but because I am fucking lazy idiot i do this shit
/obj/item/device/pmp
	name = "portable media player"
	desc = "A little device which looks like a old radio. Can be used to play soft tunes."
	icon = 'icons/portable_media_player.dmi'
	icon_state = "pmp"
	item_state = "radio"
	w_class = ITEM_SIZE_NORMAL
	obj_flags = OBJ_FLAG_CONDUCTIBLE
	slot_flags = SLOT_BELT
	throwforce = 2
	throw_speed = 4
	throw_range = 10

	matter = list(DEFAULT_WALL_MATERIAL = 75, "glass" = 30)
	origin_tech = list(TECH_MAGNET = 2)

	var/playing = 0
	var/volume = 20
	var/max_volume = 50
	var/frequency = 1

	var/datum/sound_token/sound_token
	var/sound_id

	var/break_chance = 3
	var/broken
	var/panel = PANEL_CLOSED

	var/obj/item/weapon/cell/device/cell = /obj/item/weapon/cell/device
	var/obj/item/device/cassette/cassette = null

	var/serial_number

/obj/item/device/pmp/Initialize()
	. = ..()
	if(ispath(cell))
		cell = new cell(src)

	if(ispath(cassette))
		cassette = new cassette(src)

	sound_id = "[type]_[sequential_id(type)]"
	serial_number = "[rand(1,999)]"
	GLOB.pmp_list += src
	message_admins("RADIO: <a href='?_src_=holder;adminplayerobservefollow=\ref[src]'>#[serial_number]</a> has been created.")
	update_icon()

/obj/item/device/pmp/get_cell()
	return cell

/obj/item/device/pmp/Destroy()
	StopPlaying()
	if(cell)
		QDEL_NULL(cell)

	if(cassette)
		QDEL_NULL(cassette)

	message_admins("RADIO: #[serial_number] is deleted.")
	GLOB.pmp_list -= src
	. = ..()

/obj/item/device/pmp/Process()
	if(cell && playing)
		if(cell.charge <= 0.0833333333)
			StopPlaying()
			visible_message(SPAN_WARNING("\The [src] is suddenly turned off."))
			return
		else
			cell.use(0.0833333333)

/obj/item/device/pmp/on_update_icon()
	overlays.Cut()
	if(playing)
		overlays += image(icon, "[icon_state]_play")
	if(panel == PANEL_OPENED)
		overlays += image(icon, "[icon_state]_open")
		if(cell)
			overlays += image(icon, "[icon_state]_open-cell")

/obj/item/device/pmp/examine(mob/user)
	. = ..(user)
	if(.)
		if(serial_number)
			to_chat(user, "The serial number \"#[serial_number]\" is generated on the case.")
		if(cassette)
			to_chat(user, SPAN_NOTICE("You can see a cassette inside it. The label says \"[cassette.track.title]\"."))
		switch(panel)
			if(PANEL_OPENED)
				to_chat(user, "The front panel is unhinged.")
			if(PANEL_UNSCREWED)
				to_chat(user, "The front panel is unscrewed.")
		if(broken)
			to_chat(user, SPAN_WARNING("It's broken."))

/obj/item/device/pmp/attack_self(mob/user)
	playsound(src.loc, "switch", 20)
	if(broken) return
	if(playing)
		StopPlaying()
		return
	else
		if(cell && cell.charge <= 0.0833333333 || !cell)
			return
		else
			StartPlaying()

/obj/item/device/pmp/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/device/cassette))
		var/obj/item/device/cassette/C = I
		if(cassette)
			to_chat(user, SPAN_NOTICE("There is already a cassette inside."))
			return

		if(C.ruined)
			to_chat(user, SPAN_WARNING("\The [C] is ruined, you can't use it."))
			return

		if(!user.unEquip(C))
			return

		I.forceMove(src)
		cassette = C
		visible_message(
			SPAN_NOTICE("[user] insert a cassette into \the [src]."),
			SPAN_NOTICE("You insert a cassette into \the [src]."))
		playsound(src.loc, 'sound/weapons/TargetOn.ogg', 35, 1)
		update_icon()
		return

	if(istype(I, /obj/item/weapon/cell/device))
		var/obj/item/weapon/cell/device/C = I
		if(panel == PANEL_OPENED)
			if(cell)
				to_chat(user, SPAN_NOTICE("[src] already has a cell installed."))
				return

			if(!user.unEquip(C))
				return

			I.forceMove(src)
			cell = C
			to_chat(user, SPAN_NOTICE("You insert a cassette into \the [src]."))
			update_icon()
		return

	if(isScrewdriver(I))
		if(panel == PANEL_UNSCREWED)
			user.visible_message(SPAN_NOTICE("\The [user] screw \the [src]'s front panel with \the [I]."), SPAN_NOTICE("You screw \the [src]'s front panel."))
			playsound(src.loc, 'sound/items/Screwdriver.ogg', 50, 1)
			panel = PANEL_CLOSED
			return TRUE
		else if(panel == PANEL_CLOSED)
			user.visible_message(SPAN_NOTICE("\The [user] unscrew \the [src]'s front panel with \the [I]."), SPAN_NOTICE("You unscrew \the [src]'s front panel."))
			playsound(src.loc, 'sound/items/Screwdriver.ogg', 50, 1)
			panel = PANEL_UNSCREWED
			return TRUE

		if(panel == PANEL_OPENED)
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
		if(panel == PANEL_OPENED)
			user.visible_message(SPAN_NOTICE("\The [user] re-attaches \the [src]'s front panel with \the [I]."), SPAN_NOTICE("You re-attach \the [src]'s front panel."))
			playsound(src.loc, 'sound/items/Crowbar.ogg', 100, 1)
			panel = PANEL_UNSCREWED
			update_icon()
			return TRUE
		else if(PANEL_UNSCREWED)
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
	if(istype(I,/obj/item/stack/cable_coil))
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

/obj/item/device/pmp/proc/AdjustFrequency(var/obj/item/W, var/mob/user)
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

/obj/item/device/pmp/proc/MayAdjust(var/mob/user)
	if(playing)
		to_chat(user, SPAN_WARNING("You can only adjust \the [src] when it's not playing."))
		return FALSE
	return TRUE

/obj/item/device/pmp/attack_ai(mob/user)
	return

/obj/item/device/pmp/MouseDrop(var/obj/over_object)
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

/obj/item/device/pmp/proc/eject(mob/user)
	if(!cassette)
		to_chat(user, SPAN_NOTICE("There's no cassette in \the [src]."))
		return

	if(playing)
		StopPlaying()

	playsound(src.loc, "sound/machines/Custom_screwdriveropen.ogg", 20, 1)
	if(user)
		visible_message(
			SPAN_NOTICE("[user] eject the cassette."),
			SPAN_NOTICE("You eject the cassette."))
	if(user)
		user.put_in_hands(cassette)
	else
		cassette.dropInto(loc)
	cassette = null

/obj/item/device/pmp/verb/volume()
	set name = "Change Volume"
	set category = "Object"
	set src in view(1)

	if(usr.incapacitated())
		return

	var/vol = input(usr, "What volume would you like the sound to play at?",, volume) as null|num
	if(vol)
		AdjustVolume(vol)
	return

/obj/item/device/pmp/proc/AdjustVolume(var/new_volume)
	volume = Clamp(new_volume, 0, max_volume)
	if(sound_token)
		sound_token.SetVolume(volume)

/obj/item/device/pmp/proc/explode()
	walk_to(src, 0)
	src.visible_message("<span class='danger'>\The [src] blows apart!</span>", 1)

	explosion(src.loc, 0, 0, 1, rand(1, 2), 1)

	var/datum/effect/effect/system/spark_spread/s = new /datum/effect/effect/system/spark_spread
	s.set_up(3, 1, src)
	s.start()

	new /obj/effect/decal/cleanable/blood/oil(src.loc)
	qdel(src)

/obj/item/device/pmp/proc/pmp_break()
	audible_message("<span class='warning'>\The [src]'s speakers pop with a sharp crack!</span>")
	playsound(src.loc, 'sound/effects/snap.ogg', 100, 1)
	broken = TRUE
	StopPlaying()

/obj/item/device/pmp/proc/StartPlaying()
	if(isnull(cell))
		return

	if(broken)
		return

	if(isnull(cassette))
		return

	if(!cassette.track)
		return

	if(cassette.ruined)
		src.visible_message(SPAN_WARNING("The cassette is unusable to play."), 1)
		return

	log_and_message_admins("launched a [src] <a href='?_src_=holder;adminplayerobservefollow=\ref[src]'>#[serial_number]</a> with the song \"[cassette.track.title]\".")
	QDEL_NULL(sound_token)
	sound_token = GLOB.sound_player.PlayLoopingSound(src, sound_id, cassette.track.GetTrack(), volume = volume, frequency = frequency, range = 7, falloff = 4, prefer_mute = TRUE, preference = /datum/client_preference/play_pmps)
	playing = 1
	update_icon()
	START_PROCESSING(SSobj, src)
	if(prob(break_chance))
		pmp_break()

/obj/item/device/pmp/proc/StopPlaying()
	playing = 0
	update_icon()
	QDEL_NULL(sound_token)
	STOP_PROCESSING(SSobj, src)

/obj/item/device/pmp/fire_act()
	pmp_break()
	if(cassette)
		cassette.ruin()
	return ..()

#undef PANEL_CLOSED
#undef PANEL_UNSCREWED
#undef PANEL_OPENED

/obj/item/device/pmp/personal
	cassette = /obj/item/device/cassette/custom

/obj/item/device/cassette
	name = "cassette"
	desc = "A magnetic tape that can hold some information."
	icon_state = "tape_white"
	item_state = "analyzer"
	w_class = ITEM_SIZE_TINY
	matter = list(DEFAULT_WALL_MATERIAL = 20, "glass" = 5)
	force = 1
	throwforce = 0
	var/random_color = TRUE
	var/ruined = 0
	var/can_be_rewrited = TRUE

	var/list/datum/track/track
	var/uploader_ckey

/obj/item/device/cassette/Initialize()
	. = ..()
	if(random_color)
		icon_state = "tape_[pick("white", "blue", "red", "yellow", "purple")]"

/obj/item/device/cassette/on_update_icon()
	overlays.Cut()
	if(ruined)
		overlays += "ribbonoverlay"

/obj/item/device/cassette/fire_act()
	ruin()

/obj/item/device/cassette/attack_self(mob/user)
	if(!ruined)
		to_chat(user, SPAN_NOTICE("You pull out all the tape!"))
		ruin()

/obj/item/device/cassette/proc/ruin()
	ruined = TRUE
	update_icon()

/obj/item/device/cassette/proc/fix()
	ruined = FALSE
	update_icon()

/obj/item/device/cassette/attackby(obj/item/I, mob/user, params)
	if(ruined && isScrewdriver(I))
		to_chat(user, SPAN_NOTICE("You start winding the cassette back in..."))
		if(do_after(user, 120, target = src))
			to_chat(user, SPAN_NOTICE("You wound the cassette back in."))
			fix()
		return
	/*
	if(istype(I, /obj/item/weapon/pen))
		if(loc == user && !user.incapacitated())
			var/new_name = input(user, "What would you like to label the cassette?", "Cassette labeling") as null|text
			if(isnull(new_name)) return

			new_name = sanitizeSafe(new_name)

			if(new_name)
				SetName("cassette - \"[new_name]\"")
				to_chat(user, SPAN_NOTICE("You label the cassette '[new_name]'."))
			else
				SetName("cassette")
				to_chat(user, SPAN_NOTICE("You scratch off the label."))
		return */
	..()

/obj/item/device/cassette/custom
	name = "dusty casette"
	desc = "A dusty cassette, very expensive by the way."

/obj/item/device/cassette/custom/attack_self(mob/user)
	if(!ruined && !track)
		if(setup_cassette(user))
			log_and_message_admins("uploaded new sound <a href='?_src_=holder;listensound=\ref[track.track]'>(preview)</a> in <a href='?_src_=holder;adminplayerobservefollow=\ref[src]'>the cassette</a> with track name \"[track.title]\". <A HREF='?_src_=holder;wipedata=\ref[src]'>Wipe</A> data.")
		return
	..()

/obj/item/device/cassette/custom/proc/setup_cassette(mob/user)
	var/sound_file = input(user, "Pick sound:","File") as null|sound
	if(isnull(sound_file)) return 0

	var/new_name = input(user, "Name the cassette:") as null|text
	if(isnull(new_name)) return 0

	new_name = sanitizeSafe(new_name)

	if(new_name)
		SetName("cassette - \"[new_name]\"")

	if(sound_file && new_name)
		track = new /datum/track(new_name, sound_file)
		return 1
	return 0

//Custom pre-made cassetes

/obj/item/device/cassette/title2
	name = "Title 2"
	track = new /datum/track("Title 2", 'sound/music/title2.ogg')
	can_be_rewrited = FALSE

/obj/item/device/cassette/clouds
	name = "Clouds"
	track = new /datum/track("Clouds of Fire", /music_track/clouds_of_fire)
	can_be_rewrited = FALSE
