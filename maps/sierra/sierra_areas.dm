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

//Third Deck (Z-1)
/area/hallway/primary/thirddeck/fore
	name = "\improper Third Deck Fore Hallway"
	icon_state = "hallF"

/area/hallway/primary/thirddeck/center
	name = "\improper Third Deck Central Hallway"
	icon_state = "hallC3"

/area/hallway/primary/thirddeck/aft
	name = "\improper Third Deck Aft Hallway"
	icon_state = "hallA"

/area/hallway/primary/thirddeck/central_stairwell
	name = "\improper Third Deck Central Stairwell"
	icon_state = "hallC2"

/area/maintenance/thirddeck
	name = "\improper Third Deck Maintenance"
	icon_state = "maintcentral"

/area/maintenance/thirddeck/aft
	name = "\improper Third Deck Aft Maintenance"
	icon_state = "amaint"

/area/maintenance/thirddeck/foreport
	name = "\improper Third Deck Fore Port Maintenance"
	icon_state = "fpmaint"

/area/maintenance/thirddeck/forestarboard
	name = "\improper Third Deck Fore Starboard Maintenance"
	icon_state = "fsmaint"

/area/maintenance/thirddeck/starboard
	name = "\improper Third Deck Starboard Maintenance"
	icon_state = "smaint"

/area/maintenance/thirddeck/port
	name = "\improper Third Deck Port Maintenance"
	icon_state = "pmaint"

/area/teleporter/thirddeck
	name = "\improper Third Deck Teleporter"
	icon_state = "teleporter"

/area/maintenance/substation/thirddeck
	name = "\improper Third Deck Substation"

/area/maintenance/waterstore
	name = "\improper Cistern"
	icon_state = "disposal"
	req_access = list(list(access_cargo, access_engine, access_el))

/area/crew_quarters/commissary
	name = "\improper Commissary"
	icon_state = "crew_quarters"
	req_access = list(access_commissary)

//Second Deck (Z-2)
/area/hallway/primary/seconddeck/fore
	name = "\improper Second Deck Fore Hallway"
	icon_state = "hallF"

/area/hallway/primary/seconddeck/center
	name = "\improper Second Deck Central Hallway"
	icon_state = "hallC3"

/area/hallway/primary/seconddeck/aft
	name = "\improper Second Deck Aft Hallway"
	icon_state = "hallA"

/area/hallway/primary/seconddeck/central_stairwell
	name = "\improper Second Deck Central Stairwell"
	icon_state = "hallC2"

/area/hallway/primary/seconddeck/fore_stairwell
	name = "\improper Second Deck Fore Stairwell"
	icon_state = "hallC2"

/area/maintenance/seconddeck
	name = "\improper Second Deck Maintenance"
	icon_state = "maintcentral"

/area/maintenance/seconddeck/foreport
	name = "\improper Second Deck Fore Port Maintenance"
	icon_state = "fpmaint"

/area/maintenance/seconddeck/forestarboard
	name = "\improper Second Deck Fore Starboard Maintenance"
	icon_state = "fsmaint"

/area/maintenance/seconddeck/starboard
	name = "\improper Second Deck Starboard Maintenance"
	icon_state = "smaint"

/area/maintenance/seconddeck/port
	name = "\improper Second Deck Port Maintenance"
	icon_state = "pmaint"

/area/maintenance/seconddeck/aftstarboard
	name = "\improper Second Deck Aft Starboard Maintenance"
	icon_state = "asmaint"

/area/maintenance/seconddeck/aftport
	name = "\improper Second Deck Aft Port Maintenance"
	icon_state = "apmaint"

/area/teleporter/seconddeck
	name = "\improper Second Deck Teleporter"
	icon_state = "teleporter"

/area/maintenance/bluespace
	name = "\improper Bluespace Drive"
	icon_state = "engineering"
	req_access = list(list(access_engine_equip, access_heads), access_engine, access_maint_tunnels)

/area/crew_quarters/safe_room/seconddeck
	name = "\improper Second Deck Safe Room"
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED

/area/maintenance/substation/seconddeck
	name = "\improper Second Deck Substation"

/area/maintenance/compactor
	name = "\improper Compactor"
	icon_state = "disposal"
	sound_env = STANDARD_STATION
	req_access = list(list(access_cargo, access_maint_tunnels))

/area/crew_quarters/laundry
	name = "\improper Laundry Room"
	icon_state = "Sleep"

/area/maintenance/abandoned_compartment
	name = "\improper Unknown Compartment"
	turf_initializer = /decl/turf_initializer/maintenance/heavy
	icon_state = "cafeteria"

/area/maintenance/abandoned_hydroponics
	name = "\improper Abandoned Hydroponics"
	icon_state = "hydro"
	turf_initializer = /decl/turf_initializer/maintenance/heavy

/area/maintenance/abandoned_common
	name = "\improper Abandoned Common Room"
	icon = 'infinity/icons/turf/areas.dmi'
	icon_state = "music_room"

//First Deck (Z-3)
/area/maintenance/firstdeck
	name = "\improper First Deck Maintenance"
	icon_state = "maintcentral"

/area/maintenance/firstdeck/aftstarboard
	name = "\improper First Deck Aft Starboard Maintenance"
	icon_state = "asmaint"

