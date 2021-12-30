SUBSYSTEM_DEF(exdata)
	name = "External Data Stores"
	flags = SS_NO_FIRE

	init_order = SS_INIT_EARLY

	var/list/stores

/datum/controller/subsystem/exdata/Initialize()
	. = ..()
	ReloadDataStores()

/datum/controller/subsystem/exdata/proc/ReloadDataStores()
	stores = list()
	for(var/i in typesof(/datum/external_datastore))
		var/datum/external_datastore/path = i
		if(!ispath(path, /datum/external_datastore))
			continue
		if(fexists(initial(path.sourceOfData)) && initial(path.name))
			var/datum/external_datastore/new_ds = new path()
			stores[new_ds.name] = new_ds

	for(var/client/c in GLOB.clients)
		c.on_exdata_load()

/datum/controller/subsystem/exdata/proc/GetDS(dsname)
	if(islist(stores) && length(stores))
		if(list_find(stores, dsname))
			. = stores[dsname]
			if(istype(., /datum/external_datastore))
				var/datum/external_datastore/ds = .
				. = ds.data
			else
				. = null

/datum/controller/subsystem/exdata/proc/GetDataByKey(dsname, key)
	if(!key)
		return
	var/list/ds = GetDS(dsname)
	if(ds && list_find(ds, key))
		. = ds[key]
