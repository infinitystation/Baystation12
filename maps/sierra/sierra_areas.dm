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

/area/crew_quarters/laundry
	name = "Laundry Room"
	icon_state = "Sleep"

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

/area/crew_quarters/safe_room/seconddeck
	name = "Second Deck Safe Room"
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED

/area/maintenance/substation/seconddeck
	name = "Second Deck Substation"

/area/crew_quarters/commissary
	name = "Commissary"
	icon_state = "crew_quarters"

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

/area/teleporter/firstdeck
	name = "First Deck Teleporter"
	icon_state = "teleporter"

/area/hallway/primary/firstdeck/fore
	name = "First Deck Fore Hallway"
	icon_state = "hallF"

/area/hallway/primary/firstdeck/foreport
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

/area/maintenance/substation/firstdeck // First Deck (Z-4)
	name = "First Deck Substation"

// Shuttles
/area/shuttle/transport1/centcom
	icon_state = "shuttle"
	name = "Transport Shuttle Centcom"
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED | AREA_FLAG_IS_NOT_PERSISTENT

//sierra large pods
/area/shuttle/escape_pod6/station
	name = "Escape Pod One"
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED | AREA_FLAG_IS_NOT_PERSISTENT

/area/shuttle/escape_pod7/station
	name = "Escape Pod Two"
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED | AREA_FLAG_IS_NOT_PERSISTENT

/area/shuttle/escape_pod8/station
	name = "Escape Pod Three"
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED | AREA_FLAG_IS_NOT_PERSISTENT

/area/shuttle/escape_pod9/station
	name = "Escape Pod Four"
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED | AREA_FLAG_IS_NOT_PERSISTENT

/area/shuttle/escape_pod10/station
	name = "Escape Pod Five"
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED | AREA_FLAG_IS_NOT_PERSISTENT

//sierra small pods
/area/shuttle/escape_pod12/station
	name = "Escape Pod Seven"
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED | AREA_FLAG_IS_NOT_PERSISTENT

/area/shuttle/escape_pod13/station
	name = "Escape Pod Eight"
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED | AREA_FLAG_IS_NOT_PERSISTENT

/area/shuttle/escape_pod14/station
	name = "Escape Pod Nine"
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED | AREA_FLAG_IS_NOT_PERSISTENT

/area/shuttle/escape_pod15/station
	name = "Escape Pod Ten"
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED | AREA_FLAG_IS_NOT_PERSISTENT

/area/shuttle/escape_pod16/station
	name = "Escape Pod Eleven"
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED | AREA_FLAG_IS_NOT_PERSISTENT

/area/shuttle/escape_pod17/station
	name = "Escape Pod Twelve"
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED | AREA_FLAG_IS_NOT_PERSISTENT

//Charon

/area/exploration_shuttle
	name = "Charon"
	icon_state = "shuttlered"
	base_turf = /turf/simulated/floor/plating
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED

/area/exploration_shuttle/cockpit
	name = "Charon - Cockpit"
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


//Petrov

/area/shuttle/petrov
	name = "NSV Petrov"
	requires_power = 1
	dynamic_lighting = 1
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED

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
	name = "Turbolift"
	icon_state = "shuttle"
	requires_power = 0
	dynamic_lighting = 1
	area_flags = AREA_FLAG_ION_SHIELDED

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

//Merc

/area/syndicate_mothership
	name = "Mercenary Base"
	icon_state = "syndie-ship"
	requires_power = 0
	dynamic_lighting = 0
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED | AREA_FLAG_IS_NOT_PERSISTENT

/area/syndicate_station/start
	name = "Mercenary Forward Operating Base"
	icon_state = "yellow"
	requires_power = 0
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED | AREA_FLAG_IS_NOT_PERSISTENT

//Skipjack

/area/skipjack_station
	name = "Raider Outpost"
	icon_state = "yellow"
	requires_power = 0
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED | AREA_FLAG_IS_NOT_PERSISTENT

//NT rescue shuttle

