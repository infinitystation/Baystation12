/obj/item/clothing/accessory/bs_silk
	name = "bluespace snare"
	desc = "A bluespace snare. Looking at the edges of this thing, you see a faint blue ripple and distortion of space."
	icon = 'infinity/icons/obj/clothing/obj_accessories.dmi'
	icon_state = "bs_silk"
	slot_flags = SLOT_TIE
	w_class = ITEM_SIZE_SMALL
	origin_tech = list(TECH_BLUESPACE = 6)

	var/obj/machinery/bssilk_hub/silk_hub
	var/locking_access = access_rd
	var/silk_id = "" //using by snare controller to teleport user to controller's mark

/obj/item/clothing/accessory/bs_silk/proc/toggle_lock()
	removable = !removable

/obj/item/clothing/accessory/bs_silk/attackby(obj/item/I, mob/user)
	if(isMultitool(I))
		var/input_id = input("Enter new BS Snare ID", "Snare ID", silk_id)
		silk_id = input_id
		silk_hub = null
		return

	if(istype(I, /obj/item/weapon/card/id))
		var/obj/item/weapon/card/id/ID = I
		if(locking_access in ID.GetAccess())
			toggle_lock()
			var/isLocked = removable ? "unlocked and can be removed." : "locked and can\'t be removed."
			to_chat(user, SPAN_NOTICE("You toggle lock of [src.name]. Now it is [isLocked]"))
		else
			to_chat(user, SPAN_WARNING("ERROR: Incorrect access."))

/obj/item/clothing/accessory/bs_silk/examine()
	..()
	var/s_id = silk_id != "" ? silk_id : "NOT SETTED"
	to_chat(usr, "<br>On small display you can notice label that mean: \"DEVICE ID: [s_id]\".")
	to_chat(usr, "<br>It[removable ? " can be removed" : "\'s locked by access: " + locking_access].")

/obj/item/clothing/accessory/bs_silk/on_removed()
	..()
	silk_hub.linked_mob = null
	silk_hub = null
