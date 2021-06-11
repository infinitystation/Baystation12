/datum/map/forest
	species_to_job_whitelist = list(
		/datum/species/adherent = list(),
		/datum/species/nabber = list(),
		/datum/species/vox = list(),
		/datum/species/human/mule = list()	//No jobs for those machines of death
	)

	allowed_jobs = list(/datum/job/captain, /datum/job/hop, /datum/job/rd, /datum/job/cmo, /datum/job/chief_engineer, /datum/job/hos,
						/datum/job/iaa, /datum/job/adjutant,
						/datum/job/exploration_leader, /datum/job/explorer, /datum/job/explorer_pilot, /datum/job/explorer_medic, /datum/job/explorer_engineer,
						/datum/job/senior_engineer, /datum/job/engineer, /datum/job/infsys, /datum/job/engineer_trainee,
						/datum/job/warden, /datum/job/detective, /datum/job/officer, /datum/job/security_assistant,
						/datum/job/senior_doctor, /datum/job/doctor, /datum/job/doctor_trainee, /datum/job/chemist, /datum/job/psychiatrist,
						/datum/job/qm, /datum/job/cargo_tech,  /datum/job/cargo_assistant, /datum/job/mining,
						/datum/job/janitor, /datum/job/chef, /datum/job/bartender, /datum/job/chaplain, /datum/job/actor,
						/datum/job/senior_scientist, /datum/job/scientist, /datum/job/roboticist, /datum/job/scientist_assistant,
//						/datum/job/ai, /datum/job/cyborg,		//No borgs or AIs in forest
						/datum/job/assistant,
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

////////////////

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
