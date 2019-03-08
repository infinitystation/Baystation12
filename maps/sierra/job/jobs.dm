/datum/map/sierra
	species_to_job_whitelist = list(
		/datum/species/adherent = list(/datum/job/ai, /datum/job/cyborg, /datum/job/assistant, /datum/job/janitor, /datum/job/chef, /datum/job/bartender, /datum/job/cargo_assistant,
										/datum/job/engineer_trainee, /datum/job/roboticist, /datum/job/chemist, /datum/job/scientist_assistant, /datum/job/scientist),
		/datum/species/nabber = list(/datum/job/ai, /datum/job/cyborg, /datum/job/janitor, /datum/job/scientist_assistant, /datum/job/chemist,
									 /datum/job/roboticist, /datum/job/cargo_assistant, /datum/job/chef, /datum/job/engineer_trainee, /datum/job/doctor_trainee, /datum/job/bartender),
		/datum/species/vox = list(/datum/job/ai, /datum/job/cyborg, /datum/job/merchant, /datum/job/stowaway)
	)

#define HUMAN_ONLY_JOBS /datum/job/captain, /datum/job/hos
	species_to_job_blacklist = list(
		/datum/species/unathi  		 = list(HUMAN_ONLY_JOBS, /datum/job/iaa),
		/datum/species/unathi/yeosa  = list(HUMAN_ONLY_JOBS, /datum/job/iaa),
		/datum/species/unathi/erosan		 = list(HUMAN_ONLY_JOBS, /datum/job/iaa),
		/datum/species/skrell  		 = list(HUMAN_ONLY_JOBS),
		/datum/species/tajaran 		 = list(HUMAN_ONLY_JOBS),
		/datum/species/machine 		 = list(HUMAN_ONLY_JOBS),
		/datum/species/resomi  		 = list(HUMAN_ONLY_JOBS, /datum/job/iaa, /datum/job/officer, /datum/job/exploration_leader, /datum/job/warden, /datum/job/chief_engineer, /datum/job/rd),
		/datum/species/diona   		 = list(HUMAN_ONLY_JOBS, /datum/job/iaa, /datum/job/officer, /datum/job/exploration_leader, /datum/job/warden),
	)
#undef HUMAN_ONLY_JOBS

	allowed_jobs = list(/datum/job/captain, /datum/job/hop, /datum/job/rd, /datum/job/cmo, /datum/job/chief_engineer, /datum/job/hos,
						/datum/job/iaa, /datum/job/adjutant,
						/datum/job/exploration_leader, /datum/job/explorer, /datum/job/explorer_pilot, /datum/job/explorer_medic, /datum/job/explorer_engineer,
						/datum/job/senior_engineer, /datum/job/engineer, /datum/job/infsys, /datum/job/engineer_trainee,
						/datum/job/warden, /datum/job/detective, /datum/job/officer,
						/datum/job/senior_doctor, /datum/job/doctor, /datum/job/doctor_trainee, /datum/job/chemist, /datum/job/psychiatrist,
						/datum/job/qm, /datum/job/cargo_tech,  /datum/job/cargo_assistant, /datum/job/mining,
						/datum/job/janitor, /datum/job/chef, /datum/job/bartender,
						/datum/job/senior_scientist, /datum/job/scientist, /datum/job/roboticist, /datum/job/scientist_assistant,
						/datum/job/ai, /datum/job/cyborg,
						/datum/job/assistant,
						/datum/job/merchant, /datum/job/merchant_trainee, /datum/job/stowaway
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
// Some jobs for nabber grades defined here due to map-specific job datums.
/decl/cultural_info/education/nabber/New()
	LAZYADD(valid_jobs, /datum/job/scientist_assistant)
	..()

/decl/cultural_info/education/nabber/b/New()
	LAZYADD(valid_jobs, /datum/job/cargo_assistant)
	..()

/decl/cultural_info/education/nabber/a/New()
	LAZYADD(valid_jobs, /datum/job/engineer_trainee)
	..()

/decl/cultural_info/education/nabber/a/plus/New()
	LAZYADD(valid_jobs, /datum/job/doctor_trainee)
	..()