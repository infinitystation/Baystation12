/datum/map/sierra
	shuttle_called_message = "�������� ����� ���������: �������� ��������� ���������� � �������������������� ������ � ��������� ������. ��������� ����� ��������� ������� ���������� ���������: %ETA%."
	shuttle_docked_message = "�������� ����� ���������: ���������� � �������������������� ������ ���������. ������ ��������� ���������� ��������� ��������� ����������. ��������� ����� �� ������ ������: %ETD%."
	shuttle_leaving_dock = "�������� ����� ���������: ������ �����. ��������� ����� ������ �� ��������������������: %ETA%. ���������� ����������� � ��������� ��������."
	shuttle_recall_message = "�������� ����� ���������: ��������� ���������� � �������������������� ������ ��������. ������������� � ���������� ����� ������� ������������."

	emergency_shuttle_called_message = "�������� ����� ���������: ������ ��������� ��������� ��������� �����. �� ������������� ������������ ������ ��������: %ETA%."
	emergency_shuttle_docked_message = "�������� ����� ���������: ������������ ������� ��������������. � ��� ���� %ETD% ����� ������ ����� � ������������ ��������."
	emergency_shuttle_leaving_dock = "�������� ����� ���������: ��������� ���������� ������������ ������. ��������� ����� �������� �� ������ ������� ������: %ETA%"
	emergency_shuttle_recall_message = "�������� ����� ���������: ��������� ��������� ��������. ������������� � ���������� ����� ������� ������������."
	emergency_shuttle_called_sound = sound('sound/AI/torch/abandonship.ogg', volume = 45)

	command_report_sound = sound('sound/AI/torch/commandreport.ogg', volume = 45)

	grid_check_message = "���������� ���������� � ������ ���������� ��� ������. ���������� �������� ��������� ��� ������ ����������. ����������, ��������."
	grid_check_sound = sound('sound/AI/torch/poweroff.ogg', volume = 45)

	grid_restored_message = "���������� ������� ��� ������ ���� �������� �� ���������� ���������."
	grid_restored_sound = sound('sound/AI/torch/poweron.ogg', volume = 45)

	meteor_detected_message = "�������� ����� ���������, ���������� ��������� ����� �� ����� ��� ������. ����� ��������� ������������ ������������� ������ � ����� ������� �� ������ �� ������� ����."
	meteor_detected_sound = sound('sound/AI/torch/meteors.ogg', volume = 45)

	radiation_detected_message = "������������� ��������� ������ �������� ���������� ��� ������. ����� ��������� ������������ ������������� ������ � �������������� ������ �� ��������� ���� ���������� ���������������. �������������� ������ - ����������� �������, �������, ������ ������, ���������� �������, ����, ����������."
	radiation_detected_sound = sound('sound/AI/torch/radiation.ogg', volume = 45)

	space_time_anomaly_sound = sound('sound/AI/torch/spanomalies.ogg', volume = 45)

	unknown_biological_entities_message = "����������� ������������� �������� ���������� � ����������� ������������ ��� ������. ������������ ������������� ������������ ����� ����������� ����������� ���� ����� �� ���������� ����."

	unidentified_lifesigns_message = "���������� ������������ ����� ����� �� ����� ��� ������. ������������ ������������� ������������� ��� ������� ����� � ��������� �������� ����������� �����."
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
