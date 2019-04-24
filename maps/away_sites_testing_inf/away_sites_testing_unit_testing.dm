/datum/map/away_sites_testing
	// Unit test exemptions
	apc_test_exempt_areas = list(
//		/area/adherent_base = NO_SCRUBBER|NO_VENT|NO_APC, //AREAS WITH // DOESN'T MAINTENANCE
//		/area/adherent_base/surface = NO_SCRUBBER|NO_VENT|NO_APC,
//		/area/adherent_base/underwater = NO_APC,
//		/area/adherent_base/deep = NO_SCRUBBER|NO_VENT|NO_APC,
//		/area/ship/gunboat = NO_SCRUBBER|NO_VENT|NO_APC,
//		/area/ship/marksman = NO_SCRUBBER|NO_VENT|NO_APC,
//		/area/rubbidu = NO_SCRUBBER|NO_VENT|NO_APC,
//		/area/ship/patrol = NO_SCRUBBER|NO_VENT|NO_APC,
//		/area/white_star = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/space = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/mine = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/smugglers/base = NO_SCRUBBER,
		/area/smugglers/dorms = NO_SCRUBBER|NO_VENT,
		/area/smugglers/office = NO_SCRUBBER|NO_VENT,
		/area/bluespaceriver/underground = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/bluespaceriver/ship/power = NO_SCRUBBER|NO_VENT,
		/area/bluespaceriver/ground = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/map_template/hydrobase = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/map_template/hydrobase/station = NO_SCRUBBER,
		/area/map_template/marooned = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/map_template/colony/mineralprocessing = NO_SCRUBBER|NO_VENT,
		/area/map_template/datacapsule = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/outpost/mining/solar = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/outpost/mining/maints = NO_SCRUBBER|NO_VENT,
		/area/outpost/mining/atmos = NO_SCRUBBER|NO_VENT,
		/area/ship/skrellscoutship/solars = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/ship/skrellscoutship/crew/toilets = NO_SCRUBBER|NO_VENT,
		/area/ship/skrellscoutship/maintenance/power = NO_SCRUBBER,
		/area/ship/skrellscoutshuttle = NO_SCRUBBER
	)

	area_coherency_test_exempt_areas = list(
		/area/space,
		/area/mine/explored,
		/area/mine/unexplored,
	)
/*
	area_coherency_test_subarea_count = list(
		/area/constructionsite = 7,
		/area/constructionsite/maintenance = 14,
		/area/constructionsite/solar = 3,
	)
*/
	area_usage_test_exempted_areas = list(
		/area/overmap,
		/area/template_noop,
		/area/centcom,
		/area/centcom/holding,
		/area/centcom/specops,
		/area/chapel,
		/area/hallway,
		/area/medical,
		/area/medical/virology,
		/area/medical/virologyaccess,
		/area/medical/virology,
		/area/security,
		/area/security/brig,
		/area/security/prison,
		/area/maintenance,
		/area/rnd,
		/area/rnd/xenobiology,
		/area/rnd/xenobiology/xenoflora,
		/area/rnd/xenobiology/xenoflora_storage,
		/area/shuttle,
		/area/shuttle/escape,
		/area/shuttle/escape/centcom,
		/area/shuttle/specops,
		/area/shuttle/specops/centcom,
		/area/shuttle/syndicate_elite,
		/area/shuttle/syndicate_elite/mothership,
		/area/shuttle/syndicate_elite/station,
		/area/skipjack_station,
		/area/skipjack_station/start,
		/area/supply,
		/area/syndicate_mothership,
		/area/syndicate_mothership/elite_squad,
		/area/wizard_station,
		/area/beach,
		/area/turbolift,
		/area/map_template/hydrobase
	)

	area_usage_test_exempted_root_areas = list(
		/area/exoplanet,
		/area/map_template,
	)
