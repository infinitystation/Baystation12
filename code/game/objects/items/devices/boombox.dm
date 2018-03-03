GLOBAL_LIST_EMPTY(boombox_list)

/client/proc/list_current_boomboxes()
	set category = "Fun"
	set name = "List current Boomboxes"
	set desc = "Lists all the current boomboxes and control it"

	if(!check_rights(R_ADMIN|R_SPAWN, 0, usr))
		return

	var/list/dat = list("<html><body><center><div class='statusDisplay'>")

	dat += "<b>Current boomboxes list:</b><br>"

	if(!GLOB.boombox_list)
		dat += "At the moment there are no items in this world session."
	else
		for(var/a in GLOB.boombox_list)
			var/obj/item/device/boombox/G = a
			dat += "[G.name] : <a href='?_src_=holder;play_boombox=\ref[G]'>Play/Stop</a> | "
			dat += "<a href='?_src_=holder;adminplayerobservefollow=\ref[G]'>Current location</a> | "
			dat += "<a href='?_src_=vars;Vars=\ref[G]'>VV</a> | "
			dat += "<a href='?_src_=holder;explode_boombox=\ref[G]'>\[<font color='red'>X</font>\]</a><br>"

	dat += "</div></center></body></html>"
	dat = jointext(dat,null)

	var/datum/browser/popup = new(usr, "List current Boomboxes","List current Boomboxes", 420, 300, src)
	popup.set_content(dat)
	popup.open()

	feedback_add_details("admin_verb","LCB") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/obj/item/device/boombox
	name = "Boombox"
	desc = "A retro-designed device that can blow up your ears."
	icon = 'icons/obj/boombox.dmi'
	icon_state = "boombox0"
	item_state = "defibunit"
	w_class = ITEM_SIZE_LARGE
	obj_flags = OBJ_FLAG_CONDUCTIBLE
	slot_flags = SLOT_BACK
	throwforce = 2
	throw_speed = 4
	throw_range = 10

	matter = list(DEFAULT_WALL_MATERIAL = 60, "glass" = 30)

	var/emagged = 0
	var/playing = 0
	var/volume = 20 // max 50

	var/sound_id
	var/datum/sound_token/sound_token

	var/obj/item/weapon/cell/device/cell = /obj/item/weapon/cell/device
	var/obj/item/device/cassette/cassette = null

	var/serial_number

/obj/item/device/boombox/New()
	..()
	serial_number = "[rand(1,999)]"
	SetName("Boombox #[serial_number]")

	if(ispath(cell))
		cell = new cell(src)

	if(ispath(cassette))
		cassette = new cassette(src)

	sound_id = "[type]_[sequential_id(type)]"

	GLOB.boombox_list += src
	update_icon()

/obj/item/device/boombox/Destroy()
	StopPlaying()

	if(cell)
		qdel(cell)
		cell = null

	if(cassette)
		qdel(cassette)
		cassette = null

	GLOB.boombox_list -= src
	. = ..()

/obj/item/device/boombox/Process()
	if(cell && playing)
		if(cell.charge < 0.0833333333)
			StopPlaying()
			visible_message("<span class='warning'>The [src] is suddenly turned off.</span>")
			return
		else
			cell.use(0.0833333333)
			// world << "BOOMBOX-DEV: the curret charge is [cell.charge]%"

/obj/item/device/boombox/update_icon()
	icon_state = "boombox[playing ? "1" : "0"]"

/obj/item/device/boombox/examine(mob/user)
	. = ..()
	if(cassette)
		to_chat(user, "<span class='notice'>You can see a cassette inside it. The label says \"[cassette.name]\".</span>")

/obj/item/device/boombox/attack_self(mob/user)
	playsound(get_turf(src), 'sound/machines/click.ogg')
	if(playing)
		StopPlaying()
		return

	if(cell && cell.charge < 0.0333333333 || !cell)
		return

	if(emagged)
		emag_play()
	else
		StartPlaying()

/obj/item/device/boombox/attackby(obj/item/I, mob/user, params)
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
			"<span class='notice'>You insert a [C] into \the [src].</span>",
			"<span class='notice'>[user] insert a [C] into \the [src].</span>")
		playsound(get_turf(src), 'sound/weapons/TargetOn.ogg', 50, 1)
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
		return

	else if(isScrewdriver(I))
		if(cell)
			StopPlaying()
			to_chat(user, "<span class='notice'>You pulled out [cell] out of [src] with [I].</span>")
			usr.put_in_hands(cell)
			cell = null
		else
			to_chat(user, "<span class='notice'>[src] doesn't have a cell installed.</span>")
		return

	..()

/obj/item/device/boombox/verb/eject()
	set name = "Eject Cassette"
	set category = "Object"

	if(usr.incapacitated())
		return

	if(!cassette)
		to_chat(usr, "<span class='notice'>There's no cassette in \the [src].</span>")
		return

	if(emagged)
		to_chat(usr, "<span class='notice'>The cassette seems to be stuck inside.</span>")
		return

	if(playing)
		StopPlaying()

	visible_message(
			"<span class='notice'>You eject the cassette.</span>",
			"<span class='notice'>[usr] ejects the cassette.</span>")
	playsound(get_turf(src), "sound/machines/Custom_screwdriveropen.ogg", 30, 1)
	usr.put_in_hands(cassette)
	cassette = null
	update_icon()