/area/rescue_base
	name = "Response Team Base"
	icon_state = "yellow"
	requires_power = 0
	dynamic_lighting = 1
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED | AREA_FLAG_IS_NOT_PERSISTENT

/area/rescue_base/base
	name = "Barracks"
	icon_state = "yellow"
	dynamic_lighting = 0

/area/rescue_base/start
	name = "Response Team Base"
	icon_state = "shuttlered"
	base_turf = /turf/unsimulated/floor/rescue_base

// Elevator areas.
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

// Command
/area/command/conference
	name = "Briefing Room"
	icon_state = "head_quarters"
	sound_env = MEDIUM_SOFTFLOOR

/area/command/exploration_leader
	name = "Exploration Leader's Office"
	icon_state = "head_quarters"

/area/command/bsa
	name = "\improper Bluespace Artillery"
	icon_state = "firingrange"

/area/crew_quarters/heads
	icon_state = "head_quarters"

/area/crew_quarters/heads/cobed
	name = "Command - Captain's Quarters"
	sound_env = MEDIUM_SOFTFLOOR

/area/crew_quarters/heads/office/captain
	name = "Command - Captain's Office"
	sound_env = MEDIUM_SOFTFLOOR

/area/crew_quarters/heads/office/hop
	name = "Command - HoP's Office"

/area/crew_quarters/heads/office/rd
	name = "Command - RD's Office"

/area/crew_quarters/heads/office/cmo
	name = "Command - CMO's Office"

/area/crew_quarters/heads/office/ce
	name = "Command - CE's Office"

/area/crew_quarters/heads/office/hos
	name = "Command - HoS' Office"

/area/crew_quarters/heads/office/iaa
	name = "Command - IAA's Office"

// Engineering

/area/engineering/atmos/aux
	name = "Auxiliary Atmospherics"
	icon_state = "atmos"
	sound_env = SMALL_ENCLOSED

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

/area/engineering/hardstorage/lower
	name = "Lower Engineering Hard Storage"
	icon_state = "engineering_storage"

/area/engineering/hardstorage/aux
	name = "Auxiliary Engineering Hard Storage"
	icon_state = "engineering_storage"

/area/engineering/gravity_gen
	name = "Gravity Generator"
	icon_state = "engine"
	sound_env = SMALL_ENCLOSED

//Vacant Areas
/area/vacant
	name = "Vacant Area"
	icon_state = "construction"
	area_flags = AREA_FLAG_RAD_SHIELDED

/area/vacant/cabin
	name = "Vacant Cabins"
	icon_state = "crew_quarters"

/area/vacant/chapel
	name = "Unused Chapel"
	icon_state = "chapel"

/area/vacant/infirmary
	name = "Auxiliary Infirmary"
	icon_state = "medbay"

/area/vacant/monitoring
	name = "Auxiliary Monitoring Room"
	icon_state = "engine_monitoring"

/area/vacant/prototype/control
	name = "Prototype Fusion Reactor Control Room"
	icon_state = "engine_monitoring"
	area_flags = null

/area/vacant/prototype/engine
	name = "Prototype Fusion Reactor Chamber"
	icon_state = "firingrange"


/area/vacant/cargo
	name = "Requisitions Office"
	icon_state = "quart"

/area/vacant/mess
	name = "Officer's Mess"
	icon_state = "bar"

/area/vacant/missile
	name = "Third Deck Port Missile Pod"
	icon_state = "firingrange"

/area/vacant/brig
	name = "Permanent Brig"
	icon_state = "brig"

/area/vacant/office
	name = "Unused Office"
	icon_state = "conference"

/area/vacant/gambling
	name = "Gambling Room"
	icon_state = "restrooms"
	sound_env = MEDIUM_SOFTFLOOR


// Storage
/area/storage/auxillary/port
	name = "Port Auxillary Storage"
	icon_state = "auxstorage"

/area/storage/auxillary/starboard
	name = "Starboard Auxillary Storage"
	icon_state = "auxstorage"

/area/storage/cargo
	name = "Cargo Storage"
	icon_state = "quartstorage"
	sound_env = SMALL_ENCLOSED

