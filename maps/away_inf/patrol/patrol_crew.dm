#define WEBHOOK_SUBMAP_LOADED_SOL	"webhook_submap_sol"

/obj/effect/submap_landmark/joinable_submap/away_scg_patrol
	name = "Patrol Ship"
	archetype = /decl/submap_archetype/away_scg_patrol

/decl/submap_archetype/away_scg_patrol
	descriptor = "SCGF Patrol Ship"
	map = "Patrol Ship"
	crew_jobs = list(
		/datum/job/submap/patrol/pilot,
		/datum/job/submap/patrol/pilot2,
		/datum/job/submap/patrol,
		/datum/job/submap/patrol/corpsman,
		/datum/job/submap/patrol/engineer
	)
	call_webhook = WEBHOOK_SUBMAP_LOADED_SOL

/obj/effect/submap_landmark/spawnpoint/away_patrol
	name = "Rifleman"
	movable_flags = MOVABLE_FLAG_EFFECTMOVE

/obj/effect/submap_landmark/spawnpoint/away_patrol/pilot
	name = "Sub-Lieutenant"

/obj/effect/submap_landmark/spawnpoint/away_patrol/pilot2
	name = "Pilot"

/obj/effect/submap_landmark/spawnpoint/away_patrol/corpsman
	name = "Corpsman"

/obj/effect/submap_landmark/spawnpoint/away_patrol/engineer
	name = "Technician"

/* ACCESS
 * =======
 */

/var/const/access_away_patrol = "ACCESS_AWAYPATROL"
/var/const/access_away_patrol_captain = "ACCESS_AWAYPATROL_CAPTAIN"

/datum/access/away_patrol
	id = access_away_patrol
	desc = "SPS Crewman"
	region = ACCESS_REGION_NONE

/datum/access/away_patrol_captain
	id = access_away_patrol_captain
	desc = "SPS Captain"
	region = ACCESS_REGION_NONE

/obj/item/weapon/card/id/awaypatrol
	color = COLOR_GRAY40
	detail_color = "#7331c4"
	access = list(access_away_patrol)

/obj/item/weapon/card/id/awaypatrol/captain
	access = list(access_away_patrol, access_away_patrol_captain)
	extra_details = list("goldstripe")

/* JOBS
 * =======
 */

/datum/job/submap/patrol
	title = "Rifleman"
	total_positions = 1
	outfit_type = /decl/hierarchy/outfit/job/patrol/crewman
	supervisors = "пилот, ваш офицер"
	loadout_allowed = FALSE
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
	title = "Sub-Lieutenant"
	total_positions = 1
	outfit_type = /decl/hierarchy/outfit/job/patrol/pilot
	supervisors = "коммандование 3-го флота ЦПСС"
	loadout_allowed = FALSE
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

/datum/job/submap/patrol/pilot2
	title = "Pilot"
	total_positions = 1
	outfit_type = /decl/hierarchy/outfit/job/patrol/pilot2
	supervisors = "пилот, ваш офицер"
	loadout_allowed = FALSE
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
	loadout_allowed = FALSE
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
	loadout_allowed = FALSE
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
	l_ear = /obj/item/device/radio/headset/away_scg_patrol
	l_pocket = /obj/item/device/radio
	r_pocket = /obj/item/weapon/crowbar/prybar
	suit_store = /obj/item/weapon/tank/oxygen
	id_type = /obj/item/weapon/card/id/awaypatrol
	id_slot = slot_wear_id
	pda_type = null
	belt = /obj/item/weapon/gun/projectile/pistol/military
	back = /obj/item/weapon/storage/backpack/rucksack/navy
	backpack_contents = list(/obj/random/mre)
	flags = OUTFIT_EXTENDED_SURVIVAL

/decl/hierarchy/outfit/job/patrol/crewman
	name = PATROL_OUTFIT_JOB_NAME("Crewman")


/decl/hierarchy/outfit/job/patrol/engineer
	name = PATROL_OUTFIT_JOB_NAME("Technician")
	belt = /obj/item/weapon/storage/belt/utility/full
	gloves = /obj/item/clothing/gloves/insulated/black

/decl/hierarchy/outfit/job/patrol/corpsman
	name = PATROL_OUTFIT_JOB_NAME("Corpsman")
	uniform = /obj/item/clothing/under/solgov/utility/fleet/medical/away_solpatrol


/decl/hierarchy/outfit/job/patrol/pilot
	name = PATROL_OUTFIT_JOB_NAME("Sub-Lieutenant")
	uniform = /obj/item/clothing/under/solgov/utility/fleet/command/pilot/away_solpatrol
	id_type = /obj/item/weapon/card/id/awaypatrol/captain

/decl/hierarchy/outfit/job/patrol/pilot2
	name = PATROL_OUTFIT_JOB_NAME("Pilot")
	uniform = /obj/item/clothing/under/solgov/utility/fleet/command/pilot2/away_solpatrol
	id_type = /obj/item/weapon/card/id/awaypatrol/captain

#undef PATROL_OUTFIT_JOB_NAME
#undef WEBHOOK_SUBMAP_LOADED_SOL
