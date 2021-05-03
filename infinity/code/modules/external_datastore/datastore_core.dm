/datum/external_datastore
	var/sourceOfData //text
	var/name = "Unknown Data Store"

	var/tmp/list/data

/datum/external_datastore/New(init_on_new = TRUE)
	. = ..()
	if(init_on_new)
		init_src()

/datum/external_datastore/proc/init_src()
	load()

/datum/external_datastore/proc/load()
	if(!fexists(sourceOfData))
		return
	data = json_decode(file2text(sourceOfData))
	. = data
