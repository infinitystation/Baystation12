/obj/item/weapon/gun/projectile/sec/lethal
	magazine_type = /obj/item/ammo_magazine/c45m

/obj/item/weapon/gun/projectile/spistol
	name = "TH22 pistol"
	desc = "The TH22. A small sidearm, with futuristic design. Uses .22LR rounds."
	icon = 'icons/obj/infinity_guns.dmi'
	icon_state = "pistol0"
	item_icons = list(
		slot_l_hand_str = 'icons/mob/onmob/items/lefthand_guns.dmi',
		slot_r_hand_str = 'icons/mob/onmob/items/righthand_guns.dmi',
		)
	item_state = "gun"
	w_class = ITEM_SIZE_SMALL
	caliber = "22"
	fire_delay = 1
	origin_tech = list(TECH_COMBAT = 2)
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/c22m
	allowed_magazines = /obj/item/ammo_magazine/c22m
	auto_eject = 1
	auto_eject_sound = 'sound/weapons/smg_empty_alarm.ogg'

/obj/item/weapon/gun/projectile/spistol/on_update_icon()
	if(ammo_magazine)
		icon_state = "pistol0"
	else
		icon_state = "pistol_empty"
