/decl/webhook/server_update
	id = WEBHOOK_SERVER_UPDATE

// Data expects a "name" field containing the name of the updaters ckey being announced.
/decl/webhook/server_update/get_message(var/list/data)
	. = ..()
	.["embeds"] = list(list(
		"title" = "���������� �������",
		"description" = "������������ ���������� �������. ������ ����� ���� ���������� ������ ��� ������",
		"color" = COLOR_WEBHOOK_DEFAULT
	))
