//Infinity's Property

/area/quartermaster/quarantine
	name = "\improper Hangar Quarantine"
	icon_state = "toxstorage"



/area/aquila/
	name = "\improper SEV Aquila"
	icon_state = "shuttlered"
	base_turf = /turf/simulated/floor/reinforced/airless
	area_flags = AREA_FLAG_RAD_SHIELDED
/area/aquila/cockpit
	name = "\improper Aquila - Cockpit"
/area/aquila/engineering
	name = "\improper Aquila - Engineering Compartment"
/area/aquila/storage
	name = "\improper Aquila - Cargo Compartment"
/area/aquila/medical
	name = "\improper Aquila - Medical Compartment"
/area/aquila/troops
	name = "\improper Aquila - Troops Compartment"
/area/aquila/crew
	name = "\improper Aquila - Crew Compartment"
/area/aquila/airlock
	name = "\improper Aquila - Airlock Compartment"



/area/tdome/testing
	name = "\improper Thunderdome (TESTING AREA)"
	icon_state = "purple"

/area/tdome/testing/engineering
	name = "\improper Thunderdome"
	requires_power = 0
	dynamic_lighting = 1

/area/tdome/testing/engineering/unpowered
	name = "\improper Thunderdome"
	requires_power = 1


/area/quartermaster/compactor
	name = "\improper Compactor"
	icon_state = "quartstorage"
	sound_env = LARGE_ENCLOSED


/area/rnd/pilot
	name = "\improper NanoTrasen Pilot Office"
	icon_state = "researchbreak"

/area/engineering/gravity_gen
	name = "\improper Gravity Generator"
	icon_state = "engine"
	sound_env = SMALL_ENCLOSED

/area/vacant/gambling
	name = "\improper Gambling Room"
	icon_state = "restrooms"
	sound_env = MEDIUM_SOFTFLOOR