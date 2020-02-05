/decl/webhook/roundend/get_message(var/list/data)
	. = ..()
	var/desc = "����� � ������� **[SSticker.mode ? SSticker.mode.name : "Unknown"]** ������ ��� �����������\n\n"
	if(data)

		if(data["survivors"] > 0)

			var/s_was =      "�������"
			var/s_survivor = "��������"
			var/s_escaped =  "��������������"

			if(data["survivors"] != 1)
				s_was = "��������"
				s_survivor = "��������"

			if(!evacuation_controller.emergency_evacuation)
				s_escaped = "����������������"

			desc += "[s_was] [data["survivors"]]: **[s_survivor]**\n"
			desc += "[s_escaped]: **[data["escaped"]]**\n"
		else
			desc += "**����� �� ������� ��� �����**\n"
		desc += "���������: [data["ghosts"]]"

	.["embeds"] = list(list(
		"title" = "����� ��� ������� [game_id] ��������",
		"description" = desc,
		"color" = COLOR_WEBHOOK_DEFAULT
	))
