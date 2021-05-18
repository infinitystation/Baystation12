/client/proc/set_ooc_color(value)
	prefs.ooccolor = value
	update_ooc_color()

/client/proc/update_ooc_color()
	if(DonateData)
		DonateData.Update()
	var/getter = holder ? holder.rank : null
	var/ooc_color_by_holder
	if(istext(getter))
		ooc_color_by_holder = SSexdata.GetDataByKey(DATASTORE_RANKS_OOC_COLORS, getter)
	if(DonateData?.ooc_color || ooc_color_by_holder)
		var/nooc_color = (ooc_color_by_holder ? ooc_color_by_holder : DonateData.ooc_color)
		// Свободный выбор цветов у ведущих сотрудников пусть остается ~bear1ake
		if( istext(nooc_color) && (prefs && (prefs.ooccolor == initial(prefs.ooccolor))) )
			prefs.ooccolor = "#" + nooc_color

/client/proc/on_exdata_load()
	DonateData.Update()
	update_ooc_color()

/datum/preferences/load_preferences()
	. = ..()
	if(client)
		client.update_ooc_color()

/datum/preferences/save_preferences()
	. = ..()
	if(client)
		client.update_ooc_color()
