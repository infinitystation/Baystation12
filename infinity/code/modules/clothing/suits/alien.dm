/obj/item/clothing/suit/storage/toggle/Resomicoat
	 name = "small cloak"
	 icon = 'icons/obj/clothing/infinity/suits.dmi'
	 desc = "A cloak that seems too small to fit a human."
	 icon_state = "resomicoat"
	 item_state = "resomicoat"
	 icon_open = "resomicoat_open"
	 icon_closed = "resomicoat"
	 body_parts_covered = UPPER_TORSO|ARMS|LOWER_TORSO|LEGS
	 species_restricted = list(SPECIES_RESOMI)

/obj/item/clothing/suit/storage/toggle/Resomicoat/white
 	icon_state = "white_resomicoat"
 	item_state = "white_resomicoat"
 	icon_open = "white_resomicoat_open"
 	icon_closed = "white_resomicoat"

/obj/item/clothing/suit/storage/toggle/Resomilabcoat
	name = "small labcoat"
	icon = 'icons/obj/clothing/infinity/suits.dmi'
	desc = "A labcoat that seems too small to fit a human."
	icon_state = "resomi_labcoat"
	item_state = "resomi_labcoat"
	icon_open = "resomi_labcoat_open"
	icon_closed = "resomi_labcoat"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS
	species_restricted = list(SPECIES_RESOMI)
	allowed = list(/obj/item/device/analyzer,/obj/item/stack/medical,/obj/item/weapon/reagent_containers/dropper,/obj/item/weapon/reagent_containers/syringe,/obj/item/weapon/reagent_containers/hypospray,/obj/item/device/healthanalyzer,/obj/item/device/flashlight/pen,/obj/item/weapon/reagent_containers/glass/bottle,/obj/item/weapon/reagent_containers/glass/beaker,/obj/item/weapon/reagent_containers/pill,/obj/item/weapon/storage/pill_bottle,/obj/item/weapon/paper)
	armor = list(melee = 0, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 50, rad = 0)