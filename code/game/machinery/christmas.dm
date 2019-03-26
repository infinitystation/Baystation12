/obj/machinery/xmaslights
	name = "xmas lights"
	desc = "You can see a small button on it's plastic branch and a label near it - ON/OFF."
	icon = 'icons/obj/christmas_inf.dmi'
	icon_state = "xmaslights_off"
	anchored = 1
	plane = BLOB_PLANE
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
	desc = "This is a tiny well lit decorative christmas tree. You can see a small button on it's pot and a label near it - ON/OFF"
	icon = 'icons/obj/christmas_inf.dmi'
	icon_state = "plant-xmas"
	use_power = 1
	idle_power_usage = 1
	active_power_usage = 4
	plane = ABOVE_HUMAN_PLANE
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
	icon = 'icons/obj/christmas_inf.dmi'
	icon_state = "doorwreath"
	mouse_opacity = 0
	plane = BLOB_PLANE
	layer = BLOB_SHIELD_LAYER

/obj/structure/sign/tinsel
	name = "tinsel"
	desc = "A decorative flourish, the socity often calls them tinsels."
	icon = 'icons/obj/christmas_inf.dmi'
	icon_state = "tinsel1"
	mouse_opacity = 0
	plane = BLOB_PLANE
	layer = BLOB_SHIELD_LAYER
	color = "#5662ff"

/obj/structure/sign/tinsel/red
	color = COLOR_RED_LIGHT

/obj/structure/sign/tinsel/cyan
	color = "#80e1ff"

/obj/structure/sign/tinsel/green
	color = "#56f25f"

/obj/structure/sign/tinsel/yellow
	color = COLOR_YELLOW

/obj/structure/sign/tinsel/purple
	color = "#e37dff"

/obj/structure/sign/tinsel/lorange
	color = "#ffef63"

/obj/structure/sign/tinsel/gold
	color = "#ffff00"

/obj/structure/sign/tinsel/random
	color = null

/obj/structure/sign/tinsel/random/New()
	..()
	color = pick(COLOR_YELLOW, "#56f25f", COLOR_RED_LIGHT, "#5662ff", "#e37dff", "#80e1ff", "#ffef63", "#ffff00")

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
