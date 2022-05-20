// This code allows players to store items in pots with plants.
//
// Pots with plants have two variables:
// can_store_item - a boolean variable that determines whether a pot can hide an object in itself
// stored_item - the variable that is responsible for the object hidden in the pot.
//
// ported from Aurorastation
//
// by SidVeld


/obj/structure/flora/pottedplant
	var/can_store_item = TRUE
	var/obj/item/stored_item


/obj/structure/flora/pottedplant/Destroy()
	QDEL_NULL(stored_item)
	return ..()


/obj/structure/flora/pottedplant/attackby(obj/item/object, mob/user)

	// Can this pot store items?
	if (can_store_item)
		user.visible_message(
			"[user] begins digging around inside of \the [src].",
			"You begin digging around in \the [src], trying to hide \the [object]."
		)

		if (do_after(user, 20, src))

			// Is there a hidden object in the pot?
			if (!stored_item)

				// Is it too big an object we want to hide?
				if (object.w_class <= ITEM_SIZE_NORMAL)
					user.drop_from_inventory(object)
					object.forceMove(src)
					stored_item = object
					to_chat(user, SPAN_NOTICE("You hide \the [object] in [src]."))
					return
				else
					to_chat(user, SPAN_NOTICE("The [object] can't be hidden in [src], it's too big."))
					return

			else
				to_chat(user, SPAN_NOTICE("There is something hidden in [src]."))
				return

	return ..()


/obj/structure/flora/pottedplant/attack_hand(mob/user)

	// Can this pot store items?
	if (can_store_item)
		user.visible_message(
			"[user] begins digging around inside of \the [src].",
			"You begin digging around in \the [src], searching it."
		)

		if (do_after(user, 40, src))
			if(!stored_item)
				to_chat(user, SPAN_NOTICE("There is nothing hidden in [src]."))
				return
			else
				user.put_in_hands(stored_item)
				stored_item = null
				to_chat(user, SPAN_NOTICE("You take \the [stored_item] from [src]."))
				return


// This plants can't store items - they are too small
/obj/structure/flora/pottedplant/smallcactus
	can_store_item = FALSE

/obj/structure/flora/pottedplant/small
	can_store_item = FALSE

/obj/structure/flora/pottedplant/shoot
	can_store_item = FALSE

/obj/structure/flora/pottedplant/deskleaf
	can_store_item = FALSE

/obj/structure/flora/pottedplant/deskferntrim
	can_store_item = FALSE
