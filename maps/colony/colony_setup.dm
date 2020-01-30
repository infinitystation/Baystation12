/datum/map/colony/setup_map()
	..()
	system_name = generate_system_name()
	minor_announcement = new(new_sound = sound('sound/AI/torch/commandreport.ogg', volume = 45))

/datum/map/colony/map_info(victim)
	to_chat(victim, "<h2>���������&#255; � �����</h2>")
	to_chat(victim, "�� ���������� �� ����� <b>[station_name]</b>, ������������������ ����� ���������� �����������. �������&#255; �����&#255; ������ ������� - ���������� ������������ �� ����������� ����������, ��� �������, �� ��������� ������� ������� � ����� ���������&#255; ����� ������� ������, ����������� ��������, ���������� � �������� ������������ �����������.")
	to_chat(victim, "������ ����� �������������� ������������ ������ ������������ ����������� � ������� �������&#255;���.")
	to_chat(victim, "������ ��� � ������, � ��������� ������� ����� ������������ ����&#255;�����. �� ���&#255;�� ��� ���������&#255; ������������ � ����� �������, ��� ��������� �������������� ���������. ��� �������, ��� ���� �������� �� ���&#255; (civilian), ���� �� ������ ���������� (contractor). �������� ������:")
	to_chat(victim, "<a href=\"https://wiki.infinity-ss13.info/index.php?title=�����������_���������_��\">��������� ��</a>, <a href=\"https://wiki.infinity-ss13.info/index.php?title=�������������_������\">�����&#255;��� ��</a>, <a href=\"https://wiki.infinity-ss13.info/index.php?title=����_������_��\">���� ����� ��</a>, <a href=\"https://wiki.infinity-ss13.info/index.php?title=����,_��_������_������_�_����_����������%3F\">������ ����������</a>.")
	to_chat(victim, "<br><strong>��������! ��� ���� ��� ������. ������ � ���� �� 2563, � 2307 (-256 ���).")

/datum/map/colony/send_welcome()
	var/welcome_text = "<center><img src = ntlogo.png /><br /><font size = 3><b>NSV Colony</b> ��������&#255; ��������:</font><hr />"
	welcome_text += "����� ������������ [stationdate2text()] � [stationtime2text()]</center><br /><br />"
	welcome_text += "������&#255; �������: <b>[system_name()]</b><br />"
	welcome_text += "��������&#255; ������� ��&#255; ������: <b>[generate_system_name()]</b><br />"
	welcome_text += "���� �� ��������� �������: <b>[rand(15,45)]</b><br />"
	welcome_text += "���� � ���������� ������ � ����: <b>[rand(60,180)]</b><br />"
	welcome_text += "���������� �����������&#255; �������� ��������� ������������� ������� ��&#255; �����������&#255;:<br />"
	var/list/space_things = list()
	var/obj/effect/overmap/colony = map_sectors["1"]
	for(var/zlevel in map_sectors)
		var/obj/effect/overmap/O = map_sectors[zlevel]
		if(O.name == colony.name)
			continue
		if(istype(O, /obj/effect/overmap/visitable/ship/landable))
			continue
		space_things |= O

	var/list/distress_calls
	for(var/obj/effect/overmap/O in space_things)
		var/location_desc = " �� ������� ��������."
		if(O.loc != colony.loc)
			var/bearing = round(90 - Atan2(O.x - colony.x, O.y - colony.y),5) //fucking triangles how do they work
			if(bearing < 0)
				bearing += 360
			location_desc = ", �� ������� [bearing]."
		if(O.has_distress_beacon)
			LAZYADD(distress_calls, "[O.has_distress_beacon][location_desc]")
		welcome_text += "<li>\A <b>[O.name]</b>[location_desc]</li>"

	if(LAZYLEN(distress_calls))
		welcome_text += "<br><b>���������� ������� �������&#255;:</b><br>[jointext(distress_calls, "<br>")]<br>"
	else
		welcome_text += "<br>�������� �������&#255; �� ����������.<br />"
	welcome_text += "<hr>"

	post_comm_message("NSV Colony Sensor Readings", welcome_text)
	minor_announcement.Announce(message = "New [GLOB.using_map.company_name] Update available at all communication consoles.")
