/obj/item/clothing/under/hooded
	var/obj/item/clothing/head/hood
	var/hoodtype = null
	var/suittoggled = 0

/obj/item/clothing/under/hooded/New()
	MakeHood()
	..()

/obj/item/clothing/under/hooded/Destroy()
	QDEL_NULL(hood)
	return ..()

/obj/item/clothing/under/hooded/proc/MakeHood()
	if(!hood)
		hood = new hoodtype(src)

/obj/item/clothing/under/hooded/ui_action_click()
	ToggleHood()

/obj/item/clothing/under/hooded/equipped(mob/user, slot)
	if(slot != slot_w_uniform)
		RemoveHood()
	..()

/obj/item/clothing/under/hooded/proc/RemoveHood()
	if(!hood)
		return
	suittoggled = 0
	update_icon()
	if(ishuman(hood.loc))
		var/mob/living/carbon/H = hood.loc
		H.drop_from_inventory(hood)
		H.update_inv_wear_suit()
	hood.forceMove(src)

/obj/item/clothing/under/hooded/dropped()
	RemoveHood()

/obj/item/clothing/under/hooded/proc/ToggleHood()
	if(!suittoggled)
		if(ishuman(loc))
			var/mob/living/carbon/human/H = src.loc
			if(H.w_uniform != src)
				to_chat(H, SPAN_WARNING("You must be wearing \the [src] to put up the hood!"))
				return
			if(H.head)
				to_chat(H, SPAN_WARNING("You're already wearing something on your head!"))
				return
			else
				H.equip_to_slot_if_possible(hood,slot_head,0,0,1)
				suittoggled = 1
				hood.icon_state = "[icon_state]_hood"
				hood.item_state = "[item_state]_hood"
				update_icon()
				H.update_inv_wear_suit()
	else
		RemoveHood()

/obj/item/clothing/under/hooded/on_update_icon()
	if(suittoggled)
		icon_state = "[initial(icon_state)]_t"
	else
		icon_state = "[initial(icon_state)]"
