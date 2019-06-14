// ========= Core =========
/obj/item/weapon/paimod
	name = "unknown personal AI modification module"
	desc = "This is unknown PAImod. You should not have this "
	icon = 'infinity/icons/obj/paimod.dmi'
	icon_state = "null"
	var/is_broken = 0 //Check is mod used
	var/mod_integrity = 100

/obj/item/weapon/paimod/attackby(obj/item/weapon/W as obj, mob/user as mob)
	if(mod_integrity <= 0)
		visible_message("<span class='danger'>[user.name] attacks [src.name] with [W]!</span>")
		return
	if(W.force)
		visible_message("<span class='danger'>[user.name] attacks [src.name] with [W]!</span>")
		mod_integrity -= W.force*2
		if(mod_integrity <= 0 && copytext(icon_state, -1, -5) != "_dead")
			src.is_broken = 1
			src.icon_state = "[icon_state]_dead"
			src.desc += " It's broken."
			return

/obj/item/weapon/paimod/memory
	name = "unknown memory PAImod"
	desc = "This is the root memory PAImod. You should not have this."
	icon_state = "memory_root"
	var/mmemory = 1

/obj/item/weapon/paimod/hack_speed
	name = "unknown encryption PAImod"
	desc = "This is the root encryption PAImod. You should not have this."
	icon_state = "enc_root"
	var/additional_speed = 1

// ========= Memory =========

/obj/item/weapon/paimod/memory/standart
	name = "standart memory PAImod"
	desc = "This is the standart memory PAImod. This using to increase memory of PAI. On this back writen \"Memory: 5\""
	icon_state = "memory_stdc"
	mmemory = 5

/obj/item/weapon/paimod/memory/advanced
	name = "advanced memory PAImod"
	desc = "This is the advanced memory PAImod. This using to increase memory of PAI. On this back writen \"Memory: 20\""
	icon_state = "memory_adv"
	mmemory = 20

/obj/item/weapon/paimod/memory/lambda
	name = "lambda memory PAImod"
	desc = "<font color='#180038'>This is the lambda memory PAImod, beyond a small display you can notice some purple crystals. This using to increase memory of PAI. On this back writen \"Memory: 50\"</font>"
	icon_state = "memory_lambda"
	mmemory = 40
	mod_integrity = 40

// ========= Hacking =========

/obj/item/weapon/paimod/hack_speed/standart
	name = "standart encryption PAImod"
	desc = "This is standart encryption PAImod. It used to increase speed of hacking by PAI. Doubles speed of hacking."
	additional_speed = 2

/obj/item/weapon/paimod/hack_speed/advanced
	name = "advanced encryption PAImod"
	desc = "This is advanced encryption PAImod. It used to increase speed of hacking by PAI. Quadrupling speed of hacking."
	additional_speed = 4
	icon_state = "enc_adv"

/obj/item/weapon/paimod/hack_camo
	name = "hacking camouflage"
	desc = "This is hacking camouflage. Using to cover hacking by PAI from central AI."
	icon_state = "camo"

// ========= Misc =========

/obj/item/weapon/paimod/advanced_holo
	name = "advanced holo profector"
	desc = "This is advanced hologram projector, using to modificate PAI. It give to PAI opportunity to change it hologram and choose premium holograms."
	icon_state = "holo_proj"