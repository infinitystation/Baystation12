// For checking if we have a specific state, for inventory icons and nonhumanoid species.
// Cached cause asking icons is expensive. This is still expensive, so avoid using it if
// you can reasonably expect the icon_state to exist beforehand, or if you can cache the
// value somewhere (as done below with use_single_icon in /obj/item/Initialize()).
var/global/list/icon_state_cache = list()
/proc/check_state_in_icon(var/checkstate, var/checkicon, var/high_accuracy = FALSE)
	// isicon() is apparently quite expensive so short-circuit out early if we can.
	if(!istext(checkstate) || isnull(checkicon) || !(isfile(checkicon) || isicon(checkicon)))
		return FALSE
	var/checkkey = "\ref[checkicon]"
	var/list/check = global.icon_state_cache[checkkey]
	if(!check)
		check = list()
		for(var/istate in icon_states(checkicon))
			check[istate] = TRUE
		global.icon_state_cache[checkkey] = check
	. = check[checkstate]
