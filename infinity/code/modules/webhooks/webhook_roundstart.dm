/decl/webhook/roundstart/get_message(var/list/data)
	. = ..()
	var/desc = "������ ����� �����"
	if(data && data["gamemode"])
		desc += " c ������� [data["gamemode"]]"
	if(data && data["players"])
		desc += "; ���������� �������: [data["players"]]"
//	desc += "."

	.["embeds"] = list(list(
		"title" = "����� ��������",
		"description" = desc,
		"color" = COLOR_WEBHOOK_DEFAULT
	))
