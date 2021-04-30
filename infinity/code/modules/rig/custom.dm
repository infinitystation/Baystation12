//~Elar desu
GLOBAL_LIST_INIT(customizable_parts_of_rig, list("helmet", "chest", "gloves", "boots"))
/* Take care that this strings equal to names of
/obj/item/weapon/rig/var/obj/item/clothing/shoes/boots
/obj/item/weapon/rig/var/obj/item/clothing/shoes/gloves
/obj/item/weapon/rig/var/obj/item/clothing/shoes/chest
/obj/item/weapon/rig/var/obj/item/clothing/shoes/helmet
*/
/obj/item/weapon/rig
	var/list/piece_icon_state_overrides //Example: list("helmet" = "dude_junior_helmet")
/obj/item/weapon/rig/inherit_custom_item_data(var/datum/custom_item/citem)
	. = ..()
	if(length(citem.additional_data))
		if(citem.additional_data.Find("piece_icon_state_overrides"))
			piece_icon_state_overrides = citem.additional_data["piece_icon_state_overrides"]
		for(var/item in GLOB.customizable_parts_of_rig)
			if(vars.Find(item) && citem.additional_data.Find(item))
				var/obj/item/i = vars[item]
				i.init_custom_icon_file()
				var/list/custom_packet = citem.additional_data[item]
				for(var/variableToIterate in custom_packet)
					if(i.vars.Find(variableToIterate))
						i.vars[variableToIterate] = custom_packet[variableToIterate]
					else
						log_error("[citem.ckey]>[citem.character_name]>[citem.item_path]{[citem.item_name]}. Tried to assign unexisting variable ([i] = [custom_packet[i]]) of [i.type]. Please check JSON packet of item.")
				i.update_icon()
