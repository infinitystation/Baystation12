/obj/item/weapon/computer_hardware/microphone
	name = "microphone"
	desc = ""
	power_usage = 10
	critical = 0
	hardware_size = 1
	icon_state = "microphone"

/obj/item/weapon/computer_hardware/microphone/New()
	. = ..()
	GLOB.listening_objects += src

/obj/item/weapon/computer_hardware/microphone/Destroy()
	GLOB.listening_objects -= src
	. = ..()

/obj/item/weapon/computer_hardware/microphone/hear_talk(var/mob/living/M as mob, text, verb, datum/language/speaking)
	if(!enabled || !holder2)
		return
	if(M && text)
		if(istype(holder2.active_program, /datum/computer_file/program/teascord))
			var/datum/computer_file/program/teascord/TD = holder2.active_program
			if(TD && TD.NM)
				var/datum/nano_module/teascord/NMT = TD.NM
				if(!NMT.microphone)
					return
				if(NMT.current_account && NMT.conversation)
					if(!NMT.broadcoast && get_dist(M, get_turf(src)) < 1)
						NMT.conversation.talk(NMT.current_account, M, text, verb, speaking)
					else if(NMT.broadcoast)
						NMT.conversation.talk(NMT.current_account, M, text, verb, speaking)
