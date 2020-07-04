/obj/item/clothing/suit/armor/pcarrier/medium/nt/atlasarmor
	name = "UTKV Plate Carrier"
	desc = "A tactical webbing vest with SAARE tag on the back, this one can be reinforced with armor plates"
	icon = CUSTOM_ITEM_OBJ
	icon_state = "atlasarmor"
	item_state = "atlasarmor"
	item_icons = list(slot_wear_suit_str = CUSTOM_ITEM_MOB)

	trade_blacklisted = TRUE

/obj/item/clothing/under/rank/security/atlasuni
	name = "Operator jeans suit"
	desc = "A suit contained of police track jacket, and ripped OxyCo-Done jeans, looks like owner never heard about kneepads"
	icon = CUSTOM_ITEM_OBJ
	item_icons = list(slot_w_uniform_str = CUSTOM_ITEM_MOB)
	icon_state = "atlasuni"
	item_state = "atlasuni"
	worn_state = "atlasuni"
	armor = list() //no armor
	trade_blacklisted = TRUE

/obj/item/clothing/head/helmet/atlashelm
	name = "\improper AM-95 helmet"
	desc = "A typical helmet designed for stopping bullets, pretty heavy, this one have a bulletproof visor and place for rifle headset, looking pretty classy. It has little label with 'It got me more drugs' written on it"
	icon = CUSTOM_ITEM_OBJ
	icon_state = "atlashelm"
	item_icons = list(
		slot_head_str = CUSTOM_ITEM_MOB
	)
	item_state_slots = list(
		slot_head_str = "atlashelm"
	)
	trade_blacklisted = TRUE
	action_button_name = "Toggle Visor"
	var/isVisorUp = 0

/obj/item/clothing/head/helmet/atlashelm/on_update_icon()
	. = ..()
	var/tmp = "[initial(icon_state)][isVisorUp ? "_up" : ""]"
	item_state_slots = list(slot_head_str = tmp)
	icon_state = tmp
	update_clothing_icon()

/obj/item/clothing/head/helmet/atlashelm/attack_self(mob/user as mob)
	isVisorUp = !isVisorUp
	to_chat(user, "You [isVisorUp ? "raise" : "lower"] the visor on the [src].")
	update_icon()
