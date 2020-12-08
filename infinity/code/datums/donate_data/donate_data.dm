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

/datum/donator_data/proc/SanitizeLoadout()
	var/available_points = GetAvailablePoints()
	if(available_points < 0)
		var/list/prices = list()
		for(var/datum/gear/gear2check in donate_loadout)
			prices[gear2check.price] = gear2check
		var/list/sortedprices = insertion_sort_numeric_list_descending(prices)
		while(available_points < 0)
			var/price_for_gear = sortedprices[length(sortedprices)]
			var/gear_to_remove = prices[price_for_gear]
			donate_loadout.Remove(gear_to_remove)
			sortedprices.Remove(gear_to_remove)
			available_points += price_for_gear

/datum/donator_data/proc/GetAvailablePoints()
	. = points
	for(var/datum/gear/g in donate_loadout)
		. -= g.price

/datum/donator_data/proc/CheckGear(datum/gear/gear2check)
	if(gear2check)
		SanitizeLoadout()
		if((GetAvailablePoints() >= gear2check.price) && (level >= gear2check.required_donate_level))
			return TRUE

/datum/donator_data/proc/TryAddGear(datum/gear/gear2add)
	if(CheckGear(gear2add))
		donate_loadout.Add(gear2add)
