/datum/controller/subsystem/ticker/proc/update_server()
	end_game_state = END_GAME_AWAITING_UPDATE
	to_world(SPAN_NOTICE("<font size='3'><b>\n=== ������ ������ �� ����������! ===\n=== �� ����� ���������� ��������� �����. ===\n</b></font>"))

	sleep(10 SECONDS)

	if(end_game_state == END_GAME_AWAITING_UPDATE)
		send2mainirc("������������ ���������� �������.")
		game_log("SERVER", "�������� ���������� �������. ")
		shell("update.bat")

/datum/controller/subsystem/ticker/proc/update_map(New_Map)
	if(shell("update_map.bat") == 0)
		send2mainirc("��������� ������ ����� - [New_Map]!")
		log_and_message_admins("�������������� ����� ���������. ��������� ������ ����� - [New_Map].")
	else
		scheduled_map_change = 1
		log_and_message_admins("������ � �������������� �����! ��������������� ���������� ���������� � ����� ������! �������� �� ������ �������������!")

	if(GAME_STATE == RUNLEVEL_POSTGAME)
		end_game_state = END_GAME_AWAITING_TICKETS
