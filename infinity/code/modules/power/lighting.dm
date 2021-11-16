/obj/machinery/light
	var/special_broken_chance = 0
	var/sound_id
	var/datum/sound_token/sound_token
	var/_init_bulb_color

/obj/machinery/light/Initialize(mapload, obj/machinery/light_construct/construct)
	. = ..()
	if(istext(_init_bulb_color) && lightbulb)
		lightbulb.set_bulb_color(_init_bulb_color)


/obj/item/light/proc/set_bulb_color(value)
	b_colour = value
	if(istype(loc, /atom/movable))
		loc.update_icon()
	update_icon()
/*TODO
/obj/machinery/light/get_power_usage()
	. = ..()
	if(use_power == POWER_USE_ACTIVE && istype(lightbulb) && (. > 0))
		. *= lightbulb.power_usage_multiplier
		. *= max1(log(lightbulb.b_outer_range)) * max1(log(2, lightbulb.b_inner_range)) * max1(log(10, lightbulb.b_max_bright * 100))
*/

#define UPDATE_ENVIROMENT_SOUND_MACRO_INHERITER(lproc) ##lproc{. = ..(); update_enviroment_sound();}
UPDATE_ENVIROMENT_SOUND_MACRO_INHERITER(/obj/machinery/light/Initialize(mapload, obj/machinery/light_construct/construct))
UPDATE_ENVIROMENT_SOUND_MACRO_INHERITER(/obj/machinery/light/seton(state))
UPDATE_ENVIROMENT_SOUND_MACRO_INHERITER(/obj/machinery/light/broken())
UPDATE_ENVIROMENT_SOUND_MACRO_INHERITER(/obj/machinery/light/fix())
UPDATE_ENVIROMENT_SOUND_MACRO_INHERITER(/obj/machinery/light/insert_bulb(obj/item/light/L))
UPDATE_ENVIROMENT_SOUND_MACRO_INHERITER(/obj/machinery/light/remove_bulb())
#undef UPDATE_ENVIROMENT_SOUND_MACRO_INHERITER

/obj/machinery/light/proc/update_enviroment_sound()
	if(!sound_id)
		sound_id = "[sequential_id("[type]_z[z]")]"
	if(lightbulb?.enviroment_sound && powered() && !lightbulb.status)
		sound_token = GLOB.sound_player.PlayLoopingSound(src, sound_id, lightbulb.enviroment_sound, volume = lightbulb.enviroment_sound_volume, range = lightbulb.enviroment_sound_range, falloff = 3, prefer_mute = TRUE)
	else
		QDEL_NULL(sound_token)

/obj/machinery/light/Destroy()
	QDEL_NULL(sound_token)
	return ..()

/obj/item/light
	var/enviroment_sound
	var/enviroment_sound_range = 3
	var/enviroment_sound_volume = 30

	var/power_usage_multiplier = 1

/obj/item/light/bulb
	power_usage_multiplier = 0.5

/obj/machinery/light/xenon
	light_type = /obj/item/light/xenon

/obj/item/light/xenon
	name = "xenon light tube"
	desc = "A xenon light, really, it's very bright."
	icon_state = "ltube"
	base_state = "ltube"
	item_state = "c_tube"
	matter = list(MATERIAL_GLASS = 100, MATERIAL_ALUMINIUM = 20)
	color = LIGHT_COLOR_XENON
	b_colour = LIGHT_COLOR_XENON
	b_max_bright = 0.95
	b_inner_range = 3
	b_outer_range = 8
	power_usage_multiplier = 3

	enviroment_sound_range = 4
	enviroment_sound = 'infinity/sound/ambience/external/1/neon_hum.ogg'

/obj/machinery/light/outer //works without power sources in area
	on = TRUE

/obj/machinery/light/outer/powered()
	return TRUE

/obj/item/light/led_neon
	name = "neon tube"
	desc = "A LED neon tape."
	matter = list(MATERIAL_GLASS = 100, MATERIAL_ALUMINIUM = 20)
	icon = 'infinity/icons/obj/machinery/neon.dmi'
	icon_state = "big_tape"
	base_state = "big_tape"
	item_state = null

	b_inner_range = 1
	b_outer_range = 2
	b_colour = LIGHT_DEFAULT_LED_NEON

/obj/item/light/led_neon/attackby(obj/item/I, mob/user)
	. = ..()
	if(user)
		if(isMultitool(I))
			var/c = input("You are changing diode frequency.", "Input", b_colour) as color|null
			if(c)
				set_bulb_color(c)

/obj/item/light/led_neon/large
	base_state = "big_tape"
	icon_state = "big_tape_preset"
	b_inner_range = 2
	b_outer_range = 4

/obj/item/light/led_neon/small
	base_state = "small_tape"
	icon_state = "small_tape_preset"

/obj/item/light/led_neon/small/attackby(obj/item/I, mob/user)
	. = ..()
	if(istype(I, type))
		var/turf/T = get_turf(user)
		if(isturf(T))
			user.drop_from_inventory(src, T)
			user.drop_from_inventory(I, T)
			qdel(I)
			qdel(src)
			user.put_in_any_hand_if_possible(new /obj/item/light/led_neon/large(T))

/obj/machinery/light/led
	name = "neon tube"
	desc = "A tape of LEDs. Not actually neon, but THIS is FUTURE."
	light_type = /obj/item/light/led_neon/large
	icon = 'infinity/icons/obj/machinery/neon.dmi'
	icon_state = "tube_maped"
	layer = BELOW_DOOR_LAYER

/obj/machinery/light/led/update_pixels()
	return

/obj/machinery/light/led/small
	name = "small neon tube"
	base_state = "tube_border"
	icon_state = "tube_border_maped"
	light_type = /obj/item/light/led_neon/small

#define INIT_COLOR_PREFAB_OF_LEDNEON(n, colour) /obj/machinery/light/led/##n/_init_bulb_color = colour; /obj/machinery/light/led/small/##n/_init_bulb_color = colour;
INIT_COLOR_PREFAB_OF_LEDNEON(cyan, "#00ffff")
INIT_COLOR_PREFAB_OF_LEDNEON(green, "#00ff00")
INIT_COLOR_PREFAB_OF_LEDNEON(red, "#ff0000")
