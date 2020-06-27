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
	name = "Shuttle Crweman"
	movable_flags = MOVABLE_FLAG_EFFECTMOVE

/obj/effect/submap_landmark/spawnpoint/away_patrol/pilot
	name = "Pilot"

/obj/effect/submap_landmark/spawnpoint/away_patrol/corpsman
	name = "Corpsman"

/obj/effect/submap_landmark/spawnpoint/away_patrol/engineer
	name = "Technician"

/* JOBS
 * =======
 */

/datum/job/submap/patrol
	title = "Shuttle Crewman"
	total_positions = 1
	outfit_type = /decl/hierarchy/outfit/job/patrol/crewman
	supervisors = "пилот, ваш офицер"
	info = "Вы просыпаетесь и выходите из криосна, ощущая прохладный воздух на своём лице, а также лёгкую тошноту. \
	Являясь одним из членов экипажа патрульного шаттла 3 флота ЦПСС, ваша задача состоит в патруле и разведке данного сектора. \
	По данным бортового компьютера, поступал неизвестный сигнал о нападении воксов в этом регионе - возможно, потребуется подробная \
	разведка."
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
	supervisors = "коммандование 3-го флота ЦПСС"
	info = "Вы просыпаетесь и выходите из криосна, ощущая прохладный воздух на своём лице, а также лёгкую тошноту. \
	Являясь одним из членов экипажа патрульного шаттла 3 флота ЦПСС, ваша задача состоит в патруле и разведке данного сектора. \
	По данным бортового компьютера, поступал неизвестный сигнал о нападении воксов в этом регионе - возможно, потребуется подробная \
	разведка."
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
	supervisors = "пилот, ваш офицер"
	info = "Вы просыпаетесь и выходите из криосна, ощущая прохладный воздух на своём лице, а также лёгкую тошноту. \
	Являясь одним из членов экипажа патрульного шаттла 3 флота ЦПСС, ваша задача состоит в патруле и разведке данного сектора. \
	По данным бортового компьютера, поступал неизвестный сигнал о нападении воксов в этом регионе - возможно, потребуется подробная \
 	разведка."
	min_skill = list(SKILL_COMBAT  = SKILL_BASIC,
					 SKILL_WEAPONS = SKILL_BASIC,
					 SKILL_HAULING = SKILL_ADEPT,
					 SKILL_MEDICAL = SKILL_EXPERT,
					 SKILL_ANATOMY = SKILL_BASIC,
					 SKILL_CHEMISTRY = SKILL_BASIC,
					 SKILL_EVA = SKILL_BASIC)

/datum/job/submap/patrol/engineer
	title = "Technician"
	total_positions = 1
	outfit_type = /decl/hierarchy/outfit/job/patrol/engineer
	supervisors = "пилот, ваш офицер"
	info = "Вы просыпаетесь и выходите из криосна, ощущая прохладный воздух на своём лице, а также лёгкую тошноту. \
	Являясь одним из членов экипажа патрульного шаттла 3 флота ЦПСС, ваша задача состоит в патруле и разведке данного сектора. \
	По данным бортового компьютера, поступал неизвестный сигнал о нападении воксов в этом регионе - возможно, потребуется подробная \
	разведка."
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
	id_type = /obj/item/weapon/card/id/awaypatrol
	id_slot = slot_wear_id
	pda_type = null
	backpack_contents = list(/obj/random/mre)
	flags = OUTFIT_EXTENDED_SURVIVAL

/decl/hierarchy/outfit/job/patrol/crewman
	name = PATROL_OUTFIT_JOB_NAME("Shuttle Crewman")
	back = /obj/item/weapon/rig/military/equipped/engineer

/decl/hierarchy/outfit/job/patrol/engineer
	name = PATROL_OUTFIT_JOB_NAME("Technician")
	belt = /obj/item/weapon/storage/belt/utility/full
	gloves = /obj/item/clothing/gloves/insulated/black
	back = /obj/item/weapon/rig/military/equipped/engineer

/decl/hierarchy/outfit/job/patrol/corpsman
	name = PATROL_OUTFIT_JOB_NAME("Corpsman")
	uniform = /obj/item/clothing/under/solgov/utility/fleet/medical/away_solpatrol
	belt = /obj/item/weapon/storage/belt/medical/emt/combat
	back = /obj/item/weapon/rig/military/equipped/corpsman

/decl/hierarchy/outfit/job/patrol/pilot
	name = PATROL_OUTFIT_JOB_NAME("Pilot")
	uniform = /obj/item/clothing/under/solgov/utility/fleet/command/pilot/away_solpatrol
	back = /obj/item/weapon/rig/military/equipped/comander

#undef PATROL_OUTFIT_JOB_NAME
