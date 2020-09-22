/client/New()
	. = ..()
	update_ooc_color()

/client/proc/set_ooc_color(value)
	prefs.ooccolor = value
	update_ooc_color()

/client/proc/update_ooc_color()
	var/getter = holder ? holder.rank : null
	var/list/donatorskey_rank = SSexdata.get_data_by_key(DATASTORE_DONATORS, key)
	if(islist(donatorskey_rank) && length(donatorskey_rank))
		getter ? null : (getter = donatorskey_rank.Find("rank") ? donatorskey_rank["rank"] : null)
	if(getter)
		var/cbr = SSexdata.get_data_by_key(DATASTORE_RANKS_OOC_COLORS, getter)
		if(istext(cbr) && prefs)
			prefs.ooccolor = "#" + cbr

/client/proc/on_exdata_load()
	update_ooc_color()

/datum/preferences/load_preferences()
	. = ..()
	if(client)
		client.update_ooc_color()