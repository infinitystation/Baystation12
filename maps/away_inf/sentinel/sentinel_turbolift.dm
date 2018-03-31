/obj/turbolift_map_holder/sentinel
	name = "Sentinel turbolift map placeholder"
	icon = 'icons/obj/turbolift_preview_2x2.dmi'
	depth = 2
	lift_size_x = 3
	lift_size_y = 3

	areas_to_use = list(
		/area/turbolift/sentinel_first,
		/area/turbolift/sentinel_second
		)

/area/turbolift/startsent
	name = "\improper Turbolift Start"

/area/turbolift/firstdecksent
	name = "\improper first deck"
	base_turf = /turf/simulated/floor

/area/turbolift/seconddecksenst
	name = "\improper second deck"
	base_turf = /turf/simulated/floor

/area/turbolift/sentinel_second
	name = "lift (upper deck)"
	lift_floor_label = "Deck 1"
	lift_floor_name = "Crew Deck"
	lift_announce_str = "Arriving at Habitation Deck: Секция гаупвахты. Секция экипажа. Столовая. Капсулы криосна. Спасательые капсулы. Туалет."
	base_turf = /turf/simulated/floor

/area/turbolift/sentinel_first
	name = "lift (lower deck)"
	lift_floor_label = "Deck 2"
	lift_floor_name = "Utility Deck"
	lift_announce_str = "Arriving at Hangar Deck: Shuttle Docks. Cargo Storage. Main Hangar. Supply Office. Expedition Preparation. Mineral Processing."
	base_turf = /turf/simulated/floor
