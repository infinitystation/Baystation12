/obj/item/clothing/glasses/tajblind
	name = "embroidered veil"
	desc = "An classic Ahdominian made veil that allows the user to see while obscuring their eyes."
	icon_state = "tajblind"
	item_state = "tajblind"
	item_icons = list(slot_glasses_str = 'infinity/icons/mob/onmob/onmob_eyes.dmi')
	icon = 'infinity/icons/obj/clothing/obj_eyes.dmi'
	prescription = 5
	body_parts_covered = EYES

/obj/item/clothing/glasses/hud/health/tajblind
	name = "lightweight veil"
	desc = "An classic Ahdominian made veil that allows the user to see while obscuring their eyes. This one has an installed medical HUD."
	item_icons = list(slot_glasses_str = 'infinity/icons/mob/onmob/onmob_eyes.dmi')
	icon = 'infinity/icons/obj/clothing/obj_eyes.dmi'
	icon_state = "tajblind_med"
	item_state = "tajblind_med"
	body_parts_covered = EYES

/obj/item/clothing/glasses/sunglasses/sechud/tajblind
	name = "sleek veil"
	desc = "An classic Ahdominian made veil that allows the user to see while obscuring their eyes. This one has an in-built security HUD."
	item_icons = list(slot_glasses_str = 'infinity/icons/mob/onmob/onmob_eyes.dmi')
	icon = 'infinity/icons/obj/clothing/obj_eyes.dmi'
	icon_state = "tajblind_sec"
	item_state = "tajblind_sec"
	prescription = 5
	body_parts_covered = EYES

/obj/item/clothing/glasses/meson/prescription/tajblind
	name = "industrial veil"
	desc = "An classic Ahdominian made veil that allows the user to see while obscuring their eyes. This one has installed mesons."
	item_icons = list(slot_glasses_str = 'infinity/icons/mob/onmob/onmob_eyes.dmi')
	icon = 'infinity/icons/obj/clothing/obj_eyes.dmi'
	icon_state = "tajblind_meson"
	item_state = "tajblind_meson"
	off_state = "tajblind_meson"
	body_parts_covered = EYES

/obj/item/clothing/glasses/hud/health/tajvisor
	name = "lightweight visor"
	desc = "A modern Ahdominian made visor that allows the user to see while obscuring their eyes. This one has an installed medical HUD."
	item_icons = list(slot_glasses_str = 'infinity/icons/mob/onmob/onmob_eyes.dmi')
	icon = 'infinity/icons/obj/clothing/obj_eyes.dmi'
	icon_state = "tajvisor_med"
	item_state = "tajvisor_med"
	body_parts_covered = EYES

/obj/item/clothing/glasses/sunglasses/sechud/tajvisor
	name = "sleek visor"
	desc = "A modern Ahdominian made visor that allows the user to see while obscuring their eyes. This one has an in-built security HUD."
	item_icons = list(slot_glasses_str = 'infinity/icons/mob/onmob/onmob_eyes.dmi')
	icon = 'infinity/icons/obj/clothing/obj_eyes.dmi'
	icon_state = "tajvisor_sec"
	item_state = "tajvisor_sec"
	prescription = 5
	body_parts_covered = EYES

/obj/item/clothing/glasses/meson/prescription/tajvisor
	name = "industrial visor"
	desc = "A modern Ahdominian made visor that allows the user to see while obscuring their eyes. This one has installed mesons."
	item_icons = list(slot_glasses_str = 'infinity/icons/mob/onmob/onmob_eyes.dmi')
	icon = 'infinity/icons/obj/clothing/obj_eyes.dmi'
	icon_state = "tajvisor_mes"
	item_state = "tajvisor_mes"
	off_state = "tajvisor_mes"
	body_parts_covered = EYES

/obj/item/clothing/glasses/meson/prescription/tajvisor/hybrid
	name = "engineering visor"
	desc = "A modern Ahdominian made visor that allows the user to see while obscuring their eyes. This one has installed as the mesons, and the add-on shielding module."
	item_icons = list(slot_glasses_str = 'infinity/icons/mob/onmob/onmob_eyes.dmi')
	icon = 'infinity/icons/obj/clothing/obj_eyes.dmi'
	icon_state = "tajvisor_mes"
	item_state = "tajvisor_mes"
	off_state = "tajvisor_mes"
	body_parts_covered = EYES
	var/mode = 1

/obj/item/clothing/glasses/meson/prescription/tajvisor/hybrid/attack_self(mob/user)
	if(!toggleable || user.incapacitated())
		return
	switch(mode)
		if(1)
			flash_protection = FLASH_PROTECTION_MAJOR
			tint = TINT_HEAVY
			to_chat(user, "You switch \the [src] to welding protection mode.")
			mode = 2
			active = TRUE
			return
		if(2)
			flash_protection = FLASH_PROTECTION_NONE
			vision_flags = SEE_TURFS
			tint = TINT_NONE
			to_chat(user, "You switch \the [src] to meson mode.")
			mode = 3
			active = TRUE
			user.update_inv_glasses()
			return
		if(3)
			vision_flags = null
			to_chat(user, "You switch off \the [src].")
			mode = 1
			active = FALSE
			user.update_inv_glasses()
			return

/obj/item/clothing/glasses/tajvisor
	name = "tajaran master visor object, not used"
	desc = "An Ahdominian made eyeguard."
	item_icons = list(slot_glasses_str = 'infinity/icons/mob/onmob/onmob_eyes.dmi')
	icon = 'infinity/icons/obj/clothing/obj_eyes.dmi'
	body_parts_covered = EYES

/obj/item/clothing/glasses/tajvisor/a
	name = "visor"
	icon_state = "tajvisor_a"
	item_state = "tajvisor_a"

/obj/item/clothing/glasses/tajvisor/b
	name = "visor"
	icon_state = "tajvisor_b"
	item_state = "tajvisor_b"

/obj/item/clothing/glasses/tajvisor/c
	name = "visor"
	icon_state = "tajvisor_c"
	item_state = "tajvisor_c"

/obj/item/clothing/glasses/tajvisor/d
	name = "visor"
	icon_state = "tajvisor_d"
	item_state = "tajvisor_d"

/obj/item/clothing/glasses/tajvisor/d
	name = "visor"
	icon_state = "tajvisor_d"
	item_state = "tajvisor_d"

/obj/item/clothing/glasses/tajvisor/e
	name = "visor"
	icon_state = "tajvisor_e"
	item_state = "tajvisor_e"

/obj/item/clothing/glasses/tajvisor/f
	name = "visor"
	icon_state = "tajvisor_f"
	item_state = "tajvisor_f"

/obj/item/clothing/glasses/tajvisor/g
	name = "visor"
	icon_state = "tajvisor_g"
	item_state = "tajvisor_g"
