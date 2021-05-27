/datum/map/sierra
	species_to_job_whitelist = list(
		/datum/species/adherent = list(/datum/job/ai, /datum/job/cyborg, /datum/job/assistant, /datum/job/janitor, /datum/job/engineer_trainee,\
									   /datum/job/chef, /datum/job/cargo_tech, /datum/job/scientist_assistant,\
									   /datum/job/doctor_trainee, /datum/job/engineer, /datum/job/mining, /datum/job/cargo_assistant,\
									   /datum/job/roboticist, /datum/job/chemist, /datum/job/bartender, /datum/job/explorer_engineer),
		/datum/species/nabber = list(/datum/job/ai, /datum/job/cyborg, /datum/job/janitor, /datum/job/scientist_assistant,\
									 /datum/job/chemist, /datum/job/roboticist, /datum/job/cargo_assistant, /datum/job/chef,\
									 /datum/job/engineer_trainee, /datum/job/doctor_trainee, /datum/job/bartender),
		/datum/species/vox = list(/datum/job/ai, /datum/job/cyborg),
		/datum/species/human/mule	= list(/datum/job/ai, /datum/job/cyborg, /datum/job/submap/merchant, /datum/job/submap/merchant_trainee)
	)

#define HUMAN_ONLY_JOBS /datum/job/captain, /datum/job/hos, /datum/job/hop, /datum/job/chief_engineer, /datum/job/rd, /datum/job/cmo, /datum/job/iaa, /datum/job/psychiatrist
	species_to_job_blacklist = list(
		/datum/species/unathi  		 = list(HUMAN_ONLY_JOBS/*, /datum/job/adjutant, /datum/job/senior_doctor, /datum/job/senior_scientist*/),
		/datum/species/unathi/yeosa  = list(HUMAN_ONLY_JOBS/*, /datum/job/adjutant, /datum/job/senior_doctor, /datum/job/senior_scientist*/),
		/datum/species/unathi/erosan = list(HUMAN_ONLY_JOBS/*, /datum/job/adjutant, /datum/job/senior_doctor, /datum/job/senior_scientist*/),
		/datum/species/skrell  		 = list(/datum/job/captain, /datum/job/hos, /datum/job/hop, /*/datum/job/chief_engineer, /datum/job/rd, *//datum/job/cmo, /datum/job/iaa, /datum/job/psychiatrist),
		/datum/species/tajaran 		 = list(HUMAN_ONLY_JOBS/*, /datum/job/senior_doctor*/),
		/datum/species/machine 		 = list(/datum/job/captain, /datum/job/hos, /datum/job/security_assistant, /datum/job/psychiatrist),
		/datum/species/resomi  		 = list(HUMAN_ONLY_JOBS, /datum/job/officer, /datum/job/exploration_leader,\
									/datum/job/warden, /datum/job/security_assistant),
		/datum/species/diona   		 = list(HUMAN_ONLY_JOBS, /datum/job/exploration_leader, /datum/job/explorer_pilot,\
									/datum/job/officer, /datum/job/warden, /datum/job/detective,\
									/datum/job/qm,\
									/datum/job/senior_engineer, /datum/job/senior_doctor,\
									/*/datum/job/stowaway,*/ /datum/job/senior_scientist, /datum/job/security_assistant),
		/* /datum/species/human/booster= list(HUMAN_ONLY_JOBS,\
									/datum/job/adjutant, /datum/job/exploration_leader, /datum/job/senior_engineer,\
									/datum/job/warden, /datum/job/detective, /datum/job/officer,
									/datum/job/qm, /datum/job/senior_scientist) */
	)