/area/maintenance/firstdeck/aftport
	name = "\improper First Deck Aft Port Maintenance"
	icon_state = "apmaint"

/area/maintenance/firstdeck/forestarboard
	name = "\improper First Deck Fore Starboard Maintenance"
	icon_state = "fsmaint"

/area/maintenance/firstdeck/fore
	name = "\improper First Deck Fore Port Maintenance"
	icon_state = "fpmaint"

/area/maintenance/firstdeck/foreport
	name = "\improper First Deck Fore Maintenance"
	icon_state = "fpmaint"

/area/maintenance/firstdeck/centralstarboard
	name = "\improper First Deck Starboard Maintenance"
	icon_state = "smaint"

/area/maintenance/firstdeck/centralport
	name = "\improper First Deck Port Maintenance"
	icon_state = "pmaint"

/area/hallway/primary/firstdeck/fore
	name = "\improper First Deck Fore Hallway"
	icon_state = "hallF"

/area/hallway/primary/firstdeck/center
	name = "\improper First Deck Central Hallway"
	icon_state = "hallC1"

/area/hallway/primary/firstdeck/aft
	name = "\improper First Deck Aft Hallway"
	icon_state = "hallA"

/area/hallway/primary/firstdeck/central_stairwell
	name = "\improper First Deck Central Stairwell"
	icon_state = "hallC2"

/area/hallway/primary/firstdeck/fore_stairwell
	name = "\improper First Deck Fore Stairwell"
	icon_state = "hallC2"

/area/crew_quarters/safe_room/firstdeck
	name = "\improper First Deck Safe Room"
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED

/area/maintenance/substation/firstdeck
	name = "\improper First Deck Substation"

/* not found on Sierra
/area/teleporter/firstdeck
	name = "\improper First Deck Teleporter"
	icon_state = "teleporter"

/area/hallway/primary/firstdeck/foreport
	name = "\improper First Deck Fore Hallway"
	icon_state = "hallF"
*/

// Shuttles
/area/shuttle/transport1/centcom
	name = "\improper Transport Shuttle Centcom"
	icon_state = "shuttle"
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED | AREA_FLAG_IS_NOT_PERSISTENT

//sierra large pods
/area/shuttle/escape_pod6/station
	name = "\improper Escape Pod One"
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED | AREA_FLAG_IS_NOT_PERSISTENT
	icon_state = "exit"

/area/shuttle/escape_pod7/station
	name = "\improper Escape Pod Two"
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED | AREA_FLAG_IS_NOT_PERSISTENT
	icon_state = "exit"

/area/shuttle/escape_pod8/station
	name = "\improper Escape Pod Three"
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED | AREA_FLAG_IS_NOT_PERSISTENT
	icon_state = "exit"

/area/shuttle/escape_pod9/station
	name = "\improper Escape Pod Four"
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED | AREA_FLAG_IS_NOT_PERSISTENT
	icon_state = "exit"

/area/shuttle/escape_pod10/station
	name = "\improper Escape Pod Five"
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED | AREA_FLAG_IS_NOT_PERSISTENT
	icon_state = "exit"

//sierra small pods
/area/shuttle/escape_pod12/station
	name = "\improper Escape Pod Seven"
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED | AREA_FLAG_IS_NOT_PERSISTENT
	icon_state = "exit"

/area/shuttle/escape_pod13/station
	name = "\improper Escape Pod Eight"
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED | AREA_FLAG_IS_NOT_PERSISTENT
	icon_state = "exit"

/area/shuttle/escape_pod14/station
	name = "\improper Escape Pod Nine"
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED | AREA_FLAG_IS_NOT_PERSISTENT
	icon_state = "exit"

/area/shuttle/escape_pod15/station
	name = "\improper Escape Pod Ten"
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED | AREA_FLAG_IS_NOT_PERSISTENT
	icon_state = "exit"

/area/shuttle/escape_pod16/station
	name = "\improper Escape Pod Eleven"
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED | AREA_FLAG_IS_NOT_PERSISTENT
	icon_state = "exit"

/area/shuttle/escape_pod17/station
	name = "\improper Escape Pod Twelve"
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED | AREA_FLAG_IS_NOT_PERSISTENT
	icon_state = "exit"

//Charon
/area/exploration_shuttle
	name = "\improper Charon"
	icon_state = "shuttlered"
	base_turf = /turf/simulated/floor/plating
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED
//	req_access = list(access_expedition_shuttle)

/area/exploration_shuttle/cockpit
	name = "\improper Charon - Cockpit"
//	req_access = list(access_expedition_shuttle_helm)
/area/exploration_shuttle/atmos
	name = "\improper Charon - Atmos Compartment"
/area/exploration_shuttle/power
	name = "\improper Charon - Power Compartment"
/area/exploration_shuttle/medical
	name = "\improper Charon - Medical Compartment"
/area/exploration_shuttle/cargo
	name = "\improper Charon - Cargo Bay"
/area/exploration_shuttle/airlock
	name = "\improper Charon - Airlock Compartment"

//Guppy
/area/guppy_hangar/start
	name = "\improper Guppy"
	icon_state = "shuttlered"
	requires_power = 1
	dynamic_lighting = 1
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED
	req_access = list(access_guppy)

