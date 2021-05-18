#define WEBHOOK_SUBMAP_LOADED_SOL	"webhook_submap_sol"

/obj/effect/submap_landmark/joinable_submap/away_scg_patrol
	name = "Patrol Ship"
	archetype = /decl/submap_archetype/away_scg_patrol

/decl/submap_archetype/away_scg_patrol
	descriptor = "SCGF Patrol Ship"
	map = "Patrol Ship"
	crew_jobs = list(
		/datum/job/submap/patrol/commander,
		/datum/job/submap/patrol/pilot1,
		/datum/job/submap/patrol,
		/datum/job/submap/patrol/captain,
		/datum/job/submap/patrol/surgeon,
		/datum/job/submap/patrol/engineer
	)
	call_webhook = WEBHOOK_SUBMAP_LOADED_SOL

/obj/effect/submap_landmark/spawnpoint/away_patrol
	name = "Army SCGSO Trooper"
	movable_flags = MOVABLE_FLAG_EFFECTMOVE

/obj/effect/submap_landmark/spawnpoint/away_patrol/captain
	name = "Army SCGSO Leader"

/obj/effect/submap_landmark/spawnpoint/away_patrol/commander
	name = "Fleet Commander"

/obj/effect/submap_landmark/spawnpoint/away_patrol/pilot1
	name = "Fleet Pilot"

/obj/effect/submap_landmark/spawnpoint/away_patrol/surgeon
	name = "Fleet Corpsman"

/obj/effect/submap_landmark/spawnpoint/away_patrol/engineer
	name = "Fleet Technician"

/* ACCESS
 * =======
 */

/var/const/access_away_cavalry = "ACCESS_CAVALRY"
/var/const/access_away_cavalry_ops = "ACCESS_CAVALRY_OPS"
/var/const/access_away_cavalry_captain = "ACCESS_CAVALRY_CAPTAIN"
/var/const/access_away_cavalry_commander = "ACCESS_CAVALRY_COMMANDER"

/datum/access/access_away_cavalry_patrol
	id = access_away_cavalry
	desc = "SPS Main"
	region = ACCESS_REGION_NONE

/datum/access/access_away_cavalry_ops
	id = access_away_cavalry_ops
	desc = "SPS Army"
	region = ACCESS_REGION_NONE

/datum/access/access_away_cavalry_captain
	id = access_away_cavalry_captain
	desc = "SPS Captain"
	region = ACCESS_REGION_NONE

/datum/access/access_away_patrol_commander
	id = access_away_cavalry_commander
	desc = "SPS Commander"
	region = ACCESS_REGION_NONE

/obj/item/card/id/awaycavalry/fleet
	color = COLOR_GRAY40
	detail_color = "#447ab1"
	access = list(access_away_cavalry)

/obj/item/card/id/awaycavalry/ops
	color = "#b10309c2"
	detail_color = "#000000"
	access = list(access_away_cavalry, access_away_cavalry_ops)

/obj/item/card/id/awaycavalry/ops/captain
	access = list(access_away_cavalry, access_away_cavalry_ops, access_away_cavalry_captain)
	extra_details = list("goldstripe")

/obj/item/card/id/awaycavalry/fleet/commander
	access = list(access_away_cavalry, access_away_cavalry_ops, access_away_cavalry_commander)
	extra_details = list("goldstripe")

/* JOBS
 * =======
 */

