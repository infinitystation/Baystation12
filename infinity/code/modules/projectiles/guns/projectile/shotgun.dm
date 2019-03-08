/obj/item/weapon/gun/projectile/shotgun/magazine
	name = "AS-53 automatic shotgun"
	desc = "The mass-produced by Aussec Armory, shotgun AS-53 'Striker' is an echo of the past in new package. Reborned assault shotgun usually can be saw in hands of mercenaries groups and Private Military Companies."
	icon = 'icons/obj/infinity_guns.dmi'
	icon_state = "bulldog"
	item_state = "bulldog"
	item_icons = list(
		slot_r_hand_str = 'icons/mob/infinity/misc.dmi',
		slot_l_hand_str = 'icons/mob/infinity/misctwo.dmi',
		)
	one_hand_penalty = 4
	wielded_item_state = "bulldog-wielded"
	max_shells = 1
	w_class = ITEM_SIZE_HUGE
	force = 10
	obj_flags =  OBJ_FLAG_CONDUCTIBLE
	caliber = "shotgun"
	origin_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 2)
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/c12m
	allowed_magazines = /obj/item/ammo_magazine/c12m
	ammo_type = /obj/item/ammo_casing/shotgun

/obj/item/weapon/gun/projectile/shotgun/magazine/on_update_icon()
	..()
	if(ammo_magazine)
		icon_state = "bulldog"
	else
		icon_state = "bulldog-e"