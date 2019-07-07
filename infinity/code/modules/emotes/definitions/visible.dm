/decl/emote/visible/salute
	emote_sound = 'infinity/sound/effects/salute.ogg'

/decl/emote/visible/blink/do_emote(var/mob/user)
	if(isliving(user)) user:eye_blink()
