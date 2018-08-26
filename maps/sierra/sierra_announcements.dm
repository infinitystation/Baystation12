/datum/map/sierra
	shuttle_called_message = "Внимание всему персоналу: запущена процедура подготовки к гиперпрыжку в следующий сектор. Расчатное время окончания зарядки генератора гиперпространства: %ETA%."
	shuttle_docked_message = "Внимание всему персоналу: подготовка к гиперпрыжку завершена. Начата процедура безопасной активации гипердвигателя. Рачестное время до гиперпрыжка: %ETD%."
	shuttle_leaving_dock = "Внимание всему персоналу: гиперпрыжок начат. Примерное время выхода из гиперпространства: %ETA%."
	shuttle_recall_message = "Внимание всему персоналу: процедура подготовки к гиперпрыжку отменена. Возвращайтесь к исполнению своих рабочих обязанностей."

	emergency_shuttle_called_message = "Внимание всему персоналу: начата процедура аварийной эвакуации судна. Расчетное время разблокировки спасательных капсул: %ETA%."
	emergency_shuttle_docked_message = "Внимание всему персоналу: спасательные капсулы разблокированы. У вас есть %ETD% чтобы занять места в спасательных капсулах."
	emergency_shuttle_leaving_dock = "Внимание всему персоналу: активация двигателей спасательных капсул. Расчетное время прибытия до пункта встречи шлюпок: %ETA%"
	emergency_shuttle_recall_message = "Внимание всему персоналу: аварийная эвакуации отменена. Возвращайтесь к выполнению своих рабочих обязанностей."
	emergency_shuttle_called_sound = sound('sound/AI/torch/abandonship.ogg', volume = 45)

	command_report_sound = sound('sound/AI/torch/commandreport.ogg', volume = 45)

	grid_check_message = "Обнаружены отклонения в работе энергосети %STATION_NAME%. Энергосеть аварийно отключена для калибровки."
	grid_check_sound = sound('sound/AI/torch/poweroff.ogg', volume = 45)

	grid_restored_message = "Накопители энергии %STATION_NAME% были заряжены из аварийного хранилища."
	grid_restored_sound = sound('sound/AI/torch/poweron.ogg', volume = 45)

	meteor_detected_message = "Внимание всему персоналу, обнаружены метеориты прямо по курсу %STATION_NAME%. Настоятельно рекомендуется пройти в центр корабля до выхода из опасной зоны."
	meteor_detected_sound = sound('sound/AI/torch/meteors.ogg', volume = 45)

	radiation_detected_message = "Зафиксировано повышение уровня радиации поблизости %STATION_NAME%. Всему персоналу настоятельно рекомендуется пройти в экранированные технические помещения или шаттлы до покидания зоны повышенной радиоактивности."
	radiation_detected_sound = sound('sound/AI/torch/radiation.ogg', volume = 45)

	space_time_anomaly_sound = sound('sound/AI/torch/spanomalies.ogg', volume = 45)

	unknown_biological_entities_message = "Неизвестные биологические существа обнаружены в космическом пространстве %STATION_NAME%."

	unidentified_lifesigns_message = "Обнаружена неопознанная форма жизни на борту %STATION_NAME%. Рекомендуется заблокировать все внешние шлюзы и запретить стыковку гражданским судам."
	unidentified_lifesigns_sound = sound('sound/AI/torch/aliens.ogg', volume = 45)

	xenomorph_spawn_sound = sound('sound/AI/torch/aliens.ogg', volume = 45)

	electrical_storm_moderate_sound = sound('sound/AI/torch/electricalstormmoderate.ogg', volume = 45)
	electrical_storm_major_sound = sound('sound/AI/torch/electricalstormmajor.ogg', volume = 45)

/datum/map/sierra/level_x_biohazard_sound(var/bio_level)
	switch(bio_level)
		if(7)
			return sound('sound/AI/torch/outbreak7.ogg', volume = 45)
		else
			return sound('sound/AI/torch/outbreak5.ogg', volume = 45)
