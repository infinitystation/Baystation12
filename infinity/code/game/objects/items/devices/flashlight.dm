/obj/item/device/flashlight
	var/suitable_cell = /obj/item/cell/device/standard
	var/obj/item/cell/cell
	var/power_cost = 0.2

/obj/item/device/flashlight/lamp/floodlamp
	power_cost = 1
/obj/item/device/flashlight/lamp
	power_cost = 0.2
/obj/item/device/flashlight/lamp/lava
	on = 1

/obj/item/device/flashlight/upgraded
	cell = /obj/item/cell/device/high
/obj/item/device/flashlight/maglight
	cell = /obj/item/cell/device/high
/obj/item/device/flashlight/lantern
	cell = /obj/item/cell/device/high//inf
/obj/item/device/flashlight/drone
	suitable_cell = null

/obj/item/device/flashlight/flare
	suitable_cell = null

/obj/item/device/flashlight/Initialize()
	. = ..()
	if(!ispath(cell) && ispath(suitable_cell))
		cell = new suitable_cell(src)
	else if(ispath(cell))
		suitable_cell = cell
		cell = new cell()

/obj/item/device/flashlight/get_cell()
	return cell

/obj/item/device/flashlight/proc/get_power_cost()
	return power_cost * flashlight_max_bright / 2

/obj/item/device/flashlight/Process()
	if(on && suitable_cell)
		var/obj/item/cell/C = get_cell()
		if(!C || !C.checked_use(get_power_cost()))
			if(ismob(loc))
				to_chat(loc, SPAN_WARNING("\The [src] dies. You are alone now."))
			turn_off()
		else if (cell.percent() <= 33)
			apply_power_deficiency()

/obj/item/device/flashlight/proc/apply_power_deficiency()
	var/obj/item/cell/C = get_cell()
	if(!C)
		return
	if(flashlight_max_bright > 0)
		set_light(clamp(flashlight_max_bright / 2 * max(log(rand(4,6), C.percent()), flashlight_max_bright / 8), 0, 1), flashlight_inner_range, flashlight_outer_range, 2, light_color)

/obj/item/device/flashlight/proc/turn_off()
	on = FALSE
	set_light(0)
	STOP_PROCESSING(SSobj, src)//inf
	update_icon()

/obj/item/device/flashlight/MouseDrop(over_object)
	if(istype(over_object, /obj/screen/inventory))
		if(ismob(usr))
			var/mob/user = usr
			var/obj/screen/inventory/hand = over_object
			if(!user.stat && hand.name && (loc == user) && eject_item(cell, user))
				turn_off()
				cell = null
	else
		return ..()

/obj/item/device/flashlight/attackby(obj/item/C, mob/living/user)
	if(istype(C, suitable_cell) && !cell && insert_item(C, user))
		cell = C