//Petrov
/area/shuttle/petrov
	name = "\improper NSV Petrov"
	requires_power = 1
	dynamic_lighting = 1
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED
	req_access = list(access_petrov)

/area/shuttle/petrov/ship
	icon_state = "shuttlered"
/area/shuttle/petrov/cell1
	name = "\improper NSV Petrov - Isolation Cell 1"
	icon_state = "shuttle"
/area/shuttle/petrov/cell2
	name = "\improper NSV Petrov - Isolation Cell 2"
	icon_state = "shuttlegrn"
/area/shuttle/petrov/cell3
	name = "\improper NSV Petrov - Isolation Cell 3"
	icon_state = "shuttle"

//Turbolift
/area/turbolift
	icon_state = "shuttle"
	dynamic_lighting = 1
	area_flags = AREA_FLAG_ION_SHIELDED
	req_access = list(access_maint_tunnels)

/area/turbolift/sierra_top
	name = "lift (first deck)"
	lift_floor_label = "Deck 1"
	lift_floor_name = "Main Deck"
	lift_announce_str = "Arriving at Main Deck: Bridge. Captain's Mess. Meeting Room. Security Wing. Research Wing. Infirmary. AI Core."

/area/turbolift/sierra_middle
	name = "lift (second deck)"
	lift_floor_label = "Deck 2"
	lift_floor_name = "Living Deck"
	lift_announce_str = "Arriving at Living Deck: Cryogenic Storage. Dormitory. Holodeck. Lounge. Bar. Hydroponics. Gym. Laundry. Engineering. Atmospherics. Telecommunications. EVA."

/area/turbolift/sierra_ground
	name = "lift (third deck)"
	lift_floor_label = "Deck 3"
	lift_floor_name = "Hangar Deck"
	lift_announce_str = "Arriving at Hangar Deck: Shuttle Docks. Supply Office. Cargo Storage. Main Hangar. Expedition Preparation. Exploration Leader's Office. Mineral Processing. Sanitation."
	base_turf = /turf/simulated/floor

/area/turbolift/start
	name = "\improper Turbolift Start"

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
	name = "\improper Ninja Base"
	icon_state = "green"
	requires_power = 0
	dynamic_lighting = 1
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED | AREA_FLAG_IS_NOT_PERSISTENT
	req_access = list(access_syndicate)

/area/ninja_dojo/dojo
	name = "\improper Clan Dojo"
	dynamic_lighting = 0

/area/ninja_dojo/start
	name = "\improper Clan Dojo"
	icon_state = "shuttlered"
	base_turf = /turf/simulated/floor/plating

//Merchant
/area/shuttle/merchant/home
	name = "\improper Merchant Vessel"
	icon_state = "shuttlegrn"
	requires_power = 1
	dynamic_lighting = 1
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED | AREA_FLAG_IS_NOT_PERSISTENT
	req_access = list(access_merchant)

//Merc
/area/syndicate_mothership
	name = "\improper Mercenary Base"
	icon_state = "syndie-ship"
	requires_power = 0
	dynamic_lighting = 0
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED | AREA_FLAG_IS_NOT_PERSISTENT
	req_access = list(access_syndicate)

/area/syndicate_station/start
	name = "\improper Mercenary Forward Operating Base"
	icon_state = "yellow"
	requires_power = 0
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED | AREA_FLAG_IS_NOT_PERSISTENT
	req_access = list(access_syndicate)

//Skipjack
/area/skipjack_station
	name = "\improper Raider Outpost"
	icon_state = "yellow"
	requires_power = 0
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED | AREA_FLAG_IS_NOT_PERSISTENT
	req_access = list(access_syndicate)

//NT rescue shuttle
/area/rescue_base
	name = "\improper Response Team Base"
	icon_state = "yellow"
	requires_power = 0
	dynamic_lighting = 1
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED | AREA_FLAG_IS_NOT_PERSISTENT
	req_access = list(access_cent_specops)

/area/rescue_base/base
	name = "\improper Barracks"
	icon_state = "yellow"
	dynamic_lighting = 0

/area/rescue_base/start
	name = "\improper Response Team Base"
	icon_state = "shuttlered"
	base_turf = /turf/unsimulated/floor/rescue_base

// Command
/area/command/exploration_leader
	name = "\improper Exploration Leader's Office"
	icon_state = "heads_sea"
	req_access = list(access_el)

/area/command/bsa
	name = "\improper Bluespace Artillery"
	icon_state = "firingrange"
	req_access = list(access_gun)

/area/crew_quarters/heads
	icon_state = "heads"

/area/crew_quarters/heads/cobed
	name = "\improper Command - Captain's Quarters"
	sound_env = MEDIUM_SOFTFLOOR
	icon_state = "captain"
	req_access = list(access_captain)

/area/crew_quarters/heads/office/captain
	name = "\improper Command - Captain's Office"
	icon_state = "heads_cap"
	sound_env = MEDIUM_SOFTFLOOR
	req_access = list(access_captain)

/area/crew_quarters/heads/captain
	req_access = list(access_captain)
	icon_state = "heads_cap"

/area/crew_quarters/heads/captain/office_anteroom
	name = "\improper Command - Captain's Office Anteroom"
	sound_env = MEDIUM_SOFTFLOOR

