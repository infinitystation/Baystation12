/obj/item/clothing/head/helmet/custom_kek4ik228
	name = "\improper D.H.E.F helmet"
	desc = "This is D.H.E.F helmet, it looks really menacing with it's red lenses and military styled woodland cover. When you really need to look cool and stylish."
	icon = CUSTOM_ITEM_OBJ
	icon_state = "kek4ik228_helmet"
	item_icons = list(
		slot_head_str = CUSTOM_ITEM_MOB
	)
	trade_blacklisted = TRUE
	action_button_name = "Toggle Mask"
	var/isVisorUp = 0

/obj/item/clothing/head/helmet/custom_kek4ik228/on_update_icon()
	. = ..()
	var/tmp = "[initial(icon_state)][isVisorUp ? "_up" : ""]"
	item_state_slots = list(slot_head_str = tmp)
	icon_state = tmp
	update_clothing_icon()

/obj/item/clothing/head/helmet/custom_kek4ik228/attack_self(mob/user as mob)
	isVisorUp = !isVisorUp
	to_chat(user, "You [isVisorUp ? "retracts" : "extend"] the mask on the [src].")
	update_icon()

/obj/item/clothing/suit/armor/pcarrier/custom_kek4ik228
	name = "\improper D.H.E.F combat vest"
	desc = "This is the Designated Hazardous Environment Fireteam Combat vest, D.H.E.F for short, it has a wide variety for a number of modifications, including various clips, holsters, armor pieces and etc."
	icon = CUSTOM_ITEM_OBJ
	item_icons = list(slot_wear_suit_str = CUSTOM_ITEM_MOB)
	icon_state = "kek4ik228_pcarrier"
	sprite_sheets = list()
//	starting_accessories = list(/obj/item/clothing/accessory/armorplate/medium, /obj/item/clothing/accessory/storage/pouches)
	trade_blacklisted = TRUE
