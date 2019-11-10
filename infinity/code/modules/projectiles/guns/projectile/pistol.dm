/obj/item/weapon/gun/projectile/spistol
	name = "TH22 pistol"
	desc = "The TH22. A small sidearm, with futuristic design. Uses .22LR rounds."
	icon = 'infinity/icons/obj/guns.dmi'
	icon_state = "pistol0"
	item_icons = list(
		slot_l_hand_str = 'icons/mob/onmob/items/lefthand_guns.dmi',
		slot_r_hand_str = 'icons/mob/onmob/items/righthand_guns.dmi',
		)
	item_state = "gun"
	caliber = CALIBER_PISTOL_TINY
	fire_delay = 1
	origin_tech = list(TECH_COMBAT = 2)
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/c22m
	allowed_magazines = /obj/item/ammo_magazine/c22m
	auto_eject = 1
	auto_eject_sound = 'sound/weapons/smg_empty_alarm.ogg'

	bulk = GUN_BULK_PISTOL
	w_class = ITEM_SIZE_SMALL

/obj/item/weapon/gun/projectile/spistol/on_update_icon()
	if(ammo_magazine)
		icon_state = "pistol0"
	else
		icon_state = "pistol_empty"

/obj/item/weapon/gun/projectile/spistol/civ
	desc = "The TH22. A small sidearm, with futuristic design. Uses .22LR rounds. Inside installed a smart chip that allows track the weapons and to whom it is registered."
	magazine_type = /obj/item/ammo_magazine/c22m/civ
	allowed_magazines = /obj/item/ammo_magazine/c22m/civ
	req_access = list()
	authorized_modes = list(ALWAYS_AUTHORIZED, UNAUTHORIZED)
	auto_eject = 0

/obj/item/weapon/gun/projectile/spistol/civ/black
	icon_state = "ppistol0"

/obj/item/weapon/gun/projectile/spistol/civ/black/on_update_icon()
	if(ammo_magazine)
		icon_state = "ppistol0"
	else
		icon_state = "ppistol_empty"

/obj/item/weapon/gun/projectile/spistol/civ/white
	icon_state = "wpistol0"

/obj/item/weapon/gun/projectile/spistol/civ/black/on_update_icon()
	if(ammo_magazine)
		icon_state = "wpistol0"
	else
		icon_state = "wpistol_empty"