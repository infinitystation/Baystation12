// Bitmasks for the flags_inv variable. These determine when a piece of clothing hides another, i.e. a helmet hiding glasses.
// WARNING: The following flags apply only to the back!
#define BACKOVERHEAD		(1<<1)

/obj/item/storage/backpack/industrial/anime_coffin
	name = "coffin"
	desc = "This coffin has webbing."
	icon = 'infinity/icons/obj/storage.dmi'
	item_icons = list(slot_back_str = 'infinity/icons/mob/onmob/onmob_back.dmi')
	item_state_slots = list()
	icon_state = "anime_coffin"
	item_state = "anime_coffin"
	w_class = ITEM_SIZE_HUGE

	flags_inv = BACKOVERHEAD

/obj/item/proc/backOverHead_handler(var/obj/me, var/mob/living/carbon/human/remover)
	remover.update_inv_head()
	GLOB.item_unequipped_event.unregister(remover, src, /obj/item/proc/backOverHead_handler)

/mob/living/carbon/human/update_inv_head(var/update_icons=1)
	..(update_icons)
	if(back && (back.flags_inv & BACKOVERHEAD))
		var/icon/back_image = icon(back.item_icons[slot_back_str], back.item_state)
		back_image.Insert(species.icon_template, "", SOUTH)
		back_image.Insert(species.icon_template, "", WEST)
		back_image.Insert(species.icon_template, "", EAST)
		var/image/head = overlays_standing[22]
		if(head == null)
			head = image(back_image)
		else
			head.overlays |= back_image
		overlays_standing[22] = head

/mob/living/carbon/human/update_inv_back(var/update_icons=1)
	..(update_icons)
	if(back && (back.flags_inv & BACKOVERHEAD))
		GLOB.item_unequipped_event.register(back, src, /obj/item/proc/backOverHead_handler)
		var/icon/back_image = icon(back.item_icons[slot_back_str], back.item_state)
		back_image.Insert(species.icon_template, "", SOUTH)
		back_image.Insert(species.icon_template, "", WEST)
		back_image.Insert(species.icon_template, "", EAST)
		var/image/head = overlays_standing[22]
		if(head == null)
			head = image(back_image)
		else
			head.overlays |= back_image
		overlays_standing[22] = head
