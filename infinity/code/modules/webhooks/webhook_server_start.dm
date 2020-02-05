/decl/webhook/server_start
	id = WEBHOOK_SERVER_START

// Data expects a "url" field pointing to the current hosted server and port to connect on.
/decl/webhook/server_start/get_message(var/list/data)
	. = ..()
	var/desc = "����� ����� ����� �������\n"
	desc = "������: **[station_name()]**\n"
	desc = "�����: [get_world_url()]"
//	desc += "."

	.["embeds"] = list(list(
		"title" = "������ �������",
		"description" = desc,
		"color" = COLOR_WEBHOOK_DEFAULT
	))
