/obj/item/clothing/head/helmet/space/void/exploration/kosteg
	name = "white exploration voidsuit helmet"
	icon = 'icons/obj/clothing/infinity/hats.dmi'
	item_icons = list(slot_head_str = 'icons/mob/infinity/hats.dmi')
	icon_state = "whitehelmet"
	item_state = "whitehelmet"

/obj/item/clothing/head/helmet/space/void/exploration/chowny
	name = "red exploration voidsuit helmet"
	icon = 'icons/obj/clothing/infinity/hats.dmi'
	item_icons = list(slot_head_str = 'icons/mob/infinity/hats.dmi')
	icon_state = "redhelmet"
	item_state = "redhelmet"

/obj/item/clothing/suit/space/void/exploration/kosteg
	name = "white exploration voidsuit"
	icon = 'icons/obj/clothing/infinity/suits.dmi'
	item_icons = list(slot_wear_suit_str = 'icons/mob/infinity/suits.dmi')
	icon_state = "whitesuit"

/obj/item/clothing/suit/space/void/exploration/chowny
	name = "red exploration voidsuit"
	icon = 'icons/obj/clothing/infinity/suits.dmi'
	item_icons = list(slot_wear_suit_str = 'icons/mob/infinity/suits.dmi')
	icon_state = "redsuit"

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