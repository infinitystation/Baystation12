/obj/item/weapon/melee/energy/machete/mixa
	name = "Energy deluxe machete"
	desc = "Black handle with button on bottom"
	icon = CUSTOM_ITEM_OBJ
	icon_state = "mach_fold"
	active_icon = "mach_active"	
	item_icons = list(
		slot_l_hand_str = 'icons/mob/onmob/guns/guns_l.dmi',
		slot_r_hand_str = 'icons/mob/onmob/guns/guns_r.dmi',
		)
	lighting_color = COLOR_SABER_RED
	force = 1
	active_force = 16
	active = 0
	armor_penetration = 0
	sharp = 1
	edge = 1
	base_parry_chance = 40
	trade_blacklisted = TRUE


/obj/item/weapon/melee/energy/machete/mixa/dropped(var/mob/user)
	..()
	if(!istype(loc,/mob))
		deactivate(user)


/obj/item/weapon/melee/energy/machete/mixa/get_parry_chance(mob/user)
	return active ? ..() : 0
