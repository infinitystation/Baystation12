/datum/map/exodus_infinity
	emergency_shuttle_docked_message = "Эвакуационный шаттл производит стыковку с КСН Исход. Шаттл отбывает через %ETD%."
	emergency_shuttle_leaving_dock = "Эвакуационный шаттл покинул КСН ИТсход. Расчетное время прибытия: %ETA%, пункт назначения: %dock_name%."

	emergency_shuttle_called_message = "Был вызван Эвакуационный шаттл. Расчетное время прибытия: %ETA%"
	emergency_shuttle_called_sound = 'sound/AI/shuttlecalled.ogg'

	emergency_shuttle_recall_message = "Эвакуационный шаттл был отозван.."

	command_report_sound = 'sound/AI/commandreport.ogg'
	grid_check_sound = 'sound/AI/poweroff.ogg'
	grid_restored_sound = 'sound/AI/poweron.ogg'
	meteor_detected_sound = 'sound/AI/meteors.ogg'
	radiation_detected_sound = 'sound/AI/radiation.ogg'
	space_time_anomaly_sound = 'sound/AI/spanomalies.ogg'
	unidentified_lifesigns_sound = 'sound/AI/aliens.ogg'

	electrical_storm_moderate_sound = null
	electrical_storm_major_sound = null

/datum/map/exodus_infinity/level_x_biohazard_sound(var/bio_level)
	switch(bio_level)
		if(7)
			return 'sound/AI/outbreak7.ogg'
		else
			return 'sound/AI/outbreak5.ogg'
