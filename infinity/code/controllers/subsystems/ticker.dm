/datum/controller/subsystem/ticker/proc/update_server()
	end_game_state = END_GAME_AWAITING_UPDATE
	to_world(SPAN_NOTICE("<font size='3'><b>\n=== ������ ������ �� ����������! ===\n=== �� ����� ���������� ��������� �����. ===\n</b></font>"))

	sleep(10 SECONDS)

	if(end_game_state == END_GAME_AWAITING_UPDATE)
		send2maindiscord("������������ ���������� �������.")
		game_log("SERVER", "�������� ���������� �������. ")
		shell("update.bat")
