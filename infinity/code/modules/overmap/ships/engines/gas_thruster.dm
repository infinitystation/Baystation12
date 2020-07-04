/obj/machinery/atmospherics/unary/engine/attackby(obj/item/I, mob/user)
	if(get_turf(user) != get_step(src, dir))
		to_chat(user, SPAN_WARNING("You cannot work with [src] while you not in front of its primary side."))
		return
	. = ..()
