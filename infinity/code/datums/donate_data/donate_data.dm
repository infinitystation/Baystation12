/client
	var/datum/donator_data/DonateData
/client/New()
	. = ..()
	SyncWithDonatorData()

/client/proc/SyncWithDonatorData()
	if(GLOB.donators_data.Find(key))
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
			if(rank_and_points.Find("rank"))
				rank = rank_and_points["rank"]
			if(rank_and_points.Find("points"))
				points = rank_and_points["points"]
		if(rank)
			var/list/levels = SSexdata.GetDataByKey(DATASTORE_DONATORS_RANKS, rank)
			if(islist(levels) && length(levels) && levels?.Find("level"))
				level = levels["level"]

			var/list/rank_color = SSexdata.GetDataByKey(DATASTORE_RANKS_OOC_COLORS, rank)
			if(length(rank_color))
				ooc_color = rank_color
