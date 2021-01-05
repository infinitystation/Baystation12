/datum/map/colony

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

//Third Deck (Z-1)
/area/hallway/primary/thirddeck/fore
	name = "Third Deck Fore Hallway"
	icon_state = "hallF"

/area/hallway/primary/thirddeck/center
	name = "Third Deck Central Hallway"
	icon_state = "hallC3"

/area/hallway/primary/thirddeck/aft
	name = "Third Deck Aft Hallway"
	icon_state = "hallA"

/area/hallway/primary/thirddeck/central_stairwell
	name = "Third Deck Central Stairwell"
	icon_state = "hallC2"

/area/maintenance/thirddeck
	name = "Third Deck Maintenance"
	icon_state = "maintcentral"

/area/maintenance/thirddeck/aft
	name = "Third Deck Aft Maintenance"
	icon_state = "amaint"

/area/maintenance/thirddeck/foreport
	name = "Third Deck Fore Port Maintenance"
	icon_state = "fpmaint"

/area/maintenance/thirddeck/forestarboard
	name = "Third Deck Fore Starboard Maintenance"
	icon_state = "fsmaint"

/area/maintenance/thirddeck/starboard
	name = "Third Deck Starboard Maintenance"
	icon_state = "smaint"

/area/maintenance/thirddeck/port
	name = "Third Deck Port Maintenance"
	icon_state = "pmaint"

/area/teleporter/thirddeck
	name = "Third Deck Teleporter"
	icon_state = "teleporter"

/area/maintenance/substation/thirddeck
	name = "Third Deck Substation"

/area/maintenance/waterstore
	name = "\improper Cistern"
	icon_state = "disposal"
	req_access = list(list(access_cargo, access_engine, access_el))

/area/crew_quarters/commissary
	name = "Commissary"
	icon_state = "crew_quarters"
	req_access = list(access_commissary)

//Second Deck (Z-2)
/area/hallway/primary/seconddeck/fore
	name = "Second Deck Fore Hallway"
	icon_state = "hallF"

/area/hallway/primary/seconddeck/center
	name = "Second Deck Central Hallway"
	icon_state = "hallC3"

/area/hallway/primary/seconddeck/aft
	name = "Second Deck Aft Hallway"
	icon_state = "hallA"

/area/hallway/primary/seconddeck/central_stairwell
	name = "Second Deck Central Stairwell"
	icon_state = "hallC2"

/area/hallway/primary/seconddeck/fore_stairwell
	name = "Second Deck Fore Stairwell"
	icon_state = "hallC2"

/area/maintenance/seconddeck
	name = "Second Deck Maintenance"
	icon_state = "maintcentral"

/area/maintenance/seconddeck/foreport
	name = "Second Deck Fore Port Maintenance"
	icon_state = "fpmaint"

/area/maintenance/seconddeck/forestarboard
	name = "Second Deck Fore Starboard Maintenance"
	icon_state = "fsmaint"

/area/maintenance/seconddeck/starboard
	name = "Second Deck Starboard Maintenance"
	icon_state = "smaint"

/area/maintenance/seconddeck/port
	name = "Second Deck Port Maintenance"
	icon_state = "pmaint"

/area/maintenance/seconddeck/aftstarboard
	name = "Second Deck Aft Starboard Maintenance"
	icon_state = "asmaint"

/area/maintenance/seconddeck/aftport
	name = "Second Deck Aft Port Maintenance"
	icon_state = "apmaint"

/area/teleporter/seconddeck
	name = "Second Deck Teleporter"
	icon_state = "teleporter"

/area/maintenance/bluespace
	name = "Bluespace Drive"
	icon_state = "engineering"
	req_access = list(list(access_engine_equip, access_heads), access_engine, access_maint_tunnels)

/area/crew_quarters/safe_room/seconddeck
	name = "Second Deck Safe Room"
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED

/area/maintenance/substation/seconddeck
	name = "Second Deck Substation"

/area/maintenance/compactor
	name = "Compactor"
	icon_state = "disposal"
	sound_env = STANDARD_STATION
	req_access = list(list(access_cargo, access_maint_tunnels))

/area/crew_quarters/laundry
	name = "Laundry Room"
	icon_state = "Sleep"

/area/maintenance/abandoned_compartment
	name = "Unknown Compartment"
	turf_initializer = /decl/turf_initializer/maintenance/heavy
	icon_state = "cafeteria"

/area/maintenance/abandoned_hydroponics
	name = "Abandoned Hydroponics"
	icon_state = "hydro"
	turf_initializer = /decl/turf_initializer/maintenance/heavy

//First Deck (Z-3)
/area/maintenance/firstdeck
	name = "First Deck Maintenance"
	icon_state = "maintcentral"

/area/maintenance/firstdeck/aftstarboard
	name = "First Deck Aft Starboard Maintenance"
	icon_state = "asmaint"

/area/maintenance/firstdeck/aftport
	name = "First Deck Aft Port Maintenance"
	icon_state = "apmaint"

/area/maintenance/firstdeck/forestarboard
	name = "First Deck Fore Starboard Maintenance"
	icon_state = "fsmaint"

