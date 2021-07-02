/obj/item/clothing/gloves/verb/toggle_layer()
	set name = "Switch Gloves Layer"
	set category = "Object"

	use_alt_layer = !use_alt_layer
	update_icon()

/obj/item/clothing/under/inherit_custom_item_data(var/datum/custom_item/citem)
	. = ..()
	if(list_find(citem.additional_data, "rolled_down") && citem.additional_data["rolled_down"])
		verbs |= /obj/item/clothing/under/verb/rollsuit
	if(list_find(citem.additional_data, "rolled_sleeves") && citem.additional_data["rolled_sleeves"])
		verbs |= /obj/item/clothing/under/verb/rollsleeves
	if(worn_state)
		if(!item_state_slots)
			item_state_slots = list()
		item_state_slots[slot_w_uniform_str] = worn_state
	else
		worn_state = icon_state
