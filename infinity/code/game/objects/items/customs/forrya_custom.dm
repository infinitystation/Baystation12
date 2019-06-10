/obj/item/clothing/accessory/inf_pin/ccapin
	name = "CCA patch"
	desc = "A small patch, decorated with a CCA symbol pattern embroidered with titanium threads. It looks minimalistic, beautiful and strict. "
	icon = 'infinity/icons/obj/clothing/ties.dmi'
	icon_state = "ccapatch"

/obj/item/clothing/accessory/badge/tajamc // non-solgov variant
	name = "DSS-D7"
	desc = "Technological amulet made of titanium, which has a strange glowing crystal inside. On the sides of the amulet engraved information about the owner. Looks extremely durable."
	gender = PLURAL
	icon = 'infinity/icons/obj/clothing/ties.dmi'
	icon_state = "cls"
	badge_string = null
	slot_flags = SLOT_MASK | SLOT_TIE
	var/open = 0
	var/flashlight_max_bright = 0.2 //brightness of light when on, must be no greater than 1.
	var/flashlight_inner_range = 0.1 //inner range of light when on, can be negative
	var/flashlight_outer_range = 1.5 //outer range of light when on, can be negative

/obj/item/weapon/clothingbag/forrya_tajar/Initialize()
	new /obj/item/clothing/accessory/inf_pin/ccapin(src)
	new /obj/item/clothing/accessory/badge/tajamc(src)