/datum/job/submap/patrol
	title = "Army SCGSO Trooper"
	total_positions = 2
	outfit_type = /decl/hierarchy/outfit/job/patrol/army_ops
	supervisors = "captain"
	loadout_allowed = TRUE
	is_semi_antagonist = TRUE
	info = "Вы просыпаетесь и выходите из криосна, ощущая прохладный воздух на своём лице, а также лёгкую тошноту. \
	Являясь одним из членов экипажа патрульного корабля 5-го флота ЦПСС, вы - член группы 'Буря', разведовательных войск СОЦПСС. \
	По данным бортового компьютера, поступал сигнал о неизвестных нападениях в этом регионе.\
	\
	 Вам крайне нежелательно приближаться к кораблям и станциям с опозновательными знаками без разрешения от командования группировкой. \
	 Исключением являются те ситуации, когда вы терпите бедствие или на вашем судне аварийная ситуация."
	required_language = LANGUAGE_HUMAN_EURO
	whitelisted_species = list(SPECIES_HUMAN)
	min_skill = list(SKILL_COMBAT  = SKILL_BASIC,
					 SKILL_WEAPONS = SKILL_BASIC,
					 SKILL_HAULING = SKILL_BASIC,
					 SKILL_MEDICAL = SKILL_BASIC,
					 SKILL_EVA = SKILL_BASIC)
	access = list(access_away_cavalry, access_away_cavalry_ops)
	//required_role = list("Sub-Lieutenant", "Ensign")

/datum/job/submap/patrol/captain
	title = "Army SCGSO Leader"
	total_positions = 1
	outfit_type = /decl/hierarchy/outfit/job/patrol/captain
	supervisors = "lieutenant commander, command of the Battle Group Bravo of the 5th fleet, SCGDF"
	loadout_allowed = TRUE
	is_semi_antagonist = TRUE
	info = "Вы просыпаетесь и выходите из криосна, ощущая прохладный воздух на своём лице, а также лёгкую тошноту. \
	Являясь одним из членов соединения, входящего в экипаж патрульного корабля 5-го флота ЦПСС, ваша задача состоит в руководстве группой 'Буря', разведовательных войск СОЦПСС. \
	По данным бортового компьютера, поступал сигнал о неизвестных нападениях в этом регионе.\
	\
	 Вам крайне нежелательно приближаться к кораблям и станциям с опозновательными знаками без разрешения от командования группировкой. \
	 Исключением являются те ситуации, когда вы терпите бедствие или на вашем судне аварийная ситуация."
	required_language = LANGUAGE_HUMAN_EURO
	whitelisted_species = list(SPECIES_HUMAN)
	min_skill = list(SKILL_COMBAT  = SKILL_BASIC,
					 SKILL_WEAPONS = SKILL_BASIC,
					 SKILL_HAULING = SKILL_BASIC,
					 SKILL_MEDICAL = SKILL_BASIC,
					 SKILL_EVA = SKILL_BASIC)
	access = list(access_away_cavalry, access_away_cavalry_ops, access_away_cavalry_captain)
	//required_role = list("Sub-Lieutenant", "Ensign")

/datum/job/submap/patrol/commander
	title = "Fleet Commander"
	total_positions = 1
	outfit_type = /decl/hierarchy/outfit/job/patrol/commander
	supervisors = "command of the Battle Group Bravo of the 5th fleet, SCGDF"
	loadout_allowed = TRUE
	info = "Вы просыпаетесь и выходите из криосна, ощущая прохладный воздух на своём лице, а также лёгкую тошноту. \
	Являясь одним из членов экипажа патрульного корабля 5-го флота ЦПСС, ваша задача состоит в патруле и разведке данного сектора. \
	По данным бортового компьютера, поступал сигнал о неизвестных нападениях в этом регионе.\
	\
	 Вам крайне нежелательно приближаться к кораблям и станциям с опозновательными знаками без разрешения от командования группировкой. \
	 Исключением являются те ситуации, когда вы терпите бедствие или на вашем судне аварийная ситуация."
	min_skill = list(SKILL_COMBAT  = SKILL_BASIC,
					 SKILL_WEAPONS = SKILL_BASIC,
					 SKILL_HAULING = SKILL_BASIC,
					 SKILL_MEDICAL = SKILL_BASIC,
					 SKILL_PILOT = SKILL_ADEPT,
					 SKILL_EVA = SKILL_BASIC)
	access = list(access_away_cavalry, access_away_cavalry_ops, access_away_cavalry_commander)
	//required_role = null

