/client
	var/obj/screen/tooltip/tooltip

/obj/screen/tooltip
	icon = 'infinity/icons/tooltip.dmi'
	icon_state = "transparent"
	screen_loc = "TOP, CENTER - 3"
//	screen_loc = "TOP + 1, CENTER - 3"
	plane = FULLSCREEN_PLANE
	maptext_width = 256
	maptext_x = -16
	var/active = FALSE
	var/maptext_style = "text-shadow: 1px 1px 2px black; font-family: 'Small Fonts';"

/obj/screen/tooltip/proc/set_state(new_state, type)
	switch(type)
		if(GLOB.PREF_SHOW)
			icon_state = "transparent"
		if(GLOB.PREF_FANCY)
			icon_state = "bar"

	if(new_state == active) return
	active = new_state
	set_invisibility(active ? initial(invisibility) : INVISIBILITY_MAXIMUM)

/*
	addtimer(CALLBACK(src, /atom/proc/set_invisibility, active ? initial(invisibility) : INVISIBILITY_MAXIMUM), active ? 0 : 10)
	var/matrix/M = matrix(transform)
	M.Translate(0, active ? -32 : 32)
	animate(src, transform = M, time = 10, easing = ELASTIC_EASING | active ? EASE_IN : EASE_OUT)
*/

/client/New(TopicData)
	..()
	tooltip = new /obj/screen/tooltip()
	if(mob)
		var/value = mob.get_preference_value(/datum/client_preference/tooltip)
		if(value == GLOB.PREF_SHOW || value == GLOB.PREF_FANCY)
			tooltip.set_state(1, value)

/client/MouseEntered(atom/object, location, control, params)
	if(tooltip && tooltip.active && GAME_STATE > RUNLEVEL_SETUP)
		screen |= tooltip
		tooltip.maptext = "<center style=\"[tooltip.maptext_style]\">[object.name]</center>"

/datum/client_preference/tooltip
	description = "Show Tooltip"
	key = "SHOW_TOOLTIP"
	options = list(GLOB.PREF_SHOW, GLOB.PREF_FANCY, GLOB.PREF_HIDE)

/datum/client_preference/tooltip/changed(mob/preference_mob, new_value)
	var/client/C = preference_mob.client
	if(new_value == GLOB.PREF_SHOW || new_value == GLOB.PREF_FANCY)
		C.tooltip.set_state(1, new_value)
	else
		C.tooltip.set_state(0)
