/obj/machinery/xmaslights
	name = "xmas lights"
	desc = "A small button on this plastic branch and a label near it - ON/OFF."
	icon = 'infinity/icons/obj/christmas.dmi'
	icon_state = "xmaslights_off"
	anchored = TRUE
	layer = BLOB_SHIELD_LAYER
	use_power = 1
	idle_power_usage = 1
	active_power_usage = 4
	power_channel = LIGHT
	var/on = 1

/obj/machinery/xmaslights/New()
	activate()

/obj/machinery/xmaslights/attack_hand(mob/user)
	on = !on
	activate()
	user.visible_message("[user] turns [on ? "on" : "off"] \the [src].", "You turn [on ? "on" : "off"] \the [src]!")

/obj/machinery/xmaslights/proc/activate()
	if(powered())
		if(on)
			use_power = 1
			set_light(0.4, 0.1, 2, 2, "#ff6633")
		else
			use_power = 0
			set_light(0)

	update_icon()
	active_power_usage = ((light_outer_range * light_max_bright) * 15)

/obj/machinery/xmaslights/power_change()
	. = ..()
	activate()


/obj/machinery/xmaslights/on_update_icon()
	pixel_y = 0
	pixel_x = 0
	switch(dir)
		if(NORTH)	pixel_y = 22
		if(EAST)	pixel_x = 11
		if(WEST)	pixel_x = -11

	if(on && powered())
		icon_state = "xmaslights"
	else
		icon_state = "xmaslights_off"
		set_light(0)

// christmas plant //

/obj/machinery/xmas_plant //yeah, it consumes power.
	name = "small christmas tree"
	desc = "A tiny well lit decorative christmas tree. A small button on its pot and a label near it - ON/OFF"
	icon = 'infinity/icons/obj/christmas.dmi'
	icon_state = "plant-xmas"
	use_power = 1
	idle_power_usage = 1
	active_power_usage = 4
	layer = ABOVE_HUMAN_LAYER
	power_channel = LIGHT
	var/on = 1

/obj/machinery/xmas_plant/New()
	activate()

/obj/machinery/xmas_plant/Move()
	..()
	activate()

/obj/machinery/xmas_plant/attack_hand(mob/user)
	on = !on
	activate()
	user.visible_message("[user] turns [on ? "on" : "off"] \the [src].", "You turn [on ? "on" : "off"] \the [src].")

/obj/machinery/xmas_plant/proc/activate()
	if(powered())
		if(on)
			use_power = 1
			set_light(0.4, 0.1, 2, 2, "#ff6633")
		else
			use_power = 0
			set_light(0)

	update_icon()
	active_power_usage = ((light_outer_range * light_max_bright) * 15)

/obj/machinery/xmas_plant/on_update_icon()
	if(on && powered())
		icon_state = "plant-xmas"
	else
		icon_state = "plant-xmas-off"
		set_light(0)

/obj/machinery/xmas_plant/power_change()
	. = ..()
	activate()

//decor

/obj/structure/sign/doorwreath
	name = "door wreath"
	desc = "A decorative flourish. The rounds are too narrow, a head won't fit."
	icon = 'infinity/icons/obj/christmas.dmi'
	icon_state = "doorwreath"
	mouse_opacity = 0
	layer = BLOB_SHIELD_LAYER

/obj/structure/sign/tinsel
	name = "tinsel"
	desc = "A decorative flourish. The socity often calls them tinsels."
	icon = 'infinity/icons/obj/christmas.dmi'
	icon_state = "tinsel1"
	mouse_opacity = 0
	layer = BLOB_SHIELD_LAYER

/obj/structure/sign/tinsel/New()
	..()
	if(!color)
		color = pick(COLOR_RED_LIGHT, COLOR_YELLOW, TINSEL_COLOR_TIN, TINSEL_COLOR_GREEN, TINSEL_COLOR_BLUE, TINSEL_COLOR_PURPLE, TINSEL_COLOR_CYAN, TINSEL_COLOR_LORANGE, TINSEL_COLOR_GOLD)

#define CREATE_TINSEL_PREFAB(p_name, p_color)\
/obj/structure/sign/tinsel/##p_name/color = p_color;\
/obj/random/date_based/christmas/tinsel/##p_name/name = #p_name + " xmas tinsel";\
/obj/random/date_based/christmas/tinsel/##p_name/spawn_choices() return list(/obj/structure/sign/tinsel/##p_name)

CREATE_TINSEL_PREFAB(red, COLOR_RED_LIGHT)
CREATE_TINSEL_PREFAB(cyan, TINSEL_COLOR_CYAN)
CREATE_TINSEL_PREFAB(green, TINSEL_COLOR_GREEN)
CREATE_TINSEL_PREFAB(yellow, COLOR_YELLOW)
CREATE_TINSEL_PREFAB(purple, TINSEL_COLOR_PURPLE)
CREATE_TINSEL_PREFAB(lorange, TINSEL_COLOR_LORANGE)
CREATE_TINSEL_PREFAB(gold, TINSEL_COLOR_GOLD)
CREATE_TINSEL_PREFAB(blue, TINSEL_COLOR_BLUE)
CREATE_TINSEL_PREFAB(tin, TINSEL_COLOR_TIN)

/obj/structure/sign/tinsel/New()
	..()
	update_icon()
	icon_state = "tinsel[rand(1,5)]"

/obj/structure/sign/tinsel/on_update_icon()
	pixel_y = 0
	pixel_x = 0
	switch(dir)
		if(NORTH)	pixel_y = 22
		if(EAST)	pixel_x = 11
		if(WEST)	pixel_x = -11