/datum/job/submap/patrol/pilot1
	title = "Fleet Pilot"
	total_positions = 1
	outfit_type = /decl/hierarchy/outfit/job/patrol/pilot1
	supervisors = "lieutenant commander"
	loadout_allowed = TRUE
	info = "Вы просыпаетесь и выходите из криосна, ощущая прохладный воздух на своём лице, а также лёгкую тошноту. \
	Являясь одним из членов экипажа патрульного корабля 5-го флота ЦПСС, ваша задача состоит в пилотировании и руководством экипажа. \
	По данным бортового компьютера, поступал сигнал о неизвестных нападениях в этом регионе.\
	\
	 Вам крайне нежелательно приближаться к кораблям и станциям с опозновательными знаками без разрешения от командования группировкой. \
	 Исключением являются те ситуации, когда вы терпите бедствие или на вашем судне аварийная ситуация."
	min_skill = list(SKILL_COMBAT  = SKILL_BASIC,
					 SKILL_WEAPONS = SKILL_BASIC,
					 SKILL_HAULING = SKILL_BASIC,
					 SKILL_MEDICAL = SKILL_BASIC,
					 SKILL_PILOT = SKILL_ADEPT,
					 SKILL_EVA = SKILL_BASIC)
	access = list(access_away_cavalry)
	//required_role = null

/datum/job/submap/patrol/surgeon
	title = "Fleet Corpsman"
	total_positions = 1
	outfit_type = /decl/hierarchy/outfit/job/patrol/surgeon
	supervisors = "ensign, lieutenant commander"
	loadout_allowed = TRUE
	info = "Вы просыпаетесь и выходите из криосна, ощущая прохладный воздух на своём лице, а также лёгкую тошноту. \
	Являясь одним из членов экипажа патрульного корабля 5-го флота ЦПСС, ваша задача состоит в медицинской поддержке экипажа. \
	\
	 Вам крайне нежелательно приближаться к кораблям и станциям с опозновательными знаками без разрешения от командования группировкой. \
	 Исключением являются те ситуации, когда вы терпите бедствие или на вашем судне аварийная ситуация."
	min_skill = list(SKILL_COMBAT  = SKILL_BASIC,
					 SKILL_WEAPONS = SKILL_BASIC,
					 SKILL_HAULING = SKILL_ADEPT,
					 SKILL_MEDICAL = SKILL_EXPERT,
					 SKILL_ANATOMY = SKILL_BASIC,
					 SKILL_CHEMISTRY = SKILL_BASIC,
					 SKILL_EVA = SKILL_BASIC)
	access = list(access_away_cavalry)

/datum/job/submap/patrol/engineer
	title = "Fleet Technician"
	total_positions = 1
	outfit_type = /decl/hierarchy/outfit/job/patrol/engineer
	supervisors = "ensign, lieutenant commander"
	loadout_allowed = TRUE
	info = "Вы просыпаетесь и выходите из криосна, ощущая прохладный воздух на своём лице, а также лёгкую тошноту. \
	Являясь одним из членов экипажа патрульного корабля 5-го флота ЦПСС, ваша задача состоит в поддержании работоспособности судна и экипировки экипажа. \
	\
	 Вам крайне нежелательно приближаться к кораблям и станциям с опозновательными знаками без разрешения от командования группировкой. \
	 Исключением являются те ситуации, когда вы терпите бедствие или на вашем судне аварийная ситуация."
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
	access = list(access_away_cavalry)


