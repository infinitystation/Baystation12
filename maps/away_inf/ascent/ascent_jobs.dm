#define WEBHOOK_SUBMAP_LOADED_ASCENT_INF "webhook_submap_ascent_inf"

// Submap datum and archetype.
/decl/webhook/submap_loaded/ascent_inf
	id = WEBHOOK_SUBMAP_LOADED_ASCENT_INF

/decl/submap_archetype/ascent_seedship_inf
	descriptor = "Ascent's Colony Ship"
	map = DAMAGED_ASCENT_COLONY_SHIP_NAME
	blacklisted_species = null
	whitelisted_species = null
	crew_jobs = list(
		/datum/job/submap/ascent_inf,
		/datum/job/submap/ascent_inf/alate,
		/datum/job/submap/ascent_inf/drone,
		//datum/job/submap/ascent_inf/control_mind,
		//datum/job/submap/ascent_inf/msq,
		//datum/job/submap/ascent_inf/msw,
	)
	call_webhook = WEBHOOK_SUBMAP_LOADED_ASCENT_INF

/datum/submap/ascent_inf
	var/gyne_name

/datum/submap/ascent_inf/sync_cell(obj/effect/overmap/visitable/cell)
	return

/datum/submap/ascent_inf/check_general_join_blockers(var/mob/new_player/joining, var/datum/job/submap/job)
	. = ..()
	if(. && istype(job, /datum/job/submap/ascent_inf))
		var/datum/job/submap/ascent_inf/ascent_job = job
		if(ascent_job.set_species_on_join == SPECIES_MANTID_GYNE && !is_species_whitelisted(joining, SPECIES_MANTID_GYNE))
			to_chat(joining, SPAN_WARNING("You are not whitelisted to play a [SPECIES_MANTID_GYNE]."))
			return FALSE
		if(ascent_job.set_species_on_join == SPECIES_MONARCH_QUEEN && !is_species_whitelisted(joining, SPECIES_NABBER))
			to_chat(joining, SPAN_WARNING("You must be whitelisted to play a [SPECIES_NABBER] to join as a [SPECIES_MONARCH_QUEEN]."))
			return FALSE

/mob/living/carbon/human/proc/gyne_rename_lineage_inf()
	set name = "Name Nest-Lineage"
	set category = "IC"
	set desc = "Rename yourself and your alates."

	if(species.name == SPECIES_MANTID_GYNE && mind && istype(mind.assigned_job, /datum/job/submap/ascent_inf))
		var/datum/job/submap/ascent_inf/ascent_job = mind.assigned_job
		var/datum/submap/ascent_inf/cutter = ascent_job.owner
		if(istype(cutter))

			var/new_number = input("What is your position in your lineage?", "Name Nest-Lineage") as num|null
			if(!new_number)
				return
			new_number = Clamp(new_number, 1, 999)
			var/new_name = sanitize(input("What is the true name of your nest-lineage?", "Name Nest-Lineage") as text|null, MAX_NAME_LEN)
			if(!new_name)
				return

			if(species.name != SPECIES_MANTID_GYNE || !mind || mind.assigned_job != ascent_job)
				return

			// Rename ourselves.
			fully_replace_character_name("[new_number] [new_name]")

			// Rename our alates (and only our alates).
			cutter.gyne_name = new_name
			for(var/mob/living/carbon/human/H in GLOB.human_mob_list)
				if(!H.mind || H.species.name != SPECIES_MANTID_ALATE)
					continue
				var/datum/job/submap/ascent_inf/temp_ascent_job = H.mind.assigned_job
				if(!istype(temp_ascent_job) || temp_ascent_job.owner != ascent_job.owner)
					continue


				var/new_alate_number = is_species_whitelisted(H, SPECIES_MANTID_GYNE) ? random_id(/datum/species/mantid, 1000, 9999) : random_id(/datum/species/mantid, 10000, 99999)
				H.fully_replace_character_name("[new_alate_number] [new_name]")
				to_chat(H, SPAN_NOTICE("<font size = 3>Your gyne, [real_name], has awakened, and you recall your place in the nest-lineage: <b>[H.real_name]</b>.</font>"))

	verbs -= /mob/living/carbon/human/proc/gyne_rename_lineage_inf

