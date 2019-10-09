//Custom pre-made cassetes
/obj/item/music_tape/title2
	name = "Title 2"
	track = new /datum/track("Title 2", 'sound/music/title2.ogg')
	can_be_rewrited = FALSE

/obj/item/music_tape/clouds
	name = "Clouds"
	track = new /datum/track("Clouds of Fire", /music_track/clouds_of_fire)
	can_be_rewrited = FALSE

/obj/item/music_tape/custom
	name = "dusty tape"
	desc = "A dusty tape, which can hold anything. Only what you need is blow the dust away and you will be able to play it again."

// Music tape code :3
/obj/item/music_tape
	name = "music tape"
	desc = "Magnetic tape adapted to outdated but proven music formats such as midi, wav and module files."
	icon = 'icons/obj/device.dmi'
	icon_state = "tape_white"
	item_state = "analyzer"
	w_class = ITEM_SIZE_TINY
	force = 1
	throwforce = 0

	matter = list(MATERIAL_PLASTIC = 20, MATERIAL_STEEL = 5, MATERIAL_GLASS= 5)

	var/random_color = TRUE
	var/ruined = 0
	var/can_be_rewrited = TRUE

	var/list/datum/track/track
	var/uploader_ckey

/obj/item/music_tape/Initialize()
	. = ..()
	if(random_color)
		icon_state = "tape_[pick("white", "blue", "red", "yellow", "purple")]"

/obj/item/music_tape/on_update_icon()
	overlays.Cut()
	if(ruined)
		overlays += "ribbonoverlay"

/obj/item/music_tape/examine(mob/user)
	. = ..(user)
	if(.) if(track) to_chat(user, SPAN_NOTICE("It's labeled as \"[track.title]\"."))

/obj/item/music_tape/attack_self(mob/user)
	if(!ruined)
		to_chat(user, SPAN_NOTICE("You pull out all the tape!"))
		ruin()

/obj/item/music_tape/attackby(obj/item/I, mob/user, params)
	if(ruined && (isScrewdriver(I) || istype(I, /obj/item/weapon/pen)))
		to_chat(user, SPAN_NOTICE("You start winding \the [src] back in..."))
		if(do_after(user, 120, target = src))
			to_chat(user, SPAN_NOTICE("You wound \the [src] back in."))
			fix()
		return
	/*
	if(istype(I, /obj/item/weapon/pen))
		if(loc == user && !user.incapacitated())
			var/new_name = input(user, "What would you like to label \the [src]?", "\improper [src] labeling") as null|text
			if(isnull(new_name)) return

			new_name = sanitizeSafe(new_name)

			if(new_name)
				SetName("[src] - \"[new_name]\"")
				to_chat(user, SPAN_NOTICE("You label \the [src] '[new_name]'."))
			else
				SetName("[src]")
				to_chat(user, SPAN_NOTICE("You scratch off the label."))
		return */
	..()

/obj/item/music_tape/fire_act()
	ruin()

/obj/item/music_tape/custom/attack_self(mob/user)
	if(!ruined && !track)
		if(setup_tape(user))
			log_and_message_admins("uploaded new sound <a href='?_src_=holder;listen_tape_sound=\ref[track.track]'>(preview)</a> in <a href='?_src_=holder;adminplayerobservefollow=\ref[src]'>\the [src]</a> with track name \"[track.title]\". <A HREF='?_src_=holder;wipe_tape_data=\ref[src]'>Wipe</A> data.")
		return
	..()

/obj/item/music_tape/custom/proc/setup_tape(mob/user)
	var/sound_file = input(user, "Pick sound:","File") as null|sound
	if(isnull(sound_file)) return 0

	var/new_name = input(user, "Name \the [src]:") as null|text
	if(isnull(new_name)) return 0

	new_name = sanitizeSafe(new_name)

/*	if(new_name)
		SetName("[src] - \"[new_name]\"")*/

	if(sound_file && new_name)
		track = new /datum/track(new_name, sound_file)
		return 1
	return 0

/obj/item/music_tape/proc/CanPlay()
	if(!track)
		return FALSE

	if(ruined)
		return FALSE

	return TRUE

/obj/item/music_tape/proc/ruin()
	ruined = TRUE
	update_icon()

/obj/item/music_tape/proc/fix()
	ruined = FALSE
	update_icon()
