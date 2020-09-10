SUBSYSTEM_DEF(exdata)
	name = "External Data Stores"
	flags = SS_NO_FIRE

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

/datum/controller/subsystem/exdata/proc/get_ds(dsname)
	. = stores[dsname]
	if(istype(., /datum/external_datastore))
		var/datum/external_datastore/ds = .
		. = ds.data

/datum/controller/subsystem/exdata/proc/get_data_by_key(dsname, key)
	var/list/ds = get_ds(dsname)
	. = ds[key]
	if(!.)
		. = ds.Find(key)

