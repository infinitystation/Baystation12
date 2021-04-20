// --------- Voice Helper ---------

/obj/item/device/hailer/roer
	name = "Voice Helper"
	desc = "This is a kind of modification of the standard hailer."

	use_message = "I need a medic!"
	action_button_name = "Use Voice Helper"

	var/list/voicelines = list(
		'infinity/sound/customs/roer_voice_helper/voice_helper_one.ogg',
		'infinity/sound/customs/roer_voice_helper/voice_helper_two.ogg',
		'infinity/sound/customs/roer_voice_helper/voice_helper_three.ogg',
	)


/obj/item/device/hailer/roer/set_message()
	set name = "Set Hailer Message"
	set category = "Object"
	set desc = "Alter the message shouted by your hailer."

	if(!isnull(insults))
		to_chat(usr, "The [src] is fried. The tiny input screen just shows a waving ASCII penis.")
		return

	var/new_message = input(usr, "Please enter new message (leave blank to reset).") as text
	if(!new_message || new_message == "")
		use_message = "I need a medic!"
	else
		use_message = capitalize(copytext(sanitize(new_message), 1, MAX_MESSAGE_LEN))

	to_chat(usr, "You configure the hailer to shout \"[use_message]\".")


/obj/item/device/hailer/roer/proc/reset_spamcheck()
	spamcheck = 0


/obj/item/device/hailer/roer/attack_self(mob/living/carbon/user as mob)
	if (spamcheck)
		return

	if(isnull(insults))
		if(prob(5))
			playsound(get_turf(src), 'infinity/sound/customs/roer_voice_helper/voice_helper_four.ogg', 60, 1, vary = 0)
		else
			playsound(get_turf(src), pick(voicelines), 70, 1, vary = 0)
		user.audible_message("<span class='warning'>[user]'s [name] rasps, \"[use_message]\"</span>", null, "<span class='warning'>\The [user] holds up \the [name].</span>")

		if(user)
			var/list/observers = list()
			for(var/mob/M in viewers(user, null))
				if ((M.client && !( M.blinded )))
					observers.Add(M.client)
			var/image/I = image('infinity/icons/customs/infinity_custom_items_effects.dmi', user, "roer_voice_helper_call", MOB_LAYER + 1)
			animate_speech_bubble(I, observers, 30)

		spamcheck = 1
		addtimer(CALLBACK(src, .proc/reset_spamcheck), 3 SECOND)

	else
		to_chat(user, SPAN_DANGER("*BZZZZZZZZT*"))
