/mob/living/carbon/human/proc/implant_head(var/datum/gear/G = new/datum/gear/utility/implanth)
	var/obj/item/weapon/implant/I = new G.path(src)
	I.imp_in = src
	I.implanted = 1
	var/obj/item/organ/external/affected = src.organs_by_name[BP_HEAD]
	affected.implants += I
	I.part = affected
	I.implanted(src)

/mob/living/carbon/human/proc/implant_chest(var/datum/gear/G = new/datum/gear/utility/implantc)
	var/obj/item/weapon/implant/I = new G.path(src)
	I.imp_in = src
	I.implanted = 1
	var/obj/item/organ/external/affected = src.organs_by_name[BP_CHEST]
	affected.implants += I
	I.part = affected
	I.implanted(src)

/obj/item/weapon/implant/collector
	name = "S'rri-Va'a implant"
	desc = "It looks like a strange tiny fish net made of an unknown metal, with strange tiny crystals or something on it."
	icon = 'infinity/icons/obj/items.dmi'
	icon_state = "collector"
	w_class = ITEM_SIZE_TINY
	known = 1

/obj/item/weapon/implant/holder
	name = "S'D-S'rri implant"
	desc = "A small the easy, but heavy device incomprehensible purpose. It has embossed CСA emblems on the sides of the device."
	icon = 'infinity/icons/obj/items.dmi'
	icon_state = "holder"
	w_class = ITEM_SIZE_TINY
	known = 1

/obj/item/weapon/implant/holder/transholder
	icon_state = "transholder"
