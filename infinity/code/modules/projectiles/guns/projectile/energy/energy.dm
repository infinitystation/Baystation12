/obj/item/weapon/gun/projectile/energy/
	item_state = "xray"
	icon = 'infinity/icons/obj/p_weapon.dmi'
	wielded_item_state = "gun_wielded"
	item_icons = list(
		slot_r_hand_str = 'icons/mob/onmob/items/lefthand_guns.dmi',
		slot_l_hand_str = 'icons/mob/onmob/items/righthand_guns.dmi',
		)

/obj/item/weapon/gun/projectile/energy/mg
	name = "Ares ENG MK4"
	desc = "The NT41 Enforcer is a self-defense weapon made on bullpup system. Produced by NanoTrasen for it's Security Force. Looks cool and stylish, but sometimes too uncomfortably to run with it. Uses 5.7x28mm rounds."
	icon_state = "energy_machinegun"

	w_class = ITEM_SIZE_HUGE
	caliber = CALIBER_DART
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 3)
	slot_flags = 0
	ammo_type = /obj/item/ammo_casing/emg
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/emg
	allowed_magazines = /obj/item/ammo_magazine/emg
	auto_eject = 1
	auto_eject_sound = 'sound/weapons/smg_empty_alarm.ogg'
	one_hand_penalty = 12

	firemodes = list(
		list(mode_name="semiauto",       burst=1, fire_delay=0,    move_delay=null, one_hand_penalty=1, burst_accuracy=null, dispersion=null),
		list(mode_name="short bursts",   burst=4, fire_delay=null, move_delay=2,    one_hand_penalty=12, burst_accuracy=list(0,-1),       dispersion=list(0.0, 0.8)),
		list(mode_name="long bursts",    burst=8, fire_delay=null, move_delay=4,    one_hand_penalty=12, burst_accuracy=list(0,-1,-1.5,-2), dispersion=list(0.6, 0.8, 1.0, 1.4)),
		list(mode_name="full auto",		can_autofire=1, burst=1, fire_delay=1, one_hand_penalty=12, burst_accuracy = list(0,-1,-1,-2,-2,-2,-3,-3), dispersion = list(1.0, 1.0, 1.0, 1.0, 1.2)),
		)

/obj/item/weapon/gun/projectile/energy/mg/on_update_icon()
	..()
	icon_state = (ammo_magazine)? "energy_machinegun" : "energy_machinegun-e"