/area/storage/expedition
	name = "Expedition Storage"
	icon_state = "storage"
	sound_env = SMALL_ENCLOSED

/area/storage/medical
	name = "Medical Storage"
	icon_state = "medbay4"
	sound_env = SMALL_ENCLOSED

/area/storage/research
	name = "Research Storage"
	icon_state = "toxstorage"
	sound_env = SMALL_ENCLOSED

/area/storage/bridge
	name = "Bridge Storage"
	icon_state = "bridge"
	sound_env = SMALL_ENCLOSED

// Supply

/area/quartermaster/deckofficer
	name = "Quartermaster"
	icon_state = "quart"

/area/quartermaster/expedition
	name = "Expedition Preparation"
	icon_state = "mining"

/area/quartermaster/expedition/eva
	name = "Expedition EVA"
	icon_state = "mining"

/area/quartermaster/expedition/storage
	name = "Expedition Storage"
	icon_state = "mining"

/area/quartermaster/exploration
	name = "Exploration Equipment"
	icon_state = "exploration"

/area/quartermaster/shuttlefuel
	name = "Shuttle Fuel Bay"
	icon_state = "toxstorage"
	sound_env = SMALL_ENCLOSED

/area/quartermaster/hangar
	name = "Hangar Deck"
	icon_state = "hangar"
	sound_env = LARGE_ENCLOSED

/area/quartermaster/unused
	name = "Ready Room"
	icon_state = "auxstorage"

// Research
/area/rnd/canister
	name = "Canister Storage"
	icon_state = "toxstorage"
	sound_env = SMALL_ENCLOSED

/area/rnd/development
	name = "Fabricator Lab"
	icon_state = "devlab"

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

/area/rnd/checkpoint
	name = "Research Security Checkpoint"
	icon_state = "checkpoint1"

/area/rnd/blanks
	name = "Aux Custodial Supplies"
	icon_state = "decontamination"
	area_flags = AREA_FLAG_RAD_SHIELDED
	sound_env = SMALL_ENCLOSED

// Crew areas
/area/crew_quarters/bar
	name = "Bar"
	icon_state = "bar"
	sound_env = LARGE_SOFTFLOOR

/area/crew_quarters/cryolocker
	name = "Cryogenic Storage Wardrobe"
	icon_state = "locker"

/area/crew_quarters/head
	name = "Head"
	icon_state = "toilet"

/area/crew_quarters/head/aux
	name = "Auxiliary Head"

/area/crew_quarters/gym
	name = "Gym"
	icon_state = "fitness"

/area/crew_quarters/mess
	name = "Canteen"
	icon_state = "cafeteria"

/area/crew_quarters/galley
	name = "Galley"
	icon_state = "kitchen"

/area/crew_quarters/galleybackroom
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

/area/crew_quarters/sleep/cryo/aux
	name = "Auxiliary Cryogenic Storage"
	icon_state = "Sleep"
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED

/area/crew_quarters/diplomat
	name = "Diplomatic Quarters"
	icon_state = "Sleep"
	sound_env = SMALL_SOFTFLOOR

/area/holocontrol
	name = "Holodeck Control"
	icon_state = "Holodeck"

/area/hydroponics/storage
	name = "Hydroponics Storage"

// Tcomms
/area/tcommsat/storage
	name = "Telecoms Storage"
	icon_state = "tcomsatstore"

// Security

/area/security/sierra/hallway
	name = "Security - Fore Hallway"
	icon_state = "security"
	sound_env = LARGE_ENCLOSED

/area/security/sierra/hallway/aft
	name = "Security - Aft Hallway"
	icon_state = "security"

/area/security/sierra/hallway/port
	name = "Security - Port Hallway"
	icon_state = "security"

/area/security/sierra/sergeant
	name = "Security - Warden"
	icon_state = "brig"

/area/security/sierra/armory
	name = "Security - Armory"
	icon_state = "armory"

/area/security/sierra/armory/lobby
	name = "Security - Armory - Lobby"
	icon_state = "armory"

