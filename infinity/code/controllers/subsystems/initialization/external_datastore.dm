SUBSYSTEM_DEF(exdata)
	name = "External Data Stores"
	flags = SS_NO_FIRE
	init_order = SS_INIT_MISC_LATE

	var/list/stores

/datum/controller/subsystem/exdata/Initialize()
	. = ..()
	reloadDataStores()

/datum/controller/subsystem/exdata/proc/reloadDataStores()
	stores = list()
	for(var/datum/external_datastore/i in typesof(/datum/external_datastore))
		if(initial(i.sourceOfData) && initial(i.name))
			var/newi = new i()
			stores[newi.name] = newi

/datum/controller/subsystem/exdata/proc/get_ds(dsname)
	. = stores[dsname]
