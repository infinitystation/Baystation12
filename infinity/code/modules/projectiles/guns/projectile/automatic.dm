/obj/item/weapon/gun/projectile/automatic/sec_smg/lethal
	magazine_type = /obj/item/ammo_magazine/smg_top

/obj/item/weapon/gun/projectile/automatic/nt41
	name = "NT41 submachine gun"
	desc = "The NT41 Enforcer is a self-defense weapon made on bullpup system. Produced by NanoTrasen for it's Security Force. Looks cool and stylish, but sometimes too uncomfortably to run with it. Uses 5.7x28mm rounds."
	icon_state = "nt41"
	item_state = "nt41"
	icon = 'infinity/icons/obj/guns.dmi'
	wielded_item_state = "nt41-wielded"
	item_icons = list(
		slot_r_hand_str = 'infinity/icons/mob/onmob/righthand.dmi',
		slot_l_hand_str = 'infinity/icons/mob/onmob/lefthand.dmi',
		)

	caliber = CALIBER_PISTOL_FAST
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 3)
	slot_flags = SLOT_BELT
	ammo_type = /obj/item/ammo_casing/nt28mm
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/n10mm
	allowed_magazines = /obj/item/ammo_magazine/n10mm
	screen_shake = 0.5 //SMG

	firemodes = list(
		list(mode_name="semiauto",       burst=1, fire_delay=0,    move_delay=null, one_hand_penalty=1, burst_accuracy=null, dispersion=null),
		list(mode_name="2-round bursts", burst=2, fire_delay=null, move_delay=2,    one_hand_penalty=3, burst_accuracy=list(0,-1),       dispersion=list(0.0, 0.8)),
		list(mode_name="short bursts",   burst=4, fire_delay=null, move_delay=4,    one_hand_penalty=4, burst_accuracy=list(0,-1,-1.5,-2), dispersion=list(0.6, 0.8, 1.0, 1.4)),
		)

	bulk = GUN_BULK_CARABINE
	w_class = ITEM_SIZE_NORMAL
	one_hand_penalty = 2

/obj/item/weapon/gun/projectile/automatic/nt41/on_update_icon()
	..()
	icon_state = (ammo_magazine)? "nt41" : "nt41-e"

/obj/item/weapon/gun/projectile/automatic/amrcarabine
	name = "LDC-542 carabine"
	desc = "The sielent and deadly and manufactured by Aussec Armory, bullpup carabine LDC-542 is a common weapon for a long-medium ranged combat units in Private Military Companies. Uses 12.7x55mm rounds."
	icon = 'infinity/icons/obj/guns.dmi'
	icon_state = "amrcarabine"
	item_state = "z8carbine"
	force = 10
	caliber = CALIBER_ANTIMATERIAL_SMALL
	origin_tech = list(TECH_COMBAT = 8, TECH_MATERIAL = 2)
	slot_flags = SLOT_BACK
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/c12755
	allowed_magazines = /obj/item/ammo_magazine/c12755
	ammo_type = /obj/item/ammo_casing/a12755
	wielded_item_state = "z8carbine-wielded"
	burst_delay = 2
	firemodes = list(
		list(mode_name="semiauto",       burst=1,    fire_delay=4, move_delay=1, one_hand_penalty=7, burst_accuracy=null, dispersion=null),
		list(mode_name="2-round bursts", burst=2,    fire_delay=6, move_delay=1, one_hand_penalty=15, burst_accuracy=list(0,-0.8), dispersion=list(0.0, 0.4)),
		)

	bulk = GUN_BULK_RIFLE
	w_class = ITEM_SIZE_HUGE
	one_hand_penalty = 7

/obj/item/weapon/gun/projectile/automatic/amrcarabine/on_update_icon()
	..()
	icon_state = (ammo_magazine)? "amrcarabine" : "amrcarabine-e"


/obj/item/weapon/gun/projectile/automatic/bp15
	name = "BP-15 PDW"
	desc = "The BP-15 'Moloh' is a  personal defense weapon, produced by Aussec Armory for use by police spec ops or solders. Uses 5.7x28 mm rounds."
	icon = 'infinity/icons/event/guns.dmi'
	icon_state = "pdw"
	item_state = "c20r"
	item_icons = list(
		slot_r_hand_str = 'icons/mob/onmob/items/righthand_guns.dmi',
		slot_l_hand_str = 'icons/mob/onmob/items/lefthand_guns.dmi',
		)
	caliber = CALIBER_PISTOL_FAST
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 2)
	slot_flags = SLOT_BELT
	ammo_type = /obj/item/ammo_casing/c57
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/mc57
	allowed_magazines = /obj/item/ammo_magazine/mc57

	//machine pistol, like SMG but easier to one-hand with
	firemodes = list(
		list(mode_name="semiauto",       burst=1, fire_delay=0,    move_delay=null, one_hand_penalty=0, burst_accuracy=null, dispersion=null),
		list(mode_name="3-round bursts", burst=3, fire_delay=null, move_delay=2,    one_hand_penalty=1, burst_accuracy=list(0,-1,-1),       dispersion=list(0.0, 0.6, 1.0)),
		list(mode_name="short bursts",   burst=5, fire_delay=null, move_delay=2,    one_hand_penalty=2, burst_accuracy=list(0,-1,-1,-1,-2), dispersion=list(0.6, 0.6, 1.0, 1.0, 1.2)),
		)

	bulk = GUN_BULK_SMG
	w_class = ITEM_SIZE_NORMAL
	one_hand_penalty = 3

/obj/item/weapon/gun/projectile/automatic/bp15/on_update_icon()
	icon_state = (ammo_magazine)? "pdw" : "pdw-empty"
	..()

/obj/item/weapon/gun/projectile/automatic/invider
	name = "Invider submachine gun"
	desc = "The Invider is a Hi-tech and rapid firing SMG. Uses 4.6x30mm universal rounds."
	icon = 'infinity/icons/event/guns.dmi'
	icon_state = "pdw"
	item_state = "c20r"
	var/projetcile_type = 0
	force = 10
	caliber = CALIBER_PISTOL_FAST
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 2, TECH_ESOTERIC = 8)
	slot_flags = SLOT_BELT|SLOT_BACK
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/uni46x30mm
	allowed_magazines = /obj/item/ammo_magazine/uni46x30mm
	auto_eject = 1
	auto_eject_sound = 'sound/weapons/smg_empty_alarm.ogg'

	firemodes = list(
		list(mode_name="semiauto",       burst=1, fire_delay=0,    move_delay=null, one_hand_penalty=0, burst_accuracy=null, dispersion=null),
		list(mode_name="3-round bursts", burst=3, fire_delay=null, move_delay=2,    one_hand_penalty=0, burst_accuracy=list(0,-1,-1),       dispersion=list(0.0, 0.6, 1.0)),
		)

	bulk = GUN_BULK_CARABINE
	w_class = ITEM_SIZE_LARGE
	one_hand_penalty = 3


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
			playsound(user, 'infinity/sound/weapons/selector.ogg', 50, 1)
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

/obj/item/weapon/gun/projectile/automatic/nt41/armory
	starts_loaded = 0

/obj/item/weapon/gun/projectile/shotgun/pump/combat/armory
	starts_loaded = 0
