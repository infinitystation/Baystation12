GLOBAL_DATUM_INIT(xenomorphs, /datum/antagonist/xenos, new)

/datum/antagonist/xenos
	id = MODE_XENOMORPH
	role_text = "Xenophage"
	role_text_plural = "Xenophages"
	flags = ANTAG_OVERRIDE_MOB | ANTAG_RANDSPAWN | ANTAG_OVERRIDE_JOB
	mob_path = /mob/living/carbon/alien/larva
	welcome_text = "<span class='changeling'><b>����������</b>:<br>\
	�� - '����������&#255; ����� �����', ��� ������ ������. ����� �������&#255; �� ������ <b>��������</b> \
	��� ����� �����, ����������� ������� ',a' (� ���������� ������).<br>\
	���&#255;���� �������� � ��������� ������� � �� ����������� ��������-����� � ����.<br>\
	�� �� ������� �����. �����&#255;��� �� � ���� � �� �����, ����� ����������� ��� �����.<br>\
	��������� ����� - �������� ����� ��������� �� 7~ ��������� ������� ��� 9 ����, �� �����&#255; �������.<br>\
	���������� ������� ��������.<br>\
	<b>��������</b>:<br>\
	��&#255; ���� �������, ����� ����� ������, ��&#255; ����� ��������&#255; ���� ����� ����� (��� ��������).<br>\
	����� ����� (��� ��&#255;���) � ������� ����� ������&#255;��� ��� ����� � ���� �&#255;��� � ���������, \
	���� ���-������ �� �������� ���.<br>\
	����� ������&#255; �� <i>Moult</i> ��� ����� ������� ������ ��������� ���� ��&#255; �������� � ���������.<br>\
	<b>��������</b>:<br>\
	��������� ��� - ����� ���� � ������� ������&#255;� ����� �����.<br>\
	��������� �������� � ����.<br>\
	�� �������� �����, �&#255;��� � �������� ���� ������� � ���, ��� ��� � ����. �� ������� ��.<br>\
	�� ������ ����������� ��.<br>\
	�� ������������� ���� �� ����, �� ����� ��������. ���� ���� �� �����, �� ������� ��������&#255; � ��������� ���.<br>\
	<b>�� ����������� ������������ � ������ �����. ��� ��������� ��������������</b>.<br>\
	<b>��������</b>:<br>\
	�� &#255;�� ��&#255;��&#255;���&#255; ������� - ���� �� ���, �������, ������ ����� � �������. ��&#255; ����� \
	�� ����� �����.<br>\
	����������� <i>Infest</i> ������� �������� ����� ������ ���&#255;. �������� �� �������� � LOOC ����� ����������.<br>\
	<b>���&#255;���� ����!</b></span>"
	antaghud_indicator = "hudalien"
	antag_indicator = "hudalien"
	faction_role_text = "Xenophage Thrall"
	faction_descriptor = "Hive"
	faction_welcome = "<span class='changeling'>���� ������� ���� ���� ��������� �� ���� ����� ����� ����, ��� ��� ����� ���� ������ ���&#255;. \
	������, �� ������&#255;����� ����, � � ����������� ��� ��������, ��� ��������� ���  ������&#255;���&#255; \
	������ ���&#255;���. \
	������&#255;��� �������&#255; ��������������. ������� ������ ������ ����.</span>"
	faction = "xenophage"
	faction_indicator = "hudalien"
	skill_setter = /datum/antag_skill_setter/alien

	hard_cap = 5
	hard_cap_round = 8
	initial_spawn_req = 4
	initial_spawn_target = 6

	spawn_announcement_title = "Lifesign Alert"
	spawn_announcement_delay = 5000

/datum/antagonist/xenos/Initialize()
//	spawn_announcement = replacetext(GLOB.using_map.unidentified_lifesigns_message, "%STATION_NAME%", station_name())
	spawn_announcement = GLOB.using_map.level_x_biohazard_announcement(9)
	..()

/datum/antagonist/xenos/attempt_random_spawn()
	if(config.aliens_allowed) ..()

/*
/datum/antagonist/xenos/create_objectives(var/datum/mind/player)
	if(!..())
		return
	player.objectives += new /datum/objective/survive()
*/

/datum/antagonist/xenos/create_global_objectives()
	if(!..())
		return
	global_objectives |= new /datum/objective/survive
	return 1
