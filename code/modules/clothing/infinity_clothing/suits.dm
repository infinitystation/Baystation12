/obj/item/clothing/suit/sc_labcoat
	name = "robotic bathrobe"
	desc = "A suit that protects against minor chemical spills."
	icon = 'icons/obj/clothing/infinity/suits.dmi'
	item_icons = list(slot_wear_suit_str = 'icons/mob/infinity/suits.dmi')
	icon_state = "sc_labcoat"
	item_state = "sc_labcoat"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	allowed = list(/obj/item/device/analyzer,/obj/item/stack/medical,/obj/item/weapon/reagent_containers/dropper,/obj/item/weapon/reagent_containers/syringe,/obj/item/weapon/reagent_containers/hypospray,/obj/item/device/healthanalyzer,/obj/item/device/flashlight/pen,/obj/item/weapon/reagent_containers/glass/bottle,/obj/item/weapon/reagent_containers/glass/beaker,/obj/item/weapon/reagent_containers/pill,/obj/item/weapon/storage/pill_bottle,/obj/item/weapon/paper)
	armor = list(melee = 0, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 50, rad = 0)

/obj/item/clothing/suit/storage/toggle/civilian
	name = "black jacket"
	desc = "A black jacket for real white men."
	icon = 'icons/obj/clothing/infinity/suits.dmi'
	item_icons = list(slot_wear_suit_str = 'icons/mob/infinity/suits.dmi')
	icon_state = "black_jacket_o"
	icon_open = "black_jacket_o"
	icon_closed = "black_jacket_c"

/obj/item/clothing/suit/storage/toggle/longjacket
	name = "long jacket"
	desc = "A long gray jacket"
	icon = 'icons/obj/clothing/infinity/suits.dmi'
	item_icons = list(slot_wear_suit_str = 'icons/mob/infinity/suits.dmi')
	icon_state = "longjacket_o"
	icon_open = "longjacket_o"
	icon_closed = "longjacket_c"

/obj/item/clothing/suit/officerdnavyjacket
	name = "officer navy jacket"
	desc = "The utility jacket of the SCG Fleet, made from an insulated materials."
	icon = 'icons/obj/clothing/suits.dmi'
	icon_state = "officerdnavyjacket"
	body_parts_covered = UPPER_TORSO

/obj/item/clothing/suit/storage/hoscoat
	name = "armored trenchcoat"
	desc = "A trenchcoat augmented with a special alloy for some protection and style."
	icon_state = "hostrench"
	item_state = "hostrench"
	armor = list(melee = 65, bullet = 30, laser = 50, energy = 10, bomb = 25, bio = 0, rad = 0)

/obj/item/clothing/suit/storage/tgbomber
	name = "modern bomber jacket"
	desc = "A leather bomber jacket."
	icon = 'icons/obj/clothing/infinity/suits.dmi'
	item_icons = list(slot_wear_suit_str = 'icons/mob/infinity/suits.dmi')
	icon_state = "bomberjacket"
	body_parts_covered = UPPER_TORSO|ARMS
	cold_protection = UPPER_TORSO|ARMS
	min_cold_protection_temperature = T0C - 20

/obj/item/clothing/suit/storage/janjacket
	name = "janitor jacket"
	desc = "A janitor's jacket. Gives unbelivable protection versus depression about your job."
	icon = 'icons/obj/clothing/infinity/suits.dmi'
	item_icons = list(slot_wear_suit_str = 'icons/mob/infinity/suits.dmi')
	icon_state = "janitor_jacket"
	body_parts_covered = UPPER_TORSO|ARMS
	allowed = list(/obj/item/device/flashlight,/obj/item/device/lightreplacer,/obj/item/weapon/storage/bag/trash,/obj/item/weapon/grenade/chem_grenade/cleaner,/obj/item/weapon/reagent_containers/spray/cleaner, /obj/item/weapon/mop, /obj/item/weapon/reagent_containers/glass/bucket)