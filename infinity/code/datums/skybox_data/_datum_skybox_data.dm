/datum/skybox_data
	var/skybox_icon = 'icons/skybox/skybox.dmi'
	var/stars_icon
	var/list/star_state = "stars"
	var/list/dyable_icon_states = "dyable"
	var/list/cascade_icon_states = "cascade"
	var/list/narsie_icon_states = "narsie"
	var/list/forced_colors
	var/list/undyable_icon_states

/datum/skybox_data/New()
	. = ..()
	if(!stars_icon)
		stars_icon = skybox_icon

/datum/controller/subsystem/skybox
	var/datum/skybox_data/skybox_data

/datum/controller/subsystem/skybox/Initialize()
	. = ..()
	set_rand_skybox_datum()
	set_random_skybox_color()

/datum/controller/subsystem/skybox/proc/set_random_skybox_color()
	if(length(skybox_data?.forced_colors))
		background_color = PICK_OR_SET(skybox_data.forced_colors)
	else
		background_color = RANDOM_RGB
	. = background_color
	rebuild_skyboxes()

/datum/controller/subsystem/skybox/proc/set_rand_skybox_datum()
	var/list/skydatums = typesof(/datum/skybox_data)
	if(length(skydatums))
		set_skybox_datum(pick(skydatums))
		if(skybox_data)
			return TRUE

/datum/controller/subsystem/skybox/proc/set_skybox_datum(Type)
	skybox_data = new Type()
	if(istype(skybox_data))

		if(skybox_data.skybox_icon)
			skybox_icon = skybox_data.skybox_icon

		if(skybox_data.forced_colors)
			background_color = PICK_OR_SET(skybox_data.forced_colors)

		if(skybox_data.star_state)
			if(skybox_data.stars_icon)
				star_path = skybox_data.stars_icon
			star_state = PICK_OR_SET(skybox_data.star_state)
			use_stars = TRUE
		else
			use_stars = FALSE

		if(!skybox_data.undyable_icon_states)
			if(skybox_data.dyable_icon_states)
				background_icon = PICK_OR_SET(skybox_data.dyable_icon_states)
		else
			background_icon = PICK_OR_SET(skybox_data.undyable_icon_states)
	rebuild_skyboxes()