/area/security/sierra/safe_room
	name = "Security - Safe Room"
	icon_state = "security"
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED

/area/security/sierra/suits
	name = "Security - Suits Storage"
	icon_state = "security"

/area/security/sierra/breakroom
	name = "Security - Break Room"
	icon_state = "security"

/area/security/sierra/hos
	name = "Security - Head Of Security"
	icon_state = "sec_hos"

/area/security/sierra/hos/bedroom
	name = "Security - HOS - Bedroom"
	icon_state = "sec_hos"

/area/security/sierra/forensic
	name = "Security - Forensic"
	icon_state = "detective"

/area/security/sierra/forensic/lab
	name = "Security - Forensic - Laboratory"
	icon_state = "detective"

/area/security/sierra/equipment
	name = "Security - Equipment storage"
	icon_state = "security"

/area/security/sierra/interrogation
	name = "Security - Interrogation"
	icon_state = "detective"

/area/security/sierra/evidence
	name = "Security - Evidence Storage"
	icon_state = "detective"

/area/security/range
	name = "Security - Firing Range"
	icon_state = "firingrange"

/area/security/nuke_storage
	name = "Vault"
	icon_state = "nuke_storage"

/area/security/sierra/dockcheck
	name = "Security - Fore Docks Checkpoint"
	icon_state = "checkpoint1"

// AI
/area/turret_protected/ai_foyer
	name = "AI Chamber Foyer"
	icon_state = "ai_foyer"
	sound_env = SMALL_ENCLOSED

/area/turret_protected/ai_outer_chamber
	name = "Outer AI Chamber"
	icon_state = "ai_chamber"
	sound_env = SMALL_ENCLOSED

// Medbay

/area/medical/equipstorage
	name = "Infirmary Storage"
	icon_state = "medbay4"

/area/medical/maintenance_equipstorage
	name = "Infirmary Maintenance Storage"
	icon_state = "medbay4"

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

/area/medical/subacute
	name = "Sub-Acute Ward"
	icon_state = "patients"

/area/medical/mentalhealth
	name = "Mental Health"
	icon_state = "medbay3"
	ambience = list('sound/ambience/signal.ogg')

// Chapel
/area/chapel/crematorium
	name = "Crematorium"
	icon_state = "chapel"
	sound_env = SMALL_ENCLOSED

// Shield Rooms
/area/shield
	name = "Shield Generator"
	icon_state = "engineering"
	sound_env = SMALL_ENCLOSED

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

/area/thruster
	icon_state = "thruster"

/area/thruster/d1port
	name = "First Deck Port Nacelle"

/area/thruster/d1starboard
	name = "First Deck Starboard Nacelle"

/area/thruster/d3port
	name = "Third Deck Port Nacelle"

/area/thruster/d3starboard
	name = "Third Deck Starboard Nacelle"

/area/engineering/fuelbay
	name = "Fuel Bay"
	icon_state = "engineering"
	sound_env = SMALL_ENCLOSED

// Command

/area/bridge
	name = "Bridge"
	icon_state = "bridge"

/area/bridge/canteen
	name = "Command Canteen"
	icon_state = "bar"

/area/bridge/meeting_room
	name = "Meeting Room"
	icon_state = "bridge"
	ambience = list()
	sound_env = MEDIUM_SOFTFLOOR

/area/bridge/lobby
	name = "Bridge Lobby"

/area/crew_quarters/heads
	icon_state = "head_quarters"

/area/maintenance/substation
	name = "Substation"
	icon_state = "substation"
	sound_env = SMALL_ENCLOSED

/area/maintenance/exterior
	name = "Exterior Reinforcements"
	icon_state = "maint_security_starboard"
	area_flags = AREA_FLAG_EXTERNAL
	has_gravity = FALSE
	turf_initializer = /decl/turf_initializer/maintenance/space
	sound_env = SPACE

// CentCom

/area/centcom/control
	name = "Centcom Control"

/area/centcom/creed
	name = "Creed's Office"

/area/centcom/evac
	name = "Centcom Emergency Shuttle"

