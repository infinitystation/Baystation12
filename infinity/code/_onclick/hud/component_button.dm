/obj/screen/proc/component_click(obj/screen/component_button/component, params)
	return

/obj/screen/component_button
	var/obj/screen/parent

/obj/screen/component_button/Initialize(mapload, obj/screen/parent)
	. = ..()
	src.parent = parent

/obj/screen/component_button/Click(params)
	if(parent)
		parent.component_click(src, params)