/obj/item/paimod/memory
	name = "unknown memory PAImod"
	desc = "This is the root memory PAImod. You should not have this."
	icon_state = "memory_root"
	var/memory = 1
	special_limit_tag = "memory"

/obj/item/paimod/memory/on_recalculate(var/mob/living/silicon/pai/P)
	. = ..()
	P.update_memory()

/obj/item/paimod/memory/on_update_memory(var/mob/living/silicon/pai/P)
	. = ..()
	P.ram += memory

/obj/item/paimod/memory/standart
	name = "standart memory PAImod"
	desc = "This is the standart memory PAImod. This using to increase memory of PAI. On this back writen \"Memory: 5\""
	icon_state = "memory_stdc"
	memory = 5

/obj/item/paimod/memory/advanced
	name = "advanced memory PAImod"
	desc = "This is the advanced memory PAImod. This using to increase memory of PAI. On this back writen \"Memory: 20\""
	icon_state = "memory_adv"
	memory = 20

/obj/item/paimod/memory/lambda
	name = "lambda memory PAImod"
	desc = "This is the <font color='#180038'>lambda</font> memory PAImod, beyond a small display you can notice some purple crystals. This using to increase memory of PAI. On this back writen \"Memory: 50\""
	icon_state = "memory_lambda"
	memory = 50
	mod_integrity = 40
