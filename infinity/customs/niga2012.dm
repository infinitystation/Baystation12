/*
 *  Vox's RIG
 */

// RIG parts
/obj/item/clothing/head/helmet/space/rig/vox_rig/niga2012
	icon = CUSTOM_ITEM_OBJ
	item_icons = list(slot_head_str = CUSTOM_ITEM_MOB)
	icon_state = "niga2012_vox_rig_helmet"
	flags_inv = HIDEEARS | HIDEEYES | HIDEFACE
	light_overlay = "niga2012_light"

/obj/item/clothing/head/helmet/space/rig/vox_rig/niga2012/update_flashlight(var/mob/user = null)
	if(on && !light_applied)
		set_light(brightness_on, 1, 3, 1, COLOR_PURPLE)
		light_applied = 1
	else if(!on && light_applied)
		set_light(0)
		light_applied = 0
	update_icon(user)
	user.update_action_buttons()

/obj/item/clothing/head/helmet/space/rig/vox_rig/niga2012/get_mob_overlay(mob/user_mob, slot)
	var/image/ret = ..()
	if(light_overlay_image)
		ret.overlays -= light_overlay_image
	if(on && slot == slot_head_str)
		if(!light_overlay_image)
			if(ishuman(user_mob))
				var/mob/living/carbon/human/user_human = user_mob
				var/use_icon
				if(sprite_sheets)
					use_icon = sprite_sheets[user_human.species.get_bodytype(user_human)]
				if(use_icon)
					light_overlay_image = user_human.species.get_offset_overlay_image(TRUE, use_icon, "[light_overlay]", color, slot)
				else
					light_overlay_image = user_human.species.get_offset_overlay_image(FALSE, 'icons/mob/light_overlays.dmi', "[light_overlay]", color, slot)
			else
				light_overlay_image = overlay_image(CUSTOM_ITEM_MOB, "[light_overlay]", null, RESET_COLOR)
		ret.overlays |= light_overlay_image
	return ret


/obj/item/clothing/suit/space/rig/vox_rig/niga2012
	icon = CUSTOM_ITEM_OBJ
	item_icons = list(slot_wear_suit_str = CUSTOM_ITEM_MOB)
	icon_state = "niga2012_vox_rig_chest"

/obj/item/clothing/shoes/magboots/rig/vox_rig/niga2012
	icon = CUSTOM_ITEM_OBJ
	item_icons = list(slot_shoes_str = CUSTOM_ITEM_MOB)
	icon_state = "niga2012_vox_rig_boots"
	online_slowdown = 0
	sprite_sheets = list("vox" = CUSTOM_ITEM_MOB)

/obj/item/clothing/gloves/rig/vox_rig/niga2012
	icon = CUSTOM_ITEM_OBJ
	item_icons = list(slot_gloves_str = CUSTOM_ITEM_MOB)
	icon_state = "niga2012_vox_rig_gloves"
	sprite_sheets = list("vox" = CUSTOM_ITEM_MOB)


// RIG modules
/obj/item/gun/energy/gun/mounted/niga2012
	projectile_type = /obj/item/projectile/beam/stun/darkmatter
	firemodes = list(
		list(mode_name="stunning", burst=1, fire_delay=null, move_delay=null, burst_accuracy=list(30), dispersion=null, projectile_type=/obj/item/projectile/beam/stun/darkmatter, charge_cost = 50),
		list(mode_name="focused", burst=1, fire_delay=null, move_delay=null, burst_accuracy=list(30), dispersion=null, projectile_type=/obj/item/projectile/beam/darkmatter, charge_cost = 75),
		list(mode_name="scatter burst", burst=8, fire_delay=null, move_delay=4, burst_accuracy=list(0, 0, 0, 0, 0, 0, 0, 0), dispersion=list(0, 1, 2, 2, 3, 3, 3, 3, 3), projectile_type=/obj/item/projectile/energy/darkmatter, charge_cost = 10),
	)
	use_external_power = 0

/obj/item/rig_module/mounted/niga2012
	name = "darkmatter cannon"
	desc = "A portable darkmatter generator with three firemodes"
	interface_name = "darkmatter cannon"
	interface_desc = "A portable darkmatter generator with three firemodes"
	suit_overlay_active = "niga2012_darkmatter"
	icon = CUSTOM_ITEM_OBJ
	icon_state = "niga2012_darkmatter"
	gun = /obj/item/gun/energy/gun/mounted/niga2012

/obj/item/rig_module/mounted/plasmacutter/niga2012
	name = "plasmacutter"
	desc = "A portable darkmatter plasmacutter"
	interface_name = "plasmacutter"
	interface_desc = "A portable darkmatter plasmacutter"
	icon = CUSTOM_ITEM_OBJ
	icon_state = "niga2012_plasmacutter"
	suit_overlay_active = "niga2012_plasmacutter"

/obj/item/rig_module/vision/niga2012
	vision_modes = list(
		/datum/rig_vision/nvg,
		/datum/rig_vision/meson
	)


// RIG's MAIN PART
/obj/item/rig/vox/niga2012
	name = "gaze rig"
	desc = "A purple vox-sized rig."
	icon = CUSTOM_ITEM_OBJ
	icon_override = CUSTOM_ITEM_MOB
	icon_state = "niga2012_vox_rig"
	equipment_overlay_icon = CUSTOM_ITEM_MOB

	chest_type = /obj/item/clothing/suit/space/rig/vox_rig/niga2012
	helm_type = /obj/item/clothing/head/helmet/space/rig/vox_rig/niga2012
	boot_type = /obj/item/clothing/shoes/magboots/rig/vox_rig/niga2012
	glove_type = /obj/item/clothing/gloves/rig/vox_rig/niga2012

	piece_icon_state_overrides = list(
		"helmet" = "niga2012_vox_rig_helmet",
		"chest" = "niga2012_vox_rig_chest",
		"gloves" = "niga2012_vox_rig_gloves",
		"boots" = "niga2012_vox_rig_boots"
	)

	custom = TRUE
	trade_blacklisted = TRUE

/obj/item/rig/vox/niga2012/Initialize()
	initial_modules += /obj/item/rig_module/mounted/niga2012
	initial_modules += /obj/item/rig_module/mounted/plasmacutter/niga2012
	initial_modules += /obj/item/rig_module/vision/niga2012
	. = ..()

/obj/item/clothingbag/niga2012_vox_rig
	name = "Kighakiki's bag"
	desc = "Kighakiki's property"
	trade_blacklisted = TRUE

/obj/item/clothingbag/niga2012_vox_rig/Initialize()
	. = ..()
	new /obj/item/rig/vox/niga2012(src)
