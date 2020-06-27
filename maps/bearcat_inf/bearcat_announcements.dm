/datum/map/bearcat
	shuttle_called_message = "Внимание всему экипажу: запущена процедура подготовки к подпространственному прыжку в следующий сектор. Расчетное время окончания зарядки генератора блюспейса: %ETA%."
	shuttle_docked_message = "Внимание всему экипажу: подготовка к подпространственному прыжку завершена. Начата процедура безопасной активации генератора подпространства. Расчетное время до начала прыжка: %ETD%."
	shuttle_leaving_dock = "Внимание всему экипажу: прыжок начат. Примерное время окончания прыжка: %ETA%. Сохраняйте спокойствие и трезвость мышления."
	shuttle_recall_message = "Внимание всему экипажу: процедура подготовки к подпространственному прыжку отменена. Возвращайтесь к исполнению своих рабочих обязанностей."

	emergency_shuttle_called_message = "Внимание всему экипажу: начата аварийная эвакуация судна. Спасательные капсулы будут готовы к отбытию через %ETA%."
	emergency_shuttle_docked_message = "Внимание всему экипажу: спасательные капсулы разблокированы. У вас есть %ETD% чтобы занять места в спасательных капсулах."
	emergency_shuttle_leaving_dock = "Внимание всему экипажу: магнитные болты спасательных капсул отключены. Капсулы катапультируются при наличии разумного внутри."
	emergency_shuttle_recall_message = "Внимание всему экипажу: аварийная эвакуация судна отменена. Возвращайтесь к работе."
	emergency_shuttle_called_sound = sound('sound/AI/torch/abandonship.ogg', volume = 45)

	command_report_sound = sound('sound/AI/torch/commandreport.ogg', volume = 45)

	grid_check_message = "Обнаружены отклонения в работе энергосети %STATION_NAME%. Энергосеть аварийно отключена для полной калибровки. Пожалуйста, ожидайте."
	grid_check_sound = sound('sound/AI/torch/poweroff.ogg', volume = 45)

	grid_restored_message = "Накопители энергии %STATION_NAME% были заряжены из аварийного хранилища."
	grid_restored_sound = sound('sound/AI/torch/poweron.ogg', volume = 45)

	meteor_detected_message = "Внимание всему экипажу, обнаружены метеориты прямо по курсу %STATION_NAME%. Настоятельно рекомендуется пройти в центр корабля до выхода из опасной зоны."
	meteor_detected_sound = sound('sound/AI/torch/meteors.ogg', volume = 45)

	radiation_detected_message = "Зафиксировано повышение уровня радиации поблизости %STATION_NAME%. Всему экипажу настоятельно рекомендуется пройти в экранированные отсеки до покидания зоны повышенной радиоактивности. Коридор третьей палубы и челнок экранированы."
	radiation_detected_sound = sound('sound/AI/torch/radiation.ogg', volume = 45)

	space_time_anomaly_sound = sound('sound/AI/torch/spanomalies.ogg', volume = 45)

	unknown_biological_entities_message = "Неизвестные биологические существа обнаружены в космическом пространстве %STATION_NAME%. Настоятельно рекомендуется активировать режим сдерживания неизвестных форм жизни на генераторе щита."

	unidentified_lifesigns_message = "Обнаружена неопознанная форма жизни на борту %STATION_NAME%. Настоятельно рекомендуется заблокировать все внешние шлюзы и запретить стыковку гражданским судам."
	unidentified_lifesigns_sound = sound('sound/AI/torch/aliens.ogg', volume = 45)

//	xenomorph_spawn_sound = sound('sound/AI/torch/aliens.ogg', volume = 45)

	electrical_storm_moderate_sound = sound('sound/AI/torch/electricalstormmoderate.ogg', volume = 45)
	electrical_storm_major_sound = sound('sound/AI/torch/electricalstormmajor.ogg', volume = 45)

	use_job_frequency_announcement = FALSE
	use_radio_announcement = TRUE

/datum/map/bearcat/level_x_biohazard_announcement(var/bio_level)
	if(!isnum(bio_level))
		CRASH("Expected a number, was: [log_info_line(bio_level)]")
	if(bio_level < 1 || bio_level > 9)
		CRASH("Expected a number between 1 and 9, was: [log_info_line(bio_level)]")

	var/msg
	var/crew
	switch(bio_level)
		if(9)
			msg = "неопознанная форма жизни. Рекомендуется изолировать неизвестный организм. Это максимальный уровень потенциальной угрозы"
			crew = "Командующему"
		if(8)
			msg = "враждебные коррозийные организмы. Зафиксировано нарушение структурной целостности переборок"
			crew = "Инженерному и Охранному"
		if(6)
			msg = "опасные вредители. Рядом с вентиляционными шахтами обнаружены скопления паутины"
			crew = "Охранному"
		if(5)
			msg = "космические карпы. Настоятельно рекомендуется временно прервать всю внекорабельную деятельность"
			crew = "Охранному"
		if(4)
			msg = "быстрорастущие растения. Точное определение степени опасности невозможно из-за частых мутаций"
			crew = "Инженерному и Обслуживающему"
		if(3)
			msg = "вредоносные патогены"
			crew = "Медицинскому"
		if(2)
			msg = "коррозийные грибы. Имеется опасность поражения переборок"
			crew = "Инженерному"
		if(1)
			msg = "мелкие вредители"
			crew = "Обслуживающему"

	priority_announcement.Announce("Подтверждено наличие объекта [bio_level] уровня биологической угрозы на борту [station_name()] - [msg]. [crew] экипажу требуется предпринять меры по ликвидации угрозы.", "Биоугроза")
