/obj/machinery/light
	var/special_broken_chance = 0
	var/sound_id
	var/datum/sound_token/sound_token

#define UPDATE_ENVIROMENT_SOUND_MACRO_INHERITER(lproc) ##lproc{ . = ..(); update_enviroment_sound();}
UPDATE_ENVIROMENT_SOUND_MACRO_INHERITER(/obj/machinery/light/Initialize(mapload, obj/machinery/light_construct/construct))
UPDATE_ENVIROMENT_SOUND_MACRO_INHERITER(/obj/machinery/light/seton(state))
UPDATE_ENVIROMENT_SOUND_MACRO_INHERITER(/obj/machinery/light/broken())
UPDATE_ENVIROMENT_SOUND_MACRO_INHERITER(/obj/machinery/light/fix())
UPDATE_ENVIROMENT_SOUND_MACRO_INHERITER(/obj/machinery/light/insert_bulb(obj/item/weapon/light/L))
UPDATE_ENVIROMENT_SOUND_MACRO_INHERITER(/obj/machinery/light/remove_bulb())
#undef UPDATE_ENVIROMENT_SOUND_MACRO_INHERITER

/obj/machinery/light/proc/update_enviroment_sound()
	if(!sound_id)
		sound_id = "[sequential_id("[type]_z[z]")]"
	if(lightbulb?.enviroment_sound && powered() && !lightbulb.status)
		sound_token = GLOB.sound_player.PlayLoopingSound(src, sound_id, lightbulb.enviroment_sound, volume = lightbulb.enviroment_sound_volume, range = lightbulb.enviroment_sound_range, falloff = 3, prefer_mute = TRUE)
	else
		QDEL_NULL(sound_token)

/obj/item/weapon/light
	var/enviroment_sound
	var/enviroment_sound_range = 3
	var/enviroment_sound_volume = 30

/obj/machinery/light/xenon
	light_type = /obj/item/weapon/light/tube/xenon

/obj/item/weapon/light/tube/xenon
	name = "xenon light tube"
	color = LIGHT_COLOR_XENON
	b_colour = LIGHT_COLOR_XENON
	b_max_bright = 0.95
	b_inner_range = 3
	b_outer_range = 8
	b_curve = 2

	enviroment_sound_range = 4
	enviroment_sound = 'infinity/sound/ambience/external/1/neon_hum.ogg'

/obj/machinery/light/outer //works without power sources in area
	on = TRUE

/obj/machinery/light/outer/powered()
	return TRUE