/area/maintenance/firstdeck/fore
	name = "First Deck Fore Port Maintenance"
	icon_state = "fpmaint"

/area/maintenance/firstdeck/foreport
	name = "First Deck Fore Maintenance"
	icon_state = "fpmaint"

/area/maintenance/firstdeck/centralstarboard
	name = "First Deck Starboard Maintenance"
	icon_state = "smaint"

/area/maintenance/firstdeck/centralport
	name = "First Deck Port Maintenance"
	icon_state = "pmaint"

/area/hallway/primary/firstdeck/fore
	name = "First Deck Fore Hallway"
	icon_state = "hallF"

/area/hallway/primary/firstdeck/center
	name = "First Deck Central Hallway"
	icon_state = "hallC1"

/area/hallway/primary/firstdeck/aft
	name = "First Deck Aft Hallway"
	icon_state = "hallA"

/area/hallway/primary/firstdeck/central_stairwell
	name = "First Deck Central Stairwell"
	icon_state = "hallC2"

/area/hallway/primary/firstdeck/fore_stairwell
	name = "First Deck Fore Stairwell"
	icon_state = "hallC2"

/area/crew_quarters/safe_room/firstdeck
	name = "First Deck Safe Room"
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED

/area/maintenance/substation/firstdeck
	name = "First Deck Substation"

/* not found on Colony
/area/teleporter/firstdeck
	name = "First Deck Teleporter"
	icon_state = "teleporter"

/area/hallway/primary/firstdeck/foreport
	name = "First Deck Fore Hallway"
	icon_state = "hallF"
*/

// Shuttles
/area/shuttle/transport1/centcom
	icon_state = "shuttle"
	name = "Transport Shuttle Centcom"
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED | AREA_FLAG_IS_NOT_PERSISTENT

//colony large pods
/area/shuttle/escape_pod6/station
	name = "Escape Pod One"
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED | AREA_FLAG_IS_NOT_PERSISTENT
	icon_state = "exit"

/area/shuttle/escape_pod7/station
	name = "Escape Pod Two"
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED | AREA_FLAG_IS_NOT_PERSISTENT
	icon_state = "exit"

/area/shuttle/escape_pod8/station
	name = "Escape Pod Three"
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED | AREA_FLAG_IS_NOT_PERSISTENT
	icon_state = "exit"

/area/shuttle/escape_pod9/station
	name = "Escape Pod Four"
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED | AREA_FLAG_IS_NOT_PERSISTENT
	icon_state = "exit"

/area/shuttle/escape_pod10/station
	name = "Escape Pod Five"
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED | AREA_FLAG_IS_NOT_PERSISTENT
	icon_state = "exit"

//colony small pods
/area/shuttle/escape_pod12/station
	name = "Escape Pod Seven"
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED | AREA_FLAG_IS_NOT_PERSISTENT
	icon_state = "exit"

/area/shuttle/escape_pod13/station
	name = "Escape Pod Eight"
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED | AREA_FLAG_IS_NOT_PERSISTENT
	icon_state = "exit"

/area/shuttle/escape_pod14/station
	name = "Escape Pod Nine"
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED | AREA_FLAG_IS_NOT_PERSISTENT
	icon_state = "exit"

/area/shuttle/escape_pod15/station
	name = "Escape Pod Ten"
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED | AREA_FLAG_IS_NOT_PERSISTENT
	icon_state = "exit"

/area/shuttle/escape_pod16/station
	name = "Escape Pod Eleven"
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED | AREA_FLAG_IS_NOT_PERSISTENT
	icon_state = "exit"

/area/shuttle/escape_pod17/station
	name = "Escape Pod Twelve"
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED | AREA_FLAG_IS_NOT_PERSISTENT
	icon_state = "exit"

//Charon
/area/exploration_shuttle
	name = "Charon"
	icon_state = "shuttlered"
	base_turf = /turf/simulated/floor/plating
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED
	req_access = list(access_expedition_shuttle)

/area/exploration_shuttle/cockpit
	name = "Charon - Cockpit"
	req_access = list(access_expedition_shuttle_helm)
/area/exploration_shuttle/atmos
	name = "Charon - Atmos Compartment"
/area/exploration_shuttle/power
	name = "Charon - Power Compartment"
/area/exploration_shuttle/medical
	name = "Charon - Medical Compartment"
/area/exploration_shuttle/cargo
	name = "Charon - Cargo Bay"
/area/exploration_shuttle/airlock
	name = "Charon - Airlock Compartment"

//Guppy
/area/guppy_hangar/start
	name = "Guppy"
	icon_state = "shuttlered"
	requires_power = 1
	dynamic_lighting = 1
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED
	req_access = list(access_guppy)

//Petrov
/area/shuttle/petrov
	name = "NSV Petrov"
	requires_power = 1
	dynamic_lighting = 1
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED
	req_access = list(access_petrov)

/area/shuttle/petrov/ship
	icon_state = "shuttlered"
/area/shuttle/petrov/cell1
	name = "NSV Petrov - Isolation Cell 1"
	icon_state = "shuttle"
/area/shuttle/petrov/cell2
	name = "NSV Petrov - Isolation Cell 2"
	icon_state = "shuttlegrn"
