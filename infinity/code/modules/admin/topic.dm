/datum/admins/Topic(href, href_list)
	..()

	if(href_list["mp_play"])
		if(!check_rights(R_ADMIN|R_FUN, 0, usr))
			return

		var/obj/item/music_player/mp = locate(href_list["mp_play"])
		if(!mp)
			return

		mp.attack_self(usr)
		mp_panel()
		return

	if(href_list["mp_volume"])
		if(!check_rights(R_ADMIN|R_FUN, 0, usr))
			return

		var/obj/item/music_player/mp = locate(href_list["mp_volume"])
		if(!mp) return

		var/vol = input(usr, "What volume would you like the sound to play at? (maximum number is 50)",, mp.volume) as null|num
		if(vol) mp.AdjustVolume(vol)

		mp_panel()
		return

	if(href_list["mp_explode"])
		if(!check_rights(R_ADMIN|R_FUN, 0, usr))
			return

		var/obj/item/music_player/mp = locate(href_list["mp_explode"])
		if(!mp) return

		switch(alert("Do you really want explode this?",,"Yes","No"))
			if("Yes")
				mp.explode()
				log_and_message_admins("launched self-destruction mechanism in \the [mp] <a href='?_src_=holder;adminplayerobservefollow=\ref[mp]'>#[mp.serial_number]</a>.")

		mp_panel()
		return

	if(href_list["listen_tape_sound"])
		var/sound/S = sound(locate(href_list["listen_tape_sound"]))
		if(!S) return

		S.channel = 703
		sound_to(usr, S)
		to_chat(usr, "<B><A HREF='?_src_=holder;stop_tape_sound=1'>Stop listening</A></B>")

	if(href_list["stop_tape_sound"])
		var/sound/S = sound(null)
		S.channel = 703
		sound_to(usr, S)

	if(href_list["wipe_tape_data"])
		var/obj/item/music_tape/tape = locate(href_list["wipe_tape_data"])
		if(!tape.track)
			to_chat(usr, "This [tape] have no data or already is wiped.")
			return

		if(alert("Wipe data written by [(tape.uploader_ckey) ? tape.uploader_ckey : "<b>*NULL*</b>"]?",,"Yes", "No") == "Yes")
			if(istype(tape.loc, /obj/machinery/media/jukebox))
				var/obj/machinery/media/jukebox/J = tape.loc
				if(J.current_track && J.current_track == tape.track)
					J.StopPlaying()
					J.current_track = null

			if(istype(tape.loc, /obj/item/music_player))
				var/obj/item/music_player/mp = tape.loc
				if(mp.mode)
					mp.StopPlaying()

			qdel(tape.track)
			tape.ruin()
			tape.SetName("burned [initial(tape.name)]")