/area/crew_quarters/heads/captain/beach
	name = "\improper Command - Captain's Beach Room"
	icon_state = "heads_cap"
	sound_env = PLAIN
	req_access = list()

/area/crew_quarters/heads/captain/secret_room/level_one
	name = "\improper Captain's toilet"

/area/crew_quarters/heads/captain/secret_room/level_two
	name = "\improper Captain's bathroom"

/area/crew_quarters/heads/office/hop
	name = "\improper Command - HoP's Office"
	icon_state = "heads_hop"
	req_access = list(access_hop)

/area/crew_quarters/heads/office/hop/cobed
	name = "\improper Command - HoP's Quarters"

/area/crew_quarters/heads/office/rd
	icon_state = "heads_rd"
	name = "\improper Command - RD's Office"
	req_access = list(access_rd)

/area/crew_quarters/heads/office/cmo
	icon_state = "heads_cmo"
	name = "\improper Command - CMO's Office"
	req_access = list(access_cmo)

/area/crew_quarters/heads/office/ce
	icon_state = "heads_ce"
	name = "\improper Command - CE's Office"
	req_access = list(access_ce)

/area/crew_quarters/heads/office/hos
	icon_state = "heads_hos"
	name = "\improper Command - HoS' Office"
	req_access = list(access_hos)

/area/crew_quarters/heads/office/iaa
	icon_state = "heads_cl"
	name = "\improper Command - IAA's Office"
	req_access = list(access_iaa)

/area/bridge
	name = "\improper Bridge"
	icon_state = "bridge"
	req_access = list(access_bridge)

/area/bridge/nano
	icon = 'infinity/icons/turf/areas.dmi'
	icon_state = "bridge_nano"  // Yes, this is exactly what no one has ever done, probably.
	dynamic_lighting = 1

/area/bridge/meeting_room
	name = "\improper Meeting Room"
	ambience = list()
	sound_env = MEDIUM_SOFTFLOOR

/area/bridge/hall/level_one
	name = "\improper Bridge Hall Level One"

/area/bridge/hall/level_two
	name = "\improper Bridge Hall Level Two"

/area/bridge/lobby
	name = "\improper Bridge Lobby"
	req_access = list()

/area/bridge/gun/energy
	name = "\improper Ship Lasers Battery"
	icon = 'infinity/icons/turf/areas.dmi'
	icon_state = "bridge_gun"

/* not found on Sierra
/area/bridge/canteen
	name = "\improper Command Canteen"
	icon_state = "bar"
	req_access = list(list(access_bridge, access_kitchen))
*/

// Engineering
/area/engineering
	req_access = list(access_engine)
	icon_state = "engineering"

/area/engineering/auxpower
	name = "\improper Auxiliary Power Storage"
	icon_state = "engine_smes"
	sound_env = SMALL_ENCLOSED

/area/engineering/hallway
	name = "\improper Engineering Hallway"
	icon_state = "engineering_workshop"

/area/engineering/hardstorage
	name = "\improper Engineering Hard Storage"
	icon_state = "engineering_storage"
	sound_env = SMALL_ENCLOSED

/area/engineering/engine_room
	name = "\improper Engine Room"
	icon_state = "engine"
	sound_env = LARGE_ENCLOSED
	area_flags = AREA_FLAG_ION_SHIELDED
	req_access = list(access_engine_equip)

/area/engineering/drone_fabrication
	name = "\improper Engineering Drone Fabrication"
	icon_state = "drone_fab"
	sound_env = SMALL_ENCLOSED
	req_access = list(access_ai_upload)

/area/engineering/engine_eva
	name = "\improper Engine EVA"
	icon_state = "engine_eva"
	req_access = list(list(access_eva, access_external_airlocks), access_engine)

/area/engineering/engine_monitoring
	name = "\improper Engine Monitoring Room"
	icon_state = "engine_monitoring"

/area/engineering/engine_smes
	name = "\improper Engineering SMES"
	icon_state = "engine_smes"
	sound_env = SMALL_ENCLOSED

/area/engineering/engineering_monitoring
	name = "\improper Engineering Monitoring Room"
	icon_state = "engine_monitoring"
	area_flags = AREA_FLAG_RAD_SHIELDED

/area/engineering/locker_room
	name = "\improper Engineering Locker Room"
	icon_state = "engineering_locker"

/area/engineering/atmos
 	name = "\improper Atmospherics"
 	icon_state = "atmos"
 	sound_env = LARGE_ENCLOSED
 	req_access = list(access_atmospherics)

/* not found on Sierra
/area/engineering/fuelbay
	name = "\improper Fuel Bay"
	icon_state = "engineering"
	sound_env = SMALL_ENCLOSED

/area/engineering/foyer
	name = "\improper Engineering Foyer"
	icon_state = "engineering_foyer"

/area/engineering/gravity_gen
	name = "\improper Gravity Generator"
	icon_state = "engine"
	sound_env = SMALL_ENCLOSED
*/

//Vacant Areas
/area/vacant
	name = "\improper Vacant Area"
	icon_state = "construction"
	area_flags = AREA_FLAG_RAD_SHIELDED
//	req_access = list(access_construction)
	req_access = list(access_maint_tunnels)

/area/vacant/infirmary
	name = "\improper Auxiliary Infirmary"
	icon_state = "medbay"

/area/vacant/monitoring
	name = "\improper Auxiliary Monitoring Room"
	icon_state = "engine_monitoring"