/area/shuttle/petrov/cell3
	name = "NSV Petrov - Isolation Cell 3"
	icon_state = "shuttle"

//Turbolift
/area/turbolift
	icon_state = "shuttle"
	dynamic_lighting = 1
	area_flags = AREA_FLAG_ION_SHIELDED
	req_access = list(access_maint_tunnels)

/area/turbolift/colony_top
	name = "lift (first deck)"
	lift_floor_label = "Deck 1"
	lift_floor_name = "Main Deck"
	lift_announce_str = "Arriving at Main Deck: Bridge. Captain's Mess. Meeting Room. Security Wing. Research Wing. Infirmary. AI Core."

/area/turbolift/colony_middle
	name = "lift (second deck)"
	lift_floor_label = "Deck 2"
	lift_floor_name = "Living Deck"
	lift_announce_str = "Arriving at Living Deck: Cryogenic Storage. Dormitory. Holodeck. Lounge. Bar. Hydroponics. Gym. Laundry. Engineering. Atmospherics. Telecommunications. EVA."

/area/turbolift/colony_ground
	name = "lift (third deck)"
	lift_floor_label = "Deck 3"
	lift_floor_name = "Hangar Deck"
	lift_announce_str = "Arriving at Hangar Deck: Shuttle Docks. Supply Office. Cargo Storage. Main Hangar. Expedition Preparation. Exploration Leader's Office. Mineral Processing. Sanitation."
	base_turf = /turf/simulated/floor

/area/turbolift/start
	name = "Turbolift Start"

/area/turbolift/firstdeck
	name = "first deck"
	base_turf = /turf/simulated/open

/area/turbolift/seconddeck
	name = "second deck"
	base_turf = /turf/simulated/open

/area/turbolift/thirddeck
	name = "third deck"
	base_turf = /turf/simulated/open

// Ninja areas
/area/ninja_dojo
	name = "Ninja Base"
	icon_state = "green"
	requires_power = 0
	dynamic_lighting = 1
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED | AREA_FLAG_IS_NOT_PERSISTENT
	req_access = list(access_syndicate)

/area/ninja_dojo/dojo
	name = "Clan Dojo"
	dynamic_lighting = 0

/area/ninja_dojo/start
	name = "Clan Dojo"
	icon_state = "shuttlered"
	base_turf = /turf/simulated/floor/plating

//Merchant
/area/shuttle/merchant/home
	name = "Merchant Vessel"
	icon_state = "shuttlegrn"
	requires_power = 1
	dynamic_lighting = 1
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED | AREA_FLAG_IS_NOT_PERSISTENT
	req_access = list(access_merchant)

//Merc
/area/syndicate_mothership
	name = "Mercenary Base"
	icon_state = "syndie-ship"
	requires_power = 0
	dynamic_lighting = 0
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED | AREA_FLAG_IS_NOT_PERSISTENT
	req_access = list(access_syndicate)

/area/syndicate_station/start
	name = "Mercenary Forward Operating Base"
	icon_state = "yellow"
	requires_power = 0
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED | AREA_FLAG_IS_NOT_PERSISTENT
	req_access = list(access_syndicate)

//Skipjack
/area/skipjack_station
	name = "Raider Outpost"
	icon_state = "yellow"
	requires_power = 0
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED | AREA_FLAG_IS_NOT_PERSISTENT
	req_access = list(access_syndicate)

//NT rescue shuttle
/area/rescue_base
	name = "Response Team Base"
	icon_state = "yellow"
	requires_power = 0
	dynamic_lighting = 1
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED | AREA_FLAG_IS_NOT_PERSISTENT
	req_access = list(access_cent_specops)

/area/rescue_base/base
	name = "Barracks"
	icon_state = "yellow"
	dynamic_lighting = 0

/area/rescue_base/start
	name = "Response Team Base"
	icon_state = "shuttlered"
	base_turf = /turf/unsimulated/floor/rescue_base

// Command
/area/command/exploration_leader
	name = "Exploration Leader's Office"
	icon_state = "heads_sea"
	req_access = list(access_el)

/area/command/bsa
	name = "\improper Bluespace Artillery"
	icon_state = "firingrange"
	req_access = list(access_gun)

/area/crew_quarters/heads
	icon_state = "heads"

/area/crew_quarters/heads/cobed
	name = "Command - Captain's Quarters"
	sound_env = MEDIUM_SOFTFLOOR
	icon_state = "captain"
	req_access = list(access_captain)

/area/crew_quarters/heads/office/captain
	icon_state = "heads_cap"
	name = "Command - Captain's Office"
	sound_env = MEDIUM_SOFTFLOOR
	req_access = list(access_captain)

/area/crew_quarters/heads/office/hop
	icon_state = "heads_hop"
	name = "Command - HoP's Office"
	req_access = list(access_hop)

/area/crew_quarters/heads/office/rd
	icon_state = "heads_rd"
	name = "Command - RD's Office"
	req_access = list(access_rd)

/area/crew_quarters/heads/office/cmo
	icon_state = "heads_cmo"
	name = "Command - CMO's Office"
	req_access = list(access_cmo)

