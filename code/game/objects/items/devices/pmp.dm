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

/obj/item/device/pmp
	name = "portable media player"
	desc = "A little device which looks like a old radio. Can be used to play soft tunes."
	icon = 'icons/obj/pmp.dmi'
	icon_state = "pmp"
	item_state = "radio"
	w_class = ITEM_SIZE_NORMAL
	obj_flags = OBJ_FLAG_CONDUCTIBLE
	slot_flags = SLOT_BELT
	throwforce = 2
	throw_speed = 4
	throw_range = 10

	matter = list(DEFAULT_WALL_MATERIAL = 60, "glass" = 30)

	var/playing = 0
	var/volume = 20 // max 50

	var/sound_id
	var/datum/sound_token/sound_token

	var/obj/item/weapon/cell/device/cell = /obj/item/weapon/cell/device
	var/obj/item/device/cassette/cassette = null

	var/serial_number

/obj/item/device/pmp/Initialize()
	. = ..()
	serial_number = "[rand(1,999)]"

	if(ispath(cell))
		cell = new cell(src)

	if(ispath(cassette))
		cassette = new cassette(src)

	sound_id = "[type]_[sequential_id(type)]"

	message_admins("RADIO: <a href='?_src_=holder;adminplayerobservefollow=\ref[src]'>#[serial_number]</a> has been created.")

	GLOB.pmp_list += src
	update_icon()

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
			visible_message("<span class='warning'>\The [src] is suddenly turned off.</span>")
			return
		else
			cell.use(0.0833333333)

/obj/item/device/pmp/update_icon()
	overlays.Cut()
	if(playing)
		overlays += image(icon, "[icon_state]_play")
	if(!cell)
		overlays += image(icon, "[icon_state]_open")

/obj/item/device/pmp/examine(mob/user)
	. = ..()
	if(user in oview(src, 2))
		if(serial_number)
			to_chat(user, "The serial number \"#[serial_number]\" is generated on the case.")
		if(cassette)
			to_chat(user, "<span class='notice'>You can see a cassette inside it. The label says \"[cassette.name]\".</span>")

/obj/item/device/pmp/attack_self(mob/user)
	playsound(get_turf(src), 'sound/machines/switch1.ogg')
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
			to_chat(user, "<span class='notice'>There is already a cassette inside.</span>")
			return

		if(C.ruined)
			to_chat(user, "<span class='warning'>\The [C] is ruined, you can't use it.</span>")
			return

		if(!user.unEquip(C))
			return

		I.forceMove(src)
		cassette = C
		visible_message(
			"<span class='notice'>[user] insert a [C] into \the [src].</span>",
			"<span class='notice'>You insert a [C] into \the [src].</span>")
		playsound(get_turf(src), 'sound/weapons/TargetOn.ogg', 35, 1)
		return

	if(istype(I, /obj/item/weapon/cell/device))
		var/obj/item/weapon/cell/device/C = I
		if(cell)
			to_chat(user, "<span class='notice'>[src] already has a cell installed.</span>")
			return

		if(!user.unEquip(C))
			return

		I.forceMove(src)
		cell = C
		to_chat(user, "<span class='notice'>You insert a [C] into \the [src].</span>")
		update_icon()
		return

	else if(isScrewdriver(I))
		if(cell)
			StopPlaying()
			playsound(src.loc, 'sound/items/Screwdriver.ogg', 45, 1)
			to_chat(user, "<span class='notice'>You pulled out [cell] out of [src] with [I].</span>")
			usr.put_in_hands(cell)
			cell = null
			update_icon()
		else
			to_chat(user, "<span class='notice'>\The [src] doesn't have a cell installed.</span>")
		return
	..()

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

/obj/item/device/pmp/proc/eject(mob/user)
	if(!cassette)
		to_chat(user, "<span class='notice'>There's no cassette in \the [src].</span>")
		return

	if(playing)
		StopPlaying()

	playsound(get_turf(src), "sound/machines/Custom_screwdriveropen.ogg", 20, 1)
	if(user)
		visible_message(
			"<span class='notice'>[user] eject the cassette.</span>",
			"<span class='notice'>You eject the cassette.</span>")
	if(user)
		user.put_in_hands(cassette)
	else
		cassette.dropInto(loc)
	cassette = null

/obj/item/device/pmp/verb/volume()
	set name = "Change Volume"
	set category = "Object"
	set src in usr

	if(usr.incapacitated())
		return

	var/vol = input(usr, "What volume would you like the sound to play at? (maximum number is 50)",, volume) as null|num
	if(vol)
		AdjustVolume(vol)
	return

