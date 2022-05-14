/datum/death
	var/name
	var/key
	var/job
	var/special_role
	var/place_of_death
	var/time_of_death
	var/last_attacker_name
	var/last_attacker_key
	var/gender
	var/bruteloss
	var/fireloss
	var/brainloss
	var/oxyloss
	var/using_map_name
	var/overmap_location_name
	var/coords

SUBSYSTEM_DEF(statistics)
	name = "Statistics"
	wait = 5 MINUTES
	init_order = SS_INIT_MISC_LATE
	flags = SS_NO_INIT | SS_NEEDS_SHUTDOWN

	var/extracted_slime_cores_amount = 0
	var/crew_death_count = 0
	var/list/deaths
	var/list/values = list()
	var/list/value_details = list()
	var/list/population_log = list()

/datum/controller/subsystem/statistics/fire(resumed = FALSE)
	population_log[time2text(world.realtime, "YYYY-MM-DD hh:mm:ss")] = list("players" = LAZYLEN(GLOB.clients), "admin" = LAZYLEN(GLOB.admins))

	if(!dbcon.IsConnected())
		log_debug("No connections to database while gathering player experience in /datum/controller/subsystem/statistics")
		return

	// Set 'announce' to TRUE, if want to notify players about their earnings :D
	update_player_exp()

/datum/controller/subsystem/statistics/Shutdown()

	// Create tables.
	var/database/db = new("data/statistics.sqlite")
	var/database/query/query = new(
		"CREATE TABLE IF NOT EXISTS deaths ( \
		game_id TEXT NOT NULL, \
		name TEXT, \
		key TEXT, \
		job TEXT, \
		special_role TEXT, \
		place_of_death TEXT, \
		time_of_death TEXT, \
		last_attacker_name TEXT, \
		last_attacker_key TEXT, \
		gender TEXT, \
		bruteloss INTEGER, \
		fireloss INTEGER, \
		brainloss INTEGER, \
		oxyloss INTEGER, \
		using_map_name TEXT, \
		overmap_location_name TEXT, \
		coords TEXT \
		);")
	query.Execute(db)
	if(query.Error() || query.ErrorMsg())
		to_world_log( "SQL error - creating death table - [query.Error()] - [query.ErrorMsg()]")

	query = new("CREATE TABLE IF NOT EXISTS population (game_id TEXT NOT NULL, timestamp TEXT NOT NULL, players INTEGER, admin INTEGER);")
	query.Execute(db)
	if(query.Error() || query.ErrorMsg())
		to_world_log( "SQL error - creating population table - [query.Error()] - [query.ErrorMsg()]")

	query = new("CREATE TABLE IF NOT EXISTS feedback (game_id TEXT NOT NULL, field_name TEXT, value TEXT, details TEXT);")
	query.Execute(db)
	if(query.Error() || query.ErrorMsg())
		to_world_log( "SQL error - creating feedback table - [query.Error()] - [query.ErrorMsg()]")

	// Dump stats.
	if(LAZYLEN(deaths))
		for(var/thing in deaths)
			var/datum/death/death = thing
			query = new("INSERT INTO deaths VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);",
				game_id,
				death.name,
				death.key,
				death.job,
				death.special_role,
				death.place_of_death,
				death.time_of_death,
				death.last_attacker_name,
				death.last_attacker_key,
				death.gender,
				death.bruteloss,
				death.fireloss,
				death.brainloss,
				death.oxyloss,
				death.using_map_name,
				death.overmap_location_name,
				death.coords
			)
			query.Execute(db);
			if(query.Error() || query.ErrorMsg())
				to_world_log( "SQL error - logging death - [query.Error()] - [query.ErrorMsg()]")

	if(LAZYLEN(population_log))
		for(var/thing in population_log)
			var/list/data = population_log[thing]
			query = new("INSERT INTO population VALUES (?, ?, ?, ?);", game_id, thing, data["players"], data["admin"])
			query.Execute(db);
			if(query.Error() || query.ErrorMsg())
				to_world_log( "SQL error - logging population - [query.Error()] - [query.ErrorMsg()]")

	// These values are arbitrary and largely unused, so using JSON is far easier than expecting
	// people to maintain a hard list of fields and migrate the tables every time they change.
	if(LAZYLEN(values))
		for(var/field in values)
			var/deets = value_details[field] ? json_encode(value_details[field]) : null
			var/val = islist(values[field]) ? jointext(values[field], "\n") : "[values[field]]"
			query = new("INSERT INTO feedback VALUES (?, ?, ?, ?);", game_id, field, val, deets)
			query.Execute(db);
			if(query.Error() || query.ErrorMsg())
				to_world_log( "SQL error - logging values - [query.Error()] - [query.ErrorMsg()]")

