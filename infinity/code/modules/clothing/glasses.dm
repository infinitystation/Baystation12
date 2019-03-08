/obj/item/clothing/glasses/material/hybrid
	name = "advanced optical material scanner"
	desc = "Prototype hybrid glasses with toggleable welding shielding"
	icon = 'icons/obj/clothing/infinity/glasses.dmi'
	icon_state = "hybrid"
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
			icon_state = "[initial(icon_state)]_weld"
			on = !on
			to_chat(user, "You switch \the [src] to welding protection mode.")
			update_state(user)
			return
		if(on && !mode)
			flash_protection = FLASH_PROTECTION_NONE
			vision_flags = SEE_OBJS
			tint = TINT_NONE
			icon_state = "[initial(icon_state)]_mat"
			mode = !mode
			to_chat(user, "You switch \the [src] to material mode.")
			update_state(user)
			return
		if(on && mode)
			flash_protection = FLASH_PROTECTION_NONE
			vision_flags = null
			icon_state = "[initial(icon_state)]"
			mode = !mode
			on = !on
			to_chat(user, "You switch off \the [src].")
			update_state(user)
			return

/obj/item/clothing/glasses/material/hybrid/proc/update_state(mob/user)
	update_icon()
	sound_to(user, activation_sound)
	user.update_inv_glasses()
	user.update_action_buttons()

/obj/item/clothing/glasses/sunglasses/blindfold/fake
	flash_protection = FLASH_PROTECTION_NONE
	tint = TINT_NONE

/obj/item/clothing/glasses/sunglasses/blindfold/fake/toggle()
	. = ..()
	flash_protection = FLASH_PROTECTION_NONE
	tint = TINT_NONE

/obj/item/clothing/glasses/sunglasses/blindfold/fake/examine()
	. = ..()
	if(Adjacent(usr))
		to_chat(usr, "<span class='notice'>You may notice two small holes on one side, which are most likely used to see through them.</span>")
