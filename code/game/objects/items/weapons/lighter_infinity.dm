/obj/item/weapon/flame/lighter/zippo/infinity
	name = "\improper engraved zippo lighter"
	icon = 'icons/obj/lighters_inf.dmi'
	icon_state = "engraved"

/obj/item/weapon/flame/lighter/zippo/infinity/gold
	name = "\improper gold zippo lighter"
	icon_state = "gold"

/obj/item/weapon/flame/lighter/zippo/infinity/station
	name = "\improper special zippo lighter"
	icon_state = "13"

/obj/item/weapon/flame/lighter/zippo/infinity/black
	name = "\improper black zippo lighter"
	icon_state = "black"

/obj/item/weapon/flame/lighter/zippo/infinity/blue
	name = "\improper blue zippo lighter"
	icon_state = "bluezippo"

/obj/item/weapon/flame/lighter/zippo/infinity/red
	name = "\improper red zippo lighter"
	icon_state = "redzippo"

/obj/item/weapon/flame/lighter/zippo/infinity/butterfly
	name = "\improper butterfly zippo lighter"
	icon_state = "butterzippo"

/obj/item/weapon/flame/lighter/zippo/infinity/fancy
	name = "\improper fancy zippo lighter"
	icon_state = "butterzippo"


/obj/item/weapon/flame/lighter/zippo/infinity/on_update_icon()
	var/datum/extension/base_icon_state/bis = get_extension(src, /datum/extension/base_icon_state)

	overlays.Cut()
	if(lit)
		icon_state = "[bis.base_icon_state]on"
		item_state = "[bis.base_icon_state]on"
	else
		icon_state = "[bis.base_icon_state]"
		item_state = "[bis.base_icon_state]"
