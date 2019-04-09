/obj/item/weapon/handcuffs/plush
	name = "plush handcuffs"
	desc = "A pink plush handcuffs. How cute, owww...."
	icon = 'icons/obj/spectoys.dmi'
	icon_state = "plushcuff"
	obj_flags = null
	throwforce = 0
	matter = list("plastic" = 350)
	breakouttime = 30 //Deciseconds = 3s

/obj/item/weapon/handcuffs/plush/get_icon_state(mob/user_mob, slot)
	if(slot == slot_handcuffed_str)
		return "plushcuff1"
	if(slot == slot_legcuffed_str)
		return "legcuff1"
	return ..()