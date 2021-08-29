/obj/item/clothing/shoes/dutyboots/sad_ninja_sid
	name = "blue duty boots"
	desc = "Duty boots in a special color to fit blue armor."
	icon = CUSTOM_ITEM_OBJ
	item_icons = list(
		slot_shoes_str = CUSTOM_ITEM_MOB
	)
	icon_state = "sad_ninja_sid_sidnie_boots"
	item_state = "sad_ninja_sid_sidnie_boots"
	trade_blacklisted = TRUE


/obj/item/clothing/under/sad_ninja_sid
	name = "white shirt and pants"
	desc = "Common set of clothes."
	icon = CUSTOM_ITEM_OBJ
	item_icons = list(
		slot_w_uniform_str = CUSTOM_ITEM_MOB
	)
	icon_state = "sad_ninja_sid_sidnie_uni"
	item_state = "sad_ninja_sid_sidnie_uni"
	worn_state = "sad_ninja_sid_sidnie_uni"
	trade_blacklisted = TRUE


/obj/item/clothing/head/beret/sad_ninja_sid
	name = "moonlight Guardians beret"
	desc = "Made in colors of moon PSO, this one belongs to a medic officer."
	icon = CUSTOM_ITEM_OBJ
	item_icons = list(
		slot_head_str = CUSTOM_ITEM_MOB
	)
	icon_state = "sad_ninja_sid_sidnie_beret"
	item_state = "sad_ninja_sid_sidnie_beret"
	trade_blacklisted = TRUE


/obj/item/clothing/accessory/armor/tag/sad_ninja_sid
	name = "combat medic patch"
	desc = "A medical cross, that can be attached to a plate carrier."
	icon_override = CUSTOM_ITEM_MOB
	icon = CUSTOM_ITEM_OBJ
	accessory_icons = list(
		slot_tie_str = CUSTOM_ITEM_MOB,
		slot_wear_suit_str = CUSTOM_ITEM_MOB
	)
	icon_state = "sad_ninja_sid_sidnie_medpatch"
	item_state = "sad_ninja_sid_sidnie_medpatch"
	trade_blacklisted = TRUE


/obj/item/clothingbag/sad_ninja_sid
	name = "blue clothbag"
	desc = "Sidnie Cloud's property"
	trade_blacklisted = TRUE


/obj/item/clothingbag/sad_ninja_sid/Initialize()
	. = ..()
	new /obj/item/clothing/shoes/dutyboots/sad_ninja_sid(src)
	new /obj/item/clothing/under/sad_ninja_sid(src)
	new /obj/item/clothing/head/beret/sad_ninja_sid(src)
	new /obj/item/clothing/accessory/armor/tag/sad_ninja_sid(src)


// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// Revolver
/obj/item/gun/projectile/revolver/medium/sad_ninja_sid
	name = "peacemaker"
	desc = "An old fashion custom revolver, chambered in 10mm caliber. \
			The inscription \"Peacemaker\" is engraved on the handle."
	icon = CUSTOM_GUN_ICONS
	item_icons = list(
		slot_l_hand_str = CUSTOM_GUN_INHANDS_LEFT,
		slot_r_hand_str = CUSTOM_GUN_INHANDS_RIGHT,
		slot_belt_str = CUSTOM_ITEM_MOB
	)
	icon_state = "peacemaker"
	item_state = "peacemaker"
	safety_icon = "peacemaker_safety"
	starts_loaded = FALSE
	trade_blacklisted = TRUE

/obj/item/gun/projectile/revolver/medium/sad_ninja_sid/handle_click_empty()
	. = ..()
	if(!safety_state)
		toggle_safety()

/obj/item/gun/projectile/revolver/medium/sad_ninja_sid/handle_post_fire()
	. = ..()
	if(!safety_state)
		toggle_safety()

/obj/item/gun/projectile/revolver/medium/sad_ninja_sid/attackby(obj/item/W, mob/user)
	if ( istype(W, /obj/item/ammo_magazine/speedloader) )
		to_chat(user, SPAN_WARNING("You can't reload \the [src] with [W]!"))
		return
	return ..()

/obj/item/gun/projectile/revolver/medium/sad_ninja_sid/attack_self(mob/user)
	user.visible_message(SPAN_NOTICE("\The [usr] spins in hands \the [src]!"))
	return


/obj/item/ammo_magazine/box/pistol/sad_ninja_sid
	ammo_type = /obj/item/ammo_casing/pistol/rubber
	max_ammo = 30
	initial_ammo = 6
	trade_blacklisted = TRUE


/obj/item/weapon_case/custom/sad_ninja_sid
	owner = "Sidnie Cloud"
	holding_weapon = /obj/item/gun/projectile/revolver/medium/sad_ninja_sid
	trade_blacklisted = TRUE


/obj/item/clothingbag/sad_ninja_sid_revolver
	name = "peacemaker's bag"
	desc = "Sidnie Cloud's property"
	trade_blacklisted = TRUE

/obj/item/clothingbag/sad_ninja_sid_revolver/Initialize()
	. = ..()
	new /obj/item/weapon_case/custom/sad_ninja_sid(src)
	new /obj/item/ammo_magazine/box/pistol/sad_ninja_sid(src)
