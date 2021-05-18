/obj/item/material/hatchet/machete/deluxe/mixa
	name = "Energy deluxe machete"
	desc = "Black handle with button on bottom"
	icon = CUSTOM_ITEM_OBJ
	icon_state = "mach_active"
	item_icons = list(
		slot_l_hand_str = 'icons/mob/onmob/guns/guns_l.dmi',
		slot_r_hand_str = 'icons/mob/onmob/guns/guns_r.dmi',
		)
	item_state = null
	force = 16
	throwforce = 13
	trade_blacklisted = TRUE
	applies_material_name = FALSE
	var/active = TRUE

/obj/item/material/hatchet/machete/deluxe/mixa/Initialize()
	. = ..()
	icon_state = "mach_active"

/obj/item/material/hatchet/machete/deluxe/mixa/attack_self(mob/living/user as mob)
	active = !active

	if(active)
		force = initial(force)
		throwforce = initial(throwforce)
		icon_state = initial(icon_state)
		w_class = initial(w_class)
	else
		force = 3
		throwforce = 3
		icon_state = "mach_fold"
		w_class = ITEM_SIZE_SMALL
		update_icon()
	
	if(istype(user,/mob/living/carbon/human))
		var/mob/living/carbon/human/H = user
		H.update_inv_l_hand()
		H.update_inv_r_hand()
	add_fingerprint(user)
	return
