/obj/item/weapon/gun/projectile/automatic/invider
	name = "Invider submachine gun"
	desc = "The Invider is a Hi-tech and rapid firing SMG. Uses 4.6x30mm rounds."
	icon_state = "c20r"
	item_state = "c20r"
	w_class = ITEM_SIZE_LARGE
	force = 10
	caliber = "46x30mm"
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 2, TECH_ILLEGAL = 8)
	slot_flags = SLOT_BELT|SLOT_BACK
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/in46x30mm
	allowed_magazines = /obj/item/ammo_magazine/in46x30mm
	auto_eject = 1
	auto_eject_sound = 'sound/weapons/smg_empty_alarm.ogg'
	one_hand_penalty = 0

	//SMG
	firemodes = list(
		list(mode_name="semiauto",       burst=1, fire_delay=0,    move_delay=null, one_hand_penalty=0, burst_accuracy=null, dispersion=null),
		list(mode_name="3-round bursts", burst=3, fire_delay=null, move_delay=2,    one_hand_penalty=1, burst_accuracy=list(0,-1,-1),       dispersion=list(0.0, 0.6, 1.0)),
		)

/obj/item/weapon/gun/projectile/automatic/c20r/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "c20r-[round(ammo_magazine.stored_ammo.len,4)]"
	else
		icon_state = "c20r"
	return