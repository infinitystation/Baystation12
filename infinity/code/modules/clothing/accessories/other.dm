/obj/item/clothing/accessory/storage/bandolier/armory/Initialize()
	. = ..()

	for(var/i = 0, i < slots, i++)
		new /obj/item/ammo_casing/shotgun/pellet(hold)

//Sprites from tgstation, specially for Parasoul's custom-item
/obj/item/clothing/accessory/necklace/talisman
	name = "bone talisman"
	desc = "A hunter's talisman, some say the old gods smile on those who wear it."
	icon = CUSTOM_ITEM_OBJ
	accessory_icons = list(slot_w_uniform_str = CUSTOM_ITEM_MOB, slot_wear_suit_str = CUSTOM_ITEM_MOB)
	icon_state = "talisman-4"


//Resomi scarf
/obj/item/clothing/accessory/scarf/resomi
	name = "small mantle"
	desc = "A stylish scarf. The perfect winter accessory for those with a keen fashion sense, and those who just can't handle a cold breeze on their necks."
	icon = 'icons/obj/clothing/infinity/ties.dmi'
	icon_state = "small_mantle"
	species_restricted = list(SPECIES_RESOMI)

/obj/item/clothing/accessory/scarf/red
	name = "red striped scarf"
	icon = 'icons/obj/clothing/infinity/TG_copy/neck.dmi'
	icon_state = "stripedredscarf"
	accessory_icons = list(slot_w_uniform_str = 'infinity/icons/mob/onmob/onmob_accessories.dmi', slot_wear_suit_str = 'infinity/icons/mob/onmob/onmob_accessories.dmi', slot_wear_mask_str  = 'infinity/icons/mob/onmob/onmob_accessories.dmi')
