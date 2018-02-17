#include "sentinel_areas.dm"
#include "sentinel_crew.dm"

/obj/effect/overmap/ship/patrol
	name = "Cobra-Class Craft"
	color = "#00FFFF"
	vessel_mass = 15
	default_delay = 3 MINUTES
	triggers_events = 0
	speed_mod = 0.3 MINUTE
	burn_delay = 20 SECONDS
	start_x = 2
	start_y = 2

/obj/effect/overmap/ship/patrol/New()
	name = "SPC [pick("Bloodhound","Rescuer","Cobra","Cavalry","Anchor","God's hand","Korobochka")], \a [name]"
	for(var/area/ship/patrol/A)
		A.name = "\improper [name] - [A.name]"
		GLOB.using_map.area_purity_test_exempt_areas += A.type
	..()

/datum/map_template/ruin/away_site/patrol
	name = "Sol Patrol Ship (ERT)"
	id = "awaysite_patrol_ship"
	description = "A saviour for souls of SEV Torch."
	prefix = "maps/away-inf/"
	suffixes = list("sentinel/sentinel-1.dmm", "sentinel/sentinel-2.dmm")
	cost = 10

/obj/machinery/door/airlock/autoname/command
	icon = 'icons/obj/doors/Doorhatchele.dmi'
	req_access = list(access_heads)

/obj/machinery/door/airlock/autoname/engineering
	req_access = list(access_engine)

/obj/machinery/door/airlock/autoname/marine
	req_access = list(access_security)

/obj/structure/closet/secure_closet/guncabinet/patrol
	name = "storm group cabinet"

/obj/structure/closet/secure_closet/guncabinet/patrol/energy/WillContain()
	return list(
		/obj/item/clothing/accessory/holster/thigh = 8,
		/obj/item/weapon/gun/energy/gun = 8
	)

/obj/structure/closet/secure_closet/guncabinet/patrol/assault/WillContain()
	return list(
		/obj/item/ammo_magazine/a762 = 16,
		/obj/item/weapon/gun/projectile/automatic/z8 = 4
	)

/obj/structure/closet/secure_closet/guncabinet/patrol/carabine/WillContain()
	return list(
		/obj/item/ammo_magazine/c12755 = 6,
		/obj/item/weapon/gun/projectile/automatic/amrcarabine = 2
	)

/obj/structure/closet/secure_closet/guncabinet/patrol/shotgun/WillContain()
	return list(
		/obj/item/ammo_casing/shotgun/pellet = 20,
		/obj/item/clothing/accessory/storage/bandolier = 2,
		/obj/item/weapon/gun/projectile/shotgun/pump/combat/lethal = 2
	)

/obj/machinery/computer/shuttle_control/explore/patrol
	name = "shuttle control console"
	shuttle_tag = "Patrol"
	req_access = list(access_bridge)

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

