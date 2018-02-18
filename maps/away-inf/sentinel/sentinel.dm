#include "sentinel_areas.dm"
#include "sentinel_shuttle.dm"
#include "sentinel_crew.dm"
#include "sentinel_presets.dm"

/obj/effect/overmap/ship/patrol
	name = "Cobra-Class Craft"
	color = "#990000"
	fore_dir = WEST
	vessel_mass = 120
	default_delay = 20 SECONDS
	start_x = 15
	start_y = 15

	restricted_waypoints = list("Albatross" = list("nav_hangar_calypso"))
	generic_waypoints = list(
		"nav_patrol_1",
		"nav_patrol_2",
		"nav_patrol_3",
		"nav_patrol_4"
		)

/obj/effect/overmap/ship/patrol/New()
	name = "SPC [pick("Sentinel","Swordfish","Rescuer","Cobra","Cavalry","Anchor","God's hand","Boxi","Scarabaeus","Purposeful","Helios")], \a [name]"
	for(var/area/ship/patrol/A)
		A.name = "\improper [name] - [A.name]"
		GLOB.using_map.area_purity_test_exempt_areas += A.type
	..()

/datum/map_template/ruin/away_site/patrol
	name = "Sol Patrol Ship (ERT)"
	id = "awaysite_patrol_ship"
	description = "A saviour for souls of SEV Torch's crew."
	prefix = "maps/away-inf/"
	suffixes = list("sentinel/sentinel-1.dmm", "sentinel/sentinel-2.dmm")
	cost = 100

/obj/effect/shuttle_landmark/patrol/nav1
	name = "Patrol Ship Fore"
	landmark_tag = "nav_patrol_1"

/obj/effect/shuttle_landmark/patrol/nav2
	name = "Patrol Ship Aft"
	landmark_tag = "nav_patrol_2"

/obj/effect/shuttle_landmark/patrol/nav3
	name = "Patrol Ship Port"
	landmark_tag = "nav_patrol_3"

/obj/effect/shuttle_landmark/patrol/nav4
	name = "Patrol Ship Starboard"
	landmark_tag = "nav_patrol_4"

/obj/machinery/door/airlock/autoname/command
	icon = 'icons/obj/doors/Doorhatchele.dmi'
	req_access = list(access_heads)

/obj/machinery/door/airlock/autoname/engineering
	req_access = list(access_engine)

/obj/machinery/door/airlock/autoname/marine
	req_access = list(access_security)

/obj/machinery/suit_storage_unit/patrol_marine
	name = "Marine Voidsuit Storage Unit"
	suit_type = /obj/item/clothing/suit/space/void/military/prepared
	tank_type = /obj/item/weapon/tank/oxygen
	mask_type = /obj/item/clothing/mask/gas/half
	req_access = list(access_security)
	islocked = 1

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
