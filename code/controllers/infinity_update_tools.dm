/datum/controller/gameticker
	var/update_waiting = 0				//build updating?
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

	var/confirm = alert("������������ ���������� � ����� ������?", "End Round", "Yes", "Cancel")
	if(confirm == "Cancel")
		return

	if(confirm == "Yes")
		message_admins("[key_name_admin(usr)] �����������(�) ���������� ������� � ����� �������� ������.")
		log_game("[key_name_admin(usr)] �����������(�) ���������� ������� � ����� �������� ������.")
		to_chat(world, "<span class='adminooc'>������������� [usr.key] �����������(�) ���������� ������� � ����� �������� ������.</span>")
		ticker.updater_ckey = usr.key
		ticker.update_waiting = 1

/proc/force_update_server()
	if(currentbuild.folder == currentbuild.update)
		to_chat(world, "������ ���������&#255;. ������������� �� ��������� ����� �� ��������.")
		return

	if(ticker.buildchangechecked)
		to_chat(usr, "�� �� ������ �������� ������ ��� ��� ������������� ������� ����� �����.")
		return

	to_chat(world, "<span class='adminooc'><FONT size=5>��������! ������ ����������� ����� 10 ������! ������ �� ����� �������� ��������� �����!</FONT><br>���������� � ����� ������ ������������ ��������������� [ticker.updater_ckey]</span>.")
	sound_to(world, sound('sound/effects/alarm.ogg', repeat = 0, wait = 0, volume = 100, channel = 1))
	sleep(100)
	shell("sh ../update.sh [currentbuild.dmb_file] [currentbuild.folder] [world.port] [currentbuild.update]")
