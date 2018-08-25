/datum/map/sierra
	shuttle_called_message = "Внимание всему персоналу: запущена процедура подготовки к гиперпрыжку в следующий сектор. Расчатное врем&#255; окончани&#255; зар&#255;дки генератора гиперпространства: %ETA%."
	shuttle_docked_message = "Внимание всему персоналу: подготовка к гиперпрыжку завершена. Начата процедура безопасной активации гипердвигател&#255;. Рачестное врем&#255; до гиперпрыжка: %ETD%."
	shuttle_leaving_dock = "Внимание всему персоналу: гиперпрыжок начат. Примерное врем&#255; выхода из гиперпространства: %ETA%."
	shuttle_recall_message = "Внимание всему персоналу: процедура подготовки к гиперпрыжку отменена. Возвращайтесь к исполнению своих рабочих об&#255;занностей."

	emergency_shuttle_called_message = "Внимание всему персоналу: начата процедура аварийной эвакуации судна. Расчетное врем&#255; разблокировки спасательных капсул: %ETA%."
	emergency_shuttle_docked_message = "Внимание всему персоналу: спасательные капсулы разблокированы. У вас есть %ETD% чтобы зан&#255;ть места в спасательных капсулах."
	emergency_shuttle_leaving_dock = "Внимание всему персоналу: активаци&#255; двигателей спасательных капсул. Расчетное врем&#255; прибыти&#255; до пункта встречи шлюпок: %ETA%"
	emergency_shuttle_called_message = "Внимание всему персоналу: аварийна&#255; эвакуации отменена. Возвращайтесь к выполнению своих рабочих об&#255;занностей."
	emergency_shuttle_called_sound = sound('sound/AI/torch/abandonship.ogg', volume = 45)

	command_report_sound = sound('sound/AI/torch/commandreport.ogg', volume = 45)

	grid_check_message = "Обнаружены отклонени&#255; в работе энергосети %STATION_NAME%. Энергосеть аварийно отключена дл&#255; калибровки."
	grid_check_sound = sound('sound/AI/torch/poweroff.ogg', volume = 45)

	grid_restored_message = "Накопители энергии %STATION_NAME% были зар&#255;жены из аварийного хранилища."
	grid_restored_sound = sound('sound/AI/torch/poweron.ogg', volume = 45)

	meteor_detected_message = "Внимание всему персоналу, обнаружены метеориты пр&#255;мо по курсу %STATION_NAME%. Насто&#255;тельно рекомендуетс&#255; пройти в центр корабл&#255; до выхода из опасной зоны."
	meteor_detected_sound = sound('sound/AI/torch/meteors.ogg', volume = 45)

	radiation_detected_message = "Зафиксировано повышение уровн&#255; радиации поблизости %STATION_NAME%. Всему персоналу насто&#255;тельно рекомендуетс&#255; пройти в экранированные технические помещени&#255; или шаттлы до покидани&#255; зоны повышенной радиоактивности."
	radiation_detected_sound = sound('sound/AI/torch/radiation.ogg', volume = 45)

	space_time_anomaly_sound = sound('sound/AI/torch/spanomalies.ogg', volume = 45)

	unknown_biological_entities_message = "Неизвестные биологические существа обнаружены в космическом пространстве %STATION_NAME%."

	unidentified_lifesigns_message = "Обнаружена неопознанна&#255; форма жизни на борту %STATION_NAME%. Рекомендуетс&#255; заблокировать все внешние шлюзы и запретить стыковку гражданским судам."
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
