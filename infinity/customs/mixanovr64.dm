/obj/item/weapon/material/hatchet/machete/deluxe/mixa
	name = "Energy deluxe machete"
	desc = "Black handle with button on bottom"
	icon = CUSTOM_ITEM_OBJ
	icon_state = "mach_active"
	item_icons = list(
		slot_l_hand_str = 'icons/mob/onmob/guns/guns_l.dmi',
		slot_r_hand_str = 'icons/mob/onmob/guns/guns_r.dmi',
		)
	var/active = TRUE
	item_state = null
	var/inactive_force = 3
	var/inactive_throwforce = 3
	var/inactive_icon = "mach_fold"
	trade_blacklisted = TRUE
	applies_material_name = FALSE

/obj/item/weapon/material/hatchet/machete/deluxe/mixa/Initialize()
	. = ..()
	icon_state = "mach_active"

/obj/item/weapon/material/hatchet/machete/deluxe/mixa/attack_self(mob/living/user as mob)
	active = !active
	if(active)
		slot_flags  = initial(slot_flags)
		force = initial(force)
		throwforce = initial(throwforce)
		icon_state = initial(icon_state)
	else
		force = inactive_force
		throwforce = inactive_throwforce
		icon_state = inactive_icon
		slot_flags |= SLOT_POCKET
		update_icon()
	if(istype(user,/mob/living/carbon/human))
		var/mob/living/carbon/human/H = user
		H.update_inv_l_hand()
		H.update_inv_r_hand()
	add_fingerprint(user)
	return