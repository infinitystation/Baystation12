/obj/item
	var/base_icon_state
/obj/item/Initialize()
	base_icon_state = icon_state
	. = ..()
