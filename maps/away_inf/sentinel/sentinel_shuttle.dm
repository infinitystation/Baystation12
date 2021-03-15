/datum/shuttle/autodock/overmap/reaper
	name = "Reaper Gunboat"
	warmup_time = 15
	current_location = "nav_hangar_reaper"
	range = 2
	shuttle_area = /area/ship/reaper
	defer_initialisation = TRUE
	flags = SHUTTLE_FLAGS_PROCESS
	skill_needed = SKILL_NONE
	ceiling_type = /turf/simulated/floor/shuttle_ceiling/merc

/obj/machinery/computer/shuttle_control/explore/away_scg_patrol/reaper
	name = "Reaper Shuttle control console"
	req_access = list(access_away_cavalry)
	shuttle_tag = "Reaper Gunboat"

/obj/effect/overmap/visitable/ship/landable/reaper
	name = "Reaper-G"
	desc = "A heavily modified military gunboat of particular design. More of the dropship now, scanner detects heavy alteration to the hull of the vessel and no designation."
	shuttle = "Reaper Gunboat"
	fore_dir = WEST
	color = "#000000"
	vessel_mass = 250
	vessel_size = SHIP_SIZE_TINY

/area/ship/reaper
	name = "\improper Reaper"
	icon_state = "shuttlered"
	base_turf = /turf/simulated/floor
	requires_power = 1
	dynamic_lighting = 1
	area_flags = AREA_FLAG_RAD_SHIELDED

/obj/effect/shuttle_landmark/reaper/start
	name = "Dock"
	landmark_tag = "nav_hangar_reaper"
	base_area = /area/ship/patrol/command/hangar
	base_turf = /turf/simulated/floor/plating
	movable_flags = MOVABLE_FLAG_EFFECTMOVE

/obj/effect/shuttle_landmark/reaper/altdock
	name = "Docking Port"
	landmark_tag = "nav_hangar_reaperalt"


	////////
	//TAGS//
	////////

/*/obj/effect/shuttle_landmark/reaper/hangar
	name = "Reaper Hangar"
	landmark_tag = "nav_hangar_reaper"
	base_area = /area/ship/patrol/command/hangar
	base_turf = /turf/simulated/floor/plating

/obj/effect/shuttle_landmark/reaper/transit
	name = "In transit"
	landmark_tag = "nav_transit_reaper"

/obj/effect/shuttle_landmark/reaper/tdock
	name = "SEV Torch Dock"
	landmark_tag = "nav_reaper_dock"
	docking_controller = "nuke_shuttle_dock_airlock" */