/datum/controller/subsystem/statistics/proc/get_field(var/field)
	return values[field]

/datum/controller/subsystem/statistics/proc/set_field(var/field, var/value)
	values[field] = value

/datum/controller/subsystem/statistics/proc/add_field(var/field, var/value)
	if(isnull(values[field]))
		set_field(field, value)
	else
		values[field] += value

/datum/controller/subsystem/statistics/proc/get_field_details(var/field)
	return jointext(value_details[field], "<br>")

/datum/controller/subsystem/statistics/proc/set_field_details(var/field, var/details)
	value_details[field] = list(details)

/datum/controller/subsystem/statistics/proc/add_field_details(var/field, var/details)
	if(isnull(value_details[field]))
		set_field_details(field, details)
	else
		value_details[field] += details

/datum/controller/subsystem/statistics/proc/report_death(var/mob/living/dead)

	if(dead && dead.mind && dead.client)
		var/datum/death/death = new
		var/area/placeofdeath = get_area(dead)
		death.place_of_death = placeofdeath ? placeofdeath.name : "Unknown area"
		death.place_of_death = sanitizeSQL(death.place_of_death)
		death.name = sanitizeSQL(dead.real_name)
		death.key = sanitizeSQL(dead.key)
		death.special_role = sanitizeSQL(dead.mind.special_role)
		death.job = sanitizeSQL(dead.mind.assigned_role)
		if(dead.last_attacker_)
			death.last_attacker_name = sanitizeSQL(dead.last_attacker_.name)
			death.last_attacker_key =  sanitizeSQL(dead.last_attacker_.client.key)
		death.gender = dead.gender
		death.time_of_death = time2text(world.realtime, "YYYY-MM-DD hh:mm:ss")
		death.coords = "[dead.x], [dead.y], [dead.z]"
		death.bruteloss = dead.getBruteLoss()
		death.fireloss =  dead.getFireLoss()
		death.brainloss = dead.getBrainLoss()
		death.oxyloss =   dead.getOxyLoss()
		death.using_map_name = GLOB.using_map.full_name
		var/obj/effect/overmap/visitable/cell = map_sectors ? map_sectors["[dead.z]"] : null
		death.overmap_location_name = cell ? cell.name : "Unknown"
		LAZYADD(deaths, death)

		if(!player_is_antag(dead.mind) && dead.mind.assigned_job && dead.mind.assigned_job.department_flag)
			crew_death_count++
/**
  * This proc will update all players EXP end SPECIES_EXP at once. It will calculate amount of time to add dynamically based on the SS fire time.
  *
  * Arguments:
  * * announce - whether or not to announce aboutconvert  exp update to players
  */
