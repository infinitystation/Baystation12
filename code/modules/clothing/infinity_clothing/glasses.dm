/obj/item/clothing/glasses/material/hybrid
	name = "advanced optical material scanner"
	desc = "Prototype hybrid glasses with toggleable welding shielding"
	icon = 'icons/obj/clothing/infinity/glasses.dmi'
	icon_state = "hybrid_off"
	item_state = "glasses"
	item_icons = list(slot_glasses_str = 'icons/mob/infinity/glasses.dmi')
	vision_flags = null
	var/on = FALSE
	var/mode = FALSE

/obj/item/clothing/glasses/material/hybrid/attack_self(mob/user)
	if(toggleable && !user.incapacitated())
		if(!on && !mode)
			flash_protection = FLASH_PROTECTION_MAJOR
			vision_flags = null
			tint = TINT_HEAVY
			icon_state = "hybrid_weld"
			on = !on
			to_chat(user, "You switch \the [src] to welding protection mode.")
			goto hybr_loop
		if(on && !mode)
			flash_protection = FLASH_PROTECTION_NONE
			vision_flags = SEE_OBJS
			tint = TINT_NONE
			icon_state = "hybrid_mat"
			mode = !mode
			to_chat(user, "You switch \the [src] to material mode.")
			goto hybr_loop
		if(on && mode)
			flash_protection = FLASH_PROTECTION_NONE
			vision_flags = null
			icon_state = "hybrid_off"
			mode = !mode
			on = !on
			to_chat(user, "You switch off \the [src].")
		hybr_loop:
		update_icon()
		sound_to(user, activation_sound)
		user.update_inv_glasses()
		user.update_action_buttons()