/area/vacant/cargo
	name = "\improper Requisitions Office"
	icon_state = "quart"

/area/vacant/mess
	name = "\improper Officer's Mess"
	icon_state = "bar"

/area/vacant/gambling
	name = "\improper Gambling Room"
	icon_state = "restrooms"
	sound_env = MEDIUM_SOFTFLOOR

/* not found on Sierra
/area/vacant/cabin
	name = "\improper Vacant Cabins"
	icon_state = "crew_quarters"

/area/vacant/chapel
	name = "\improper Unused Chapel"
	icon_state = "chapel"

/area/vacant/prototype/control
	name = "\improper Prototype Fusion Reactor Control Room"
	icon_state = "engine_monitoring"
	area_flags = null

/area/vacant/prototype/engine
	name = "\improper Prototype Fusion Reactor Chamber"
	icon_state = "firingrange"

/area/vacant/missile
	name = "\improper Third Deck Port Missile Pod"
	icon_state = "firingrange"

/area/vacant/brig
	name = "\improper Permanent Brig"
	icon_state = "brig"

/area/vacant/office
	name = "\improper Unused Office"
	icon_state = "conference"
*/

// Supply
/area/quartermaster
	req_access = list(access_cargo)

/area/quartermaster/office
	name = "\improper Supply Office"
	icon_state = "quartoffice"
	req_access = list(access_mailsorting, access_cargo)

/area/quartermaster/storage
	name = "\improper Warehouse"
	icon_state = "quartstorage"
	sound_env = LARGE_ENCLOSED

/area/quartermaster/deckofficer
	name = "\improper Quartermaster"
	icon_state = "quart"
	req_access = list(access_qm)

/area/quartermaster/expedition
	name = "\improper Expedition Preparation"
	icon_state = "mining"
	req_access = list(list(access_mining, access_xenoarch))

/area/quartermaster/expedition/eva
	name = "\improper Expedition EVA"
	icon_state = "mining"

/area/quartermaster/expedition/storage
	name = "\improper Expedition Storage"
	icon_state = "mining"

/area/quartermaster/exploration
	name = "\improper Exploration Equipment"
	icon_state = "exploration"
	req_access = list(access_explorer)

/area/quartermaster/shuttlefuel
	name = "\improper Shuttle Fuel Bay"
	icon_state = "toxstorage"
	sound_env = SMALL_ENCLOSED
	req_access = list(list(access_cargo, access_expedition_shuttle_helm, access_guppy_helm))

/area/quartermaster/hangar
	name = "\improper Hangar Deck"
	icon_state = "hangar"
	sound_env = LARGE_ENCLOSED
	req_access = list(access_hangar)

/area/quartermaster/unused
	name = "\improper Ready Room"
	icon_state = "auxstorage"

// Robotics
/area/assembly
	req_access = list(access_robotics)

/area/assembly/chargebay
	name = "\improper Mech Bay"
	icon_state = "mechbay"

/area/assembly/robotics
	name = "\improper Robotics Lab"
	icon_state = "robotics"

/* not found on Sierra
/area/assembly/robotics_surgery
	name = "\improper Robotics Operating Theatre"
	icon_state = "robotics"
*/

//Research
/area/rnd/misc_lab
	name = "\improper Miscellaneous Research"
	icon_state = "misclab"
	req_access = list(access_research)

/area/rnd/research
	name = "\improper Research and Development"
	icon_state = "research"
	req_access = list(access_research)

/area/rnd/storage
	name = "\improper Research Storage"
	icon_state = "toxstorage"
	req_access = list(access_tox_storage)

/area/rnd/canister
	name = "\improper Canister Storage"
	icon_state = "toxstorage"
	sound_env = SMALL_ENCLOSED
	req_access = list(access_tox_storage)

/area/rnd/development
	name = "\improper Fabricator Lab"
	icon_state = "devlab"
	req_access = list(access_tox)

/area/rnd/entry
	name = "\improper Research and Development Access"
	icon_state = "decontamination"

/area/rnd/locker
	name = "\improper Research Locker Room"
	icon_state = "locker"

/area/rnd/xenobiology/entry
	name = "\improper Xenobiology Access"
	icon_state = "xeno_lab"

/area/rnd/xenobiology/entry2
	name = "\improper Xenobiology Access"
	icon_state = "xeno_lab"

/area/rnd/xenobiology/level1
	name = "\improper Xenobiology Level One"
	icon_state = "xeno_lab"

/area/rnd/xenobiology/level2
	name = "\improper Xenobiology Level Two"
	icon_state = "xeno_lab"

/area/rnd/xenobiology/atmos
	name = "\improper Xenobiology Atmos Hub"
	icon_state = "xeno_lab"

/area/rnd/xenobiology/water_cell
	name = "\improper Xenobiology Water Cell"
	icon_state = "xeno_lab"

/area/rnd/xenobiology/storage
	name = "\improper Xenobiology Storage"
	icon_state = "xeno_lab"

/area/rnd/blanks
	name = "\improper Aux Custodial Supplies"
	icon_state = "decontamination"
	area_flags = AREA_FLAG_RAD_SHIELDED
	sound_env = SMALL_ENCLOSED
	req_access = list(access_rd)

