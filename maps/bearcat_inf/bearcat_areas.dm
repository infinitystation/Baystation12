/area/ship/scrap
	name = "\improper Space Bar"
	ambience = list('sound/ambience/ambigen3.ogg','sound/ambience/ambigen4.ogg','sound/ambience/ambigen5.ogg','sound/ambience/ambigen6.ogg','sound/ambience/ambigen7.ogg','sound/ambience/ambigen8.ogg','sound/ambience/ambigen9.ogg','sound/ambience/ambigen10.ogg','sound/ambience/ambigen11.ogg','sound/ambience/ambigen12.ogg')
	icon_state = "bar"

/area/ship/scrap/crew
	name = "\improper Crew Compartements"
	icon_state = "crew_quarters"

/area/ship/scrap/crew/kitchen
	name = "\improper Galley"
	icon_state = "kitchen"

/area/ship/scrap/crew/gym
	name = "\improper Gym"
	icon_state = "fitness"

/area/ship/scrap/crew/restroom
	name = "\improper Bathrooms"
	icon_state = "toilet"
	turf_initializer = /decl/turf_initializer/maintenance

/area/ship/scrap/crew/wash
	name = "\improper Washroom"
	icon_state = "locker"

/area/ship/scrap/crew/garden
	name = "\improper Garden"
	icon_state = "green"

/area/ship/scrap/crew/cryo
	name = "\improper Cryo Storage"
	icon_state = "cryo"

/area/ship/scrap/crew/dorms
	name = "\improper Dormitory"
	icon_state = "green"

/area/ship/scrap/hallway/port
	name = "\improper Hallway - Port"
	icon_state = "hallP"

/area/ship/scrap/hallway/port/upper
	name = "\improper Upper Hallway - Port"

/area/ship/scrap/hallway/starboard
	name = "\improper Hallway - Starboard"
	icon_state = "hallS"

/area/ship/scrap/hallway/starboard/upper
	name = "\improper Upper Hallway - Starbound"

/area/ship/scrap/hallway/aft
	name = "\improper Hallway - Aft"
	icon_state = "hallA"

/area/ship/scrap/hallway/aft/upper
	name = "\improper Upper Hallway - Aft"

/area/ship/scrap/other/research
	name = "\improper Research"
	icon_state = "devlab"
	turf_initializer = /decl/turf_initializer/maintenance/heavy

/area/ship/scrap/other/eva
	name = "\improper EVA Storage"
	icon_state = "eva"
	req_access = list(access_eva)

/area/ship/scrap/other/dock
	name = "\improper Docking Bay"
	icon_state = "entry_1"

/area/ship/scrap/other/security
	name = "\improper Brig"
	icon_state = "red"
	req_access = list(access_brig)

/area/ship/scrap/other/robotics
	name = "\improper Robotic Maintenance"
	icon_state = "robotics"
	req_access = list(access_robotics)

/area/ship/scrap/other/requisition
	name = "\improper Requisition"
	icon_state = "storage"
	req_access = list(access_qm)

/area/ship/scrap/other/lounge
	name = "\improper Lounge"
	icon_state = "auxstorage"

/area/ship/scrap/medbay
	name = "\improper Medical Bay"
	icon_state = "medbay"
	//req_access = list(access_medical)

/area/ship/scrap/escape/port
	name = "\improper Port Escape Pods"
	icon_state = "yellow"

/area/ship/scrap/escape/port/upper
	name = "\improper Upper Port Escape Pods"

/area/ship/scrap/escape/starboard
	name = "\improper Starboard Escape Pods"
	icon_state = "yellow"

/area/ship/scrap/escape/starboard/upper
	name = "\improper Upper Starbound Escape Pods"

/area/ship/scrap/cargo
	name = "\improper Cargo Hold"
	icon_state = "quartstorage"

/area/ship/scrap/cargo/lower
	name = "\improper Lower Cargo Hold"

/area/ship/scrap/cargo/upper
	name = "\improper Upper Cargo Hold"

/area/ship/scrap/cargo/ore_melting
	name = "\improper Smelting Section"
	icon_state = "cave"

/area/ship/scrap/maintenance
	name = "\improper Maintenance Compartments"
	icon_state = "amaint"

/area/ship/scrap/maintenance/hallway
	name = "\improper Maintenance Corridors"

