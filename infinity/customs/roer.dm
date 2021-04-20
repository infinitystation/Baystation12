// --------- Voice Helper ---------

/obj/item/device/hailer/roer
	name = "Voice Helper"
	desc = "This is a kind of modification of the standard heielr."

	use_message = "I need a medic!"
	action_button_name = "Use Voice Helper"

	var/voicelines = list(
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


/obj/item/device/hailer/roer/attack_self(mob/living/carbon/user as mob)
	if (spamcheck)
		return

	if(isnull(insults))
		if(prob(5))
			playsound(get_turf(src), 'infinity/sound/customs/roer_voice_helper/voice_helper_four.ogg', 60, 1, vary = 0)
		else
			playsound(get_turf(src), pick(voicelines), 70, 1, vary = 0)
		user.audible_message("<span class='warning'>[user]'s [name] rasps, \"[use_message]\"</span>", null, "<span class='warning'>\The [user] holds up \the [name].</span>")
	else
		to_chat(user, SPAN_DANGER("*BZZZZZZZZT*"))

	spamcheck = 1
	spawn(35)
		spamcheck = 0
