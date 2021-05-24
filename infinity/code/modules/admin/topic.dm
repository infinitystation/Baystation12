/datum/admins/Topic(href, href_list)
	. = ..()
	if(href_list["sendbacktolobby"])
		if(!check_rights(R_ADMIN))
			return

		var/mob/M = locate(href_list["sendbacktolobby"])

		if(!isobserver(M))
			to_chat(usr, "<span class='notice'>You can only send ghost players back to the Lobby.</span>")
			return

		if(!M.client)
			to_chat(usr, "<span class='warning'>[M] doesn't seem to have an active client.</span>")
			return

		if(alert(usr, "Send [key_name(M)] back to Lobby?", "Message", "Yes", "No") != "Yes")
			return

		log_admin("[key_name(usr)] has sent [key_name(M)] back to the Lobby.")
		message_admins("[key_name(usr)] has sent [key_name(M)] back to the Lobby.")

		var/mob/new_player/NP = new()
		NP.ckey = M.ckey
		qdel(M)

	//Player Notes
	else if(href_list["addnote"])
		var/target_ckey = href_list["addnote"]
		add_note(target_ckey)

	else if(href_list["addnoteempty"])
		add_note()

	else if(href_list["removenote"])
		var/note_id = href_list["removenote"]
		remove_note(note_id)

	else if(href_list["editnote"])
		var/note_id = href_list["editnote"]
		edit_note(note_id)

	else if(href_list["nonalpha"])
		var/target = href_list["nonalpha"]
		target = text2num(target)
		show_note(index = target)

	else if(href_list["shownote"])
		var/target = href_list["shownote"]
		show_note(index = target)

	else if(href_list["shownoteckey"])
		var/target_ckey = href_list["shownoteckey"]
		show_note(target_ckey)

	else if(href_list["notessearch"])
		var/target = href_list["notessearch"]
		show_note(index = target)

	else if(href_list["noteedits"])
		var/note_id = sanitizeSQL("[href_list["noteedits"]]")
		var/DBQuery/query_noteedits = dbcon.NewQuery("SELECT edits FROM erro_messages WHERE id = '[note_id]'")
		if(!query_noteedits.Execute())
			var/err = query_noteedits.ErrorMsg()
			log_game("SQL ERROR obtaining edits from notes table. Error : \[[err]\]\n")
			return
		if(query_noteedits.NextRow())
			var/edit_log = query_noteedits.item[1]
			show_browser(usr, edit_log,"window=noteedits")

	else if(href_list["stickyban"])
		stickyban(href_list["stickyban"],href_list)

/*	else if(href_list["show_skills"])
		var/mob/living/carbon/human/M = locate(href_list["show_skills"])
		show_skill_window(usr, M)
		skillset.open_ui(usr, M)*/

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

/*	if(href_list["wipe_tape_data"]) jukebox merge 02 05 2021 ~bear1ake
		var/obj/item/music_tape/tape = locate(href  _list["wipe_tape_data"])
		if(!tape.track)
			to_chat(usr, "This [tape] have no data or already is wiped.")
			return

		if(alert("Wipe data written by [(tape.uploader_ckey) ? tape.uploader_ckey : "<b>*NULL*</b>"]?",,"Yes", "No") == "Yes")
			if(istype(tape.loc, /obj/machinery/jukebox))
				var/obj/machinery/jukebox/J = tape.loc
				if(J.current_track == tape.track)
					J.StopPlaying()
					J.current_track = null

			if(istype(tape.loc, /obj/item/music_player))
				var/obj/item/music_player/mp = tape.loc
				if(mp.mode)
					mp.StopPlaying()

			qdel(tape.track)
			tape.ruin()
			tape.SetName("burned [initial(tape.name)]") */

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
				if(H.equip_to_slot_or_store_or_drop(new /obj/item/reagent_containers/food/snacks/cookie(H), slot_l_hand))
					log_admin("[key_name(H)] got their cookie, spawned by [key_name(usr)]")
					message_admins("[key_name(H)] got their cookie, spawned by [key_name(usr)]")
					SSstatistics.add_field("admin_cookies_spawned",1)
					to_chat(H, SPAN_NOTICE("Your prayers have been answered! You received <b>the best cookie</b>!"))
					H.playsound_local(null, 'infinity/sound/effects/pray.ogg', 50)

			if("Give Cup of Coffee")
				var/obj/item/reagent_containers/food/drinks/glass2/coffeecup/coffee = new(H)
				coffee.reagents.add_reagent(/datum/reagent/drink/coffee, 30)
				if(H.equip_to_slot_or_store_or_drop(coffee, slot_l_hand))
					log_admin("[key_name(H)] got their cup of coffee, spawned by [key_name(usr)]")
					message_admins("[key_name(H)] got their cup of coffee, spawned by [key_name(usr)]")
					SSstatistics.add_field("admin_coffe_spawned",1)
					to_chat(H, SPAN_NOTICE("our prayers have been answered! You received <b>a cup of coffee</b>!"))
					H.playsound_local(null, 'infinity/sound/effects/pray.ogg', 50)

			if("Give Cup of Tea")
				if(H.equip_to_slot_or_store_or_drop(new /obj/item/reagent_containers/food/drinks/tea/green(H), slot_l_hand))
					log_admin("[key_name(H)] got their cup of green tea, spawned by [key_name(usr)]")
					message_admins("[key_name(H)] got their cup of green tea, spawned by [key_name(usr)]")
					SSstatistics.add_field("admin_tea_spawned",1)
					to_chat(H, SPAN_NOTICE("Your prayers have been answered! You received <b>a cup of tea</b>!"))
					H.playsound_local(null, 'infinity/sound/effects/pray.ogg', 50)

			if("Punish")
				var/list/punishment_list = list("Lightning bolt", "Brain damage", /*"Gib"*/)

				var/punishment = input("Choose a punishment", "DIVINE SMITING") as null|anything in punishment_list

				if(QDELETED(H) || !punishment)
					return

				switch(punishment)
					if("Lightning bolt")
//						var/turf/T = get_step(H, NORTH)
//						T.Beam(H, icon_state = "lightning[rand(1,12)]", icon = 'infinity/icons/effects/beam.dmi', time = 5)
						H.adjustFireLoss(75) //-15% of blood (no brain damage) + autoheal.able fire damage on all limbs
						INVOKE_ASYNC(H,/mob/living/carbon/human/proc/electrocution_animation, 10)
						to_chat(H, SPAN_DANGER("The gods have punished you for your sins!"))
						playsound(H, 'infinity/sound/effects/lightningbolt.ogg', 50)
					if("Brain damage")
						H.adjustBrainLoss(29.5) //*2. Gives 59 - a little slowdows and pain messages. Would be healed with inaprovaline
						to_chat(H, SPAN_DANGER("The gods have punished you for your sins!"))
						H.playsound_local(null, 'infinity/sound/effects/rings.ogg', 100)
//					if("Gib")
//						H.gib(FALSE)

				message_admins("[key_name_admin(usr)] punished [key_name_admin(H)] with [punishment].")
				log_admin("[key_name(usr)] punished [key_name(H)] with [punishment].")