/area/ship/scrap/maintenance/lower
	name = "\improper Lower Deck Maintenance Compartments"
	icon_state = "sub_maint_aft"
	area_flags = AREA_FLAG_RAD_SHIELDED

/area/ship/scrap/maintenance/hidden
	name = "\improper Library" //shielded compartment
	icon_state = "auxstorage"
	turf_initializer = /decl/turf_initializer/maintenance/heavy

/area/ship/scrap/maintenance/unused
	name = "\improper Compartment 2-B"
	icon_state = "yellow"
	turf_initializer = /decl/turf_initializer/maintenance/heavy
	ambience = list('sound/ambience/ambigen3.ogg','sound/ambience/ambigen4.ogg','sound/ambience/ambigen5.ogg','sound/ambience/ambigen6.ogg','sound/ambience/ambimo1.ogg','sound/ambience/ambimo2.ogg')

/area/ship/scrap/engineering
	name = "\improper Engineering Bay"
	icon_state = "engineering_supply"
	ambience = list('sound/ambience/ambigen3.ogg','sound/ambience/ambigen4.ogg','sound/ambience/ambigen5.ogg','sound/ambience/ambigen6.ogg','sound/ambience/ambigen7.ogg','sound/ambience/ambigen8.ogg','sound/ambience/ambigen9.ogg','sound/ambience/ambigen10.ogg','sound/ambience/ambigen11.ogg','sound/ambience/ambieng1.ogg')
	req_access = list(access_engine)

/area/ship/scrap/engineering/atmos
	name = "\improper Atmospherics Comparment"
	icon_state = "atmos"

/area/ship/scrap/engineering/power
	name = "\improper Power Compartment"
	icon_state = "engine_smes"

/area/ship/scrap/engineering/storage
	name = "\improper Tools Storage"
	icon_state = "engineering_storage"

/area/ship/scrap/engineering/storage/tech
	name = "\improper Parts Storage"
	icon_state = "engineering_supply"

/area/ship/scrap/engineering/nacelles
	name = "\improper Main Engine"
	area_flags = AREA_FLAG_ION_SHIELDED

/area/ship/scrap/engineering/nacelles/port
	name = "\improper Port Thruster"

/area/ship/scrap/engineering/nacelles/starboard
	name = "\improper Starboard Thruster"

/area/ship/scrap/engineering/solars
	name = "\improper Aft Solars Control"
	icon_state = "panelsS"

/area/ship/scrap/engineering/solars/array
	name = "\improper Aft Solars Array"
	icon_state = "SolarcontrolS"
	area_flags = AREA_FLAG_EXTERNAL
	turf_initializer = null

/area/ship/scrap/command //hallway
	name = "\improper Command Deck"
	icon_state = "centcom"
	req_access = list(access_heads)

/area/ship/scrap/command/bridge
	name = "\improper Bridge"
	icon_state = "bridge"
	area_flags = AREA_FLAG_ION_SHIELDED

/area/ship/scrap/command/captain
	name = "\improper Captain's Quarters"
	icon_state = "captain"
	req_access = list(access_captain)

/area/ship/scrap/command/comms
	name = "\improper Communications Relay"
	icon_state = "tcomsatcham"
	ambience = list('sound/ambience/ambigen3.ogg','sound/ambience/ambigen4.ogg','sound/ambience/signal.ogg','sound/ambience/sonar.ogg')

//shuttles

/area/ship/scrap/shuttle/outgoing
	name = "\improper Exploration Shuttle"
	icon_state = "tcomsatcham"
	area_flags = AREA_FLAG_RAD_SHIELDED

/area/admin/prison
	name = "\improper Ban Prison"
	icon_state = "green"

/area/shuttle/another
	name = "\improper Unknown Shuttle"
	icon_state = "green"

/area/ship/scrap/shuttle/lift
	name = "\improper Cargo Lift"
	icon_state = "shuttle3"
	base_turf = /turf/simulated/open
	requires_power = 0

// ACTORS GUILD

/area/acting
	name = "\improper Centcom Acting Guild"
	icon_state = "red"
	dynamic_lighting = 0
	requires_power = 0

/area/acting/backstage
	name = "\improper Backstage"

/area/acting/stage
	name = "\improper Stage"
	dynamic_lighting = 1
	icon_state = "yellow"
