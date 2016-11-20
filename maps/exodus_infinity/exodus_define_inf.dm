
/datum/map/exodus_infinity
	name = "Infinity"
	full_name = "NSS Infinity"
	path = "exodus_infinity"

	lobby_icon = 'maps/exodus_infinity/exodus_lobby_inf.dmi'

	station_levels = list(1)
	admin_levels = list(2)
	contact_levels = list(1,3,5)
	player_levels = list(1,3,4,5,6)

	shuttle_docked_message = "Запланированный шаттл для депортации персонала на ЦК произвел стыковку с %Dock_name%. Шаттл произведет отстыковку через %ETD%"
	shuttle_leaving_dock = "Внимание, шаттл покинул станцию. Приблизительное время до прибытия в пункт назначения: %ETA%. Пункт назначения: %dock_name%."
	shuttle_called_message = "Шаттл для депортации персонала был вызван для стыковки с  %Dock_name%. Расчетное время прибытия: %ETA%"
	shuttle_recall_message = "Шаттл для депортации экипажа был отозван.."
	emergency_shuttle_docked_message = "Аварийный эвакуационный шаттл произвел стыковку со станцией. У вас есть %ETD% чтобы пройти на борт эвакуационного шаттла."
	emergency_shuttle_leaving_dock = "Аварийный эвакуационный шаттл закончил процедуру отстыковки и покинул станцию. Время до прибытия: %ETA%, пункт назначения: %dock_name%."
	emergency_shuttle_called_message = "Аварийный эвакуационный шаттл был вызван по запросу экипажа. Расчетное время прибытия: %ETA%"
	emergency_shuttle_recall_message = "Аварийный эвакуационный шаттл был отозван.."

	station_networks = list(
							NETWORK_CIVILIAN_EAST,
							NETWORK_CIVILIAN_WEST,
							NETWORK_COMMAND,
							NETWORK_ENGINE,
							NETWORK_ENGINEERING,
							NETWORK_ENGINEERING_OUTPOST,
							NETWORK_EXODUS,
							NETWORK_MEDICAL,
							NETWORK_MINE,
							NETWORK_RESEARCH,
							NETWORK_RESEARCH_OUTPOST,
							NETWORK_ROBOTS,
							NETWORK_PRISON,
							NETWORK_SECURITY,
							NETWORK_ALARM_ATMOS,
							NETWORK_ALARM_FIRE,
							NETWORK_ALARM_POWER,
							NETWORK_THUNDER,
							NETWORK_TELECOM,
							)

	evac_controller_type = /datum/evacuation_controller/pods/shuttle

/datum/map/exodus/perform_map_generation()
	new /datum/random_map/automata/cave_system(null,1,1,5,255,255) // Create the mining Z-level.
	new /datum/random_map/noise/ore(null, 1, 1, 5, 64, 64)         // Create the mining ore distribution map.
	return 1
