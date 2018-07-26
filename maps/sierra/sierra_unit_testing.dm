/datum/map/sierra
	// Unit test exemptions
	apc_test_exempt_areas = list(
		/area/sierra/engineering/atmos/storage = NO_SCRUBBER|NO_VENT,
		/area/sierra/engineering/auxpower = NO_SCRUBBER|NO_VENT,
		/area/sierra/engineering/drone_fabrication = NO_SCRUBBER|NO_VENT,
		/area/sierra/engineering/engine_smes = NO_SCRUBBER|NO_VENT,
		/area/sierra/engineering/fuelbay = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/sierra/hallway/primary/seconddeck/center = NO_SCRUBBER|NO_VENT,
		/area/holodeck = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/sierra/security/nuke_storage = NO_SCRUBBER|NO_VENT,
		/area/sierra/maintenance = NO_SCRUBBER|NO_VENT,
		/area/sierra/maintenance/auxsolarbridge = NO_SCRUBBER,
		/area/sierra/maintenance/auxsolarport = NO_SCRUBBER,
		/area/sierra/maintenance/auxsolarstarboard = NO_SCRUBBER,
		/area/sierra/maintenance/exterior = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/sierra/maintenance/firstdeck/foreport = NO_SCRUBBER,
		/area/sierra/maintenance/firstdeck/forestarboard = NO_SCRUBBER,
		/area/sierra/maintenance/fourthdeck/aft = 0,
		/area/sierra/maintenance/incinerator = NO_SCRUBBER,
		/area/sierra/maintenance/seconddeck/aftport = NO_SCRUBBER,
		/area/sierra/maintenance/seconddeck/forestarboard = NO_SCRUBBER,
		/area/sierra/maintenance/thirddeck/aftstarboard = NO_SCRUBBER,
		/area/sierra/janitor = NO_SCRUBBER|NO_VENT,
		/area/mine/explored = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/mine/unexplored = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/ninja_dojo = NO_SCRUBBER |NO_VENT | NO_APC,
		/area/outpost/abandoned = NO_SCRUBBER,
		/area/rescue_base = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/sierra/shield = NO_SCRUBBER|NO_VENT,
		/area/shuttle = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/shuttle/merchant = NO_SCRUBBER|NO_APC,
		/area/skipjack_station = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/sierra/solar = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/space = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/sierra/storage = NO_SCRUBBER|NO_VENT,
		/area/sierra/storage/auxillary/port = 0,
		/area/sierra/storage/auxillary/starboard = 0,
		/area/sierra/storage/primary = 0,
		/area/sierra/storage/tech = 0,
		/area/sierra/storage/tools = 0,
		/area/supply = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/syndicate_station = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/sierra/thruster = NO_SCRUBBER,
		/area/turbolift = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/sierra/turret_protected/ai = NO_SCRUBBER|NO_VENT,
		/area/sierra/turret_protected/ai_outer_chamber = NO_SCRUBBER|NO_VENT,
		/area/sierra/vacant = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/sierra/vacant/brig = NO_SCRUBBER|NO_VENT,
		/area/sierra/vacant/prototype/control = 0,
		/area/sierra/vacant/prototype/engine = 0,
		/area/sierra/vacant/cargo = NO_SCRUBBER|NO_VENT,
		/area/sierra/vacant/infirmary = NO_SCRUBBER|NO_VENT,
		/area/sierra/vacant/missile = NO_SCRUBBER|NO_VENT,
		/area/sierra/vacant/monitoring = NO_SCRUBBER|NO_VENT,
		/area/sierra/vacant/office = 0,
		/area/exoplanet          = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/exoplanet/desert   = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/exoplanet/grass    = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/exoplanet/snow     = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/exoplanet/garbage  = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/smugglers/base = NO_SCRUBBER,
		/area/smugglers/dorms = NO_SCRUBBER|NO_VENT,
		/area/smugglers/office = NO_SCRUBBER|NO_VENT,
		/area/bluespaceriver/underground = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/bluespaceriver/ground = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/casino/casino_cutter = NO_SCRUBBER|NO_VENT,
		/area/mobius_rift = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/icarus/vessel = NO_APC,
		/area/icarus/open = NO_SCRUBBER|NO_VENT|NO_APC,
	)

	area_coherency_test_exempt_areas = list(
		/area/space,
		/area/mine/explored,
		/area/mine/unexplored,
		/area/centcom/control,
		/area/sierra/maintenance/exterior,
		/area/exoplanet,
		/area/exoplanet/desert,
		/area/exoplanet/grass,
		/area/exoplanet/snow,
		/area/exoplanet/garbage,
		/area/icarus/vessel,
		/area/icarus/open,
	)

	area_coherency_test_subarea_count = list()

	area_usage_test_exempted_areas = list(
		/area/sierra_roles/admin_prison,
		/area/AIsattele,
		/area/djstation,
		/area/outpost,
		/area/outpost/abandoned,
		/area/overmap,
		/area/shuttle/escape/centcom,
		/area/shuttle/escape,
		/area/centcom/evac,
		/area/security/prison,
		/area/shuttle/syndicate_elite/station,
		/area/shuttle/escape/centcom,
		/area/albatros_hangar/start,
		/area/albatros_hangar,
		/area/rnd/xenobiology/xenoflora_storage,
		/area/sierra/turret_protected/ai_upload_foyer,
		/area/sierra/vacant/mess,
		/area/sierra/engineering/gravity_gen,
		/area/turbolift,
		/area/turbolift/start,
		/area/turbolift/bridge,
		/area/turbolift/firstdeck,
		/area/turbolift/seconddeck,
		/area/turbolift/thirddeck,
		/area/turbolift/fourthdeck,
		/area/turbolift/startsent,
		/area/turbolift/firstdecksent,
		/area/turbolift/seconddecksenst,
		/area/turbolift/sentinel_first,
		/area/turbolift/sentinel_second,
		/area/exoplanet,
		/area/exoplanet/desert,
		/area/exoplanet/grass,
		/area/exoplanet/snow,
		/area/exoplanet/garbage,
		/area/template_noop,
		/area/map_template,
		/area/map_template/little_house,
	)

	// not an away site? you probably want to be using area_usage_test_exempted_areas
	area_usage_test_exempted_root_areas = list(
		/area/casino,
		/area/constructionsite,
		/area/derelict,
//		/area/lsb,
		/area/magshield,
//		/area/marooned,
		/area/mine,
		/area/ship,
		/area/smugglers,
//		/area/slavers_base,
//		/area/hydro,
		/area/yacht,
		/area/bluespaceriver,
		/area/mobius_rift,
		/area/icarus,
//		/area/errant_pisces,
//		/area/lar_maria,
	)

/datum/unit_test/zas_area_test/ai_chamber
	name = "ZAS: AI Chamber"
	area_path = /area/sierra/turret_protected/ai

/datum/unit_test/zas_area_test/cargo_bay
	name = "ZAS: Cargo Bay"
	area_path = /area/sierra/quartermaster/storage

datum/unit_test/zas_area_test/supply_centcomm
	name = "ZAS: Supply Shuttle (CentComm)"
	area_path = /area/supply/dock

datum/unit_test/zas_area_test/virology
	name = "ZAS: Virology"
	area_path = /area/medical/virology

datum/unit_test/zas_area_test/xenobio
	name = "ZAS: Xenobiology"
	area_path = /area/sierra/rnd/xenobiology