/area/crew_quarters/heads/office/ce
	icon_state = "heads_ce"
	name = "Command - CE's Office"
	req_access = list(access_ce)

/area/crew_quarters/heads/office/hos
	icon_state = "heads_hos"
	name = "Command - HoS' Office"
	req_access = list(access_hos)

/area/crew_quarters/heads/office/iaa
	icon_state = "heads_cl"
	name = "Command - IAA's Office"
	req_access = list(access_iaa)

/area/bridge
	name = "Bridge"
	icon_state = "bridge"
	req_access = list(access_bridge)

/area/bridge/meeting_room
	name = "Meeting Room"
	ambience = list()
	sound_env = MEDIUM_SOFTFLOOR

/area/bridge/lobby
	name = "Bridge Lobby"
	req_access = list()

/* not found on Colony
/area/bridge/canteen
	name = "Command Canteen"
	icon_state = "bar"
	req_access = list(list(access_bridge, access_kitchen))
*/

// Engineering
/area/engineering
	req_access = list(access_engine)
	icon_state = "engineering"

/area/engineering/auxpower
	name = "Auxiliary Power Storage"
	icon_state = "engine_smes"
	sound_env = SMALL_ENCLOSED

/area/engineering/hallway
	name = "Engineering Hallway"
	icon_state = "engineering_workshop"

/area/engineering/hardstorage
	name = "Engineering Hard Storage"
	icon_state = "engineering_storage"
	sound_env = SMALL_ENCLOSED

/area/engineering/engine_room
	name = "Engine Room"
	icon_state = "engine"
	sound_env = LARGE_ENCLOSED
	area_flags = AREA_FLAG_ION_SHIELDED
	req_access = list(access_engine_equip)

/area/engineering/drone_fabrication
	name = "Engineering Drone Fabrication"
	icon_state = "drone_fab"
	sound_env = SMALL_ENCLOSED
	req_access = list(access_ai_upload)

/area/engineering/engine_eva
	name = "Engine EVA"
	icon_state = "engine_eva"
	req_access = list(list(access_eva, access_external_airlocks), access_engine)

/area/engineering/engine_monitoring
	name = "Engine Monitoring Room"
	icon_state = "engine_monitoring"

/area/engineering/engine_smes
	name = "Engineering SMES"
	icon_state = "engine_smes"
	sound_env = SMALL_ENCLOSED

/area/engineering/engineering_monitoring
	name = "Engineering Monitoring Room"
	icon_state = "engine_monitoring"
	area_flags = AREA_FLAG_RAD_SHIELDED

/area/engineering/locker_room
	name = "Engineering Locker Room"
	icon_state = "engineering_locker"

/area/engineering/atmos
 	name = "Atmospherics"
 	icon_state = "atmos"
 	sound_env = LARGE_ENCLOSED
 	req_access = list(access_atmospherics)

/* not found on Colony
/area/engineering/fuelbay
	name = "Fuel Bay"
	icon_state = "engineering"
	sound_env = SMALL_ENCLOSED

/area/engineering/foyer
	name = "Engineering Foyer"
	icon_state = "engineering_foyer"

/area/engineering/gravity_gen
	name = "Gravity Generator"
	icon_state = "engine"
	sound_env = SMALL_ENCLOSED
*/

//Vacant Areas
/area/vacant
	name = "Vacant Area"
	icon_state = "construction"
	area_flags = AREA_FLAG_RAD_SHIELDED
//	req_access = list(access_construction)
	req_access = list(access_maint_tunnels)

/area/vacant/infirmary
	name = "Auxiliary Infirmary"
	icon_state = "medbay"

/area/vacant/monitoring
	name = "Auxiliary Monitoring Room"
	icon_state = "engine_monitoring"

/area/vacant/cargo
	name = "Requisitions Office"
	icon_state = "quart"

/area/vacant/mess
	name = "Officer's Mess"
	icon_state = "bar"

/area/vacant/gambling
	name = "Gambling Room"
	icon_state = "restrooms"
	sound_env = MEDIUM_SOFTFLOOR

/* not found on Colony
/area/vacant/cabin
	name = "Vacant Cabins"
	icon_state = "crew_quarters"

/area/vacant/chapel
	name = "Unused Chapel"
	icon_state = "chapel"

/area/vacant/prototype/control
	name = "Prototype Fusion Reactor Control Room"
	icon_state = "engine_monitoring"
	area_flags = null

/area/vacant/prototype/engine
	name = "Prototype Fusion Reactor Chamber"
	icon_state = "firingrange"

/area/vacant/missile
	name = "Third Deck Port Missile Pod"
	icon_state = "firingrange"

/area/vacant/brig
	name = "Permanent Brig"
	icon_state = "brig"

/area/vacant/office
	name = "Unused Office"
	icon_state = "conference"
*/

// Supply
/area/quartermaster
	req_access = list(access_cargo)

/area/quartermaster/office
	name = "Supply Office"
	icon_state = "quartoffice"
	req_access = list(access_mailsorting, access_cargo)

/area/quartermaster/storage
	name = "Warehouse"
	icon_state = "quartstorage"
	sound_env = LARGE_ENCLOSED