// Jobs.
/datum/job/submap/ascent_inf
	title = "Ascent gyne"
	total_positions = 1
	supervisors = "youself"
	info = "You are Gyna on your own independent vessel. Your path has led you to this remote sector full of primitive bioforms. \
	\
	Show everyone your greatness, crush all those who dare to oppose you, establish your new nest here and bring prosperity to your lineage. \
    Your radars picked up a large ship equipped with a bluespace engine, until you find out who owns it, it's better not to give yourself away with vigorous activity. \
    Your ship was damaged during the bluespace jump, you need to restore it to fully function."
	outfit_type = /decl/hierarchy/outfit/job/ascent
	minimal_player_age = 21
	blacklisted_species = null
	whitelisted_species = list("Kharmaan Gyne")
	loadout_allowed = FALSE
	is_semi_antagonist = TRUE
	var/requires_supervisor = FALSE
	var/set_species_on_join = SPECIES_MANTID_GYNE
	min_skill = list(SKILL_EVA = SKILL_EXPERT,
					SKILL_PILOT = SKILL_PROF,
					SKILL_HAULING = SKILL_ADEPT,
					SKILL_COMBAT = SKILL_ADEPT,
					SKILL_WEAPONS = SKILL_EXPERT,
					SKILL_SCIENCE = SKILL_ADEPT,
					SKILL_MEDICAL = SKILL_ADEPT,
					SKILL_ANATOMY = SKILL_ADEPT)

/datum/job/submap/ascent_inf/is_position_available()
	. = ..()
	if(. && requires_supervisor)
		for(var/mob/M in GLOB.player_list)
			if(!M.client || !M.mind || !M.mind.assigned_job || M.mind.assigned_job.title != requires_supervisor)
				continue
			var/datum/job/submap/ascent_inf/ascent_job = M.mind.assigned_job
			if(istype(ascent_job) && ascent_job.owner == owner)
				return TRUE
		return FALSE

/datum/job/submap/ascent_inf/is_available(client/caller)
	. = ..()
	if(.)
		switch(set_species_on_join)
			if(SPECIES_MANTID_GYNE)
				. = is_species_whitelisted(caller.mob, SPECIES_MANTID_GYNE)
			if(SPECIES_MONARCH_QUEEN)
				. = is_species_whitelisted(caller.mob, SPECIES_NABBER)

/datum/job/submap/ascent_inf/handle_variant_join(var/mob/living/carbon/human/H, var/alt_title)

	if(ispath(set_species_on_join, /mob/living/silicon/robot))
		return H.Robotize(set_species_on_join)
	if(ispath(set_species_on_join, /mob/living/silicon/ai))
		return H.AIize(set_species_on_join, move = FALSE)

	var/datum/submap/ascent_inf/cutter = owner
	if(!istype(cutter))
		crash_with("Ascent submap job is being used by a non-Ascent submap, aborting variant join.")
		return

	if(!cutter.gyne_name)
		cutter.gyne_name = create_gyne_name()

	if(set_species_on_join)
		H.set_species(set_species_on_join)
	switch(H.species.name)
		if(SPECIES_MANTID_GYNE)
			H.real_name = "[random_id(/datum/species/mantid, 1, 99)] [cutter.gyne_name]"
			H.verbs |= /mob/living/carbon/human/proc/gyne_rename_lineage_inf
		if(SPECIES_MANTID_ALATE)
			var/new_alate_number = is_species_whitelisted(H, SPECIES_MANTID_GYNE) ? random_id(/datum/species/mantid, 1000, 9999) : random_id(/datum/species/mantid, 10000, 99999)
			H.real_name = "[new_alate_number] [cutter.gyne_name]"
	H.name = H.real_name
	if(H.mind)
		H.mind.name = H.real_name
	return H

