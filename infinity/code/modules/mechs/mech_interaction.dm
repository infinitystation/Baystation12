/mob/living/silicon/ai/var/mob/living/exosuit/controlling_exosuit
/mob/living/exosuit
	var/mob/living/silicon/ai/controlling_ai
	var/obj/item/device/radio/old_rad

/mob/living/exosuit/Destroy()
	release_ai_control()
	. = ..()

/mob/living/exosuit/proc/assume_control(var/mob/living/silicon/ai/user)
	user.controlling_exosuit = src
	controlling_ai = user
	verbs += /mob/living/exosuit/proc/release_ai_control_verb
	languages = controlling_ai.languages.Copy()

	old_rad = radio
	radio = new /obj/item/device/radio/headset/heads/ai_integrated(src)

	add_language(LANGUAGE_ROBOT_GLOBAL, 1)
	default_language = controlling_ai.default_language

	stat = CONSCIOUS
	if(user.mind)
		user.mind.transfer_to(src)
	else
		key = user.key
	to_chat(src, SPAN_NOTICE("<b>You have shunted your primary control loop into \a [initial(name)].</b> Use the <b>Release Control</b> verb to return to your core."))

/mob/living/exosuit/attack_ai(var/mob/living/silicon/ai/user)
//	if(user.controlling_drone)
//		to_chat(user, SPAN_WARNING("You are already remote controlling something."))
	if(stat != 0 || client || key)
		to_chat(user, SPAN_WARNING("You cannot take control of an autonomous, active exosuit."))
		return
	if(maintenance_protocols)
		to_chat(user, SPAN_NOTICE("<b>WARNING 0x361455656</b>: MAINTENCE OF THIS EXOSUIT IN PROGRESS."))

	if(health <= 0)
		to_chat(user, SPAN_NOTICE("<b>WARNING 0x010230463:</b> connection timed out."))
		return

	assume_control(user)
	return ..()

/mob/living/exosuit/proc/release_ai_control_verb()
	set name = "Release Control"
	set desc = "Release control of a remote exosuit."
	set category = "Silicon Commands"

	release_ai_control("Remote session terminated.")

/mob/living/exosuit/proc/release_ai_control(var/message = "Connection terminated.")
	if(controlling_ai)
		if(mind)
			mind.transfer_to(controlling_ai)
		else
			controlling_ai.key = key
		to_chat(controlling_ai, SPAN_NOTICE("[message]"))
		controlling_ai.controlling_exosuit = null
		controlling_ai = null
	radio = old_rad

	verbs -= /mob/living/exosuit/proc/release_ai_control_verb