/area/quartermaster/deckofficer
	name = "Quartermaster"
	icon_state = "quart"
	req_access = list(access_qm)

/area/quartermaster/expedition
	name = "Expedition Preparation"
	icon_state = "mining"
	req_access = list(list(access_mining, access_xenoarch))

/area/quartermaster/expedition/eva
	name = "Expedition EVA"
	icon_state = "mining"

/area/quartermaster/expedition/storage
	name = "Expedition Storage"
	icon_state = "mining"

/area/quartermaster/exploration
	name = "Exploration Equipment"
	icon_state = "exploration"
	req_access = list(access_explorer)

/area/quartermaster/shuttlefuel
	name = "Shuttle Fuel Bay"
	icon_state = "toxstorage"
	sound_env = SMALL_ENCLOSED

/area/quartermaster/hangar
	name = "Hangar Deck"
	icon_state = "hangar"
	sound_env = LARGE_ENCLOSED
	req_access = list(access_hangar)

/area/quartermaster/unused
	name = "Ready Room"
	icon_state = "auxstorage"

// Robotics
/area/assembly
	req_access = list(access_robotics)

/area/assembly/chargebay
	name = "Mech Bay"
	icon_state = "mechbay"

/area/assembly/robotics
	name = "Robotics Lab"
	icon_state = "robotics"

/* not found on Colony
/area/assembly/robotics_surgery
	name = "Robotics Operating Theatre"
	icon_state = "robotics"
*/

//Research
/area/rnd/misc_lab
	name = "Miscellaneous Research"
	icon_state = "misclab"
	req_access = list(access_research)

/area/rnd/research
	name = "Research and Development"
	icon_state = "research"
	req_access = list(access_research)

/area/rnd/storage
	name = "Research Storage"
	icon_state = "toxstorage"
	req_access = list(access_tox_storage)

/area/rnd/canister
	name = "Canister Storage"
	icon_state = "toxstorage"
	sound_env = SMALL_ENCLOSED
	req_access = list(access_tox_storage)

/area/rnd/development
	name = "Fabricator Lab"
	icon_state = "devlab"
	req_access = list(access_tox)

/area/rnd/entry
	name = "Research and Development Access"
	icon_state = "decontamination"

/area/rnd/locker
	name = "Research Locker Room"
	icon_state = "locker"

/area/rnd/xenobiology/entry
	name = "Xenobiology Access"
	icon_state = "xeno_lab"

/area/rnd/xenobiology/entry2
	name = "Xenobiology Access"
	icon_state = "xeno_lab"

/area/rnd/xenobiology/level1
	name = "Xenobiology Level One"
	icon_state = "xeno_lab"

/area/rnd/xenobiology/level2
	name = "Xenobiology Level Two"
	icon_state = "xeno_lab"

/area/rnd/xenobiology/atmos
	name = "Xenobiology Atmos Hub"
	icon_state = "xeno_lab"

/area/rnd/xenobiology/water_cell
	name = "Xenobiology Water Cell"
	icon_state = "xeno_lab"

/area/rnd/xenobiology/storage
	name = "Xenobiology Storage"
	icon_state = "xeno_lab"

/area/rnd/blanks
	name = "Aux Custodial Supplies"
	icon_state = "decontamination"
	area_flags = AREA_FLAG_RAD_SHIELDED
	sound_env = SMALL_ENCLOSED
	req_access = list(access_rd)

/* not found on Colony
/area/rnd/checkpoint
	name = "Research Security Checkpoint"
	icon_state = "checkpoint1"
	req_access = list(access_security)
*/

// Crew areas
/area/hydroponics
	name = "Hydroponics"
	icon_state = "hydro"

/area/hydroponics/storage
	name = "Hydroponics Storage"

/area/janitor
	name = "Custodial Closet"
	icon_state = "janitor"
	req_access = list(access_janitor)

/area/crew_quarters/bar
	name = "Bar"
	icon_state = "bar"
	sound_env = LARGE_SOFTFLOOR
	req_access = list(access_bar)

/area/crew_quarters/cryolocker
	name = "Cryogenic Storage Wardrobe"
	icon_state = "locker"

/area/crew_quarters/head
	name = "Head"
	icon_state = "toilet"

/area/crew_quarters/gym
	name = "Gym"
	icon_state = "fitness"

/area/crew_quarters/mess
	name = "Canteen"
	icon_state = "cafeteria"

/area/crew_quarters/galley
	name = "Galley"
	icon_state = "kitchen"
	req_access = list(access_kitchen)

/area/crew_quarters/galley/backroom
	name = "Galley Cold Storage"
	icon_state = "kitchen"

/area/crew_quarters/lounge
	name = "Lounge"
	icon_state = "crew_quarters"
	sound_env = MEDIUM_SOFTFLOOR

/area/crew_quarters/safe_room
	name = "Safe Room"
	icon_state = "crew_quarters"
	sound_env = SMALL_ENCLOSED
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED

/area/crew_quarters/sleep/bunk
	name = "Dormitory"
	icon_state = "Sleep"
	sound_env = SMALL_SOFTFLOOR
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED

/area/crew_quarters/sleep/cryo
	name = "Cryogenic Storage"
	icon_state = "Sleep"
// Security
/area/security/colony/hallway
	name = "Security - Fore Hallway"
	icon_state = "security"
	sound_env = LARGE_ENCLOSED

/area/security/colony/hallway/aft
	name = "Security - Aft Hallway"
	icon_state = "security"

/area/security/colony/hallway/port
	name = "Security - Port Hallway"
	icon_state = "security"

/area/security/colony/sergeant
	name = "Security - Warden"
	icon_state = "brig"
	req_access = list(access_warden)

/area/security/colony/armory
	name = "Security - Armory"
	icon_state = "armory"
	req_access = list(access_armory)

/area/security/colony/armory/lobby
	name = "Security - Armory - Lobby"
	icon_state = "armory"

/area/security/colony/suits
	name = "Security - Suits Storage"
	icon_state = "security"
	req_access = list(access_seceva)

/area/security/colony/breakroom
	name = "Security - Break Room"
	icon_state = "security"

/area/security/colony/hosbed
	name = "Security - HoS - Bedroom"
	icon_state = "sec_hos"
	req_access = list(access_hos)

/area/security/colony/forensic
	name = "Security - Forensic"
	icon_state = "detective"
	req_access = list(access_forensics_lockers)

/area/security/colony/forensic/lab
	name = "Security - Forensic - Laboratory"
	icon_state = "detective"

/area/security/colony/equipment
	name = "Security - Equipment storage"
	icon_state = "security"
	req_access = list(access_security)

/area/security/colony/interrogation
	name = "Security - Interrogation"
	icon_state = "detective"
	req_access = list(list(access_forensics_lockers, access_security))

/area/security/colony/evidence
	name = "Security - Evidence Storage"
	icon_state = "detective"
	req_access = list(list(access_forensics_lockers, access_security))

/area/security/range
	name = "Security - Firing Range"
	icon_state = "firingrange"
	req_access = list()

/area/security/nuke_storage
	name = "Vault"
	icon_state = "nuke_storage"
	req_access = list(access_heads_vault)

/area/security/colony/dockcheck
	name = "Security - Fore Docks Checkpoint"
	icon_state = "checkpoint1"
	req_access = list(list(access_security, access_forensics_lockers))

// Medbay
/area/medical/equipstorage
	name = "Infirmary Storage"
	icon_state = "medbay4"

/area/medical/maintenance_equipstorage
	name = "Infirmary Maintenance Storage"
	icon_state = "medbay4"
	req_access = list(access_medical_equip)

/area/medical/infirmary
	name = "Infirmary Hallway"
	icon_state = "medbay"

/area/medical/starboard_hallway
	name = "Starboard Hallway"
	icon_state = "medbay2"

/area/medical/infirmreception
	name = "Infirmary Reception"
	icon_state = "medbay2"

/area/medical/locker
	name = "Infirmary Locker Room"
	icon_state = "locker"
	req_access = list(access_medical_equip)

/area/medical/subacute
	name = "Sub-Acute Ward"
	icon_state = "patients"

/area/medical/mentalhealth
	name = "Mental Health"
	icon_state = "medbay3"
	ambience = list('sound/ambience/signal.ogg')
	req_access = list(access_psychiatrist)

/area/medical/coffins
	name = "Coffins Storage"
	icon_state = "patients" //:^)
	ambience = list('sound/ambience/ambimo1.ogg','sound/ambience/ambimo2.ogg','sound/music/main.ogg')
	sound_env = SMALL_ENCLOSED
	req_access = list(access_chapel_office)

/area/medical/chemistry
	name = "Chemistry"
	icon_state = "chem"
	req_access = list(access_chemistry)

/area/medical/morgue
	name = "Morgue"
	icon_state = "morgue"
	ambience = list('sound/ambience/ambimo1.ogg','sound/ambience/ambimo2.ogg','sound/music/main.ogg')
	req_access = list(access_morgue)

/area/medical/sleeper
	name = "Emergency Treatment Center"
	icon_state = "exam_room"
	req_access = list(access_medical_equip)

/area/medical/surgery
	name = "Operating Theatre"
	icon_state = "surgery"
	req_access = list(access_surgery)

/* not found on Colony
/area/medical/exam_room
	name = "Exam Room"
	icon_state = "exam_room"

/area/medical/autopsy
	name = "Autopsy"
	icon_state = "autopsy"
	req_access = list(list(access_morgue, access_forensics_lockers))
*/

// Chapel
/area/chapel/main
	name = "Chapel"
	icon_state = "chapel"
	ambience = list('sound/ambience/ambicha1.ogg','sound/ambience/ambicha2.ogg','sound/ambience/ambicha3.ogg','sound/ambience/ambicha4.ogg','sound/music/traitor.ogg')
	sound_env = LARGE_ENCLOSED

/area/chapel/crematorium
	name = "Crematorium"
	icon_state = "chapel"
	sound_env = SMALL_ENCLOSED
	req_access = list(access_crematorium)

// Shield Rooms
/area/shield
	name = "Shield Generator"
	icon_state = "engineering"
	sound_env = SMALL_ENCLOSED
	req_access = list(access_engine, access_atmospherics)

