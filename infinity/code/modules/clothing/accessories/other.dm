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

/obj/item/clothing/accessory/scarf/red
	name = "red striped scarf"
	icon = 'infinity/icons/obj/clothing/TG_copy/neck.dmi'
	icon_state = "stripedredscarf"
	accessory_icons = list(slot_w_uniform_str = 'infinity/icons/mob/onmob/onmob_accessories.dmi', slot_wear_suit_str = 'infinity/icons/mob/onmob/onmob_accessories.dmi', slot_wear_mask_str  = 'infinity/icons/mob/onmob/onmob_accessories.dmi')

/obj/item/clothing/accessory/scarf/tajmask
	name = "tua-tari scarf"
	icon = 'infinity/icons/obj/clothing/obj_accessories.dmi'
	icon_state = "tajmask"
	accessory_icons = list(slot_w_uniform_str = 'infinity/icons/mob/onmob/onmob_accessories.dmi', slot_wear_suit_str = 'infinity/icons/mob/onmob/onmob_accessories.dmi', slot_wear_mask_str  = 'infinity/icons/mob/onmob/onmob_accessories.dmi')
	body_parts_covered = FACE
	item_flags = ITEM_FLAG_FLEXIBLEMATERIAL
	species_restricted = list(SPECIES_TAJARA)
	slot_flags = SLOT_MASK | SLOT_TIE

/obj/item/clothing/accessory/scarf/tajmask/Initialize()
	. = ..()
	icon_state = "tajmask"
	color = get_random_colour()
	update_icon()

/obj/item/clothing/accessory/scarf/tajmask/verb/change_color()
	set name = "Change Scarf Color"
	set category = "Object"
	set desc = "Change the color of the scarf."
	set src in usr

	if(usr.incapacitated())
		return

	var/new_color = input(usr, "Pick a new color", "Scarf Color", color) as color|null
	if(!new_color || new_color == color || usr.incapacitated())
		return
	color = new_color

/obj/item/clothing/accessory/scarf/tajmask/attack_self(mob/user)
	var/obj/item/clothing/accessory/scarf/tajmask/tjmsk = new /obj/item/clothing/accessory/scarf/tajneck
	to_chat(user, "<span class='notice'>You shake up your [src].</span>")
	qdel(src)
	user.put_in_active_hand(tjmsk)

/obj/item/clothing/accessory/scarf/tajneck
	name = "tua-tari scarf"
	icon = 'infinity/icons/obj/clothing/obj_accessories.dmi'
	icon_state = "tajneck"
	accessory_icons = list(slot_w_uniform_str = 'infinity/icons/mob/onmob/onmob_accessories.dmi', slot_wear_suit_str = 'infinity/icons/mob/onmob/onmob_accessories.dmi', slot_wear_mask_str  = 'infinity/icons/mob/onmob/onmob_accessories.dmi')
	slot_flags = SLOT_MASK | SLOT_TIE

/obj/item/clothing/accessory/scarf/tajneck/Initialize()
	. = ..()
	icon_state = "tajneck"
	color = get_random_colour()
	update_icon()

/obj/item/clothing/accessory/scarf/tajneck/attack_self(mob/user)
	var/obj/item/clothing/accessory/scarf/tajneck/tjnk = new /obj/item/clothing/accessory/scarf/tajmask
	to_chat(user, "<span class='notice'>You shake up your [src].</span>")
	qdel(src)
	user.put_in_active_hand(tjnk)

/obj/item/clothing/accessory/scarf/tajneck/verb/change_color()
	set name = "Change Scarf Color"
	set category = "Object"
	set desc = "Change the color of the scarf."
	set src in usr

	if(usr.incapacitated())
		return

	var/new_color = input(usr, "Pick a new color", "Scarf Color", color) as color|null
	if(!new_color || new_color == color || usr.incapacitated())
		return
	color = new_color