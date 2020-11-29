/obj/item/clothing/head/helmet/space/void/exploration/kosteg
	name = "white exploration voidsuit helmet"
	icon = 'infinity/icons/obj/clothing/obj_head.dmi'
	item_icons = list(slot_head_str = 'infinity/icons/mob/onmob/onmob_head.dmi')
	icon_state = "whitehelmet"
	item_state = "whitehelmet"
	trade_blacklisted = TRUE

/obj/item/clothing/head/helmet/space/void/exploration/chowny
	name = "red exploration voidsuit helmet"
	icon = 'infinity/icons/obj/clothing/obj_head.dmi'
	item_icons = list(slot_head_str = 'infinity/icons/mob/onmob/onmob_head.dmi')
	icon_state = "redhelmet"
	item_state = "redhelmet"
	trade_blacklisted = TRUE

/obj/item/clothing/suit/space/void/exploration/kosteg
	name = "white exploration voidsuit"
	icon = 'infinity/icons/obj/clothing/obj_suit.dmi'
	item_icons = list(slot_wear_suit_str = 'infinity/icons/mob/onmob/onmob_suit.dmi')
	icon_state = "whitesuit"
	trade_blacklisted = TRUE

/obj/item/clothing/suit/space/void/exploration/chowny
	name = "red exploration voidsuit"
	icon = 'infinity/icons/obj/clothing/obj_suit.dmi'
	item_icons = list(slot_wear_suit_str = 'infinity/icons/mob/onmob/onmob_suit.dmi')
	icon_state = "redsuit"
	trade_blacklisted = TRUE

/obj/item/custkit/kosteg_void
	name = "white voidsuit paint kit"
	input = /obj/item/clothing/suit/space/void/exploration
	output = /obj/item/clothing/suit/space/void/exploration/kosteg

/obj/item/custkit/kosteg_helmet
	name = "white voidsuit helmet paint kit"
	input = /obj/item/clothing/head/helmet/space/void/exploration
	output = /obj/item/clothing/head/helmet/space/void/exploration/kosteg

/obj/item/custkit/chowny_void
	name = "red voidsuit paint kit"
	input = /obj/item/clothing/suit/space/void/exploration
	output = /obj/item/clothing/suit/space/void/exploration/chowny

/obj/item/custkit/chowny_helmet
	name = "red voidsuit helmet paint kit"
	input = /obj/item/clothing/head/helmet/space/void/exploration
	output = /obj/item/clothing/head/helmet/space/void/exploration/chowny
