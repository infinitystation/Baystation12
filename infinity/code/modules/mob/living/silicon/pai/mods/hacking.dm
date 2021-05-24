/obj/item/paimod/hack_speed
	name = "unknown encryption PAImod"
	desc = "This is the root encryption PAImod. You should not have this."
	icon_state = "enc_root"

	special_limit_tag = "hacking"

	var/speed_hack = 1

/obj/item/paimod/hack_speed/on_recalculate(var/mob/living/silicon/pai/P)
	. = ..()
	P.hack_speed += speed_hack


/obj/item/paimod/hack_speed/standart
	name = "standart encryption PAImod"
	desc = "This is standart encryption PAImod. It using to increase speed of hacking by PAI. Doubles speed of hacking."
	speed_hack = 2

/obj/item/paimod/hack_speed/advanced
	name = "advanced encryption PAImod"
	desc = "This is advanced encryption PAImod. It using to increase speed of hacking by PAI. Quadrupling speed of hacking."
	icon_state = "enc_adv"
	speed_hack = 4