/area/centcom/ferry
	name = "Centcom Transport Shuttle"

/area/centcom/living
	name = "Centcom Living Quarters"

/area/centcom/suppy
	name = "Centcom Supply Shuttle"

/area/centcom/test
	name = "Centcom Testing Facility"

// Solars
/area/maintenance/solar
	name = "Solar Maintenance - Port"
	icon_state = "SolarcontrolP"
	sound_env = SMALL_ENCLOSED

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

// Maintenance

/area/maintenance/disposal
	name = "Waste Disposal"
	icon_state = "disposal"

/area/maintenance/incinerator
	name = "Incinerator"
	icon_state = "disposal"

/area/maintenance/waterstore
	name = "\improper Cistern"
	icon_state = "disposal"

/area/maintenance/compactor
	name = "Compactor"
	icon_state = "disposal"
	sound_env = STANDARD_STATION

// Storage

/area/storage/primary
	name = "Primary Tool Storage"
	icon_state = "primarystorage"

/area/storage/tech
	name = "Technical Storage"
	icon_state = "storage"

/area/storage/tools
	name = "Auxiliary Tool Storage"
	icon_state = "auxstorage"

// Holodecks

/area/holodeck
	name = "Holodeck"
	icon_state = "Holodeck"
	dynamic_lighting = 0
	sound_env = LARGE_ENCLOSED

/area/holodeck/alphadeck
	name = "Holodeck Alpha"

/area/holodeck/source_plating
	name = "Holodeck - Off"

/area/holodeck/source_emptycourt
	name = "Holodeck - Empty Court"
	sound_env = ARENA

/area/holodeck/source_boxingcourt
	name = "Holodeck - Boxing Court"
	sound_env = ARENA

/area/holodeck/source_basketball
	name = "Holodeck - Basketball Court"
	sound_env = ARENA

/area/holodeck/source_thunderdomecourt
	name = "Holodeck - Thunderdome Court"
	sound_env = ARENA

/area/holodeck/source_courtroom
	name = "Holodeck - Courtroom"
	sound_env = AUDITORIUM

/area/holodeck/source_beach
	name = "Holodeck - Beach"
	sound_env = PLAIN

/area/holodeck/source_wildlife
	name = "Holodeck - Wildlife Simulation"

/area/holodeck/source_military
	name = "Holodeck - Military Parade Ground"
	sound_env = AUDITORIUM

/area/holodeck/source_meetinghall
	name = "Holodeck - Meeting Hall"
	sound_env = AUDITORIUM

/area/holodeck/source_theatre
	name = "Holodeck - Theatre"
	sound_env = CONCERT_HALL

/area/holodeck/source_picnicarea
	name = "Holodeck - Picnic Area"
	sound_env = PLAIN

/area/holodeck/source_snowfield
	name = "Holodeck - Snow Field"
	sound_env = FOREST

/area/holodeck/source_desert
	name = "Holodeck - Desert"
	sound_env = PLAIN

/area/holodeck/source_space
	name = "Holodeck - Space"
	has_gravity = 0
	sound_env = SPACE

/area/holodeck/source_cafe
	name = "Holodeck - Cafe"
	sound_env = PLAIN

/area/holodeck/source_volleyball
	name = "Holodeck - Volleyball"
	sound_env = PLAIN


// Engineering

/area/engineering/atmos/storage
	name = "Atmospherics Storage"
	icon_state = "atmos_storage"
	sound_env = SMALL_ENCLOSED

/area/engineering/engine_room
	name = "Engine Room"
	icon_state = "engine"
	sound_env = LARGE_ENCLOSED
	area_flags = AREA_FLAG_ION_SHIELDED


/area/engineering/drone_fabrication
	name = "Engineering Drone Fabrication"
	icon_state = "drone_fab"
	sound_env = SMALL_ENCLOSED

/area/engineering/engine_eva
	name = "Engine EVA"
	icon_state = "engine_eva"

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

/area/engineering/foyer
	name = "Engineering Foyer"
	icon_state = "engineering_foyer"

