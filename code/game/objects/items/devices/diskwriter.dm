/obj/machinery/media/music_writer
	name = "Memories writer"
	icon = 'icons/obj/infinity_object.dmi'
	icon_state = "writer_off"
	density = 0
	var/coin = 0

	var/mob/retard //current user

	var/writing = FALSE

	var/obj/item/device/cassette/disk

/obj/machinery/media/music_writer/Initialize(mapload)
	pixel_x = (dir & 3)? 0 : (dir == 4 ? -28 : 28)
	pixel_y = (dir & 3)? (dir ==1 ? -25 : 25) : 0
	. = ..(mapload)

/obj/machinery/media/music_writer/Process()
	if(writing)
		if(!check_victim())
			set_off()

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
	if(istype(O, /obj/item/weapon/coin))
		user.drop_item()
		qdel(O)
		coin++

	if(istype(O, /obj/item/device/cassette))
		var/obj/item/device/cassette/D = O
		if(disk)
			to_chat(user, "<span class='notice'>There is already a disk inside.</span>")
			return

		if(D.ruined)
			to_chat(user, "<span class='warning'>\The [D] is ruined, you can't use it.</span>")
			return

		visible_message("<span class='notice'>[usr] insert the disk in to \the [src].</span>")
		user.drop_item()
		D.forceMove(src)
		disk = D

/obj/machinery/media/music_writer/attack_hand(mob/user)
	var/list/dat = ""
	if(writing)
		dat += "Memory scan completed. <br>Writing from scan of [retard.name] mind... Please Stand By."
	else if(!coin || !disk)
		dat += "Please insert a coin[disk ? "" : " and disk"]."
	else
		dat += "<A href='?src=\ref[src];write=1'>Write</A>"

	if(disk)
		dat += "<br><a href='?src=\ref[src];eject=1'>Eject Disk</a>"

	playsound(get_turf(src), 'sound/machines/console/console2.ogg', 40, 1)

	user << browse(dat, "window=musicwriter;size=200x100")
	onclose(user, "onclose")
	return

/obj/machinery/media/music_writer/Topic(href, href_list)
	if(href_list["eject"])
		if(usr.incapacitated())
			return

		if(!disk)
			to_chat(usr, "<span class='notice'>There's no disk in \the [src].</span>")
			return

		if(writing)
			to_chat(usr, "<span class='danger'>You can't eject the disk while \the [src] is working.</span>")
			return

		visible_message("<span class='notice'>[usr] eject the disk from \the [src].</span>")
		playsound(get_turf(src), 'sound/machines/console/console3.ogg', 40, 1)
		usr.put_in_hands(disk)
		disk = null

	if(href_list["write"])
		if(!writing && !retard && coin && disk)
			if(disk.can_be_rewrited)
				var/interact_sound = "sound/machines/console/console_interact[rand(1,7)].ogg"
				playsound(get_turf(src), interact_sound, 40, 1)

				set_on(usr)

				var/new_sound_file = input(usr, "Pick file:","File") as null|file
				if(!new_sound_file)
					playsound(get_turf(src), 'sound/machines/console/console_error.ogg', 40, 1)
					return

				interact_sound = "sound/machines/console/console_interact[rand(1,7)].ogg"
				playsound(get_turf(src), interact_sound, 40, 1)

				var/new_name = input(usr, "Name the cassette:") as null|text
				if(!new_name)
					playsound(get_turf(src), 'sound/machines/console/console_error.ogg', 40, 1)
					return

				interact_sound = "sound/machines/console/console_interact[rand(1,7)].ogg"
				playsound(get_turf(src), interact_sound, 40, 1)

				new_name = sanitizeSafe(new_name)

				playsound(get_turf(src), 'sound/machines/console/console.ogg', 40)

				if(new_sound_file && new_name && writing)
					SetName("cassette - \"[new_name]\"")

					if(disk.tracks) //Removing old datum disk if there one
						qdel(disk.tracks)

					var/datum/track/T = new(new_name, new_sound_file)

					if(T)
						disk.tracks = T
						disk.uploader_ckey = retard.ckey

						message_admins("[retard.real_name]([retard.ckey]) uploaded new sound <A HREF='?_src_=holder;listensound=\ref[new_sound_file]'>(preview)</A> in <a href='?_src_=holder;adminplayerobservefollow=\ref[src]'>the cassette</a> named as [new_name]. <A HREF='?_src_=holder;wipedata=\ref[disk]'>Wipe</A> data.")
						sleep(40)

						playsound(get_turf(src), 'sound/machines/console/console_success.ogg', 40, 1)
						sleep(20)
						playsound(get_turf(src), 'sound/machines/console/console3.ogg', 40, 1)

						usr.put_in_hands(disk)
						disk = null

						coin -= 1
						set_off()
			else
				playsound(get_turf(src), 'sound/machines/console/console_error.ogg', 40, 1)
				to_chat(usr, "<span class='danger'>You can't rewrite this disk.</span>")
				return

/obj/machinery/media/music_writer/update_icon()
	if(writing)
		icon_state = "writer_on"
	else
		icon_state = "writer_off"