/* not found on Sierra
/area/rnd/checkpoint
	name = "\improper Research Security Checkpoint"
	icon_state = "checkpoint1"
	req_access = list(access_security)
*/

// Crew areas
/area/hydroponics
	name = "\improper Hydroponics"
	icon_state = "hydro"

/area/hydroponics/storage
	name = "\improper Hydroponics Storage"

/area/janitor
	name = "\improper Custodial Closet"
	icon_state = "janitor"
	req_access = list(access_janitor)

/area/crew_quarters/bar
	name = "\improper Bar"
	icon_state = "bar"
	sound_env = LARGE_SOFTFLOOR
	req_access = list(access_bar)
	secure = 0

/area/crew_quarters/cryolocker
	name = "\improper Cryogenic Storage Wardrobe"
	icon_state = "locker"

/area/crew_quarters/head
	name = "\improper Restroom"
	icon_state = "toilet"

/area/crew_quarters/showers
	name = "\improper Private Showers"
	icon_state = "toilet"

/area/crew_quarters/gym
	name = "\improper Gym"
	icon_state = "fitness"

/area/crew_quarters/mess
	name = "\improper Canteen"
	icon_state = "cafeteria"

/area/crew_quarters/galley
	name = "\improper Galley"
	icon_state = "kitchen"
	req_access = list(access_kitchen)
	secure = 0

/area/crew_quarters/galley/backroom
	name = "\improper Galley Cold Storage"
	icon_state = "kitchen"
	secure = 1

/area/crew_quarters/lounge
	name = "\improper Lounge"
	icon_state = "crew_quarters"
	sound_env = MEDIUM_SOFTFLOOR

/area/crew_quarters/lounge/upper
	name = "\improper Library"

/area/crew_quarters/safe_room
	name = "\improper Safe Room"
	icon_state = "crew_quarters"
	sound_env = SMALL_ENCLOSED
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED

/area/crew_quarters/sleep/bunk
	name = "\improper Dormitory"
	icon_state = "Sleep"
	sound_env = SMALL_SOFTFLOOR
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED

/area/crew_quarters/sleep/cryo
	name = "\improper Cryogenic Storage"
	icon_state = "Sleep"

/area/crew_quarters/sleep/cryo/upper
	name = "\improper Cryogenic Storage Upper Tier"

// Security
/area/security/sierra/hallway
	name = "\improper Security - Fore Hallway"
	icon_state = "security"
	sound_env = LARGE_ENCLOSED

/area/security/sierra/hallway/aft
	name = "\improper Security - Aft Hallway"
	icon_state = "security"

/area/security/sierra/hallway/port
	name = "\improper Security - Port Hallway"
	icon_state = "security"

/area/security/sierra/sergeant
	name = "\improper Security - Warden"
	icon_state = "brig"
	req_access = list(access_warden)

/area/security/sierra/armory
	name = "\improper Security - Armory"
	icon_state = "armory"
	req_access = list(access_armory)

/area/security/sierra/armory/lobby
	name = "\improper Security - Armory - Lobby"
	icon_state = "armory"

/area/security/sierra/suits
	name = "\improper Security - Suits Storage"
	icon_state = "security"
	req_access = list(access_seceva)

/area/security/sierra/breakroom
	name = "\improper Security - Break Room"
	icon_state = "security"

/area/security/sierra/hosbed
	name = "\improper Security - HoS - Bedroom"
	icon_state = "sec_hos"
	req_access = list(access_hos)

/area/security/sierra/forensic
	name = "\improper Security - Forensic"
	icon_state = "detective"
	req_access = list(access_forensics_lockers)

/area/security/sierra/forensic/lab
	name = "\improper Security - Forensic - Laboratory"
	icon_state = "detective"

/area/security/sierra/equipment
	name = "\improper Security - Equipment storage"
	icon_state = "security"
	req_access = list(access_security)

/area/security/sierra/interrogation
	name = "\improper Security - Interrogation"
	icon_state = "detective"
	req_access = list(list(access_forensics_lockers, access_security))

/area/security/sierra/evidence
	name = "\improper Security - Evidence Storage"
	icon_state = "detective"
	req_access = list(list(access_forensics_lockers, access_security))

/area/security/range
	name = "\improper Security - Firing Range"
	icon_state = "firingrange"
	req_access = list()

/area/security/nuke_storage
	name = "\improper Vault"
	icon_state = "nuke_storage"
	req_access = list(access_heads_vault)

/area/security/sierra/dockcheck
	name = "\improper Security - Fore Docks Checkpoint"
	icon_state = "checkpoint1"
	req_access = list(list(access_security, access_forensics_lockers))

// Medbay
/area/medical/equipstorage
	name = "\improper Infirmary Storage"
	icon_state = "medbay4"

/area/medical/maintenance_equipstorage
	name = "\improper Infirmary Maintenance Storage"
	icon_state = "medbay4"
	req_access = list(access_medical_equip)

/area/medical/infirmary
	name = "\improper Infirmary Hallway"
	icon_state = "medbay"

/area/medical/starboard_hallway
	name = "\improper Starboard Hallway"
	icon_state = "medbay2"

/area/medical/infirmreception
	name = "\improper Infirmary Reception"
	icon_state = "medbay2"

/area/medical/locker
	name = "\improper Infirmary Locker Room"
	icon_state = "locker"
	req_access = list(access_medical_equip)

