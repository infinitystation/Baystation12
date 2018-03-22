/obj/item/clothing/suit/space/void/swat
	name = "\improper SWAT suit"
	desc = "A heavily armored suit that protects against moderate damage. Used in special operations."
	icon_state = "deathsquad"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|FEET|ARMS
	allowed = list(/obj/item/weapon/gun,/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/weapon/melee/baton,/obj/item/weapon/handcuffs,/obj/item/weapon/tank)
	armor = list(melee = 80, bullet = 60, laser = 60,energy = 25, bomb = 50, bio = 100, rad = 100)
	flags_inv = HIDESHOES|HIDEJUMPSUIT
	siemens_coefficient = 0.6

/obj/item/clothing/suit/space/void/swat/New()
	..()
	slowdown_per_slot[slot_wear_suit] = 1

/obj/item/clothing/suit/space/void/military
	name = "\improper military voidsuit"
	desc = "A heavily armored suit for heavy infantry. Used in SCG Marine Corps."
	icon_state = "rig-secTG"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|FEET|ARMS
	allowed = list(/obj/item/weapon/gun,/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/weapon/melee/baton,/obj/item/weapon/handcuffs,/obj/item/weapon/tank)
	armor = list(melee = 30, bullet = 50, laser = 50,energy = 30, bomb = 60, bio = 100, rad = 40)
	flags_inv = HIDESHOES|HIDEJUMPSUIT
	siemens_coefficient = 0.6

/obj/item/clothing/suit/space/void/military/New()
	..()
	slowdown_per_slot[slot_wear_suit] = 1

/obj/item/clothing/suit/space/void/military/prepared
	helmet = /obj/item/clothing/head/helmet/space/void/military
	boots = /obj/item/clothing/shoes/magboots

/obj/item/clothing/head/helmet/space/void/military
	name = "military voidsuit helmet"
	desc = "A somewhat tacky voidsuit helmet, a fact mitigated by heavy armor plating."
	icon_state = "rig0-secTG"
	item_state = "rig0-secTG"
	armor = list(melee = 50, bullet = 45, laser = 50, energy = 10, bomb = 35, bio = 100, rad = 30)
	item_state_slots = list(
		slot_l_hand_str = "sec_helm",
		slot_r_hand_str = "sec_helm",
		)
	siemens_coefficient = 0.6
	light_overlay = "helmet_light_dual"