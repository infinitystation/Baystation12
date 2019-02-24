/obj/item/weapon/gun/projectile/revolver/lr22
	name = ".22LR revolver"
	desc = "A rugged revolver based on the Smith & Wesson 617 model, with modern improvements. Uses .22LR rounds."
	icon = 'icons/obj/infinity_guns.dmi'
	icon_state = "22lr_revolver"
	item_state = "revolver"
	max_shells = 10
	caliber = "22"
	origin_tech = list(TECH_COMBAT = 2, TECH_MATERIAL = 2)
	ammo_type = /obj/item/ammo_casing/a22lr

/obj/item/weapon/gun/projectile/revolver/shotgun
	name = "RSH-12 shotgun-revolver"
	desc = "The old RSH-12 shotgun revolder designer for spec ops. Useful for sweeping alleys."
	icon = 'icons/obj/infinity_guns.dmi'
	icon_state = "rsh-12"
	item_icons = list(
		slot_l_hand_str = 'icons/mob/onmob/items/lefthand_guns.dmi',
		slot_r_hand_str = 'icons/mob/onmob/items/righthand_guns.dmi',
		)
	item_state = "gun"
	max_shells = 4
	fire_delay = 8
	force = 10
	caliber = "shotgun"
	origin_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 2)
	ammo_type = /obj/item/ammo_casing/shotgun

/obj/item/weapon/gun/projectile/revolver/webley/captain
	name = "\improper Final Argument"
	icon = 'maps/sierra/icons/obj/uniques.dmi'
	icon_state = "mosley"
	desc = "A shiny al-Maliki & Mosley Autococker automatic revolver, with black accents. Marketed as the 'Revolver for the Modern Era'. Uses .357 magnum rounds."
	fire_delay = 5.7 //Autorevolver. Also synced with the animation
	fire_anim = "mosley_fire"
	origin_tech = list(TECH_COMBAT = 3, TECH_MATERIAL = 2)