/area/medical/subacute
	name = "\improper Sub-Acute Ward"
	icon_state = "patients"

/area/medical/mentalhealth
	name = "\improper Mental Health"
	icon_state = "medbay3"
	ambience = list('sound/ambience/signal.ogg')
	req_access = list(access_psychiatrist)

/area/medical/coffins
	name = "\improper Coffins Storage"
	icon_state = "patients" //:^)
	ambience = list('sound/ambience/ambimo1.ogg','sound/ambience/ambimo2.ogg','sound/music/main.ogg')
	sound_env = SMALL_ENCLOSED
	req_access = list(access_chapel_office)

/area/medical/chemistry
	name = "\improper Chemistry"
	icon_state = "chem"
	req_access = list(access_chemistry)

/area/medical/morgue
	name = "\improper Morgue"
	icon_state = "morgue"
	ambience = list('sound/ambience/ambimo1.ogg','sound/ambience/ambimo2.ogg','sound/music/main.ogg')
	req_access = list(access_morgue)

/area/medical/sleeper
	name = "\improper Emergency Treatment Center"
	icon_state = "exam_room"
	req_access = list(access_medical_equip)

/area/medical/surgery
	name = "\improper Operating Theatre"
	icon_state = "surgery"
	req_access = list(access_surgery)

/* not found on Sierra
/area/medical/exam_room
	name = "\improper Exam Room"
	icon_state = "exam_room"

/area/medical/autopsy
	name = "\improper Autopsy"
	icon_state = "autopsy"
	req_access = list(list(access_morgue, access_forensics_lockers))
*/

// Chapel
/area/chapel/main
	name = "\improper Chapel"
	icon_state = "chapel"
	ambience = list('sound/ambience/ambicha1.ogg','sound/ambience/ambicha2.ogg','sound/ambience/ambicha3.ogg','sound/ambience/ambicha4.ogg','sound/music/traitor.ogg')
	sound_env = LARGE_ENCLOSED

/area/chapel/crematorium
	name = "\improper Crematorium"
	icon_state = "chapel"
	sound_env = SMALL_ENCLOSED
	req_access = list(access_crematorium)

// Shield Rooms
/area/shield
	name = "\improper Shield Generator"
	icon_state = "engineering"
	sound_env = SMALL_ENCLOSED
	req_access = list(access_engine, access_atmospherics)

/area/shield/firstdeck
	name = "\improper First Deck Shield Generator"

/area/shield/seconddeck
	name = "\improper Second Deck Shield Generator"

/area/shield/thirddeck
	name = "\improper Third Deck Shield Generator"

// Misc
/area/deity_spawn
	name = "\improper Deity Spawn"
	icon_state = "yellow"
	requires_power = 0
	dynamic_lighting = 0

/area/teleporter
	name = "\improper Teleporter"
	icon_state = "teleporter"
	sound_env = SMALL_ENCLOSED
	req_access = list(access_teleporter)

/area/thruster
	icon_state = "thruster"
	req_access = list(access_engine)

/area/thruster/d1port
	name = "\improper First Deck Port Nacelle"

/area/thruster/d1starboard
	name = "\improper First Deck Starboard Nacelle"

/area/thruster/d3port
	name = "\improper Third Deck Port Nacelle"

/area/thruster/d3starboard
	name = "\improper Third Deck Starboard Nacelle"

/area/maintenance/substation
	name = "\improper Substation"
	icon_state = "substation"
	sound_env = SMALL_ENCLOSED
	req_access = list(access_engine)

/area/maintenance/exterior
	name = "\improper Exterior Reinforcements"
	icon_state = "maint_security_starboard"
	area_flags = AREA_FLAG_EXTERNAL
	has_gravity = FALSE
	turf_initializer = /decl/turf_initializer/maintenance/space
	sound_env = SPACE

/area/alien
	name = "\improper Alien base"
	icon_state = "yellow"
	requires_power = 0

/area/shuttle/alien/base
	name = "\improper Alien Shuttle Base"
	icon_state = "shuttle"
	requires_power = 1

// CentCom
/area/centcom/control
	name = "\improper Centcom Control"

/area/centcom/creed
	name = "\improper Creed's Office"
	req_access = list(access_cent_creed)

/area/centcom/evac
	name = "\improper Centcom Emergency Shuttle"

/area/centcom/ferry
	name = "\improper Centcom Transport Shuttle"

/area/centcom/living
	name = "\improper Centcom Living Quarters"
	req_access = list(access_cent_living)

/area/centcom/suppy
	name = "\improper Centcom Supply Shuttle"

/area/centcom/test
	name = "\improper Centcom Testing Facility"

/area/admin_prison
	name = "\improper Admin Prison"
	dynamic_lighting = 0
	requires_power = 0
	icon_state = "blue-red-d"

// Solars
/area/maintenance/solar
	name = "\improper Solar Maintenance - Port"
	icon_state = "SolarcontrolP"
	sound_env = SMALL_ENCLOSED
	req_access = list(access_engine)

/area/maintenance/solar/starboard
	name = "\improper Solar Maintenance - Starboard"
	icon_state = "SolarcontrolS"

/area/solar
	area_flags = AREA_FLAG_EXTERNAL
	requires_power = 1
	always_unpowered = 1
	has_gravity = FALSE
	base_turf = /turf/space
	sound_env = SPACE

