/obj/item/clothing/ears/headphones
	name = "headphones"
	desc = "It's probably not in accordance with company policy to listen to music on the job... but fuck it."
	var/headphones_on = 0
	icon_state = "headphones_off"
	item_state = "headphones_off"
	slot_flags = SLOT_EARS | SLOT_TWOEARS
	volume_multiplier = 0.5
	var/sound_channel
	var/sound_file
	var/datum/track/loaded_track
	var/track_name
	var/current_track
	var/music_volume = 50

/obj/item/clothing/ears/headphones/Initialize()
	. = ..()
	sound_channel = GLOB.sound_channels.RequestChannel(type)

/obj/item/clothing/ears/headphones/on_update_icon()
	if(headphones_on)
		icon_state = "headphones_on"
		item_state = "headphones_on"
	else
		icon_state = "headphones_off"
		item_state = "headphones_off"
	update_clothing_icon()

/obj/item/clothing/ears/headphones/verb/togglemusic()
	set name = "Toggle Headphone Music"
	set category = "Object"
	set src in usr
	if(!istype(usr, /mob/living)) return
	if(usr.incapacitated()) return
	toggle(usr)

/obj/item/clothing/ears/headphones/proc/toggle(mob/user)
	if(headphones_on)
		headphones_on = 0
		to_chat(user, "<span class='notice'>You turn the music off.</span>")
		volume_multiplier = initial(volume_multiplier)
		stop_music(user)
	else
		headphones_on = 1
		to_chat(user, "<span class='notice'>You turn the music on.</span>")
		volume_multiplier = 0.2
		play_music(user)

	update_icon()

/obj/item/clothing/ears/headphones/MouseDrop(mob/user)
	interact(user)

/obj/item/clothing/ears/headphones/attack_self(mob/user)
	..()
	interact(user)

/obj/item/clothing/ears/headphones/proc/load_track(mob/user)
	sound_file = input(user, "Pick sound:","File") as null|sound
	if(isnull(sound_file)) return 0

	track_name = input(user, "Name \the [src]:") as null|text
	if(isnull(track_name)) return 0

	track_name = sanitizeSafe(track_name)

	if(sound_file && track_name)
		loaded_track = new /datum/track(title = track_name, track = sound_file)
		return 1
	return 0

/obj/item/clothing/ears/headphones/proc/delete_track()
	sound_file = null
	track_name = null
	loaded_track = null
	return 1

/obj/item/clothing/ears/headphones/equipped(mob/user)
	. = ..()
	if(headphones_on)
		play_music(user)

/obj/item/clothing/ears/headphones/dropped(mob/user)
	. = ..()
	stop_music(user)

/obj/item/clothing/ears/headphones/proc/play_music(mob/user)
	if(!user || !user.client)
		return
	if(!(user.get_inventory_slot(src) in list(slot_l_ear, slot_r_ear)))
		return
	if(current_track)
		if(loaded_track && current_track == loaded_track.title)
			sound_to(user, sound(null, channel = sound_channel))
			sound_to(user, sound(loaded_track.track, repeat = 1, wait = 0, volume = music_volume, channel = sound_channel))
		else
			var/music_track/track = decls_repository.get_decl(GLOB.music_tracks[current_track])
			sound_to(user, sound(null, channel = sound_channel))
			sound_to(user, sound(track.song, repeat = 1, wait = 0, volume = music_volume, channel = sound_channel))

/obj/item/clothing/ears/headphones/proc/stop_music(mob/user)
	if(!user || !user.client)
		return
	sound_to(user, sound(null, channel = sound_channel))

/obj/item/clothing/ears/headphones/interact(var/mob/user)
	if(!CanPhysicallyInteract(user))
		return
	var/list/dat = list()
	dat += "<A href='?src=\ref[src];toggle=1;'>Switch [headphones_on ? "off" : "on"]</a>"
	dat += "<A href='?src=\ref[src];load_track=1;'>[loaded_track ? "Delete" : "Load"] track</a>"
	dat += "Volume: [music_volume] <A href='?src=\ref[src];vol=-10;'>-</a><A href='?src=\ref[src];vol=10;'>+</a>"
	dat += "Tracks:"
	if(loaded_track)
		if(loaded_track.title == current_track)
			dat += "Memory: <span class='linkOn'>[track_name]</span>"
		else
			dat += "Memory: <A href='?src=\ref[src];track=[loaded_track.title];'>[track_name]</a>"
	for(var/track in GLOB.music_tracks)
		if(track == current_track)
			dat += "<span class='linkOn'>[track]</span>"
		else
			dat += "<A href='?src=\ref[src];track=[track];'>[track]</a>"

	var/datum/browser/popup = new(user, "headphones", name, 290, 410)
	popup.set_content(jointext(dat,"<br>"))
	popup.open()

/obj/item/clothing/ears/headphones/OnTopic(var/user, var/list/href_list)
	if(href_list["toggle"])
		toggle(user)
		interact(user)
		return TOPIC_REFRESH
	if(href_list["load_track"])
		loaded_track ? delete_track() : load_track(user)
		interact(user)
		return TOPIC_REFRESH
	if(href_list["vol"])
		var/adj = text2num(href_list["vol"])
		music_volume = Clamp(music_volume + adj, 0, 100)
		if(headphones_on)
			play_music(user)
		interact(user)
		return TOPIC_REFRESH
	if(href_list["track"])
		current_track = href_list["track"]
		if(headphones_on)
			play_music(user)
		interact(user)
		return TOPIC_HANDLED
