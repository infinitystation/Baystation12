/obj/item/device/syndietele
	name = "strange beacon"
	desc = "Кажется это маячёк для чего-то, на его чёрном корпусе видно мигающий диод красного цвета."
	icon = 'infinity/icons/obj/syndiejaunter.dmi'
	icon_state = "beacon"
	item_state = "signaler"
	origin_tech = list(TECH_BLUESPACE = 4, TECH_ESOTERIC = 3)

	w_class = ITEM_SIZE_SMALL

/obj/item/device/syndiejaunter
	name = "strange device"
	desc = "Странное устройство с антеной и маленьким экранчиком."
	icon = 'infinity/icons/obj/syndiejaunter.dmi'
	icon_state = "jaunter"
	item_state = "jaunter"
	w_class = ITEM_SIZE_SMALL
	var/obj/item/device/syndietele/beacon
	var/usable = 1
	var/image/cached_usable

/obj/item/device/syndiejaunter/examine(mob/user, distance)
	. = ..()
	to_chat(user, SPAN_NOTICE("Экран [usable ? "включён и показывает цифру [usable]" : "выключен"]."))
/obj/item/device/syndiejaunter/Initialize()
	. = ..()
	update_icon()

/obj/item/device/syndiejaunter/on_update_icon()
	. = ..()
	if(usable)
		cached_usable = istype(cached_usable, /image) ? cached_usable : image(icon, "usable")
		overlays += cached_usable
	else
		overlays.Cut()

/obj/item/device/syndiejaunter/attack_self(mob/user)
	if(!istype(beacon) || !usable)
		return 0

	animated_teleportation(user, beacon)
	usable = max(usable - 1, 0)
	update_icon()

/obj/item/device/syndiejaunter/afterattack(atom/target, mob/user , proximity)
	if(!proximity) return
	if(istype(target,/obj/item/device/syndietele))
		beacon = target
		to_chat(user, "You succesfully linked [src] to [target]!")
	else
		to_chat(user, "You can't link [src] to [target]!")
	update_icon()