/area/solar/starboard
	name = "\improper Starboard Solar Array"
	icon_state = "panelsS"

/area/solar/port
	name = "\improper Port Solar Array"
	icon_state = "panelsP"

// Storage
/area/storage/primary
	name = "\improper Primary Tool Storage"
	icon_state = "primarystorage"

/area/storage/tech
	name = "\improper Technical Storage"
	icon_state = "storage"
	req_access = list(access_tech_storage)

/area/storage/auxillary/port
	name = "\improper Port Auxillary Storage"
	icon_state = "auxstorage"
	req_access = list(access_cargo)

/area/storage/bridge
	name = "\improper Bridge Storage"
	icon_state = "bridge"
	sound_env = SMALL_ENCLOSED

/* not found on Sierra
/area/storage/tools
	name = "\improper Auxiliary Tool Storage"
	icon_state = "auxstorage"

/area/storage/auxillary/starboard
	name = "\improper Starboard Auxillary Storage"
	icon_state = "auxstorage"
*/

// Holodecks
/area/holodeck
	name = "\improper Holodeck"
	icon_state = "Holodeck"
	dynamic_lighting = 0
	sound_env = LARGE_ENCLOSED

/area/holocontrol
	name = "\improper Holodeck Control"
	icon_state = "Holodeck"

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
	name = "\improper Holodeck - Wildlife Simulation"

/area/holodeck/source_military
	name = "\improper Holodeck - Military Parade Ground"
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

// Shuttles
/area/shuttle/administration/centcom
	name = "\improper Administration Shuttle"
	icon_state = "shuttlered"
	req_access = list(access_cent_general)

/area/supply/dock
	name = "\improper Supply Shuttle"
	icon_state = "shuttle3"
	requires_power = 0
	req_access = list(access_cent_storage)

// Tcomm
/area/tcommsat/
	ambience = list('sound/ambience/ambisin2.ogg', 'sound/ambience/signal.ogg', 'sound/ambience/signal.ogg', 'sound/ambience/ambigen10.ogg')
	req_access = list(access_tcomsat)

/area/tcommsat/chamber
	name = "\improper Telecoms Central Compartment"
	icon_state = "tcomsatcham"

/area/tcommsat/computer
	name = "\improper Telecoms Control Room"
	icon_state = "tcomsatcomp"

/area/tcommsat/storage
	name = "\improper Telecoms Storage"
	icon_state = "tcomsatstore"

// AI
/area/ai_monitored
	name = "\improper AI Monitored Area"

/area/ai_monitored/storage/eva
	name = "\improper EVA Storage"
	icon_state = "eva"
	req_access = list(access_eva)

/area/turret_protected
	req_access = list(access_ai_upload)

/area/turret_protected/ai
	name = "\improper AI Chamber"
	icon_state = "ai_chamber"
	ambience = list('sound/ambience/ambimalf.ogg')

/area/turret_protected/ai_cyborg_station
	name = "\improper Cyborg Station"
	icon_state = "ai_cyborg"
	sound_env = SMALL_ENCLOSED
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED

/area/turret_protected/ai_upload
	name = "\improper AI Upload Chamber"
	icon_state = "ai_upload"
	ambience = list('sound/ambience/ambimalf.ogg')

/area/turret_protected/ai_upload_foyer
	name = "\improper AI Upload Access"
	icon_state = "ai_foyer"
	ambience = list('sound/ambience/ambimalf.ogg')
	sound_env = SMALL_ENCLOSED

/* not found on Sierra
/area/turret_protected/ai_foyer
	name = "\improper AI Chamber Foyer"
	icon_state = "ai_foyer"
	sound_env = SMALL_ENCLOSED

/area/turret_protected/ai_outer_chamber
	name = "\improper Outer AI Chamber"
	icon_state = "ai_chamber"
	sound_env = SMALL_ENCLOSED
*/

// Merchant
/area/merchant_station
	name = "\improper Merchant Station"
	icon_state = "LP"
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED | AREA_FLAG_IS_NOT_PERSISTENT
	req_access = list(access_merchant)

// Syndicate
/area/syndicate_mothership/raider_base
	name = "\improper Raider Base"
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED | AREA_FLAG_IS_NOT_PERSISTENT
	req_access = list(access_syndicate)

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

// Thunderdome
/area/tdome
	name = "\improper Thunderdome"
	icon_state = "thunder"
	requires_power = 0
	dynamic_lighting = 0
	sound_env = ARENA
	req_access = list(access_cent_thunder)

/area/tdome/tdome1
	name = "\improper Thunderdome (Team 1)"
	icon_state = "green"

/area/tdome/tdome2
	name = "\improper Thunderdome (Team 2)"
	icon_state = "yellow"

/area/tdome/tdomeadmin
	name = "\improper Thunderdome (Admin.)"
	icon_state = "purple"

/area/tdome/tdomeobserve
	name = "\improper Thunderdome (Observer.)"
	icon_state = "purple"

/area/tdome/testing
	name = "\improper Thunderdome (TESTING AREA)"
	icon_state = "purple"

/area/tdome/testing/engineering
	requires_power = 0
	dynamic_lighting = 1

/area/tdome/testing/engineering/unpowered
	requires_power = 1
