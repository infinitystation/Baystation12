/obj/item/weapon/gun/projectile/automatic/invider
	name = "Invider submachine gun"
	desc = "The Invider is a Hi-tech and rapid firing SMG. Uses 4.6x30mm universal rounds."
	icon = 'icons/event/guns.dmi'
	icon_state = "pdw"
	item_state = "c20r"
	w_class = ITEM_SIZE_LARGE
	var/projetcile_type = 0
	force = 10
	caliber = "46x30mm"
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 2, TECH_ILLEGAL = 8)
	slot_flags = SLOT_BELT|SLOT_BACK
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/uni46x30mm
	allowed_magazines = /obj/item/ammo_magazine/uni46x30mm
	auto_eject = 1
	auto_eject_sound = 'sound/weapons/smg_empty_alarm.ogg'
	one_hand_penalty = 0

	//SMG
	firemodes = list(
		list(mode_name="semiauto",       burst=1, fire_delay=0,    move_delay=null, one_hand_penalty=0, burst_accuracy=null, dispersion=null),
		list(mode_name="3-round bursts", burst=3, fire_delay=null, move_delay=2,    one_hand_penalty=0, burst_accuracy=list(0,-1,-1),       dispersion=list(0.0, 0.6, 1.0)),
		)

/obj/item/weapon/gun/projectile/automatic/invider/modify_projectile(obj/item/projectile/p, var/list/params = list())
	if (params["Charged"] == 1 && loaded.len)
		p = new /obj/item/projectile/bullet/smg/uni46x30mm_charged
	return p

/obj/item/weapon/gun/projectile/automatic/invider/CtrlAltClick(mob/user)
	if(user.incapacitated())
		to_chat(user, "<span class='warning'>You can't do that right now!</span>")
		return

	else
		if(src == user.get_active_hand())
			projetcile_type = !projetcile_type
			playsound(user, 'sound/weapons/selector.ogg', 50, 1)
			to_chat(user, "<span class='notice'>You toggle the bullet penetration mode [projetcile_type ? "on":"off"].</span>")

/obj/item/weapon/gun/projectile/automatic/invider/Fire(atom/target, mob/living/user, clickparams, pointblank=0, reflex=0, var/list/params = list())
	if (projetcile_type == 1)
		..(target, user, clickparams, pointblank, reflex, list("Charged" = 1))
	else
		..(target, user, clickparams, pointblank, reflex, list("Charged" = 0))

/obj/item/weapon/gun/projectile/automatic/invider/on_update_icon()
	..()
	if(ammo_magazine)
		icon_state = "pdw"
	else
		icon_state = "pdw-empty"
	return