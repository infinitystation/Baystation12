
/area/salvage/
	name = "vi kto takie ya vas ne zval idite....."
	icon = 'infinity/icons/turf/salvage_areas.dmi'

/area/salvage/engineering
	name = "Engineering compartment"
	icon_state = "engineering"

/area/salvage/hygiene
	name = "Hygiene compartment"
	icon_state = "hyg"

/area/salvage/storage
	name = "Storage compartment"
	icon_state = "str"

/area/salvage/canteen
	name = "Canteen-medical-bay compartment"
	icon_state = "cnt"

/area/salvage/bridge
	name = "Bridge compartment"
	icon_state = "bridge"

/area/salvage/captain
	name = "Captain's room"
	icon_state = "cpt"

/obj/effect/overmap/ship/landable/salvage
	name = "PSV Pancake"
	fore_dir = WEST
	vessel_mass = 10
	start_x = 4
	start_y = 5
	base = TRUE
	color = LIGHT_COLOR_PURPLE
	icon_state = "ship_salvage"
	moving_state = "ship_salvage_moving"
	icon = 'icons/obj/overmap_inf.dmi'

/decl/submap_archetype/derelict/salvage/
	descriptor = "salvage"
	map = "PSV Pancake"
	crew_jobs = list(
		/datum/job/submap/salvage_capt,
		/datum/job/submap/salvage_eng,
		/datum/job/submap/salvage_sec
	)

datum/map_template/ruin/away_site/salvagers
	name = "PSV Pancake"
	id = "awaysite_salvagers"
	description = "A light trader vessel."
	prefix = "maps/away_inf/"
	suffixes = list("salvagers/salvagers.dmm")
	cost = 0
	accessibility_weight = 10
	template_flags = TEMPLATE_FLAG_SPAWN_GUARANTEED

/datum/map/salvagers
	allowed_jobs = list(/datum/job/submap/salvage_capt, /datum/job/submap/salvage_eng, /datum/job/submap/salvage_sec)

/var/const/access_salvage = 3074
/datum/access/salvage
	id = access_salvage
	desc = "PSV Pancake"
	region = ACCESS_TYPE_NONE

/var/const/access_salvage_capt = 3075
/datum/access/salvage/capt
	id = access_salvage_capt
	desc = "PSV Pancake - Captain"
	region = ACCESS_TYPE_NONE

/datum/job/submap/salvage_capt
	title = "Salvage vessel - captain"
	department = "Civilian"
	department_flag = CIV
	total_positions = 1
	spawn_positions = 1
	supervisors = "the invisible hand of the market"
	selection_color = "#515151"
	ideal_character_age = 30
	minimal_player_age = 7
	create_record = 0
	outfit_type = /decl/hierarchy/outfit/job/sierra/salvage_capt
	allowed_branches = list(/datum/mil_branch/civilian)
	allowed_ranks = list(/datum/mil_rank/civ/civ)
	latejoin_at_spawnpoints = 1

	access = list(access_salvage, access_salvage_capt)
	minimal_access = list()

	announced = FALSE
	min_skill = list(	SKILL_FINANCE = SKILL_ADEPT,
						SKILL_PILOT	  = SKILL_BASIC)
	skill_points = 24

/datum/job/submap/salvage_eng
	title = "Salvage vessel - engineer"
	department = "Civilian"
	department_flag = CIV

	total_positions = 1
	spawn_positions = 1
	supervisors = "the salvage vessel captain"
	selection_color = "#515151"
	ideal_character_age = 25
	minimal_player_age = 0
	create_record = 0
	outfit_type = /decl/hierarchy/outfit/job/sierra/salvage_eng
	allowed_branches = list(/datum/mil_branch/civilian)
	allowed_ranks = list(/datum/mil_rank/civ/civ)
	latejoin_at_spawnpoints = 1
	access = list(access_salvage)
	announced = FALSE
	min_skill = list(   SKILL_EVA          = SKILL_ADEPT,
	                    SKILL_CONSTRUCTION = SKILL_ADEPT,
	                    SKILL_ELECTRICAL   = SKILL_BASIC,
	                    SKILL_ENGINES      = SKILL_BASIC,
	                    SKILL_PILOT = SKILL_BASIC)

	max_skill = list(   SKILL_COMBAT  = SKILL_MAX,
	                    SKILL_WEAPONS = SKILL_MAX)

	skill_points = 24