/* BRANCH & RANKS
 * =======
 
/datum/mil_branch/scgdf
	name = "Sol Central Government Defence Forces"
	name_short = "SCGDF"
	email_domain = "sol.gov"

	rank_types = list(/datum/mil_rank/skrell_fleet)
	spawn_rank_types = list(/datum/mil_rank/skrell_fleet)

/datum/mil_rank/skrell_fleet
	name = "NULL"

/datum/job/submap/sentinel_crew/equip(var/mob/living/carbon/human/H, var/alt_title, var/datum/mil_branch/branch, var/datum/mil_rank/grade)
	. = ..(H, alt_title, branch, grade)
	
	var/milbranches = list(
		"Malish-Katish" = list(
			"Mero'ta-Ketish",
			"Toglo'i-Ketish"
		),
		"Kanin-Katish" = list(
			"Xiqarr-Ketish",
			"Mero'tol-Ketish",
			"Goxo'i-Ketish"
		),
		"Raskinta-Katish" = list(
			"Me'kerr-Ketish",
			"Qi'kerr-Ketish",
			"Me'xoal-Ketish"
		)
	)

	var/milbranch = input(H, "What was your branch before SOCOM?", "SCGDF Branch") as null|anything in milbranches
	if(milbranch)
		var/milsubbranch = input(H, "What is your assignment now?", "SCGDF Assignment") as null|anything in milbranches[milbranch]
		var/obj/item/card/id/C = H.wear_id
		if(istype(C))
			C.assignment = milsubbranch
*/

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
	r_pocket = /obj/item/crowbar/prybar
	suit_store = /obj/item/tank/oxygen
	id_types = list(/obj/item/card/id/awaycavalry/fleet)
	id_slot = slot_wear_id
	pda_type = null
	belt = null
	back = null
	backpack_contents = null
	flags = OUTFIT_EXTENDED_SURVIVAL

/decl/hierarchy/outfit/job/patrol/army_ops
	name = PATROL_OUTFIT_JOB_NAME("Ops")
	head = /obj/item/clothing/head/solgov/utility/army/urban
	uniform = /obj/item/clothing/under/solgov/utility/army/urban/away_solpatrol
	id_types = list(/obj/item/card/id/awaycavalry/ops)
	gloves = /obj/item/clothing/gloves/thick/combat/marine

/decl/hierarchy/outfit/job/patrol/captain
	name = PATROL_OUTFIT_JOB_NAME("Captain")
	head = /obj/item/clothing/head/solgov/utility/army/urban
	uniform = /obj/item/clothing/under/solgov/utility/army/urban/away_solpatrol/captain
	id_types = list(/obj/item/card/id/awaycavalry/ops/captain)
	gloves = /obj/item/clothing/gloves/thick/combat/marine

/decl/hierarchy/outfit/job/patrol/engineer
	name = PATROL_OUTFIT_JOB_NAME("Technician")
	uniform = /obj/item/clothing/under/solgov/utility/fleet/engineering/away_solpatrol
	belt = /obj/item/storage/belt/holster/general/away_solpatrol
	gloves = /obj/item/clothing/gloves/insulated/black

/decl/hierarchy/outfit/job/patrol/surgeon
	name = PATROL_OUTFIT_JOB_NAME("Doctor")
	uniform = /obj/item/clothing/under/solgov/utility/fleet/medical/away_solpatrol
	belt = /obj/item/storage/belt/holster/general/away_solpatrol
	gloves = /obj/item/clothing/gloves/latex/nitrile

/decl/hierarchy/outfit/job/patrol/commander
	name = PATROL_OUTFIT_JOB_NAME("Lieutenant Commander")
	head = /obj/item/clothing/head/beret/solgov/fleet/branch/fifth
	uniform = /obj/item/clothing/under/solgov/utility/fleet/officer/command/commander/away_solpatrol
	belt = /obj/item/storage/belt/holster/general/away_solpatrol
	id_types = list(/obj/item/card/id/awaycavalry/fleet/commander)
	gloves = /obj/item/clothing/gloves/thick/duty/solgov/cmd

/decl/hierarchy/outfit/job/patrol/pilot1
	name = PATROL_OUTFIT_JOB_NAME("Ensign")
	head = /obj/item/clothing/head/beret/solgov/fleet/branch/fifth
	uniform = /obj/item/clothing/under/solgov/utility/fleet/officer/pilot1/away_solpatrol
	belt = /obj/item/storage/belt/holster/general/away_solpatrol
	gloves = /obj/item/clothing/gloves/thick/duty/rivalgloves

#undef PATROL_OUTFIT_JOB_NAME
#undef WEBHOOK_SUBMAP_LOADED_SOL
