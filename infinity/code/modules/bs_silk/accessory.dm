/obj/item/clothing/accessory/bs_silk
	name = "bluespace snare"
	desc = "A bluespace snare. Looking at the edges of this thing, you see a faint blue ripple and spatial distortion."
	icon = 'icons/obj/rig_modules.dmi'
	icon_state = "teleporter"
	w_class = ITEM_SIZE_SMALL
	origin_tech = list(TECH_BLUESPACE = 6)
	var/id_tag = ""

/obj/item/clothing/accessory/bs_silk/New()
	. = ..()
	matter = list(MATERIAL_STEEL = 8, MATERIAL_GLASS = 5, MATERIAL_SILVER = 10)

/obj/item/clothing/accessory/bs_silk/attackby(obj/item/I, mob/user)
	if(isMultitool(I))
		var/input_id = input("Enter new BS Snare ID", "Snare ID", id_tag)
		id_tag = input_id
		return

/obj/item/clothing/accessory/bs_silk/examine()
	..()
	to_chat(usr, "<br>On small display you can notice label that mean: \"DEVICE ID: <b>[id_tag ? id_tag : "NOT SETTED"]</b>\".")
