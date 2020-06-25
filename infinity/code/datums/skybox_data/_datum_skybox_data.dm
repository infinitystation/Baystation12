GLOBAL_LIST_EMPTY(skybox_datas)
/datum/skybox_data
	var/name
	var/skybox_icon = 'icons/skybox/skybox.dmi'
	var/stars_icon
	var/list/star_state = "stars"
	var/list/icon_states = "dyable"
	var/list/cascade_icon_states = "cascade"
	var/list/narsie_icon_states = "narsie"
	var/list/forced_colors
	var/undyable_probability = 0 //probability of become undyable

/datum/skybox_data/New()
	. = ..()
	if(!stars_icon)
		stars_icon = skybox_icon

/datum/controller/subsystem/skybox
	var/datum/skybox_data/skybox_data

/datum/controller/subsystem/skybox/Initialize()
	. = ..()
	for(var/t in typesof(/datum/skybox_data))
		var/datum/skybox_data/n = new t()
		if(n.name)
			GLOB.skybox_datas[n.name] = n
	set_rand_skybox_datum()

/datum/controller/subsystem/skybox/proc/set_random_skybox_color(list/fcolors)
	if(length(fcolors))
		background_color = PICK_OR_SET(fcolors)
	else if(length(skybox_data?.forced_colors))
		background_color = PICK_OR_SET(skybox_data.forced_colors)
	else
		background_color = RANDOM_RGB
	. = background_color

/datum/controller/subsystem/skybox/proc/set_rand_skybox_datum()
	if(length(GLOB.skybox_datas))
		set_skybox_datum(GLOB.skybox_datas[pick(GLOB.skybox_datas)])
		if(istype(skybox_data))
			return TRUE

/datum/controller/subsystem/skybox/proc/set_skybox_datum(datum/skybox_data/data)
	skybox_data = data
	sync_with_skybox_data()

/datum/controller/subsystem/skybox/proc/sync_with_skybox_data(datum/skybox_data/data = skybox_data)
	if(istype(data))
		var/list/forced_colors = data.forced_colors
		var/list/icon_states = data.icon_states
		if(prob(data.undyable_probability))
			forced_colors = "#ffffff"
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
			background_icon = PICK_OR_SET(icon_states)
		set_random_skybox_color(forced_colors)
		rebuild_skyboxes()
