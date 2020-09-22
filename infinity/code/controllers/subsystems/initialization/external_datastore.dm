SUBSYSTEM_DEF(exdata)
	name = "External Data Stores"
	flags = SS_NO_FIRE

	init_order = SS_INIT_EARLY

	var/list/stores

/datum/controller/subsystem/exdata/Initialize()
	. = ..()
	reloadDataStores()

/datum/controller/subsystem/exdata/proc/reloadDataStores()
	stores = list()
	for(var/i in typesof(/datum/external_datastore))
		var/datum/external_datastore/path = i
		if(!ispath(path, /datum/external_datastore))
			continue
		if(initial(path.sourceOfData) && initial(path.name))
			var/datum/external_datastore/newi = new path()
			stores[newi.name] = newi

	for(var/client/c in GLOB.clients)
		c.on_exdata_load()

/datum/controller/subsystem/exdata/proc/get_ds(dsname)
	if(islist(stores) && length(stores))
		if(stores.Find(dsname))
			. = stores[dsname]
			if(istype(., /datum/external_datastore))
				var/datum/external_datastore/ds = .
				. = ds.data
			else
				. = null

/datum/controller/subsystem/exdata/proc/get_data_by_key(dsname, key)
	if(!key)
		return
	var/list/ds = get_ds(dsname)
	if(ds?.Find(key))
		. = ds[key]