#undef HUMAN_ONLY_JOBS

	allowed_jobs = list(/datum/job/captain, /datum/job/hop, /datum/job/rd, /datum/job/cmo, /datum/job/chief_engineer, /datum/job/hos,
						/datum/job/iaa, /datum/job/adjutant,
						/datum/job/exploration_leader, /datum/job/explorer, /datum/job/explorer_pilot, /datum/job/explorer_medic, /datum/job/explorer_engineer,
						/datum/job/senior_engineer, /datum/job/engineer, /datum/job/infsys, /datum/job/engineer_trainee,
						/datum/job/warden, /datum/job/detective, /datum/job/officer, /datum/job/security_assistant,
						/datum/job/senior_doctor, /datum/job/doctor, /datum/job/doctor_trainee, /datum/job/chemist, /datum/job/psychiatrist,
						/datum/job/qm, /datum/job/cargo_tech,  /datum/job/cargo_assistant, /datum/job/mining,
						/datum/job/janitor, /datum/job/chef, /datum/job/bartender, /datum/job/chaplain, /datum/job/actor,
						/datum/job/senior_scientist, /datum/job/scientist, /datum/job/roboticist, /datum/job/scientist_assistant,
						/datum/job/ai, /datum/job/cyborg,
						/datum/job/assistant,
						/*/datum/job/submap/merchant, /datum/job/submap/merchant_trainee, /datum/job/stowaway*/
						)

	access_modify_region = list(
		ACCESS_REGION_SECURITY = list(access_hos, access_change_ids),
		ACCESS_REGION_MEDBAY = list(access_cmo, access_change_ids),
		ACCESS_REGION_RESEARCH = list(access_rd, access_change_ids),
		ACCESS_REGION_ENGINEERING = list(access_ce, access_change_ids),
		ACCESS_REGION_COMMAND = list(access_change_ids),
		ACCESS_REGION_GENERAL = list(access_hop, access_change_ids),
		ACCESS_REGION_SUPPLY = list(access_qm, access_change_ids),
	)

/*
/datum/map/sierra/setup_map()
	..()
	for(var/job_type in GLOB.using_map.allowed_jobs)
		var/datum/job/job = decls_repository.get_decl(job_type)
		// Most species are restricted from NT security and command roles
		if((job.department_flag & (COM)) && job.allowed_branches.len && !(/datum/mil_branch/civilian in job.allowed_branches))
			for(var/species_name in list(SPECIES_IPC, SPECIES_TAJARA, SPECIES_SKRELL, SPECIES_UNATHI))
				var/datum/species/S = all_species[species_name]
				var/species_blacklist = species_to_job_blacklist[S.type]
				if(!species_blacklist)
					species_blacklist = list()
					species_to_job_blacklist[S.type] = species_blacklist
				species_blacklist |= job.type
*/


// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ GAS JOBS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

// GRADE C
/decl/cultural_info/culture/nabber
	valid_jobs = list(/datum/job/janitor)  // THIS IS GRADE C- TRUST ME ~ SidVeld


/decl/cultural_info/culture/nabber/c
	valid_jobs = list(/datum/job/janitor, /datum/job/cargo_assistant)


/decl/cultural_info/culture/nabber/c/plus
	valid_jobs = list(/datum/job/janitor,    /datum/job/cargo_assistant,
					  /datum/job/scientist_assistant)


// GRADE B
/decl/cultural_info/culture/nabber/b/minus
	valid_jobs = list(/datum/job/janitor)


/decl/cultural_info/culture/nabber/b
	valid_jobs = list(/datum/job/janitor,    /datum/job/cargo_assistant,
					  /datum/job/bartender,  /datum/job/chef,
					  /datum/job/scientist_assistant)


/decl/cultural_info/culture/nabber/b/plus
	valid_jobs = list(/datum/job/janitor,    /datum/job/cargo_assistant,
					  /datum/job/bartender,  /datum/job/chef,
					  /datum/job/scientist_assistant)


// GRADE A
/decl/cultural_info/culture/nabber/a/minus
	valid_jobs = list(/datum/job/scientist_assistant)


/decl/cultural_info/culture/nabber/a
	valid_jobs = list(/datum/job/cargo_assistant,
					  /datum/job/bartender,  /datum/job/chef,
					  /datum/job/chemist,    /datum/job/doctor_trainee,
					  /datum/job/roboticist, /datum/job/engineer_trainee,
					  /datum/job/scientist_assistant)



/decl/cultural_info/culture/nabber/a/plus
	valid_jobs = list(/datum/job/cargo_assistant,
					  /datum/job/bartender,  /datum/job/chef,
					  /datum/job/chemist,    /datum/job/doctor_trainee,
					  /datum/job/roboticist, /datum/job/engineer_trainee,
					  /datum/job/scientist_assistant)


// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


/datum/job
	allowed_branches = list(
		/datum/mil_branch/civilian
	)
	allowed_ranks = list(
		/datum/mil_rank/civ/civ
	)
	required_language = LANGUAGE_HUMAN_EURO
	psi_latency_chance = 8

/datum/map/sierra
	default_assistant_title = "Crewman"
