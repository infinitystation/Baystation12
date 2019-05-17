
/obj/effect/overmap/ship/tajsciship
	name = "light tajaran station"
	fore_dir = WEST
	vessel_mass = 64000
	base = TRUE
	color = "#800080"
	icon = 'maps/away_inf/tajsc/tajsciship.dmi'
	icon_state = "shipstay"
	moving_state = "shipmove"
	start_x = 23
	start_y = 27
	initial_generic_waypoints = list("nav_tajsciship_start", "nav_tajbase_1", "nav_tajbase_2")
	initial_restricted_waypoints = list(
	"CCA EC Shuttle" = list("nav_tajscishuttle_dock")
	)

/obj/effect/overmap/ship/landable/tajscishuttle
	name = "CCA EC Shuttle"
	shuttle = "CCA EC Shuttle"
	fore_dir = WEST
	color = "#800080"
	max_speed = 1/(2 SECONDS)
	burn_delay = 2 SECONDS

/datum/shuttle/autodock/overmap/tajscishuttle
	name = "CCA EC Shuttle"
	warmup_time = 5
	shuttle_area = /area/ship/tajscishuttle
	current_location = "nav_tajscishuttle_dock"
	range = 2
	logging_home_tag = "Hangar"
	logging_access =  access_tajsciship
	ceiling_type = /turf/simulated/floor/reinforced
	sound_takeoff = 'sound/effects/rocket.ogg'
	sound_landing = 'sound/effects/rocket_backwards.ogg'

/obj/effect/shuttle_landmark/tajscishuttle/start
	name = "Dock"
	landmark_tag = "nav_tajscishuttle_dock"
	base_area = /area/ship/tajsciship/mainzone
	base_turf = /turf/simulated/floor/plating

/obj/effect/shuttle_landmark/tajscishuttle/nav1
	name = "Space near light station"
	landmark_tag = "nav_tajbase_1"

/obj/effect/shuttle_landmark/tajscishuttle/hang
	name = "Hangar"
	landmark_tag = "nav_tajbase_2"