/datum/job/submap/salvage_sec
	title = "Salvage vessel - security"
	department = "Civilian"
	department_flag = CIV

	total_positions = 1
	spawn_positions = 1
	supervisors = "the salvage vessel captain"
	selection_color = "#515151"
	ideal_character_age = 25
	minimal_player_age = 0
	create_record = 0
	outfit_type = /decl/hierarchy/outfit/job/sierra/salvage_sec
	allowed_branches = list(/datum/mil_branch/civilian)
	allowed_ranks = list(/datum/mil_rank/civ/civ)
	latejoin_at_spawnpoints = 1
	access = list(access_salvage)
	announced = FALSE
	min_skill = list(   SKILL_FINANCE = SKILL_BASIC,
	                    SKILL_EVA          = SKILL_ADEPT,
	                    SKILL_CONSTRUCTION = SKILL_BASIC,
	                    SKILL_ENGINES      = SKILL_BASIC,
	                    SKILL_COMBAT  = SKILL_BASIC,
	                    SKILL_WEAPONS = SKILL_BASIC)

	max_skill = list(   SKILL_COMBAT  = SKILL_MAX,
	                    SKILL_WEAPONS = SKILL_MAX)

	skill_points = 24

/decl/hierarchy/outfit/job/sierra/salvage_eng
	name = OUTFIT_JOB_NAME("Salvage vessel - Engineer")
	uniform = /obj/item/clothing/under/hazard
	shoes = /obj/item/clothing/shoes/brown
	id_type = /obj/item/weapon/card/id/sierra/salvage/eng

/decl/hierarchy/outfit/job/sierra/salvage_sec
	name = OUTFIT_JOB_NAME("Salvage vessel - Security")
	uniform = /obj/item/clothing/under/syndicate/tacticool
	suit = /obj/item/clothing/suit/armor/pcarrier/light
	shoes = /obj/item/clothing/shoes/jackboots
	id_type = /obj/item/weapon/card/id/sierra/salvage/sec

/decl/hierarchy/outfit/job/sierra/salvage_capt
	name = OUTFIT_JOB_NAME("Salvage vessel - Captain - sierra")
	uniform = /obj/item/clothing/under/suit_jacket/charcoal
	shoes = /obj/item/clothing/shoes/laceup
	id_type = /obj/item/weapon/card/id/sierra/salvage/leader

/obj/item/weapon/card/id/sierra/salvage/eng
	desc = "An identification card issued to Merchants-salvagers. This one have orange stripe."
	icon_state = "trader"
	job_access_type = /datum/job/submap/salvage_eng

/obj/item/weapon/card/id/sierra/salvage/sec
	desc = "An identification card issued to Merchants-salvagers. This one have red stripe."
	icon_state = "trader"
	job_access_type = /datum/job/submap/salvage_sec

/obj/item/weapon/card/id/sierra/salvage/leader
	desc = "An identification card issued to Merchant-Salvagers Leaders, this one have blue stripe, indicating their right to salvage, sell and buy goods."
	job_access_type = /datum/job/submap/salvage_capt

/datum/computer_file/program/merchant/salvage
	required_access = 3075

/obj/item/modular_computer/console/preset/merchant/salvage/install_default_programs()
	hard_drive.store_file(new/datum/computer_file/program/merchant/salvage())
	hard_drive.store_file(new/datum/computer_file/program/wordprocessor())