/area/shield/firstdeck
	name = "First Deck Shield Generator"

/area/shield/seconddeck
	name = "Second Deck Shield Generator"

/area/shield/thirddeck
	name = "Third Deck Shield Generator"

// Misc
/area/deity_spawn
	name = "Deity Spawn"
	icon_state = "yellow"
	requires_power = 0
	dynamic_lighting = 0

/area/teleporter
	name = "Teleporter"
	icon_state = "teleporter"
	sound_env = SMALL_ENCLOSED
	req_access = list(access_teleporter)

/area/thruster
	icon_state = "thruster"
	req_access = list(access_engine)

/area/thruster/d1port
	name = "First Deck Port Nacelle"

/area/thruster/d1starboard
	name = "First Deck Starboard Nacelle"

/area/thruster/d3port
	name = "Third Deck Port Nacelle"

/area/thruster/d3starboard
	name = "Third Deck Starboard Nacelle"

/area/maintenance/substation
	name = "Substation"
	icon_state = "substation"
	sound_env = SMALL_ENCLOSED
	req_access = list(access_engine)

/area/maintenance/exterior
	name = "Exterior Reinforcements"
	icon_state = "maint_security_starboard"
	area_flags = AREA_FLAG_EXTERNAL
	has_gravity = FALSE
	turf_initializer = /decl/turf_initializer/maintenance/space
	sound_env = SPACE

/area/alien
	name = "Alien base"
	icon_state = "yellow"
	requires_power = 0

/area/shuttle/alien/base
	icon_state = "shuttle"
	name = "Alien Shuttle Base"
	requires_power = 1

// CentCom
/area/centcom/control
	name = "Centcom Control"

/area/centcom/creed
	name = "Creed's Office"
	req_access = list(access_cent_creed)

/area/centcom/evac
	name = "Centcom Emergency Shuttle"

/area/centcom/ferry
	name = "Centcom Transport Shuttle"

/area/centcom/living
	name = "Centcom Living Quarters"
	req_access = list(access_cent_living)

/area/centcom/suppy
	name = "Centcom Supply Shuttle"

/area/centcom/test
	name = "Centcom Testing Facility"

/area/admin_prison
	name = "Admin Prison"
	dynamic_lighting = 0
	requires_power = 0
	icon_state = "blue-red-d"

// Solars
/area/maintenance/solar
	name = "Solar Maintenance - Port"
	icon_state = "SolarcontrolP"
	sound_env = SMALL_ENCLOSED
	req_access = list(access_engine)

/area/maintenance/solar/starboard
	name = "Solar Maintenance - Starboard"
	icon_state = "SolarcontrolS"

/area/solar
	area_flags = AREA_FLAG_EXTERNAL
	requires_power = 1
	always_unpowered = 1
	has_gravity = FALSE
	base_turf = /turf/space
	sound_env = SPACE

/area/solar/starboard
	name = "Starboard Solar Array"
	icon_state = "panelsS"

/area/solar/port
	name = "Port Solar Array"
	icon_state = "panelsP"

// Storage
/area/storage/primary
	name = "Primary Tool Storage"
	icon_state = "primarystorage"

/area/storage/tech
	name = "Technical Storage"
	icon_state = "storage"
	req_access = list(access_tech_storage)

/area/storage/auxillary/port
	name = "Port Auxillary Storage"
	icon_state = "auxstorage"
	req_access = list(access_cargo)

/area/storage/bridge
	name = "Bridge Storage"
	icon_state = "bridge"
	sound_env = SMALL_ENCLOSED

/* not found on Colony
/area/storage/tools
	name = "Auxiliary Tool Storage"
	icon_state = "auxstorage"

/area/storage/auxillary/starboard
	name = "Starboard Auxillary Storage"
	icon_state = "auxstorage"
*/

// Holodecks
/area/holodeck
	name = "\improper Holodeck"
	icon_state = "Holodeck"
	dynamic_lighting = 0
	sound_env = LARGE_ENCLOSED

/area/holodeck/alphadeck
	name = "\improper Holodeck Alpha"

/area/holodeck/source_plating
	name = "\improper Holodeck - Off"

/area/holodeck/source_emptycourt
	name = "\improper Holodeck - Empty Court"
	sound_env = ARENA

/area/holodeck/source_boxingcourt
	name = "\improper Holodeck - Boxing Court"
	sound_env = ARENA

/area/holodeck/source_basketball
	name = "\improper Holodeck - Basketball Court"
	sound_env = ARENA

/area/holodeck/source_thunderdomecourt
	name = "\improper Holodeck - Thunderdome Court"
	sound_env = ARENA

/area/holodeck/source_courtroom
	name = "\improper Holodeck - Courtroom"
	sound_env = AUDITORIUM

/area/holodeck/source_beach
	name = "\improper Holodeck - Beach"
	sound_env = PLAIN

/area/holodeck/source_wildlife
	name = "Holodeck - Wildlife Simulation"

/area/holodeck/source_military
	name = "Holodeck - Military Parade Ground"
	sound_env = AUDITORIUM

/area/holodeck/source_meetinghall
	name = "\improper Holodeck - Meeting Hall"
	sound_env = AUDITORIUM

