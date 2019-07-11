/obj/item/weapon/gun/projectile/shotgun/magazine
	name = "AS-53 automatic shotgun"
	desc = "The mass-produced by Aussec Armory, shotgun AS-53 'Striker' is an echo of the past in new package. Reborned assault shotgun usually can be saw in hands of mercenaries groups and Private Military Companies."
	icon = 'infinity/icons/obj/guns.dmi'
	icon_state = "bulldog"
	item_state = "bulldog"
	item_icons = list(
		slot_r_hand_str = 'infinity/icons/mob/onmob/righthand.dmi',
		slot_l_hand_str = 'infinity/icons/mob/onmob/lefthand.dmi',
		)
	one_hand_penalty = 4
	wielded_item_state = "bulldog-wielded"
	max_shells = 1
	w_class = ITEM_SIZE_HUGE
	force = 10
	obj_flags =  OBJ_FLAG_CONDUCTIBLE
	caliber = CALIBER_SHOTGUN
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

/obj/item/weapon/gun/projectile/shotgun/doublebarrel/empty
	ammo_type = null

/obj/item/weapon/gun/projectile/shotgun/shotguntaj
	name = "TS-12E"
	desc = "TS-12E shotgun pistol designer for CCA EC. It has tremendous stopping power. This is the weapon of last chance."
	icon = 'infinity/icons/obj/guns.dmi'
	icon_state = "shotguntaj"
	item_state = "revolver"
	max_shells = 1
	force = 10
	w_class = ITEM_SIZE_NORMAL
	caliber = CALIBER_SHOTGUN
	origin_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 2)
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/shotguntaj/net
	allowed_magazines = /obj/item/ammo_magazine/shotguntaj
	ammo_type = /obj/item/ammo_casing/shotgun

/obj/item/weapon/gun/projectile/shotguntaj/special_check(user)
	if(istype(user,/mob/living/carbon/human))
		var/mob/living/carbon/human/H = user
		if(H.species && H.species.get_bodytype(H) != SPECIES_TAJARA)
			to_chat(user, "<span class='warning'>\The [src] trigger because of the anatomical structure of your hand is not pressed!</span>")
			return 0
	return ..()

/obj/item/weapon/gun/projectile/shotguntaj/on_update_icon()
	if(ammo_magazine)
		icon_state = "shotguntaj"
	else
		icon_state = "shotguntaj_empty"