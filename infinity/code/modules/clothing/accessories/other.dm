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
	item_icons = list(slot_wear_mask_str = 'infinity/icons/mob/onmob/onmob_accessories.dmi')
	icon_state = "talisman-4"

/obj/item/clothing/accessory/scarf/red
	name = "red striped scarf"
	icon = 'infinity/icons/obj/clothing/TG_copy/neck.dmi'
	icon_state = "stripedredscarf"
	accessory_icons = list(slot_w_uniform_str = 'infinity/icons/mob/onmob/onmob_accessories.dmi', slot_wear_suit_str = 'infinity/icons/mob/onmob/onmob_accessories.dmi')
	item_icons = list(slot_wear_mask_str = 'infinity/icons/mob/onmob/onmob_accessories.dmi')

/obj/item/clothing/accessory/scarf/tajaran
	name = "tua-tari scarf"
	desc = "A light and soft scarf, very long and wide. You also may rise it to hide your person..."
	icon = 'infinity/icons/obj/clothing/obj_accessories.dmi'
	icon_state = "tajneck"
	accessory_icons = list(slot_w_uniform_str = 'infinity/icons/mob/onmob/onmob_accessories.dmi', slot_wear_suit_str = 'infinity/icons/mob/onmob/onmob_accessories.dmi')
	item_icons = list(slot_wear_mask_str = 'infinity/icons/mob/onmob/onmob_accessories.dmi')
	body_parts_covered = 0
	item_flags = ITEM_FLAG_FLEXIBLEMATERIAL
//	species_restricted = list(SPECIES_TAJARA)
	slot_flags = SLOT_MASK | SLOT_TIE
	var/lowered_icon_state = "tajneck"
	var/rised_icon_state = "tajmask"

/obj/item/clothing/accessory/scarf/tajaran/attack_self(mob/user)
	if(body_parts_covered >= FACE)
		body_parts_covered &= ~FACE
		icon_state = lowered_icon_state
		to_chat(user, SPAN_NOTICE("You lowered your scarf."))
	else
		body_parts_covered |= FACE
		icon_state = rised_icon_state
		to_chat(user, SPAN_NOTICE("You rised your scarf. Let's rrrobe someone!"))
