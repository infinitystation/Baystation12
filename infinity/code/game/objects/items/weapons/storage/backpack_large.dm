// Bitmasks for the flags_inv variable. These determine when a piece of clothing hides another, i.e. a helmet hiding glasses.
// WARNING: The following flags apply only to the back!
#define BACKOVERHEAD		0x1

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

/obj/item/equipped(var/mob/living/carbon/human/user, var/slot)
	. = ..()
	if(slot == slot_back && slot_flags & SLOT_BACK && flags_inv & BACKOVERHEAD)
		GLOB.item_unequipped_event.register(src, user, /mob/living/carbon/human/proc/backOverHead_handler)
		user.update_inv_head()

/mob/living/carbon/human/proc/backOverHead_handler(var/obj/me)
	update_inv_head()
	GLOB.item_unequipped_event.unregister(me, src, /mob/living/carbon/human/proc/backOverHead_handler)

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