/datum/controller/subsystem/statistics/proc/update_player_exp(announce = FALSE)

	var/start_time = start_watch()

	// Calculate minutes based on the SS wait time (How often this proc fires)
	var/minutes_to_add = wait / (1 MINUTE)

	// Get a list of clients to process
	// This is copied so that clients joining in the middle of this dont break things
	var/list/client/clients_to_process = GLOB.clients.Copy()
	log_debug("Starting EXP update for [LAZYLEN(clients_to_process)] clients. (Adding [minutes_to_add] minutes)")

	// List of SELECT queries to mass grab EXP.
	var/list/datum/db_query/select_queries = list()

	for (var/client/client as anything in clients_to_process)

		// If a client logs out in the middle of this or has no mob or mind
		if(!client || !client.mob || !client.mob.mind)
			continue

		var/datum/db_query/exp_read = SSdbcore.NewQuery(
			"SELECT exp, species_exp FROM [format_table_name("player")] WHERE ckey=:ckey",
			list("ckey" = client.ckey)
		)

		select_queries[client.ckey] = exp_read

	// Explanation for parameters:
	// TRUE: We want warnings if these fail
	// FALSE: Do NOT qdel() queries here, otherwise they wont be read. At all.
	// TRUE: This is an assoc list, so it needs to prepare for that
	// FALSE: We dont want to logspam
	SSdbcore.MassExecute(select_queries, TRUE, FALSE, TRUE, FALSE) // Batch execute so we can take advantage of async magic

	// Assoc List of ckey to exp
	var/list/old_exp_records = list()

	// Assoc List of ckey to species exp
	var/list/old_species_exp_records = list()

	for (var/client/client as anything in clients_to_process)

		// If a client logs out in the middle of this or has no mob or mind
		if(!client || !client.mob || !client.mob.mind)
			continue

		while(select_queries[client.ckey].NextRow())
			old_exp_records[client.ckey] = params2list(select_queries[client.ckey].item[1])
			old_species_exp_records[client.ckey] = params2list(select_queries[client.ckey].item[2])

	QDEL_LIST_ASSOC_VAL(select_queries) // Clean stuff up

	var/list/datum/db_query/player_update_queries = list() // List of queries to update player EXP
	var/list/datum/db_query/playtime_history_update_queries = list() // List of queries to update the playtime history table

	// Loop to update player experience
	for(var/client/client as anything in clients_to_process)

		// If a client logs out in the middle of this or has no mob or mind
		if(!client || !client.mob || !client.mob.mind)
			continue

		var/list/new_exp_records = create_exp_records(GLOB.job_exp_type_to_job_titles, old_exp_records[client.ckey])
		var/list/new_species_exp_records = create_exp_records(GLOB.species_to_names_map, old_species_exp_records[client.ckey])

		var/role = client.mob.mind.assigned_role
		var/species = client.mob.dna?.species
		var/added_living = 0
		var/added_ghost = 0
		if(client.mob.stat != DEAD)
			if(role)
				new_exp_records[EXP_TYPE_LIVING] += minutes_to_add
				added_living += minutes_to_add

				if(announce)
					to_chat(client.mob, SPAN_NOTICE("You got: [minutes_to_add] Living EXP!"))

				for(var/job_exp_type in GLOB.job_exp_type_to_job_titles)
					if(role in GLOB.job_exp_type_to_job_titles[job_exp_type])

						// Add played time to current player's job experience
						new_exp_records[job_exp_type] += minutes_to_add
						if(announce)
							to_chat(client.mob, SPAN_NOTICE("You got: [minutes_to_add] [job_exp_type] EXP!"))

				// To avoid double logging for submap positions and special roles, that are mostly antags, there is check for presence in submap_positions list
				if(client.mob.mind.special_role && !(role in GLOB.submap_positions))
					new_exp_records[EXP_TYPE_SPECIAL] += minutes_to_add
					if(announce)
						to_chat(client.mob, SPAN_NOTICE("You got: [minutes_to_add] Special EXP!"))

			if(species)
				for(var/species_type in GLOB.species_to_names_map)
					if(species in GLOB.species_to_names_map[species_type])

						// Add played time to current player's species experience
						new_species_exp_records[species_type] += minutes_to_add
						if(announce)
							to_chat(client.mob, SPAN_NOTICE("You got: [minutes_to_add] [species_type] EXP!"))

						// Mob can't be multiple species at the same time, so we break as we found needed `species`
						break

		else if(isobserver(client.mob))
			new_exp_records[EXP_TYPE_GHOST] += minutes_to_add
			added_ghost += minutes_to_add
			if(announce)
				to_chat(client.mob, SPAN_NOTICE("You got: [minutes_to_add] Ghost EXP!"))
		else
			continue

		var/updated_exp = list2params(new_exp_records)
		var/updated_species_exp = list2params(new_species_exp_records)

		var/datum/db_query/player_update_query = SSdbcore.NewQuery(
			"UPDATE [format_table_name("player")] SET exp =:updated_exp, species_exp =:updated_species_exp, lastseen=NOW() WHERE ckey=:ckey",
			list(
				"updated_exp" = updated_exp,
				"updated_species_exp" = updated_species_exp,
				"ckey" = client.ckey
			)
		)

		player_update_queries += player_update_query

		var/datum/db_query/update_query_history = SSdbcore.NewQuery({"
			INSERT INTO [format_table_name("playtime_history")] (ckey, date, time_living, time_ghost)
			VALUES (:ckey, CURDATE(), :addedliving, :addedghost)
			ON DUPLICATE KEY UPDATE time_living=time_living + VALUES(time_living), time_ghost=time_ghost + VALUES(time_ghost)"},
			list(
				"ckey" = client.ckey,
				"addedliving" = added_living,
				"addedghost" = added_ghost
			)
		)

		playtime_history_update_queries += update_query_history


	// warn=TRUE, qdel=TRUE, assoc=FALSE, log=FALSE
	SSdbcore.MassExecute(player_update_queries, TRUE, TRUE, FALSE, FALSE) // Batch execute so we can take advantage of async magic
	SSdbcore.MassExecute(playtime_history_update_queries, TRUE, TRUE, FALSE, FALSE)

	log_debug("Successfully updated all EXP data in [stop_watch(start_time)]s")



/datum/controller/subsystem/statistics/proc/create_exp_records(list/exp_map, list/old_records)
	if (!old_records)
		old_records = list()

	var/list/new_records = list()
	for(var/exp_type in exp_map)
		var/old_exp_value = text2num(old_records[exp_type])
		if(old_exp_value)
			new_records[exp_type] = old_exp_value
		else
			new_records[exp_type] = 0

	return new_records
