/obj/item/clothing/head/gentle_cap
	name = "peaked cap"
	desc = "It's a peaked cap, designed and created by TX Fabrication Corp."
	icon = 'icons/infinity_custom_items_obj.dmi'
	icon_state = "gentle_cap" 
	item_state = "gentle_cap" 
	item_icons = list(slot_head_str = 'icons/infinity_custom_items_mob.dmi')

/obj/item/clothing/suit/storage/gentle_suit
	name = "black trenchcoat"
	desc = "A rugged canvas trenchcoat, designed and created by TX Fabrication Corp. The coat is externally impact resistant - perfect for your next act of autodefenestration!"
	icon = 'icons/infinity_custom_items_obj.dmi'
	icon_state = "gentle_suit"
	item_state = "gentle_suit"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	item_icons = list(slot_wear_suit_str = 'icons/infinity_custom_items_mob.dmi')

/obj/item/clothing/under/gentle_under
	name = "gentleman suit"
	desc = "A gentleman suit, designed and created by TX Fabrication Corp."
	icon = 'icons/infinity_custom_items_obj.dmi'
	icon_state = "gentle_under"
	item_state = "gentle_under"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	item_icons = list(slot_w_uniform_str = 'icons/infinity_custom_items_mob.dmi')

/obj/item/weapon/clothingbag/gentle_set
	New()
		new/obj/item/clothing/under/gentle_under(src)
		new/obj/item/clothing/head/gentle_cap(src)
		new/obj/item/clothing/suit/storage/gentle_suit(src)
