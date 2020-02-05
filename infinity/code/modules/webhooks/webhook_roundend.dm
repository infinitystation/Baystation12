/decl/webhook/roundend/get_message(var/list/data)
	. = ..()
	var/desc = "����� � ������� **[SSticker.mode ? SSticker.mode.name : "Unknown"]** ������ ��� �����������\n\n"
	if(data)
		var/s_escaped =  "��������������"
		if(!evacuation_controller.emergency_evacuation)
			s_escaped = "������������������"
		if(data["survivors"] > 0)
			desc += "��������: **[data["survivors"]]**\n"
			desc += "[s_escaped]: **[data["escaped"]]**\n"
		else
			desc += "**����� �� ������� ��� �����**\n"
		desc += "���������: **[data["ghosts"]]**\n"
		desc += "�������: **[LAZYLEN(GLOB.clients)]**\n"
		desc += "�����������������: **[roundduration2text()]**"

	.["embeds"] = list(list(
		"title" = "����� ��� ������� [game_id] ��������",
		"description" = desc,
		"color" = COLOR_WEBHOOK_DEFAULT
	))
