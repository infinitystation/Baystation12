/obj/item/clothing/under/zonesweeater
	name = "purple sweater"
	desc = "Dark-purple stockings and purple off-the-shoulder sweater with skull picture in its center."
	icon = 'icons/infinity_custom_items_obj.dmi'
	item_icons = list(slot_w_uniform_str = 'icons/infinity_custom_items_mob.dmi')
	icon_state = "kosteg_suit"
	item_state = "kosteg_suit"
	rolled_sleeves = -1

/obj/item/clothing/shoes/zoneboots
	name = "go-go boots"
	desc = "A pair of dark-purple go-go boots, perfect for every occasion, from working in a bar to fighting off tentacles, if you somehow manage to find yourself in such situation."
	icon = 'icons/infinity_custom_items_obj.dmi'
	item_icons = list(slot_shoes_str = 'icons/infinity_custom_items_mob.dmi')
	icon_state = "kosteg_boots"
	item_state = "kosteg_boots"

/obj/item/clothing/accessory/zonehairclip
	name = "skull hairclip"
	desc = "A skull shaped hairclip, ‘nuff said."
	icon = 'icons/infinity_custom_items_obj.dmi'
	accessory_icons = list(slot_w_uniform_str = 'icons/infinity_custom_items_mob.dmi')
	item_icons = list(slot_r_ear_str = 'icons/infinity_custom_items_mob.dmi', slot_l_ear_str  = 'icons/infinity_custom_items_mob.dmi')
	icon_state = "kosteg_mask"
	item_state = "kosteg_mask"
	slot_flags = SLOT_EARS | SLOT_TIE

/obj/item/weapon/clothingbag/zone
	New()
		new /obj/item/clothing/under/zonesweeater(src)
		new /obj/item/clothing/shoes/zoneboots(src)
		new /obj/item/clothing/accessory/zonehairclip(src)