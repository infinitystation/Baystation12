/obj/machinery/media/music_writer
	name = "Memories writer"
	icon = 'infinity/icons/obj/machinery/disk_writer.dmi'
	icon_state = "writer_off"
	density = 0
	power_channel = EQUIP
	use_power = 1
	idle_power_usage = 10
	active_power_usage = 100

	var/mob/retard //current user
	var/coin = 0
	var/cooldown = 0 // Every 5 minute after successful re-write.

	var/writing = FALSE

	var/obj/item/music_tape/disk

/obj/machinery/media/music_writer/Initialize(mapload)
	pixel_x = (dir & 3)? 0 : (dir == 4 ? -28 : 28)
	pixel_y = (dir & 3)? (dir ==1 ? -25 : 25) : 0
	. = ..(mapload)

/obj/machinery/media/music_writer/Process()
	if(writing)
		if(!check_victim())
			set_off()
	if(cooldown)
		cooldown -= 1 SECOND

/obj/machinery/media/music_writer/proc/check_victim()
	if(locate(retard, src.loc))
		return 1
	return 0

/obj/machinery/media/music_writer/proc/set_off()
	if(retard)
		retard = null
	writing = FALSE
	update_icon()

/obj/machinery/media/music_writer/proc/set_on(var/mob/M)
	if(M)
		retard = M
		writing = TRUE
		update_icon()

/obj/machinery/media/music_writer/attackby(obj/O, mob/user)
	if(istype(O, /obj/item/weapon/material/coin/silver))
		user.drop_item()
		qdel(O)
		coin++

	if(istype(O, /obj/item/music_tape))
		var/obj/item/music_tape/D = O
		if(disk)
			to_chat(user, SPAN_NOTICE("There is already a disk inside."))
			return

		if(D.ruined)
			to_chat(user, SPAN_NOTICE("\The [D] is ruined, you can't use it."))
			return

		visible_message(SPAN_NOTICE("[user] insert the disk in to \the [src]."))
		user.drop_item()
		D.forceMove(src)
		disk = D

/obj/machinery/media/music_writer/physical_attack_hand(mob/user)
	if(locate(user, src.loc))
		interact(user)

/obj/machinery/media/music_writer/interact(mob/user)
	var/dat = "Please insert a coin[disk ? "" : " and disk"]<br>"
	if(writing)
		dat = "Memory scan completed. <br>Writing from scan of [retard.name] mind... Please Stand By."

	if(coin && disk && !writing)
		dat = "<A href='?src=\ref[src];write=1'>Write</A>"

	if(disk && !writing)
		dat += "<br><a href='?src=\ref[src];eject=1'>Eject Disk</a>"

	playsound(src, 'infinity/sound/machines/console/console2.ogg', 40, 1)

	var/datum/browser/popup = new(user, "musicwriter", "Music Writer", 200, 100)
	popup.set_content(dat)
	popup.open()

/obj/machinery/media/music_writer/attack_ai(mob/user)
	return

/obj/machinery/media/music_writer/OnTopic(var/user, var/list/href_list)
	if(href_list["write"])
		if(!writing && !retard && coin && disk && cooldown == 0)
			if(disk.can_be_rewrited)
				if(write_disk(usr))
					message_admins("[retard.real_name]([retard.ckey]) uploaded new sound <A HREF='?_src_=holder;listensound=\ref[disk.track.track]'>(preview)</A> in <a href='?_src_=holder;adminplayerobservefollow=\ref[src]'>the cassette</a> named as \"[disk.track.title]\". <A HREF='?_src_=holder;wipedata=\ref[disk]'>Wipe</A> data.")
					coin -= 1
					cooldown += 5 MINUTES
					sleep(40)

					playsound(src, 'infinity/sound/machines/console/console_success.ogg', 40, 1)
					sleep(20)

					eject(usr)
					set_off()
			else
				playsound(src, 'infinity/sound/machines/console/console_error.ogg', 40, 1)
				to_chat(usr, SPAN_DANGER("You can't rewrite this disk."))

	if(href_list["eject"])
		if(usr.incapacitated())
			return

		if(!disk)
			to_chat(usr, SPAN_NOTICE("There's no disk in \the [src]"))
			return

		if(writing)
			to_chat(usr, SPAN_DANGER("You can't eject the disk while \the [src] is working."))
			return

		visible_message(SPAN_NOTICE("[usr] eject the disk from \the [src]."))
		eject(usr)

	return TOPIC_REFRESH

/obj/machinery/media/music_writer/proc/write_disk(mob/user)
	set_on(user)

	playsound(src, pick(GLOB.console_interact_sound), 40, 1)

	var/new_sound_file = input(user, "Pick file:","File") as null|sound
	if(!new_sound_file)
		playsound(src, 'infinity/sound/machines/console/console_error.ogg', 40, 1)
		return

	playsound(src, pick(GLOB.console_interact_sound), 40, 1)

	var/new_name = input(user, "Name the cassette:") as null|text
	if(!new_name)
		playsound(src, 'infinity/sound/machines/console/console_error.ogg', 40, 1)
		return

	playsound(src, pick(GLOB.console_interact_sound), 40, 1)

	new_name = sanitizeSafe(new_name)

	if(new_sound_file && new_name && writing)
		playsound(src, 'infinity/sound/machines/console/console.ogg', 40)

		disk.SetName("cassette - \"[new_name]\"")

		if(disk.track) //Removing old datum disk if there one
			qdel(disk.track)

		var/datum/track/T = new(new_name, new_sound_file)

		if(T)
			disk.track = T
			disk.uploader_ckey = retard.ckey
			return 1
	return 0

/obj/machinery/media/music_writer/proc/eject(mob/user)
	playsound(src, 'infinity/sound/machines/console/console3.ogg', 40, 1)
	user.put_in_hands(disk)
	disk = null

/obj/machinery/media/music_writer/on_update_icon()
	if(writing)
		icon_state = "writer_on"
	else
		icon_state = "writer_off"
