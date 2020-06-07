/datum/skybox_data
	var/skybox_icon = 'icons/skybox/skybox.dmi'
	var/stars_icon
	var/list/star_state = "stars"
	var/list/icon_states = "dyable"
	var/list/cascade_icon_states = "cascade"
	var/list/narsie_icon_states = "narsie"
	var/list/forced_colors //to forbide coloring, just set to "#ffffff"
	var/undyable_probability = 0 //probability of become undyable

/datum/skybox_data/New()
	. = ..()
	if(!stars_icon)
		stars_icon = skybox_icon
	if(prob(undyable_probability))
		forced_colors = "#ffffff"
		icon_states = "undyable"

/datum/controller/subsystem/skybox
	var/datum/skybox_data/skybox_data

/datum/controller/subsystem/skybox/Initialize()
	. = ..()
	set_rand_skybox_datum()

/datum/controller/subsystem/skybox/proc/set_random_skybox_color()
	if(length(skybox_data?.forced_colors))
		background_color = PICK_OR_SET(skybox_data.forced_colors)
	else
		background_color = RANDOM_RGB
	. = background_color

/datum/controller/subsystem/skybox/proc/set_rand_skybox_datum()
	var/list/skydatums = typesof(/datum/skybox_data)
	if(length(skydatums))
		set_skybox_datum(pick(skydatums))
		if(skybox_data)
			return TRUE

/datum/controller/subsystem/skybox/proc/set_skybox_datum(Type)
	skybox_data = new Type()
	sync_with_skybox_data()

/datum/controller/subsystem/skybox/proc/sync_with_skybox_data(datum/skybox_data/data = skybox_data)
	if(istype(data))
		if(data.skybox_icon)
			skybox_icon = data.skybox_icon
		if(data.star_state)
			if(data.stars_icon)
				star_path = data.stars_icon
			star_state = PICK_OR_SET(data.star_state)
			use_stars = TRUE
		else
			use_stars = FALSE
		if(data.icon_states)
			background_icon = PICK_OR_SET(data.icon_states)
		set_random_skybox_color()
		rebuild_skyboxes()