/obj/item/device/boombox/fire_act()
	StopPlaying()
	if(cassette)
		cassette.ruin()
	return ..()


/obj/item/device/boombox/attack_hand(mob/user)
	if(user.get_inactive_hand() == src)
		if(cassette)
			eject()
			return
	..()

/obj/item/device/boombox/verb/volume()
	set name = "Change Volume"
	set category = "Object"
	var/vol = input(usr, "What volume would you like the sound to play at? (maximum number is 50)",, volume) as null|num
	if(vol)
		AdjustVolume(vol)
	return

/obj/item/device/boombox/emag_act(var/remaining_charges, var/mob/user)
	if(!emagged)
		emagged = 1
		StopPlaying()
		visible_message("<span class='danger'>\The [src] makes a fizzling sound.</span>")
		update_icon()
		return 1

/obj/item/device/boombox/proc/emag_play()
	playsound(loc, 'sound/items/AirHorn.ogg', 100, 1)
	for(var/mob/living/carbon/M in ohearers(6, src))
		if(istype(M, /mob/living/carbon/human))
			var/mob/living/carbon/human/H = M
			if(istype(H.l_ear, /obj/item/clothing/ears/earmuffs) || istype(H.r_ear, /obj/item/clothing/ears/earmuffs))
				continue
		M.sleeping = 0
		M.stuttering += 20
		M.ear_deaf += 30
		M.Weaken(3)
		if(prob(30))
			M.Stun(10)
			M.Paralyse(4)
		else
			M.make_jittery(400)
	spawn(15)
		explode()

/obj/item/device/boombox/proc/explode()
	if(cell)
		qdel(cell)
		cell = null

	if(cassette)
		qdel(cassette)
		cassette = null

	walk_to(src, 0)
	src.visible_message("<span class='danger'>\the [src] blows apart!</span>", 1)
	log_and_message_admins("шарманка #[serial_number] доигралась и взорвалась!")

	explosion(src.loc, 0, 0, 1, rand(1, 2), 1)

	var/datum/effect/effect/system/spark_spread/s = new /datum/effect/effect/system/spark_spread
	s.set_up(3, 1, src)
	s.start()

	new /obj/effect/decal/cleanable/blood/oil(src.loc)
	qdel(src)

/obj/item/device/boombox/proc/StartPlaying()
	if(isnull(cell))
		return

	if(isnull(cassette))
		return

	if(src.cassette.ruined)
		src.visible_message("<span class='warning'>The cassette has become unusable.</span>", 1)
		return

	// Jukeboxes cheat massively and actually don't share id. This is only done because it's music rather than ambient noise.
	sound_token = sound_player.PlayLoopingSound(src, sound_id, cassette.sound_file, volume = volume, range = 7, falloff = 3, prefer_mute = TRUE)
	START_PROCESSING(SSobj, src)

	log_and_message_admins("запустил(а) шарманку <a href='?_src_=holder;adminplayerobservefollow=\ref[src]'>#[serial_number]</a> с музыкальным произведением \"[cassette.name]\".")

	playing = 1
	update_icon()

/obj/item/device/boombox/proc/StopPlaying()
	playsound(get_turf(src), 'sound/machines/click.ogg')
	playing = 0
	update_icon()
	STOP_PROCESSING(SSobj, src)
	QDEL_NULL(sound_token)

/obj/item/device/boombox/proc/AdjustVolume(var/new_volume)
	volume = Clamp(new_volume, 0, 50)
	if(sound_token)
		sound_token.SetVolume(volume)

// DJ Starter pack
/obj/item/device/boombox/elite_pack
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

	var/sound/sound_file = null

	var/ruined = 0

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
	else
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
		return
	..()

/obj/item/device/cassette/custom
	name = "dusty casette"
	desc = "A dusty cassette, very expensive by the way."

/obj/item/device/cassette/custom/attack_self(mob/user)
	if(isnull(sound_file))
		if(setup_cassette(user))
			log_and_message_admins("загрузил(а) мелодию в <a href='?_src_=holder;adminplayerobservefollow=\ref[src]'>компакт-кассету</a> с названием \"[src.name]\"")
		return
	..()

/obj/item/device/cassette/custom/proc/setup_cassette(mob/user)
	sound_file = input(user, "Pick file:","File") as null|file
	if(isnull(sound_file)) return 0

	var/new_name = input(user, "Name the cassette:") as null|text
	if(isnull(new_name)) return 0

	new_name = sanitizeSafe(new_name)

	if(new_name)
		SetName("cassette - \"[new_name]\"")

	if(sound_file && new_name)
		return 1

	return 0

/obj/item/device/cassette/random/New()
	icon_state = "tape_[pick("white", "blue", "red", "yellow", "purple")]"

//Custom pre-made cassetes

/obj/item/device/cassette/title2
	name = "Title 2"
	sound_file = 'sound/music/title2.ogg'

/obj/item/device/cassette/clouds
	name = "Clouds"
	sound_file = 'sound/music/clouds.s3m'
