/datum/controller/gameticker
	var/update_waiting = FALSE			//build updating?
	var/updater_ckey = ""				//who updating build?

/client/proc/update_server()
	set category = "Server"
	set name = "Update Server"

	if (!usr.client.holder)
		return

	if(currentbuild.folder == currentbuild.update)
		to_chat(usr, "������. ����������� ���� �� ��������")
		return

	if(ticker.buildchangechecked)
		to_chat(usr, "�� �� ������ �������� ������ ��� ��� ������������� ������� ����� �����.")
		return

	var/confirm = alert("End the round and update server?", "End Round", "Yes", "Cancel")
	if(confirm == "Cancel")
		return

	if(confirm == "Yes")
		message_admins("[key_name_admin(usr)] ��������(�) ���������� �������.")
		log_game("[key_name_admin(usr)] ��������(�) ���������� �������.")
		if(!ticker.updater_ckey)
			ticker.updater_ckey = usr.key
		force_update_server()

/client/proc/update_server_round_end()
	set category = "Server"
	set name = "Update Server at Round End"

	if(!usr.client.holder)
		return

	if(currentbuild.folder == currentbuild.update)
		to_chat(usr, "������. ����������� ���� �� ��������.")
		return

	if(ticker.buildchangechecked)
		to_chat(usr, "�� �� ������ �������� ������ ��� ��� ������������� ������� ����� �����.")
		return

	var/confirm = alert("������������ ���������� � ����� ������? ������� ������: ���������� [ticker.update_waiting ? "" : "��"] �������������.", "End Round", "Trigger End round Update", "Cancel Update", "Exit")
	if(confirm == "Trigger End round Update")
		if(ticker.update_waiting)
			if(alert("��������! ���������� �  ����� ������ ��� ���� ������������� ����������� [ticker.updater_ckey], � ������ ����������� ticker.updater_ckey ����� ����������� �� ��� ���������. �� �������?", "��", "���") == "���")
				return
		ticker.update_waiting = TRUE
		ticker.updater_ckey = usr.key
		message_admins("[key_name_admin(usr)] �����������(�) ���������� ������� � ����� �������� ������.")
		log_game("[key_name_admin(usr)] ������������(�) ���������� ������� � ����� �������� ������.")
		return

	else if(confirm == "Cancel Update")
		ticker.update_waiting = FALSE
		ticker.updater_ckey = ""
		message_admins("[key_name_admin(usr)] �������(�) ���������� ������� � ����� �������� ������.")
		log_game("[key_name_admin(usr)] �������(�) ���������� ������� � ����� �������� ������.")
		return
	else
		return

/proc/force_update_server()
	if(currentbuild.folder == currentbuild.update)
		to_chat(world, "������ ���������&#255;. ������������� �� ��������� ����� �� ��������.")
		return

	if(ticker.buildchangechecked)
		to_chat(usr, "�� �� ������ �������� ������ ��� ��� ������������� ������� ����� �����.")
		return

	to_chat(world, "<span class='adminooc'><font size=5>��������! ������ ����������� ����� 10 ������! ������ �� ����� �������� ��������� �����!</font><br>���������� [ticker.update_waiting ? "� ����� ������ �������������" : "��������"] ����������� [ticker.updater_ckey]</span>.")
	sound_to(world, sound('sound/effects/alarm.ogg', repeat = 0, wait = 0, volume = 100, channel = 1))
	sleep(100)
	shell("sudo sh ../update.sh [currentbuild.dmb_file] [currentbuild.folder] [world.port] [currentbuild.update]")
