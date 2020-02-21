// Pre-made cassetes
/obj/item/music_tape/title2
	name = "Title 2"
	track = new /datum/track("Title 2", 'sound/music/title2.ogg')
	rewrites_left = 0

/obj/item/music_tape/clouds
	name = "Clouds"
	track = new /datum/track("Clouds of Fire", /music_track/clouds_of_fire)
	rewrites_left = 0

/obj/item/music_tape/custom
	name = "dusty tape"
	desc = "A dusty tape, which can hold anything. Only what you need is blow the dust away and you will be able to play it again."

/obj/item/music_tape/custom/attack_self(mob/user)
	if(!ruined && !track)
		if(setup_tape(user))
			log_and_message_admins("uploaded new sound <a href='?_src_=holder;listen_tape_sound=\ref[track.track]'>(preview)</a> in <a href='?_src_=holder;adminplayerobservefollow=\ref[src]'>\the [src]</a> with track name \"[track.title]\". <A HREF='?_src_=holder;wipe_tape_data=\ref[src]'>Wipe</A> data.")
		return
	..()

/obj/item/music_tape/custom/proc/setup_tape(mob/user)
	var/sound_file = input(user, "Pick sound:", "Song Reminiscence: File") as null|sound
	if(isnull(sound_file)) return FALSE

	var/new_name = input(user, "Name \the [src]:", "Song Reminiscence: Name", "Untitled") as null|text
	if(isnull(new_name)) return FALSE

	new_name = sanitizeSafe(new_name)

	SetName("music tape")

	if(sound_file && new_name)
		track = new /datum/track(new_name, sound_file)
		return TRUE
	return FALSE
