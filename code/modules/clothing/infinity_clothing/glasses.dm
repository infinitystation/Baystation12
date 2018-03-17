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

/obj/item/clothing/glasses/material/hybrid/special //special glasses for spacial MrNicolas
	name = "hybrid optical scanner"
	desc = "This scanner has several buttons on one side and the TCC logo on the other. Under the logo engraving 'Thoughts are material.' On the inside there is a pair of connectors. It seems that this thing is not for ordinary eyes."
	icon_state = "hybrids_off"

/obj/item/clothing/glasses/material/hybrid/special/Process()
	if(ishuman(loc))
		var/mob/living/carbon/human/S = loc
		var/obj/item/organ/internal/eyes/N = S.internal_organs_by_name[BP_EYES]
		if(on)
			if (!N.robotic)
				if (N.damage <= N.min_broken_damage)
					to_chat(S, "<span class='warning'>Your eyes sting a little.</span>")
					N.damage += rand(1, 2)
					if (N.damage >= N.min_broken_damage)
						to_chat(S, "<span class='danger'>You go blind!</span>")
						S.sdisabilities |= BLIND

/obj/item/clothing/glasses/material/hybrid/special/equipped(var/mob/user, var/slot)
	if(slot == slot_glasses)
		START_PROCESSING(SSobj, src)

/obj/item/clothing/glasses/material/hybrid/special/dropped()
	STOP_PROCESSING(SSobj, src)
	. = ..()

/obj/item/clothing/glasses/material/hybrid/special/attack_self(mob/user)
	if(toggleable && !user.incapacitated())
		if(!on && !mode)
			flash_protection = FLASH_PROTECTION_MAJOR
			vision_flags = null
			tint = TINT_MODERATE
			icon_state = "hybrids_weld"
			on = !on
			to_chat(user, "You switch \the [src] to welding protection mode.")
			goto hybr_loop
		if(on && !mode)
			flash_protection = FLASH_PROTECTION_NONE
			vision_flags = SEE_OBJS
			tint = TINT_NONE
			icon_state = "hybrids_mat"
			mode = !mode
			to_chat(user, "You switch \the [src] to material mode.")
			goto hybr_loop
		if(on && mode)
			flash_protection = FLASH_PROTECTION_NONE
			vision_flags = null
			icon_state = "hybrids_off"
			mode = !mode
			on = !on
			to_chat(user, "You switch off \the [src].")
		hybr_loop:
		update_icon()
		sound_to(user, activation_sound)
		user.update_inv_glasses()
		user.update_action_buttons()

/obj/item/clothing/glasses/material/hybrid/special/Destroy()
	STOP_PROCESSING(SSobj, src)
	. = ..()