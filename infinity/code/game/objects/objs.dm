/obj/proc/eject_item(obj/item/I, mob/living/user)
	if(!I || !user.IsAdvancedToolUser())
		return FALSE
	user.put_in_hands(I)
	playsound(src.loc, 'sound/weapons/guns/interaction/pistol_magin.ogg', 75, 1)
	user.visible_message(
		"[user] removes \the [I] from \the [src].",
		SPAN_NOTICE("You remove \the [I] from \the [src].")
	)
	return TRUE

/obj/proc/insert_item(obj/item/I, mob/living/user)
	if(!I || !user.unEquip(I))
		return FALSE
	I.forceMove(src)
	playsound(src.loc, 'sound/weapons/guns/interaction/pistol_magout.ogg', 75, 1)
	to_chat(user, SPAN_NOTICE("You insert \the [I] into \the [src]."))
	return TRUE
