/obj/item/gun/projectile/revolver
	name = "al-Maliki & Mosley \"Magnum Double Action\" revolver"

/obj/item/gun/projectile/revolver/medium
	name = "Lumoco Arms' \"Solid\" revolver"

/obj/item/gun/projectile/revolver/holdout
	name = "al-Maliki & Mosley \"Partner\" holdout revolver"

/obj/item/gun/projectile/revolver/lr22
	name = ".22LR revolver"
	desc = "A rugged revolver based on the Smith & Wesson 617 model, with modern improvements. Uses .22LR rounds."
	icon = 'infinity/icons/obj/guns.dmi'
	icon_state = "22lr_revolver"
	item_state = "revolver"
	max_shells = 10
	caliber = CALIBER_PISTOL_TINY
	origin_tech = list(TECH_COMBAT = 2, TECH_MATERIAL = 2)
	ammo_type = /obj/item/ammo_casing/a22lr

/obj/item/gun/projectile/revolver/shotgun
	name = "RSH-12 shotgun-revolver"
	desc = "The old RSH-12 revolder designer for spec ops. Useful for sweeping alleys. Uses 12G ammo"
	icon = 'infinity/icons/obj/guns.dmi'
	icon_state = "rsh-12"
	item_icons = list(
		slot_l_hand_str = 'icons/mob/onmob/items/lefthand_guns.dmi',
		slot_r_hand_str = 'icons/mob/onmob/items/righthand_guns.dmi',
		)
	item_state = "gun"
	max_shells = 5
	fire_delay = 8
	force = 10
	caliber = CALIBER_SHOTGUN
	origin_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 2)
	ammo_type = /obj/item/ammo_casing/shotgun

/obj/item/gun/projectile/revolver/medium/captain
	name = "\improper Final Argument"
	icon = 'maps/torch/icons/obj/uniques.dmi'
	icon_state = "mosley"
	desc = "A shiny al-Maliki & Mosley Autococker automatic revolver, with black accents. Marketed as the 'Revolver for the Modern Era'."
	fire_delay = 5.7 //Autorevolver. Also synced with the animation
	fire_anim = "mosley_fire"
	origin_tech = list(TECH_COMBAT = 3, TECH_MATERIAL = 2)
	starts_loaded = 0 //Nobody keeps ballistic weapons loaded
