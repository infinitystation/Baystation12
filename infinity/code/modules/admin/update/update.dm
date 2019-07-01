/client/proc/update_server()
	set name = "Update Server"
	set desc="Synchronize with the master branch."
	set category = "Server"
	if(!check_rights(R_SERVER))
		return
	if(!SSticker.update_server)
		switch(alert("�������� ������.", "Update Server", "� ����� ������", "�������������", "������"))
			if("� ����� ������")
				to_world(SPAN_NOTICE("<font size='3'><b>\n=== ������ ����� �� ���������� � ����� ������! ===\n=== ���������� ���������������� ������� [src]. ===\n</b></font>"))
				game_log("SERVER", "[key_name(src)] ���������� ���������� �������. ")
				SSticker.update_server = 1
			if("�������������")
				if(alert("�� ������� ��� ������ ������������� �������� ������?\n������ ����� ���������� �����������!", "Force Update", "��", "������") == "������")
					return

				to_world(SPAN_NOTICE("<font size='3'><b>\n=== �������������� ���������� ������� ���� �������� ������� [src]! ===\n=== ������ ����� �������� � �������� ����� ��������� �����. ===\n</b></font>"))
				game_log("SERVER", "[key_name(src)] �������� �������������� ���������� �������. ")
				sleep(5 SECONDS)
				send2mainirc("������������ ���������� �������.")
				shell("update.bat")
	else
		if(alert("�������� ���������� ������� � ����� ������?", "Cancel Update", "��", "���") == "��")
			to_world(SPAN_NOTICE("<font size='3'><b>\n=== ���������� ������� � ����� ������ ���� �������� ������� [src]. ===\n</b></font>"))
			game_log("SERVER", "[key_name(src)] ������� ���������� �������.")
			SSticker.update_server = 0
