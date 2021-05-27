/obj/item/gun/projectile/energy/
	item_state = "xray"
	icon = 'infinity/icons/obj/p_weapon.dmi'
	item_icons = list(
		slot_r_hand_str = 'icons/mob/onmob/items/lefthand_guns.dmi',
		slot_l_hand_str = 'icons/mob/onmob/items/righthand_guns.dmi',
		)
	caliber = CALIBER_DART
	auto_eject = 1
	auto_eject_sound = 'sound/weapons/smg_empty_alarm.ogg'

/obj/item/gun/projectile/energy/mg
	name = "Ares EMG MK4"
	desc = "The NT41 Enforcer is a self-defense weapon made on bullpup system. Produced by NanoTrasen for it's Security Force. Looks cool and stylish, but sometimes too uncomfortably to run with it. Uses 5.7x28mm rounds."
	icon_state = "energy_machinegun"
	w_class = ITEM_SIZE_HUGE
	wielded_item_state = "gun_wielded"
	slot_flags = 0
	ammo_type = /obj/item/ammo_casing/e/emg
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/e/emg
	allowed_magazines = /obj/item/ammo_magazine/e/emg
	one_hand_penalty = 12

	firemodes = list(
		list(mode_name="semiauto",      can_autofire=0, burst=1, fire_delay=0,    move_delay=null, one_hand_penalty=1,  burst_accuracy = null, dispersion=null),
		list(mode_name="short bursts",  can_autofire=0, burst=4, fire_delay=null, move_delay=2,    one_hand_penalty=12, burst_accuracy = list(0, -1, -1.5, -2), dispersion=list(0.0, 0.8, 1, 1.2)),
		list(mode_name="long bursts",   can_autofire=0, burst=6, fire_delay=null, move_delay=4,    one_hand_penalty=12, burst_accuracy = list(0, -1, -1.5, -2, -2.5, -3, -3.5), dispersion=list(0.0, 0.8, 1, 1.2, 1.4, 1.8)),
		list(mode_name="full auto",		can_autofire=1, burst=1, fire_delay=0,    move_delay=null, one_hand_penalty=12, burst_accuracy = list(0, -1, -2, -2, -3, -3, -4, -4), dispersion = list(1.0, 1.0, 1.0, 1.0, 1.2)),
		)

/obj/item/gun/projectile/energy/mg/on_update_icon()
	..()
	icon_state = (ammo_magazine)? "energy_machinegun" : "energy_machinegun-e"

/obj/item/gun/projectile/energy/rifle
	name = "Ares ER MK2"
	desc = "The NT41 Enforcer is a self-defense weapon made on bullpup system. Produced by NanoTrasen for it's Security Force. Looks cool and stylish, but sometimes too uncomfortably to run with it. Uses 5.7x28mm rounds."
	icon_state = "energy_rifle"
	w_class = ITEM_SIZE_HUGE
	wielded_item_state = "gun_wielded"
	slot_flags = 0
	ammo_type = /obj/item/ammo_casing/e/rifle
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/e/rifle
	allowed_magazines = /obj/item/ammo_magazine/e/rifle
	scope_zoom = 1.3
	one_hand_penalty =6 

	firemodes = list(
		list(mode_name="semiauto",      burst=1, fire_delay=0,    move_delay=null, one_hand_penalty=3, burst_accuracy=null, dispersion=null),
		list(mode_name="2-short bursts",  burst=2, fire_delay=null, move_delay=1,    one_hand_penalty=6, burst_accuracy=list(0, - 0.5),       dispersion=list(0.0, 0.5)),
		)

/obj/item/gun/projectile/energy/rifle/on_update_icon()
	..()
	icon_state = (ammo_magazine)? "energy_rifle" : "energy_rifle-e"

/obj/item/gun/projectile/energy/carabine
	name = "Ares ER CQC MK2"
	desc = "The NT41 Enforcer is a self-defense weapon made on bullpup system. Produced by NanoTrasen for it's Security Force. Looks cool and stylish, but sometimes too uncomfortably to run with it. Uses 5.7x28mm rounds."
	icon_state = "energy_carabine"
	w_class = ITEM_SIZE_LARGE
	wielded_item_state = "gun_wielded"
	slot_flags = 0
	ammo_type = /obj/item/ammo_casing/e/rifle
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/e/rifle
	allowed_magazines = /obj/item/ammo_magazine/e/rifle
	one_hand_penalty = 5

	firemodes = list(
		list(mode_name="semiauto",      burst=1, fire_delay=0,    move_delay=null, one_hand_penalty=2, burst_accuracy=null, dispersion=null),
		list(mode_name="3-short bursts",  burst=3, fire_delay=null, move_delay=1,    one_hand_penalty=6, burst_accuracy=list(0, -0.5 , -1),       dispersion=list(0.0, 0.4, 0.8)),
		)

/obj/item/gun/projectile/energy/carabine/on_update_icon()
	..()
	icon_state = (ammo_magazine)? "energy_carabine" : "energy_carabine-e"

/obj/item/gun/projectile/energy/pistol
	name = "Ares EP \"Predator\""
	desc = "The NT41 Enforcer is a self-defense weapon made on bullpup system. Produced by NanoTrasen for it's Security Force. Looks cool and stylish, but sometimes too uncomfortably to run with it. Uses 5.7x28mm rounds."
	icon_state = "energy_pistol"
	w_class = ITEM_SIZE_HUGE
	slot_flags = 0
	ammo_type = /obj/item/ammo_casing/e/pistol
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/e/pistol
	allowed_magazines = /obj/item/ammo_magazine/e/pistol
	one_hand_penalty = 2

	firemodes = list(
		list(mode_name="semiauto",      burst=1, fire_delay=0,    move_delay=null, one_hand_penalty=1, burst_accuracy=null, dispersion=null),
		list(mode_name="3-short bursts",  burst=3, fire_delay=null, move_delay=1,    one_hand_penalty=4, burst_accuracy=list(0, -1 , -2),       dispersion=list(0.0, 1, 1)),
		)

/obj/item/gun/projectile/energy/pistol/on_update_icon()
	..()
	icon_state = (ammo_magazine)? "energy_pistol" : "energy_pistol-e"

