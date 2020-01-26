/obj/item/clothing/suit/storage/hooded/solar_cloak
	name = "polychromic cloak"
	desc = "Resomi cloak. Seems to be coated with polychrome paint. There is also a sewn hood. DO NOT MIX WITH EMP!"
	icon = CUSTOM_ITEM_OBJ
	icon_state = "solar_cloak"
	hoodtype = /obj/item/clothing/head/winterhood/solar_cloak_hood
	action_button_name = "Toggle Hood"
	slots = 2
	species_restricted = list(SPECIES_RESOMI)
	body_parts_covered = UPPER_TORSO|ARMS|LOWER_TORSO

/obj/item/clothing/suit/storage/hooded/solar_cloak/New()
	..()
	sprite_sheets = list(
		SPECIES_RESOMI = CUSTOM_ITEM_MOB
	)
	if(pockets)
		qdel(pockets)
	pockets = new/obj/item/weapon/storage/internal/pouch(src, slots*BASE_STORAGE_COST(ITEM_SIZE_SMALL))

/obj/item/clothing/suit/storage/hooded/solar_cloak/verb/change_color()
	set name = "Change Cloak Color"
	set category = "Object"
	set desc = "Change the color of the cloak."
	set src in usr

	if(usr.incapacitated())
		return

	var/new_color = input(usr, "Pick a new color", "Cloak Color", color) as color|null
	if(!new_color || new_color == color || usr.incapacitated())
		return
	color = new_color
	hood.color = color
	hood.update_icon()
	update_icon()


/obj/item/clothing/suit/storage/hooded/solar_cloak/on_update_icon()
	..()
	update_clothing_icon()

/obj/item/clothing/suit/storage/hooded/solar_cloak/emp_act()
	color = null
	update_icon()

/obj/item/clothing/head/winterhood/solar_cloak_hood
	name = "hood"
	icon = CUSTOM_ITEM_OBJ
	icon_state = "solar_cloak_hood"
	species_restricted = list(SPECIES_RESOMI)
	desc = "It's hood that covers the head."
	flags_inv = BLOCKHAIR | HIDEEARS
	body_parts_covered = HEAD

/obj/item/clothing/head/winterhood/solar_cloak_hood/New()
	..()
	sprite_sheets = list(
		SPECIES_RESOMI = CUSTOM_ITEM_MOB
	)
