/obj/item/crowbar/kek
	name = "gold crowbar"
	desc = "A crowbar cast in gold with a mahogany handle. On the handle you can notice an engraving with the inscription: \"RAMPAGE!!!\""
	icon = CUSTOM_ITEM_OBJ
	icon_state = "kekcrowbar"
	item_state = "kekcrowbar"
	item_icons = list(slot_r_hand_str = CUSTOM_ITEM_INHANDS_RIGHT,
                      slot_l_hand_str = CUSTOM_ITEM_INHANDS_LEFT)
	matter = list(MATERIAL_GOLD = 200)
	trade_blacklisted = TRUE
/obj/item/crowbar/kek/attack_self(mob/user)
	. = ..()
	playsound(src, 'infinity/sound/customs/kekcrowbar/kekcrowbar.ogg', 100, 1)
