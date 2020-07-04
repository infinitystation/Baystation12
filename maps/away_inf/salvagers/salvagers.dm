
#include "salvagers.dmm"

/area/salvage/
	name = "salvage"
	area_flags = AREA_FLAG_RAD_SHIELDED
	icon = 'infinity/icons/turf/salvage_areas.dmi'

/area/salvage/engineering
	name = "Engineering compartment"
	icon_state = "engineering"

/area/salvage/shuttle
	name = "Salvage shuttle"
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

/obj/effect/overmap/visitable/ship/salvage
	name = "PSV Pancake"
	fore_dir = WEST
	vessel_mass = 10
	start_x = 4
	start_y = 5
	color = "#2f4f4f"
	icon = 'icons/obj/overmap_inf.dmi'
	icon_state = "ship_salvage"
	moving_state = "ship_salvage_moving"
	base = TRUE
	initial_generic_waypoints = list(
		"nav_salvage_start",
		"nav_salvage_bridge",
		"nav_salvage_left",
		"nav_salvage_right",
		"nav_salvage_eng"
	)


/obj/effect/submap_landmark/joinable_submap/salvage
	name = "PSV Pancake"
	archetype = /decl/submap_archetype/salvage/

/obj/effect/submap_landmark/spawnpoint/salvage/capt
	name = "Salvage vessel - captain"

/obj/effect/submap_landmark/spawnpoint/salvage/eng
	name = "Salvage vessel - engineer"

/obj/effect/submap_landmark/spawnpoint/salvage/sec
	name = "Salvage vessel - security"

/decl/submap_archetype/salvage/
	descriptor = "Salvage"
	map = "PSV Pancake"
	crew_jobs = list(
		/datum/job/submap/salvage_capt,
		/datum/job/submap/salvage_eng,
		/datum/job/submap/salvage_sec
	)

/datum/map_template/ruin/away_site/salvagers
	name = "PSV Pancake"
	id = "awaysite_salvagers"
	description = "A light trader vessel."
	prefix = "maps/away_inf/"
	suffixes = list("salvagers/salvagers.dmm")
	cost = 0
	accessibility_weight = 10
	template_flags = TEMPLATE_FLAG_SPAWN_GUARANTEED

/obj/machinery/computer/shuttle_control/explore/salvage
	name = "shuttle control console"
	req_access = list(access_salvage)
	shuttle_tag = "Salvage shuttle"

/datum/shuttle/autodock/overmap/salvage
	name = "Salvage shuttle"
	shuttle_area = /area/salvage/shuttle
	dock_target = "nav_deck1_salvage"
	current_location = "nav_salvage_start"
	warmup_time = 10
	move_time = 5
	landmark_transition = "nav_transit_salvage"
	sound_takeoff = 'sound/effects/rocket.ogg'
	sound_landing = 'sound/effects/rocket_backwards.ogg'
	fuel_consumption = 0
	logging_home_tag = "nav_salvage_start"
	logging_access = access_salvage
	range = 3
	ceiling_type = /turf/space

/obj/effect/overmap/visitable/ship/landable/salvage
	name = "Salvage shuttle"
	shuttle = "Salvage shuttle"
	fore_dir = SOUTH

/obj/effect/shuttle_landmark/salvage/start
	name = "Salvage ship - docking port"
	landmark_tag = "nav_salvage_start"
	base_area = /area/space

/obj/effect/shuttle_landmark/salvage/bridge
	name = "Salvage ship - near bridge"
	landmark_tag = "nav_salvage_bridge"

/obj/effect/shuttle_landmark/salvage/left
	name = "Salvage ship - near left board"
	landmark_tag = "nav_salvage_left"

/obj/effect/shuttle_landmark/salvage/right //terror?
	name = "Salvage ship - near right board"
	landmark_tag = "nav_salvage_right"

/obj/effect/shuttle_landmark/salvage/eng
	name = "Salvage ship - near engineering"
	landmark_tag = "nav_salvage_eng"


/*/map/salvagers
	allowed_jobs = list(/datum/job/submap/salvage_capt, /datum/job/submap/salvage_eng, /datum/job/submap/salvage_sec)*/

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
	min_skill = list(SKILL_FINANCE = SKILL_ADEPT,
						SKILL_PILOT = SKILL_ADEPT,
						SKILL_EVA = SKILL_ADEPT,
						SKILL_CONSTRUCTION = SKILL_BASIC,
						SKILL_ENGINES = SKILL_BASIC)

	max_skill = list(   SKILL_COMBAT  = SKILL_MAX,
	                    SKILL_WEAPONS = SKILL_MAX)

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
	suit = /obj/item/clothing/suit/storage/hazardvest
	shoes = /obj/item/clothing/shoes/workboots
	id_type = /obj/item/weapon/card/id/sierra/merchant/salvage/eng
	r_pocket = /obj/item/device/radio/off
	belt = /obj/item/weapon/storage/belt/utility/full
	flags = OUTFIT_HAS_BACKPACK|OUTFIT_EXTENDED_SURVIVAL

/decl/hierarchy/outfit/job/sierra/salvage_sec
	name = OUTFIT_JOB_NAME("Salvage vessel - Security")
	uniform = /obj/item/clothing/under/syndicate/tacticool
	suit = /obj/item/clothing/suit/armor/pcarrier/light
	shoes = /obj/item/clothing/shoes/jackboots
	id_type = /obj/item/weapon/card/id/sierra/merchant/salvage/sec
	r_pocket = /obj/item/device/radio/off
	belt = /obj/item/weapon/storage/belt/holster/general/
	flags = OUTFIT_HAS_BACKPACK|OUTFIT_EXTENDED_SURVIVAL

/decl/hierarchy/outfit/job/sierra/salvage_capt
	name = OUTFIT_JOB_NAME("Salvage vessel - Captain - sierra")
	uniform = /obj/item/clothing/under/suit_jacket/charcoal
	shoes = /obj/item/clothing/shoes/laceup
	id_type = /obj/item/weapon/card/id/sierra/merchant/salvage/leader
	r_pocket = /obj/item/device/radio/off
	flags = OUTFIT_HAS_BACKPACK|OUTFIT_EXTENDED_SURVIVAL

/obj/item/weapon/card/id/sierra/merchant/salvage/eng
	desc = "An identification card issued to Merchants-salvagers. This one have orange stripe."
	icon_state = "trader"
	job_access_type = /datum/job/submap/salvage_eng
	access = access_salvage

/obj/item/weapon/card/id/sierra/merchant/salvage/sec
	desc = "An identification card issued to Merchants-salvagers. This one have red stripe."
	icon_state = "trader"
	job_access_type = /datum/job/submap/salvage_sec
	access = access_salvage

/obj/item/weapon/card/id/sierra/merchant/salvage/leader
	desc = "An identification card issued to Merchant-Salvagers Leaders, this one have blue stripe, indicating their right to salvage, sell and buy goods."
	icon_state = "trader"
	job_access_type = /datum/job/submap/salvage_capt
	access = list(access_salvage, access_salvage_capt)

/datum/computer_file/program/merchant/salvage
	required_access = access_salvage
	requires_ntnet = 0

/obj/machinery/computer/modular/preset/merchant/salvage/install_default_programs()
	hard_drive.store_file(new/datum/computer_file/program/merchant/salvage())
	hard_drive.store_file(new/datum/computer_file/program/wordprocessor())

/obj/item/weapon/paper/salvage_pacman
	name = "note"
	info = "П.А.К.М.А.Н. включать на второю мощность. Хватает для питания корабля, и не выделяет радиацию."
