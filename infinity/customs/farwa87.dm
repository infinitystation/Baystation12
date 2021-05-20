/obj/item/toy/plushie/jones
	name = "Gosha"
	desc = "Just an old good plush friend."
	icon = CUSTOM_ITEM_OBJ
	icon_state = "gosha"

	trade_blacklisted = TRUE

/obj/item/clothing/head/soft/farwa87
	name = "wig"
	desc = "Just a wig."
	icon = CUSTOM_ITEM_OBJ
	item_icons = list(slot_head_str = CUSTOM_ITEM_MOB)
	icon_state = "farwa87_wig"
	item_state = "farwa87_wig"
	flags_inv = BLOCKHAIR

/obj/item/clothing/head/soft/farwa87/attack_self(mob/user)
	user.visible_message(SPAN_NOTICE("[user] shook \the [src], removing the slightest speck of dust from it."), SPAN_NOTICE("You shook \the [src], removing the slightest speck of dust from it."))
