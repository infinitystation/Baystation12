/mob/living/carbon/human/key_down(_key, client/user)
	if(_key == "H")
		if(incapacitated())
			return

		var/obj/item/clothing/under/U = w_uniform
		for(var/obj/S in U.accessories)
			if(istype(S, /obj/item/clothing/accessory/storage/holster))
				var/datum/extension/holster/E = get_extension(S, /datum/extension/holster)
				if(!E.holstered)
					if(!get_active_hand())
						to_chat(usr, "<span class='warning'>You're not holding anything to holster.</span>")
						return
					E.holster(get_active_hand(), src)
					return
				else
					E.unholster(src, TRUE)
					return
		if(istype(belt, /obj/item/storage/belt/holster))
			var/obj/item/storage/belt/holster/B = belt
			var/datum/extension/holster/E = get_extension(B, /datum/extension/holster)
			if(!E.holstered)
				if(!get_active_hand())
					to_chat(src, "<span class='warning'>You're not holding anything to holster.</span>")
					return
				E.holster(src.get_active_hand(), src)
				return
			else
				E.unholster(src, TRUE)
				return
	if(client.keys_held["Shift"])
		switch(_key)
			if("E") // Put held thing in belt or take out most recent thing from belt
				quick_equip() // Implementing the storage component is going to take way too long
				return
				// var/obj/item/thing = get_active_hand()
				// var/obj/item/equipped_belt = get_item_by_slot(slot_belt)
				// if(!equipped_belt) // We also let you equip a belt like this
				// 	if(!thing)
				// 		to_chat(user, "<span class='notice'>You have no belt to take something out of.</span>")
				// 		return
				// 	if(equip_to_slot_if_possible(thing, slot_belt))
				// 		update_inv_r_hand()
				// 		update_inv_l_hand()
				// 	return
				// if(!SEND_SIGNAL(equipped_belt, COMSIG_CONTAINS_STORAGE)) // not a storage item
				// 	if(!thing)
				// 		equipped_belt.attack_hand(src)
				// 	else
				// 		to_chat(user, "<span class='notice'>You can't fit anything in.</span>")
				// 	return
				// if(thing) // put thing in belt
				// 	if(!SEND_SIGNAL(equipped_belt, COMSIG_TRY_STORAGE_INSERT, thing, user.mob))
				// 		to_chat(user, "<span class='notice'>You can't fit anything in.</span>")
				// 	return
				// if(!equipped_belt.contents.len) // nothing to take out
				// 	to_chat(user, "<span class='notice'>There's nothing in your belt to take out.</span>")
				// 	return
				// var/obj/item/stored = equipped_belt.contents[equipped_belt.contents.len]
				// if(!stored || stored.on_found(src))
				// 	return
				// stored.attack_hand(src) // take out thing from belt
				// return

			/* if("B") // Put held thing in backpack or take out most recent thing from backpack
				var/obj/item/thing = get_active_hand()
				var/obj/item/equipped_back = get_item_by_slot(slot_back)
				if(!equipped_back) // We also let you equip a backpack like this
					if(!thing)
						to_chat(user, "<span class='notice'>You have no backpack to take something out of.</span>")
						return
					if(equip_to_slot_if_possible(thing, slot_back))
						update_inv_r_hand()
						update_inv_l_hand()
					return
				if(!SEND_SIGNAL(equipped_back, COMSIG_CONTAINS_STORAGE)) // not a storage item
					if(!thing)
						equipped_back.attack_hand(src)
					else
						to_chat(user, "<span class='notice'>You can't fit anything in.</span>")
					return
				if(thing) // put thing in backpack
					if(!SEND_SIGNAL(equipped_back, COMSIG_TRY_STORAGE_INSERT, thing, user.mob))
						to_chat(user, "<span class='notice'>You can't fit anything in.</span>")
					return
				if(!equipped_back.contents.len) // nothing to take out
					to_chat(user, "<span class='notice'>There's nothing in your backpack to take out.</span>")
					return
				var/obj/item/stored = equipped_back.contents[equipped_back.contents.len]
				if(!stored || stored.on_found(src))
					return
				stored.attack_hand(src) // take out thing from backpack
				return */
	return ..()
