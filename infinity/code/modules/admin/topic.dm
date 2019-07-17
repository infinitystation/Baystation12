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

	if(href_list["pray_options"])
		if(!check_rights(R_ADMIN|R_FUN))
			return

		var/mob/living/carbon/human/H = locate(href_list["pray_options"])
		if(!ishuman(H))
			to_chat(usr, "This can only be used on instances of type /mob/living/carbon/human")
			return

		var/choices = list()
		choices += "Give Cookie"
		choices += "Give Cup of Coffee"
		choices += "Give Cup of Tea"
		choices += "Punish"

		var/response = input(usr, "What do you want to do?", "God ") as null|anything in choices
		if(!response)
			return

		switch(response)
			if("Give Cookie")
				if(H.equip_to_storage_or_drop(new /obj/item/weapon/reagent_containers/food/snacks/cookie(H)))
					log_admin("[key_name(H)] got their cookie, spawned by [key_name(usr)]")
					message_admins("[key_name(H)] got their cookie, spawned by [key_name(usr)]")
					SSstatistics.add_field("admin_cookies_spawned",1)
					to_chat(H, "<span class='notice'>Your prayers have been answered!! You received the <b>best cookie</b>!</span>")

			if("Give Cup of Coffee")
				var/obj/item/weapon/reagent_containers/food/drinks/glass2/coffeecup/coffee = new /obj/item/weapon/reagent_containers/food/drinks/glass2/coffeecup(get_turf(H))
				coffee.reagents.add_reagent(/datum/reagent/drink/coffee, 30)
				if(H.equip_to_storage_or_drop(coffee))
					log_admin("[key_name(H)] got their cup of coffee, spawned by [key_name(usr)]")
					message_admins("[key_name(H)] got their cup of coffee, spawned by [key_name(usr)]")
					SSstatistics.add_field("admin_coffe_spawned",1)
					to_chat(H, "<span class='notice'>Your prayers have been answered!! You received the <b>cup of coffee</b>!</span>")

			if("Give Cup of Tea")
				if(H.equip_to_storage_or_drop(new /obj/item/weapon/reagent_containers/food/drinks/tea/green))
					log_admin("[key_name(H)] got their cup of green tea, spawned by [key_name(usr)]")
					message_admins("[key_name(H)] got their cup of green tea, spawned by [key_name(usr)]")
					SSstatistics.add_field("admin_tea_spawned",1)
					to_chat(H, "<span class='notice'>Your prayers have been answered!! You received the <b>cup of green tea</b>!</span>")

			if("Punish")
				var/list/punishment_list = list("Lightning bolt", "Brain damage", "Gib", "Rod")

				var/punishment = input("Choose a punishment", "DIVINE SMITING") as null|anything in punishment_list

				if(QDELETED(H) || !punishment)
					return

				switch(punishment)
					if("Lightning bolt")
						var/turf/T = get_step(get_step(H, NORTH), NORTH)
						T.Beam(H, icon_state = "lightning[rand(1,12)]", icon = 'infinity/icons/effects/beam.dmi', time = 5)
						H.adjustFireLoss(75)
						H.electrocution_animation(40)
						to_chat(H, SPAN_DANGER("The gods have punished you for your sins!"))
					if("Brain damage")
						H.adjustBrainLoss(75)
					if("Gib")
						H.gib(FALSE)

					if("Rod")
						var/turf/T = get_turf(H)
						var/startside = pick(GLOB.cardinal)
						var/turf/startT = spaceDebrisStartLoc(startside, T.z)
						var/turf/endT = spaceDebrisFinishLoc(startside, T.z)
						new /obj/effect/immovablerod(startT, endT, H)

				message_admins("[key_name_admin(usr)] punished [key_name_admin(H)] with [punishment].")
				log_admin("[key_name(usr)] punished [key_name(H)] with [punishment].")
