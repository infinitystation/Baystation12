//21.12.2018 - turned off, cause it's unfinished

/client/proc/update_server()
	set category = "Server"
	set name = "Update Server"

	if (!usr.client.holder)
		return

	if(SSticker.buildchangechecked)
		to_chat(usr, "�� �� ������ �������� ������ ��� ��� ������������� ������� ����� �����.")
		return

	var/confirm = alert("Update server?", "Update server?", "Yes", "Cancel")

	if(confirm == "Cancel")
		return

	if(confirm == "Yes")
		shell("update.bat")
		message_admins("[key_name_admin(usr)] �����������(�) ���������� �������.")
		log_game("[key_name_admin(usr)] �����������(�) ���������� �������.")