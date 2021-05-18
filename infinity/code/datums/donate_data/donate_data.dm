/client
	var/datum/donator_data/DonateData
/client/New()
	. = ..()
	SyncWithDonatorData()

/client/proc/SyncWithDonatorData()
	if(list_find(GLOB.donators_data, key))
		DonateData = GLOB.donators_data[key]
	else
		DonateData = new(key)

GLOBAL_LIST_EMPTY(donators_data)

/datum/donator_data
	var/key
	var/rank
	var/level
	var/ooc_color
	var/points = 0
	var/list/donate_loadout = list()

/datum/donator_data/New(_key)
	. = ..()
	key = _key
	if(istext(key))
		Update()
		GLOB.donators_data[key] = src

/datum/donator_data/proc/Update()
	if(key)
		var/list/rank_and_points = SSexdata.GetDataByKey(DATASTORE_DONATORS, key)
		if(islist(rank_and_points) && length(rank_and_points))
			if(list_find(rank_and_points, "rank"))
				rank = rank_and_points["rank"]
			if(list_find(rank_and_points, "points"))
				points = rank_and_points["points"]
		if(rank)
			var/list/levels = SSexdata.GetDataByKey(DATASTORE_DONATORS_RANKS, rank)
			if(levels && islist(levels) && length(levels) && list_find(levels, "level"))
				level = levels["level"]

			var/list/rank_color = SSexdata.GetDataByKey(DATASTORE_RANKS_OOC_COLORS, rank)
			if(length(rank_color))
				ooc_color = rank_color

/datum/donator_data/proc/GetAvailablePoints()
	. = points
	for(var/datum/gear/g in donate_loadout)
		. -= g.price

/datum/donator_data/proc/CheckGear(datum/gear/gear2check)
	if(gear2check)
		if((GetAvailablePoints() >= gear2check.price) && (level >= gear2check.required_donate_level))
			return TRUE
