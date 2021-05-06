/obj/item/flame/lighter/zippo/infinity
	name = "engraved zippo"
	icon = 'infinity/icons/obj/lighters.dmi'
	icon_state = "engraved"

/obj/item/flame/lighter/zippo/infinity/gold
	name = "golden zippo"
	icon_state = "gold"

/obj/item/flame/lighter/zippo/infinity/station
	name = "13'th zippo "
	icon_state = "13"

/obj/item/flame/lighter/zippo/infinity/black
	name = "cross zippo"
	icon_state = "black"

/obj/item/flame/lighter/zippo/infinity/blue
	name = "blue zippo"
	icon_state = "bluezippo"

/obj/item/flame/lighter/zippo/infinity/red
	name = "red-white zippo"
	icon_state = "redzippo"

/obj/item/flame/lighter/zippo/infinity/butterfly
	name = "butterfly zippo"
	icon_state = "butterzippo"

/obj/item/flame/lighter/zippo/infinity/fancy
	name = "flower zippo"
	icon_state = "fancyzippo"

/obj/item/flame/lighter/zippo/infinity/on_update_icon()
	var/datum/extension/base_icon_state/bis = get_extension(src, /datum/extension/base_icon_state)

	if(lit)
		icon_state = "[bis.base_icon_state]_on"
		item_state = "[bis.base_icon_state]_on"
	else
		icon_state = "[bis.base_icon_state]"
		item_state = "[bis.base_icon_state]"
