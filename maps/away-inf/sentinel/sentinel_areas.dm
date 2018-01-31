/area/ship/patrol
	name = "\improper Patrol Ship"
	ambience = list('sound/ambience/ambigen3.ogg','sound/ambience/ambigen4.ogg','sound/ambience/ambigen5.ogg','sound/ambience/ambigen6.ogg','sound/ambience/ambigen7.ogg','sound/ambience/ambigen8.ogg','sound/ambience/ambigen9.ogg','sound/ambience/ambigen10.ogg','sound/ambience/ambigen11.ogg','sound/ambience/ambigen12.ogg')

/area/ship/patrol/crew
	name = "\improper Crew Compartements"
	icon_state = "crew_quarters"

/area/ship/patrol/crew/hallway/port
	name = "\improper Crew Hallway - Port"

/area/ship/patrol/crew/hallway/starboard
	name = "\improper Crew Hallway - Starboard"

/area/ship/patrol/crew/kitchen
	name = "\improper Galley"
	icon_state = "kitchen"

/area/ship/patrol/crew/cryo
	name += " Cryo Storage"
	icon_state = "cryo"

/area/ship/patrol/crew/engineering/hallway
	name = "\improper Engineering Hallway"
	icon_state = "green"

/area/ship/patrol/crew/engineering/equipment
	name = "\improper Engineering Equipment"
	icon_state = "green"

/area/ship/patrol/crew/engineering/fussion
	name = "\improper Fussion Zone"
	icon_state = "green"

/area/ship/patrol/crew/engineering/fussion/control
	name = "\improper Fussion Control"
	icon_state = "green"

/area/ship/patrol/crew/hangar
	name = "\improper Hangar"
	icon_state = "purple"

/area/ship/patrol/crew/torpedos
	name = "\improper Torpedos Pod"
	icon_state = "yellow"

/area/ship/patrol/crew/lasers
	name = "\improper MRSL platform"
	icon_state = "yellow"

/area/ship/patrol/crew/saloon
	name = "\improper Saloon"
	icon_state = "conference"

/area/ship/patrol/crew/toilets
	name = "\improper Bathrooms"
	icon_state = "toilet"
	turf_initializer = /decl/turf_initializer/maintenance

/area/ship/patrol/crew/wash
	name = "\improper Washroom"
	icon_state = "locker"

/area/ship/patrol/crew/medbay
	name = "\improper Medical Bay"
	icon_state = "medbay"

/area/ship/patrol/crew/medbay/lobby
	name = "\improper Medical Bay Lobby"
	icon_state = "medbay"

/area/ship/patrol/cargo
	name = "\improper Cargo Hold"
	icon_state = "quartstorage"

/area/ship/patrol/cargo/lower
	name = "\improper Lower Cargo Hold"

/area/ship/patrol/dock
	name = "\improper Docking Bay"
	icon_state = "entry_1"

/area/ship/patrol/fire
	name = "\improper Firefighting Equipment Comparment"
	icon_state = "green"

/area/ship/patrol/unused
	name = "\improper Compartment 2-B"
	icon_state = "yellow"
	turf_initializer = /decl/turf_initializer/maintenance
	ambience = list('sound/ambience/ambigen3.ogg','sound/ambience/ambigen4.ogg','sound/ambience/ambigen5.ogg','sound/ambience/ambigen6.ogg','sound/ambience/ambimo1.ogg','sound/ambience/ambimo2.ogg')

/area/ship/patrol/hidden
	name = "\improper Unknown" //shielded compartment
	icon_state = "auxstorage"

/area/ship/patrol/escape_port
	name = "\improper Port Escape Pods"
	icon_state = "green"

/area/ship/patrol/escape_star
	name = "\improper Starboard Escape Pods"
	icon_state = "yellow"

/area/ship/patrol/broken1
	name = "\improper Robotic Maintenance"
	icon_state = "green"

/area/ship/patrol/broken2
	name = "\improper Compartment 1-B"
	icon_state = "yellow"