/obj/item/device/pmp/proc/AdjustVolume(var/new_volume)
	volume = Clamp(new_volume, 0, 50)
	if(sound_token)
		sound_token.SetVolume(volume)

/obj/item/device/pmp/proc/explode()
	walk_to(src, 0)
	src.visible_message("<span class='danger'>\the [src] blows apart!</span>", 1)

	explosion(src.loc, 0, 0, 1, rand(1, 2), 1)

	var/datum/effect/effect/system/spark_spread/s = new /datum/effect/effect/system/spark_spread
	s.set_up(3, 1, src)
	s.start()

	new /obj/effect/decal/cleanable/blood/oil(src.loc)
	qdel(src)

/obj/item/device/pmp/proc/StartPlaying()
	if(isnull(cell))
		return

	if(isnull(cassette))
		return

	if(!cassette.tracks)
		return

	if(cassette.ruined)
		src.visible_message("<span class='warning'>The cassette is unusable to play.</span>", 1)
		return

	// Jukeboxes cheat massively and actually don't share id. This is only done because it's music rather than ambient noise.
	sound_token = sound_player.PlayLoopingSound(src, sound_id, cassette.tracks.sound, volume = volume, range = 7, falloff = 3, prefer_mute = TRUE)

	log_and_message_admins("launched a [src] <a href='?_src_=holder;adminplayerobservefollow=\ref[src]'>#[serial_number]</a> with the song \"[cassette.tracks.title]\".")

	playing = 1
	START_PROCESSING(SSobj, src)
	update_icon()

/obj/item/device/pmp/proc/StopPlaying()
	playing = 0
	STOP_PROCESSING(SSobj, src)
	QDEL_NULL(sound_token)
	update_icon()

/obj/item/device/pmp/fire_act()
	StopPlaying()
	if(cassette)
		cassette.ruin()
	return ..()

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
	var/ruined = 0
	var/can_be_rewrited = TRUE

	var/list/datum/track/tracks
	var/uploader_ckey

/obj/item/device/cassette/update_icon()
	overlays.Cut()
	if(ruined)
		overlays += "ribbonoverlay"

/obj/item/device/cassette/fire_act()
	ruin()

/obj/item/device/cassette/attack_self(mob/user)
	if(!ruined)
		to_chat(user, "<span class='notice'>You pull out all the tape!</span>")
		ruin()

/obj/item/device/cassette/proc/ruin()
	ruined = TRUE
	update_icon()

/obj/item/device/cassette/proc/fix()
	ruined = FALSE
	update_icon()

/obj/item/device/cassette/attackby(obj/item/I, mob/user, params)
	if(ruined && isScrewdriver(I))
		to_chat(user, "<span class='notice'>You start winding the cassette back in...</span>")
		if(do_after(user, 120, target = src))
			to_chat(user, "<span class='notice'>You wound the cassette back in.</span>")
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
				to_chat(user, "<span class='notice'>You label the cassette '[new_name]'.</span>")
			else
				SetName("cassette")
				to_chat(user, "<span class='notice'>You scratch off the label.</span>")
		return */
	..()

/obj/item/device/cassette/custom
	name = "dusty casette"
	desc = "A dusty cassette, very expensive by the way."

/obj/item/device/cassette/custom/attack_self(mob/user)
	if(!tracks)
		if(setup_cassette(user))
			log_and_message_admins("uploaded new sound <a href='?_src_=holder;listensound=\ref[tracks.sound]'>(preview)</a> in <a href='?_src_=holder;adminplayerobservefollow=\ref[src]'>the cassette</a> with track name \"[tracks.title]\". <A HREF='?_src_=holder;wipedata=\ref[src]'>Wipe</A> data.")
		return
	..()

/obj/item/device/cassette/custom/proc/setup_cassette(mob/user)
	var/sound_file = input(user, "Pick sound:","File") as null|file
	if(isnull(sound_file)) return 0

	var/new_name = input(user, "Name the cassette:") as null|text
	if(isnull(new_name)) return 0

	new_name = sanitizeSafe(new_name)

	if(new_name)
		SetName("cassette - \"[new_name]\"")

	if(sound_file && new_name)
		tracks = new /datum/track(new_name, sound_file)
		return 1
	return 0

/obj/item/device/cassette/random/New()
	icon_state = "tape_[pick("white", "blue", "red", "yellow", "purple")]"

//Custom pre-made cassetes

/obj/item/device/cassette/title2
	name = "Title 2"
	tracks = new /datum/track("Title 2", 'sound/music/title2.ogg')
	can_be_rewrited = FALSE

/obj/item/device/cassette/clouds
	name = "Clouds"
	tracks = new /datum/track("Clouds of Fire", 'sound/music/clouds.s3m')
	can_be_rewrited = FALSE
