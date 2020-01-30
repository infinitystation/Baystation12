/datum/map/sierra/setup_map()
	..()
	system_name = generate_system_name()
	minor_announcement = new(new_sound = sound('sound/AI/torch/commandreport.ogg', volume = 45))

/datum/map/sierra/map_info(victim)
	to_chat(victim, "<h2>���������&#255; � �����</h2>")
	to_chat(victim, "�� ���������� �� ����� <b>[station_name]</b>, ������������������ ����� ���������� �����������. �������&#255; �����&#255; ������ ������� - ���������� ������������ �� ����������� ����������, ��� �������, �� ��������� ������� ������� � ����� ���������&#255; ����� ������� ������, ����������� ��������, ���������� � �������� ������������ �����������.")
	to_chat(victim, "������ ����� �������������� ������������ ������ ������������ ����������� � ������� �������&#255;���.")
	to_chat(victim, "������ ��� � ������, � ��������� ������� ����� ������������ ����&#255;�����. �� ���&#255;�� ��� ���������&#255; ������������ � ����� �������, ��� ��������� �������������� ���������. ��� �������, ��� ���� �������� �� ���&#255; (civilian), ���� �� ������ ���������� (contractor). �������� ������:")
	to_chat(victim, "<a href=\"https://wiki.infinity-ss13.info/index.php?title=�����������_���������_��\">��������� ��</a>, <a href=\"https://wiki.infinity-ss13.info/index.php?title=�������������_������\">�����&#255;��� ��</a>, <a href=\"https://wiki.infinity-ss13.info/index.php?title=����_������_��\">���� ����� ��</a>, <a href=\"https://wiki.infinity-ss13.info/index.php?title=����,_��_������_������_�_����_����������%3F\">������ ����������</a>.")
	to_chat(victim, "<br><span class='danger'>��������!</span> �� ������ ������ ���������� ���, ��-�� �������� ����� � ����������� ����� �� ����������&#255;. ���� �� ��������� - ������� �� ������� OOC � ������� 'Fix characters load'.")

/datum/map/sierra/send_welcome()
	var/welcome_text = "<center><img src = ntlogo.png /><br /><font size = 3><b>NSV Sierra</b> ��������&#255; ��������:</font><hr />"

	var/list/space_things = list()
	var/obj/effect/overmap/visitable/sierra = map_sectors["1"]

	welcome_text += "����� ������������ [stationdate2text()] � [stationtime2text()]</center><br /><br />"
	welcome_text += "������&#255; �������: <b>[system_name()]</b><br />"
	welcome_text += "��������&#255; ������� ��&#255; ������: <b>[generate_system_name()]</b><br />"
	welcome_text += "���� �� ��������� �������: <b>[rand(15,45)]</b><br />"
	welcome_text += "���� � ���������� ������ � ����: <b>[rand(60,180)]</b><br />"
	welcome_text += "���������� �����������&#255; �������� ��������� ������������� ������� ��&#255; �����������&#255;:<br />"
	for(var/zlevel in map_sectors)
		var/obj/effect/overmap/O = map_sectors[zlevel]
		if(O.name == sierra.name)
			continue
		if(istype(O, /obj/effect/overmap/visitable/ship/landable))
			continue
		space_things |= O

	var/list/distress_calls
	for(var/obj/effect/overmap/visitable/O in space_things)
		var/location_desc = " �� ������� ��������."
		if(O.loc != sierra.loc)
			var/bearing = round(90 - Atan2(O.x - sierra.x, O.y - sierra.y),5) //fucking triangles how do they work
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

	post_comm_message("NSV Sierra Sensor Readings", welcome_text)
	minor_announcement.Announce(message = "������������ ������� ���������. ���������� �������� � ���� ������ �������� �����.")
