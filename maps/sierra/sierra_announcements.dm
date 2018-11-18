/datum/map/sierra
	shuttle_called_message = "�������� ����� ���������: �������� ��������� ���������� � �������������������� ������ � ��������� ������. ��������� ����� ��������� ������� ���������� ���������: %ETA%."
	shuttle_docked_message = "�������� ����� ���������: ���������� � �������������������� ������ ���������. ������ ��������� ���������� ��������� ���������� ���������������. ��������� ����� �� ������ ������: %ETD%."
	shuttle_leaving_dock = "�������� ����� ���������: ������ �����. ��������� ����� ��������� ������: %ETA%. ���������� ����������� � ��������� ��������."
	shuttle_recall_message = "�������� ����� ���������: ��������� ���������� � �������������������� ������ ��������. ������������� � ���������� ����� ������� ������������."

	emergency_shuttle_called_message = "�������� ����� ���������: ������ ��������� ��������� ��������� �����. �� ������������� ������������ ������ ��������: %ETA%."
	emergency_shuttle_docked_message = "�������� ����� ���������: ������������ ������� ��������������. � ��� ���� %ETD% ����� ������ ����� � ������������ ��������."
	emergency_shuttle_leaving_dock = "�������� ����� ���������: ��������� ���������� ������������ ������. ��������� ����� �������� �� ������ ������� ������: %ETA%"
	emergency_shuttle_recall_message = "�������� ����� ���������: ��������� ��������� ��������. ������������� � ���������� ����� ������� ������������."
	emergency_shuttle_called_sound = sound('sound/AI/torch/abandonship.ogg', volume = 45)

	command_report_sound = sound('sound/AI/torch/commandreport.ogg', volume = 45)

	grid_check_message = "���������� ���������� � ������ ���������� %STATION_NAME%. ���������� �������� ��������� ��� ������ ����������. ����������, ��������."
	grid_check_sound = sound('sound/AI/torch/poweroff.ogg', volume = 45)

	grid_restored_message = "���������� ������� %STATION_NAME% ���� �������� �� ���������� ���������."
	grid_restored_sound = sound('sound/AI/torch/poweron.ogg', volume = 45)

	meteor_detected_message = "�������� ����� ���������, ���������� ��������� ����� �� ����� %STATION_NAME%. ������������ ������������� ������ � ����� ������� �� ������ �� ������� ����."
	meteor_detected_sound = sound('sound/AI/torch/meteors.ogg', volume = 45)

	radiation_detected_message = "������������� ��������� ������ �������� ���������� %STATION_NAME%. ����� ��������� ������������ ������������� ������ � �������������� ������ �� ��������� ���� ���������� ���������������. �������������� ������ - ����������� �������, �������, ������ ������, ���������� �������, ����, ����������."
	radiation_detected_sound = sound('sound/AI/torch/radiation.ogg', volume = 45)

	space_time_anomaly_sound = sound('sound/AI/torch/spanomalies.ogg', volume = 45)

	unknown_biological_entities_message = "����������� ������������� �������� ���������� � ����������� ������������ %STATION_NAME%. ������������ ������������� ������������ ����� ����������� ����������� ���� ����� �� ���������� ����."

	unidentified_lifesigns_message = "���������� ������������ ����� ����� �� ����� %STATION_NAME%. ������������ ������������� ������������� ��� ������� ����� � ��������� �������� ����������� �����."
	unidentified_lifesigns_sound = sound('sound/AI/torch/aliens.ogg', volume = 45)

	xenomorph_spawn_sound = sound('sound/AI/torch/aliens.ogg', volume = 45)

	electrical_storm_moderate_sound = sound('sound/AI/torch/electricalstormmoderate.ogg', volume = 45)
	electrical_storm_major_sound = sound('sound/AI/torch/electricalstormmajor.ogg', volume = 45)

	use_job_frequency_announcement = FALSE
	use_radio_announcement = TRUE

/datum/map/sierra/level_x_biohazard_announcement(var/bio_level)
	if(!isnum(bio_level))
		CRASH("Expected a number, was: [log_info_line(bio_level)]")
	if(bio_level < 1 || bio_level > 9)
		CRASH("Expected a number between 1 and 9, was: [log_info_line(bio_level)]")

	var/msg
	var/crew
	switch(bio_level)
		if(9)
			msg = "������������ ����� �����. ������������� ����������� ����������� ��������. ��� ������������ ������� ������������� ������"
			crew = "������������"
		if(8)
			msg = "���������� ����������� ���������. ������������� ��������� ����������� ����������� ���������"
			crew = "����������� � ���������"
		if(6)
			msg = "������� ���������. ����� � ��������������� ������� ���������� ��������� �������"
			crew = "���������"
		if(5)
			msg = "����������� �����. ������������ ������������� �������� �������� ��� �������������� ������������"
			crew = "���������"
		if(4)
			msg = "�������������� ��������. ������ ����������� ������� ��������� ���������� ��-�� ������ �������"
			crew = "����������� � ��������������"
		if(3)
			msg = "����������� ��������"
			crew = "������������"
		if(2)
			msg = "����������� �����. ������� ��������� ��������� ���������"
			crew = "�����������"
		if(1)
			msg = "������ ���������"
			crew = "��������������"

	priority_announcement.Announce("������������ ������� ������� [bio_level] ������ ������������� ������ �� ����� [station_name()] - [msg]. [crew] ��������� ��������� ����������� ���� �� ���������� ������.", "���������")