/area/ship/patrol/gambling
	name = "\improper Compartment 1-C"
	icon_state = "cave"

/area/ship/patrol/maintenance
	name = "\improper Maintenance Compartments"
	icon_state = "amaint"

/area/ship/patrol/maintenance/hallway
	name = "\improper Maintenance Corridors"

/area/ship/patrol/maintenance/lower
	name = "\improper Lower Deck Maintenance Compartments"
	icon_state = "sub_maint_aft"

/area/ship/patrol/maintenance/storage
	name = "\improper Tools Storage"
	icon_state = "engineering_storage"

/area/ship/patrol/maintenance/techstorage
	name = "\improper Parts Storage"
	icon_state = "engineering_supply"

/area/ship/patrol/maintenance/eva
	name = "\improper EVA Storage"
	icon_state = "eva"

/area/ship/patrol/maintenance/engineering
	name = "\improper Engineering Bay"
	icon_state = "engineering_supply"

/area/ship/patrol/maintenance/atmos
	name = "\improper Atmospherics Comparment"
	icon_state = "atmos"
	ambience = list('sound/ambience/ambigen3.ogg','sound/ambience/ambigen4.ogg','sound/ambience/ambigen5.ogg','sound/ambience/ambigen6.ogg','sound/ambience/ambigen7.ogg','sound/ambience/ambigen8.ogg','sound/ambience/ambigen9.ogg','sound/ambience/ambigen10.ogg','sound/ambience/ambigen11.ogg','sound/ambience/ambiatm1.ogg')

/area/ship/patrol/maintenance/power
	name = "\improper Power Compartment"
	icon_state = "engine_smes"
	ambience = list('sound/ambience/ambigen3.ogg','sound/ambience/ambigen4.ogg','sound/ambience/ambigen5.ogg','sound/ambience/ambigen6.ogg','sound/ambience/ambigen7.ogg','sound/ambience/ambigen8.ogg','sound/ambience/ambigen9.ogg','sound/ambience/ambigen10.ogg','sound/ambience/ambigen11.ogg','sound/ambience/ambieng1.ogg')

/area/ship/patrol/maintenance/engine
	icon_state = "engine"
	ambience = list('sound/ambience/ambigen3.ogg','sound/ambience/ambigen4.ogg','sound/ambience/ambigen5.ogg','sound/ambience/ambigen6.ogg','sound/ambience/ambigen7.ogg','sound/ambience/ambigen8.ogg','sound/ambience/ambigen9.ogg','sound/ambience/ambigen10.ogg','sound/ambience/ambigen11.ogg','sound/ambience/ambieng1.ogg')

/area/ship/patrol/maintenance/engine/aft
	name = "\improper Main Engine Bay"

/area/ship/patrol/maintenance/engine/port
	name = "\improper Port Thruster"

/area/ship/patrol/maintenance/engine/starboard
	name = "\improper Starboard Thruster"

/area/ship/patrol/command/hallway
	name = "\improper Command Deck"
	icon_state = "centcom"

/area/ship/patrol/command/bridge
	name = "\improper Bridge"
	icon_state = "bridge"

/area/ship/patrol/command/captain
	name = "\improper Captain's Quarters"
	icon_state = "captain"

/area/ship/patrol/comms
	name = "\improper Communications Relay"
	icon_state = "tcomsatcham"
	ambience = list('sound/ambience/ambigen3.ogg','sound/ambience/ambigen4.ogg','sound/ambience/signal.ogg','sound/ambience/sonar.ogg')

/area/guppy_hangar/start
	name = "\improper Rescuer"
	icon_state = "shuttlered"
	requires_power = 1
	dynamic_lighting = 1
	area_flags = AREA_FLAG_RAD_SHIELDED

/area/ship/patrol/shuttle/lift
  name = "\improper Cargo Lift"
  icon_state = "shuttle3"
  base_turf = /turf/simulated/open
