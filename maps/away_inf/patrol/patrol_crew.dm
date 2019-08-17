/obj/effect/submap_landmark/joinable_submap/away_scg_patrol
	name = "Patrol Ship"
	archetype = /decl/submap_archetype/away_scg_patrol

/decl/submap_archetype/away_scg_patrol
	descriptor = "SCGF Patrol Ship"
	map = "Patrol Ship"
	crew_jobs = list(
		/datum/job/submap/patrol,
		/datum/job/submap/patrol/pilot,
		/datum/job/submap/patrol/corpsman,
		/datum/job/submap/patrol/engineer
	)

/obj/effect/submap_landmark/spawnpoint/away_patrol
	name = "Crewman"
	movable_flags = MOVABLE_FLAG_EFFECTMOVE

/obj/effect/submap_landmark/spawnpoint/away_patrol/pilot
	name = "Pilot"

/obj/effect/submap_landmark/spawnpoint/away_patrol/corpsman
	name = "Corpsman"

/obj/effect/submap_landmark/spawnpoint/away_patrol/engineer
	name = "Engineer"

/* JOBS
 * =======
 */

/datum/job/submap/patrol
	title = "Crewman"
	total_positions = 2
	outfit_type = /decl/hierarchy/outfit/job/patrol/crewman
	supervisors = "the Pilot, an officer"
	info = "You remember waking up to alarms blaring in your face. Before you could react, a gush of hot air blew \
	you away, knocking you cold unconcious.  Before this happened you were a crew member \
	on this research vessel, SRV Verne, as it carried the members of the presitigous Ceti Technical institute in \
	their pursuit of research. "
	required_language = LANGUAGE_HUMAN_EURO
	whitelisted_species = list(SPECIES_HUMAN)
	min_skill = list(SKILL_COMBAT  = SKILL_BASIC,
					 SKILL_WEAPONS = SKILL_BASIC,
					 SKILL_HAULING = SKILL_BASIC,
					 SKILL_MEDICAL = SKILL_BASIC,
					 SKILL_EVA = SKILL_BASIC)
	access = list(access_away_patrol)

/datum/job/submap/patrol/pilot
	title = "Pilot"
	total_positions = 1
	outfit_type = /decl/hierarchy/outfit/job/patrol/pilot
	supervisors = "SCGF Command"
	info = "You remember waking up to alarms blaring in your face. Before you could react, a gush of hot air blew \
	you away, knocking you cold unconcious.  Before this happened you were a crew member \
	on this research vessel, SRV Verne, as it carried the members of the presitigous Ceti Technical institute in \
	their pursuit of research. "
	min_skill = list(SKILL_COMBAT  = SKILL_BASIC,
					 SKILL_WEAPONS = SKILL_BASIC,
					 SKILL_HAULING = SKILL_BASIC,
					 SKILL_MEDICAL = SKILL_BASIC,
					 SKILL_PILOT = SKILL_ADEPT,
					 SKILL_EVA = SKILL_BASIC)

/datum/job/submap/patrol/corpsman
	title = "Corpsman"
	total_positions = 1
	outfit_type = /decl/hierarchy/outfit/job/patrol/corpsman
	info = "You remember waking up to alarms blaring in your face. Before you could react, a gush of hot air blew \
	you away, knocking you cold unconcious.  Before this happened you were a crew member \
	on this research vessel, SRV Verne, as it carried the members of the presitigous Ceti Technical institute in \
	their pursuit of research. "
	min_skill = list(SKILL_COMBAT  = SKILL_BASIC,
					 SKILL_WEAPONS = SKILL_BASIC,
					 SKILL_HAULING = SKILL_ADEPT,
					 SKILL_MEDICAL = SKILL_EXPERT,
					 SKILL_ANATOMY = SKILL_BASIC,
					 SKILL_CHEMISTRY = SKILL_BASIC,
					 SKILL_EVA = SKILL_BASIC)

/datum/job/submap/patrol/engineer
	title = "Engineer"
	total_positions = 1
	outfit_type = /decl/hierarchy/outfit/job/patrol/engineer
	info = "You remember waking up to alarms blaring in your face. Before you could react, a gush of hot air blew \
	you away, knocking you cold unconcious.  Before this happened you were a crew member \
	on this research vessel, SRV Verne, as it carried the members of the presitigous Ceti Technical institute in \
	their pursuit of research. "
	min_skill = list(SKILL_COMBAT  = SKILL_BASIC,
					 SKILL_WEAPONS = SKILL_BASIC,
					 SKILL_HAULING = SKILL_ADEPT,
					 SKILL_MEDICAL = SKILL_BASIC,
					 SKILL_EVA = SKILL_ADEPT,
					 SKILL_CONSTRUCTION = SKILL_ADEPT,
					 SKILL_ELECTRICAL = SKILL_ADEPT,
					 SKILL_ATMOS  = SKILL_BASIC,
					 SKILL_ENGINES = SKILL_ADEPT,
					 SKILL_DEVICES = SKILL_BASIC)

/* OUTFITS
 * =======
 */

#define PATROL_OUTFIT_JOB_NAME(job_name) ("SCG Patrol Ship - Job - " + job_name)

/decl/hierarchy/outfit/job/patrol
	hierarchy_type = /decl/hierarchy/outfit/job/patrol
	uniform = /obj/item/clothing/under/solgov/utility/fleet/away_solpatrol
	shoes = /obj/item/clothing/shoes/dutyboots
	l_ear = /obj/item/device/radio/headset/rescue
	l_pocket = /obj/item/device/radio
	r_pocket = /obj/item/weapon/crowbar/prybar
	suit_store = /obj/item/weapon/tank/oxygen
	belt = /obj/item/weapon/storage/belt/holster/security/away_patrol
	back = /obj/item/weapon/storage/backpack/rucksack/navy
	id_type = /obj/item/weapon/card/id/awaypatrol
	id_slot = slot_wear_id
	pda_type = null
	backpack_contents = list(/obj/random/mre)
	flags = OUTFIT_EXTENDED_SURVIVAL

/decl/hierarchy/outfit/job/patrol/crewman
	name = PATROL_OUTFIT_JOB_NAME("Crewman")

/decl/hierarchy/outfit/job/patrol/engineer
	name = PATROL_OUTFIT_JOB_NAME("Engineer")
	belt = /obj/item/weapon/storage/belt/utility/full
	gloves = /obj/item/clothing/gloves/insulated/black

/decl/hierarchy/outfit/job/patrol/corpsman
	name = PATROL_OUTFIT_JOB_NAME("Corpsman")
	uniform = /obj/item/clothing/under/solgov/utility/fleet/medical/away_solpatrol
	belt = /obj/item/weapon/storage/belt/medical/emt/combat

/decl/hierarchy/outfit/job/patrol/pilot
	name = PATROL_OUTFIT_JOB_NAME("Pilot")
	uniform = /obj/item/clothing/under/solgov/utility/fleet/command/pilot/away_solpatrol

#undef PATROL_OUTFIT_JOB_NAME
