/obj/item/photo/inherit_custom_item_data(datum/custom_item/citem)
	. = ..()
	if(list_find(citem.additional_data, "photo_path"))
		img = icon(citem.additional_data["photo_path"])
		sprite_offset = citem.additional_data["sprite_offset"]
		prewiew_scale = citem.additional_data["prewiew_scale"]
		update_icon()
