/decl/webhook/server_update
	id = WEBHOOK_SERVER_UPDATE

// Data expects a "name" field containing the name of the updaters ckey being announced.
/decl/webhook/server_update/get_message(var/list/data)
	. = ..()
	var/desc = "������������ ���������� �������\n"
	desc += "������ ����� ���� ���������� ������ ��� ������"

	.["embeds"] = list(list(
		"title" = "���������� �������",
		"description" = desc,
		"color" = COLOR_WEBHOOK_DEV
	))
