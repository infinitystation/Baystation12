
/datum/map/exodus
	name = "Exodus"
	full_name = "NSS Exodus"
	path = "exodus"

	station_levels = list(1)
	admin_levels = list(2)
	contact_levels = list(1,3,5)
	player_levels = list(1,3,4,5,6)

	// Unit test exemptions
	exempt_areas = list(
		/area/medical/genetics = NO_APC,
		/area/engineering/atmos/storage = NO_SCRUBBER | NO_VENT,
		/area/server = NO_SCRUBBER
	)

	shuttle_docked_message = "Запланированный шаттл по перевозке экипажа на %Dock_name% пристыковался к станции. Вылет шаттла будет приблизительно через %ETD%."
	shuttle_leaving_dock = "Запланированный шаттл по перевозке экипажа покинул станцию. Расчётное время до прибытия шаттла к %dock_name% через %ETA%."
	shuttle_called_message = "Был запланирован шаттл по перевозке экипажа в %Dock_name%. Шаттл был вызван. Примерное время прибытия - %ETA%."
	shuttle_recall_message = "Запланированный шаттл по перевозке экипажа был отменён."
	emergency_shuttle_docked_message = "Эвакуационный шаттл пристыковался к станции. У вас есть %ETD% до отлёта шаттла."
	emergency_shuttle_leaving_dock = "Эвакуационный шаттл покинул станцию. Расчётное время до прибытия шаттла к %dock_name% через %ETA%."
	emergency_shuttle_called_message = "Эвакуационный шаттл был запрошен. Примерное время прибытия через %ETA%."
	emergency_shuttle_recall_message = "Эвакуационный шаттл был отозван."
