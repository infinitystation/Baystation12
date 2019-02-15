/*
** Holomap vars and procs on /area
*/

/area
	var/holomap_color = null // Color of this area on station holomap

/area/rnd
	holomap_color = HOLOMAP_AREACOLOR_SCIENCE
/area/outpost/research
	holomap_color = HOLOMAP_AREACOLOR_SCIENCE
/area/server
	holomap_color = HOLOMAP_AREACOLOR_SCIENCE
/area/assembly
	holomap_color = HOLOMAP_AREACOLOR_SCIENCE

/area/bridge
	holomap_color = HOLOMAP_AREACOLOR_COMMAND
/area/command
	holomap_color = HOLOMAP_AREACOLOR_COMMAND
/area/tcommsat
	holomap_color = HOLOMAP_AREACOLOR_COMMAND
/area/teleporter
	holomap_color = HOLOMAP_AREACOLOR_COMMAND
/area/teleporter/departing
	holomap_color = null
/area/turret_protected
	holomap_color = HOLOMAP_AREACOLOR_COMMAND

/area/security
	holomap_color = HOLOMAP_AREACOLOR_SECURITY
/area/tether/surfacebase/security
	holomap_color = HOLOMAP_AREACOLOR_SECURITY

/area/medical
	holomap_color = HOLOMAP_AREACOLOR_MEDICAL
/area/tether/surfacebase/medical
	holomap_color = HOLOMAP_AREACOLOR_MEDICAL

/area/engineering
	holomap_color = HOLOMAP_AREACOLOR_ENGINEERING
/area/engineering/atmos/intake
	holomap_color = null
/area/maintenance/substation
	holomap_color = HOLOMAP_AREACOLOR_ENGINEERING
/area/storage/tech
	holomap_color = HOLOMAP_AREACOLOR_ENGINEERING

/area/quartermaster
	holomap_color = HOLOMAP_AREACOLOR_CARGO
/area/tether/surfacebase/mining_main
	holomap_color = HOLOMAP_AREACOLOR_CARGO
/*
/area/storage
	holomap_color = HOLOMAP_AREACOLOR_CARGO
*/
/area/hallway
	holomap_color = HOLOMAP_AREACOLOR_HALLWAYS
/area/bridge/hallway
	holomap_color = HOLOMAP_AREACOLOR_HALLWAYS

/area/crew_quarters/sleep
	holomap_color = HOLOMAP_AREACOLOR_DORMS
/area/crew_quarters/sleep/cryo
	holomap_color = null

// Heads
/area/crew_quarters/heads/cobed
	holomap_color = HOLOMAP_AREACOLOR_COMMAND
/area/crew_quarters/heads/office/captain
	holomap_color = HOLOMAP_AREACOLOR_COMMAND
/area/crew_quarters/heads/office/hop
	holomap_color = HOLOMAP_AREACOLOR_COMMAND
/area/crew_quarters/heads/office/iaa
	holomap_color = HOLOMAP_AREACOLOR_COMMAND
/area/crew_quarters/heads/office/rd
	holomap_color = HOLOMAP_AREACOLOR_SCIENCE
/area/crew_quarters/heads/office/ce
	holomap_color = HOLOMAP_AREACOLOR_ENGINEERING
/area/crew_quarters/heads/office/hos
	holomap_color = HOLOMAP_AREACOLOR_SECURITY
/area/crew_quarters/heads/office/cmo
	holomap_color = HOLOMAP_AREACOLOR_MEDICAL
/area/crew_quarters/medbreak
	holomap_color = HOLOMAP_AREACOLOR_MEDICAL
/area/crew_quarters/safe_room
	holomap_color = HOLOMAP_AREACOLOR_ARRIVALS

// ### PROCS ###
// Whether the turfs in the area should be drawn onto the "base" holomap.
/area/proc/holomapAlwaysDraw()
	return TRUE
/area/shuttle/holomapAlwaysDraw()
	return FALSE