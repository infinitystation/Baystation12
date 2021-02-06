/datum/map/sierra

	base_floor_type = /turf/simulated/floor/reinforced/airless
	base_floor_area = /area/maintenance/exterior

	post_round_safe_areas = list (
		/area/centcom,
		/area/shuttle/escape/centcom,
		/area/shuttle/escape_pod6/station,
		/area/shuttle/escape_pod7/station,
		/area/shuttle/escape_pod8/station,
		/area/shuttle/escape_pod9/station,
		/area/shuttle/escape_pod10/station,
		/area/shuttle/escape_pod12/station,
		/area/shuttle/escape_pod13/station,
		/area/shuttle/escape_pod14/station,
		/area/shuttle/escape_pod15/station,
		/area/shuttle/escape_pod16/station,
		/area/shuttle/escape_pod17/station,
		/area/shuttle/transport1/centcom,
		/area/shuttle/administration/centcom,
		/area/shuttle/specops/centcom,
	)
/area/medical
	icon_state = "medbay"
/area/maintenance/substation
	name = "Substation"
	icon_state = "substation"
	sound_env = SMALL_ENCLOSED
	req_access = list(access_engine)

/area/crew_quarters
	icon_state = "crew_quarters"

/area/crew_quarters/heads
	icon_state = "heads"

/area/engineering
	req_access = list(access_engine)
	icon_state = "engineering"

/area/shield
	name = "Engineering - Shield Generator"
	icon_state = "engineering"
	sound_env = SMALL_ENCLOSED
	req_access = list(access_engine, access_atmospherics)

/area/security/sierra/
	icon_state = "security"

/area/thruster
	icon_state = "thruster"
	req_access = list(access_engine)
#include "areas/multideck.dm"
#include "areas/shuttles.dm"
#include "areas/sierra1.dm"
#include "areas/sierra2.dm"
#include "areas/sierra3.dm"
#include "areas/sierra4.dm"