/area/engineering/locker_room
	name = "Engineering Locker Room"
	icon_state = "engineering_locker"

/area/engineering/storage
	name = "Engineering Storage"
	icon_state = "engineering_storage"

/area/engineering/atmos
 	name = "Atmospherics"
 	icon_state = "atmos"
 	sound_env = LARGE_ENCLOSED

// Medical
/area/medical/chemistry
	name = "Chemistry"
	icon_state = "chem"

/area/medical/exam_room
	name = "Exam Room"
	icon_state = "exam_room"

/area/medical/morgue
	name = "Morgue"
	icon_state = "morgue"
	ambience = list('sound/ambience/ambimo1.ogg','sound/ambience/ambimo2.ogg','sound/music/main.ogg')

/area/medical/sleeper
	name = "Emergency Treatment Center"
	icon_state = "exam_room"

/area/medical/surgery
	name = "Operating Theatre"
	icon_state = "surgery"

/area/medical/autopsy
	name = "Autopsy"
	icon_state = "autopsy"

// Research
/area/assembly/chargebay
	name = "Mech Bay"
	icon_state = "mechbay"

/area/assembly/robotics
	name = "Robotics Lab"
	icon_state = "robotics"

/area/assembly/robotics_surgery
	name = "Robotics Operating Theatre"
	icon_state = "robotics"

/area/rnd/misc_lab
	name = "Miscellaneous Research"
	icon_state = "misclab"

/area/rnd/research
	name = "Research and Development"
	icon_state = "research"

/area/rnd/storage
	name = "Research Storage"
	icon_state = "toxstorage"

/area/alien
	name = "Alien base"
	icon_state = "yellow"
	requires_power = 0

/area/shuttle/alien/base
	icon_state = "shuttle"
	name = "Alien Shuttle Base"
	requires_power = 1

/area/admin_prison
	name = "Admin Prison"
	dynamic_lighting = 0
	requires_power = 0


// Shuttles
/area/shuttle/administration/centcom
	name = "Administration Shuttle"
	icon_state = "shuttlered"

/area/supply/dock
	name = "Supply Shuttle"
	icon_state = "shuttle3"
	requires_power = 0

// Cargo
/area/quartermaster/office
	name = "Supply Office"
	icon_state = "quartoffice"

/area/quartermaster/storage
	name = "Warehouse"
	icon_state = "quartstorage"
	sound_env = LARGE_ENCLOSED

// Crew

/area/crew_quarters/sleep/cryo
	name = "Cryogenic Storage"
	icon_state = "Sleep"

/area/hydroponics
	name = "Hydroponics"
	icon_state = "hydro"

/area/janitor
	name = "Custodial Closet"
	icon_state = "janitor"

// Tcomm
/area/tcommsat/
	ambience = list('sound/ambience/ambisin2.ogg', 'sound/ambience/signal.ogg', 'sound/ambience/signal.ogg', 'sound/ambience/ambigen10.ogg')

/area/tcommsat/chamber
	name = "Telecoms Central Compartment"
	icon_state = "tcomsatcham"

/area/tcommsat/computer
	name = "Telecoms Control Room"
	icon_state = "tcomsatcomp"

// AI

/area/ai_monitored
	name = "AI Monitored Area"

/area/ai_monitored/storage/eva
	name = "EVA Storage"
	icon_state = "eva"

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

// Chapel

/area/chapel/main
	name = "Chapel"
	icon_state = "chapel"
	ambience = list('sound/ambience/ambicha1.ogg','sound/ambience/ambicha2.ogg','sound/ambience/ambicha3.ogg','sound/ambience/ambicha4.ogg','sound/music/traitor.ogg')
	sound_env = LARGE_ENCLOSED

// Merchant

/area/merchant_station
	name = "Merchant Station"
	icon_state = "LP"
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED | AREA_FLAG_IS_NOT_PERSISTENT

// Syndicate

/area/syndicate_mothership/raider_base
	name = "Raider Base"
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED | AREA_FLAG_IS_NOT_PERSISTENT

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