/area/holodeck/source_theatre
	name = "\improper Holodeck - Theatre"
	sound_env = CONCERT_HALL

/area/holodeck/source_picnicarea
	name = "\improper Holodeck - Picnic Area"
	sound_env = PLAIN

/area/holodeck/source_snowfield
	name = "\improper Holodeck - Snow Field"
	sound_env = FOREST

/area/holodeck/source_desert
	name = "\improper Holodeck - Desert"
	sound_env = PLAIN

/area/holodeck/source_space
	name = "\improper Holodeck - Space"
	has_gravity = 0
	sound_env = SPACE

/area/holodeck/source_cafe
	name = "\improper Holodeck - Cafe"
	sound_env = PLAIN

/area/holodeck/source_volleyball
	name = "\improper Holodeck - Volleyball"
	sound_env = PLAIN

/area/holodeck/source_temple
	name = "\improper Holodeck - Temple"
	sound_env = SMALL_ENCLOSED

/area/holodeck/source_plaza
	name = "\improper Holodeck - Plaza"
	sound_env = SMALL_ENCLOSED

// Shuttles
/area/shuttle/administration/centcom
	name = "Administration Shuttle"
	icon_state = "shuttlered"
	req_access = list(access_cent_general)

/area/supply/dock
	name = "Supply Shuttle"
	icon_state = "shuttle3"
	requires_power = 0
	req_access = list(access_cent_storage)

// Tcomm
/area/tcommsat/
	ambience = list('sound/ambience/ambisin2.ogg', 'sound/ambience/signal.ogg', 'sound/ambience/signal.ogg', 'sound/ambience/ambigen10.ogg')
	req_access = list(access_tcomsat)

/area/tcommsat/chamber
	name = "Telecoms Central Compartment"
	icon_state = "tcomsatcham"

/area/tcommsat/computer
	name = "Telecoms Control Room"
	icon_state = "tcomsatcomp"

/area/tcommsat/storage
	name = "Telecoms Storage"
	icon_state = "tcomsatstore"

// AI
/area/ai_monitored
	name = "AI Monitored Area"

/area/ai_monitored/storage/eva
	name = "EVA Storage"
	icon_state = "eva"
	req_access = list(access_eva)

/area/turret_protected
	req_access = list(access_ai_upload)

/area/turret_protected/ai
	name = "AI Chamber"
	icon_state = "ai_chamber"
	ambience = list('sound/ambience/ambimalf.ogg')

/area/turret_protected/ai_cyborg_station
	name = "Cyborg Station"
	icon_state = "ai_cyborg"
	sound_env = SMALL_ENCLOSED

/area/turret_protected/ai_upload
	name = "AI Upload Chamber"
	icon_state = "ai_upload"
	ambience = list('sound/ambience/ambimalf.ogg')

/area/turret_protected/ai_upload_foyer
	name = " AI Upload Access"
	icon_state = "ai_foyer"
	ambience = list('sound/ambience/ambimalf.ogg')
	sound_env = SMALL_ENCLOSED

/* not found on Colony
/area/turret_protected/ai_foyer
	name = "AI Chamber Foyer"
	icon_state = "ai_foyer"
	sound_env = SMALL_ENCLOSED

/area/turret_protected/ai_outer_chamber
	name = "Outer AI Chamber"
	icon_state = "ai_chamber"
	sound_env = SMALL_ENCLOSED
*/

// Merchant
/area/merchant_station
	name = "Merchant Station"
	icon_state = "LP"
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED | AREA_FLAG_IS_NOT_PERSISTENT
	req_access = list(access_merchant)

// Syndicate
/area/syndicate_mothership/raider_base
	name = "Raider Base"
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED | AREA_FLAG_IS_NOT_PERSISTENT
	req_access = list(access_syndicate)

// ACTORS GUILD
/area/acting
	name = "Centcom Acting Guild"
	icon_state = "red"
	dynamic_lighting = 0
	requires_power = 0

/area/acting/backstage
	name = "Backstage"

/area/acting/stage
	name = "Stage"
	dynamic_lighting = 1
	icon_state = "yellow"

// Thunderdome
/area/tdome
	name = "Thunderdome"
	icon_state = "thunder"
	requires_power = 0
	dynamic_lighting = 0
	sound_env = ARENA
	req_access = list(access_cent_thunder)

/area/tdome/tdome1
	name = "Thunderdome (Team 1)"
	icon_state = "green"

/area/tdome/tdome2
	name = "Thunderdome (Team 2)"
	icon_state = "yellow"

/area/tdome/tdomeadmin
	name = "Thunderdome (Admin.)"
	icon_state = "purple"

/area/tdome/tdomeobserve
	name = "Thunderdome (Observer.)"
	icon_state = "purple"

/area/tdome/testing
	name = "Thunderdome (TESTING AREA)"
	icon_state = "purple"

/area/tdome/testing/engineering
	requires_power = 0
	dynamic_lighting = 1

/area/tdome/testing/engineering/unpowered
	requires_power = 1

/area/prison/solitary
	name = "Solitary Confinement"
	icon_state = "brig"
	req_access = list(access_brig)