/datum/job/submap/ascent_inf/alate
	title = "Ascent alate"
	total_positions = 3
	supervisors = "your Gyne"
	info = "You are an Alate of an independent Ascent vessel. Your Gyne has directed you to this remote sector full of crawling primitives. Follow her instructions and bring prosperity to your nest-lineage."
	set_species_on_join = SPECIES_MANTID_ALATE
	outfit_type = /decl/hierarchy/outfit/job/ascent/tech
	whitelisted_species = list("Kharmaan Gyne")
	loadout_allowed = FALSE
	is_semi_antagonist = TRUE
	requires_supervisor = "Ascent gyne"
	min_skill = list(SKILL_EVA = SKILL_PROF,
					SKILL_HAULING = SKILL_EXPERT,
					SKILL_COMBAT = SKILL_EXPERT,
					SKILL_WEAPONS = SKILL_EXPERT,
					SKILL_MEDICAL = SKILL_ADEPT)


/datum/job/submap/ascent_inf/drone
	title = "Ascent drone"
	supervisors = "your Gyne"
	total_positions = 1
	info = "You are a Machine Intelligence of an independent Ascent vessel. The Gyne you assist, and her children, have wandered into this sector full of primitive bioforms. Try to keep them alive, and assist where you can."
	set_species_on_join = /mob/living/silicon/robot/flying/ascent
	requires_supervisor = "Ascent gyne"
	loadout_allowed = FALSE
	is_semi_antagonist = TRUE
	whitelisted_species = list("Kharmaan Gyne")

/*
/datum/job/submap/ascent_inf/msw
	title = "Serpentid Adjunct"
	supervisors = "вашей Королевой"
	total_positions = 3
	info = "You are a Monarch Serpentid Worker serving as an attendant to your Queen on this vessel. Serve her however she requires."
	set_species_on_join = SPECIES_MONARCH_WORKER
	outfit_type = /decl/hierarchy/outfit/job/ascent/soldier
	min_skill = list(SKILL_EVA = SKILL_ADEPT,
					SKILL_HAULING = SKILL_ADEPT,
					SKILL_COMBAT = SKILL_ADEPT,
					SKILL_WEAPONS = SKILL_ADEPT,
					SKILL_SCIENCE = SKILL_ADEPT,
					SKILL_MEDICAL = SKILL_BASIC)

/datum/job/submap/ascent_inf/msq
	title = "Serpentid Queen"
	supervisors = "другими Королевами и Гииной"
	total_positions = 2
	info = "You are a Monarch Serpentid Queen living on an independant Ascent vessel. Assist the Gyne in her duties and tend to your Workers."
	set_species_on_join = SPECIES_MONARCH_QUEEN
	min_skill = list(SKILL_EVA = SKILL_ADEPT,
					SKILL_HAULING = SKILL_ADEPT,
					SKILL_COMBAT = SKILL_ADEPT,
					SKILL_WEAPONS = SKILL_ADEPT,
					SKILL_MEDICAL = SKILL_BASIC)
*/

// Spawn points.
/obj/effect/submap_landmark/spawnpoint/ascent_seedship_inf
	name = "Ascent gyne"
	movable_flags = MOVABLE_FLAG_EFFECTMOVE

/obj/effect/submap_landmark/spawnpoint/ascent_seedship_inf/alate
	name = "Ascent alate"

/obj/effect/submap_landmark/spawnpoint/ascent_seedship_inf/drone
	name = "Ascent drone"

/obj/effect/submap_landmark/spawnpoint/ascent_seedship_inf/adjunct
	name = "Serpentid adjunct"

/obj/effect/submap_landmark/spawnpoint/ascent_seedship_inf/queen
	name = "Serpentid queen"

/*
/datum/job/submap/ascent_inf/control_mind
	title = "Ascent Control Mind"
	supervisors = "Гииной"
	total_positions = 1
	info = "You are a Machine Intelligence of an independent Ascent vessel. The Gyne you assist, and her children, have wandered into this sector full of primitive bioforms. Try to keep them alive, and assist where you can."
	set_species_on_join = /mob/living/silicon/ai/ascent

/obj/effect/submap_landmark/spawnpoint/ascent_seedship/control
	name = "Ascent Control Mind"

/mob/living/silicon/ai/ascent
	name = "TODO"
*/

#undef WEBHOOK_SUBMAP_LOADED_ASCENT_INF
