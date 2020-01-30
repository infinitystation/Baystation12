#ifndef PSI_IMPLANT_AUTOMATIC
#define PSI_IMPLANT_AUTOMATIC "Security Level Derived"
#endif
#ifndef PSI_IMPLANT_SHOCK
#define PSI_IMPLANT_SHOCK     "Issue Neural Shock"
#endif
#ifndef PSI_IMPLANT_WARN
#define PSI_IMPLANT_WARN      "Issue Reprimand"
#endif
#ifndef PSI_IMPLANT_LOG
#define PSI_IMPLANT_LOG       "Log Incident"
#endif
#ifndef PSI_IMPLANT_DISABLED
#define PSI_IMPLANT_DISABLED  "Disabled"
#endif

/datum/map/sierra // setting the map to use this list
	security_state = /decl/security_state/default/sierradept

//Sierra map alert levels. Refer to security_state.dm.
/decl/security_state/default/sierradept
	all_security_levels = list(/decl/security_level/default/sierradept/code_green, /decl/security_level/default/sierradept/code_violet, /decl/security_level/default/sierradept/code_orange, /decl/security_level/default/sierradept/code_blue, /decl/security_level/default/sierradept/code_red, /decl/security_level/default/sierradept/code_delta)

/decl/security_level/default/sierradept
	icon = 'maps/sierra/icons/security_state.dmi'

/decl/security_level/default/sierradept/code_green
	name = "code green"
	icon = 'icons/misc/security_state.dmi'

	light_max_bright = 0.25
	light_inner_range = 0.1
	light_outer_range = 1
	light_color_alarm = COLOR_GREEN
	light_color_status_display = COLOR_GREEN

	overlay_alarm = "alarm_green"
	overlay_status_display = "status_display_green"

	var/static/datum/announcement/priority/security/security_announcement_green = new(do_log = 0, do_newscast = 1, new_sound = sound('sound/misc/notice2.ogg'))

/decl/security_level/default/sierradept/code_green/switching_down_to()
	security_announcement_green.Announce("��� ������ ��� ����� � ��� ������� ���� ���������. \
	��������� ������� ��������� � ���������� ������� ������������ � ������� ������.", \
	"��������! ������ ���")
	notify_station()

/decl/security_level/default/sierradept/code_violet
	name = "code violet"

	light_max_bright = 0.25
	light_inner_range = 1
	light_outer_range = 2
	light_color_alarm = COLOR_VIOLET
	light_color_status_display = COLOR_VIOLET

	psionic_control_level = PSI_IMPLANT_LOG

	overlay_alarm = "alarm_violet"
	overlay_status_display = "status_display_violet"

/decl/security_level/default/sierradept/code_violet/switching_up_to()
	security_announcement_up.Announce("�� ����� ��������� ���������������� ����������� ��������. \
	����� ������������ ��������� ��������� ���������� � ����������� ����������� ��� ��������� ����������. \
	��-������������ ��������� ������� ��������� ���������� �� ������������ ���������.", "��������! ���������� ���")
	notify_station()

/decl/security_level/default/sierradept/code_violet/switching_down_to()
	security_announcement_down.Announce("�� ����� ��������� ���������������� ����������� ��������. \
	����� ������������ ��������� ��������� ���������� � ����������� ����������� ��� ��������� ����������. \
	��-������������ ��������� ������� ��������� ���������� �� ������������ ���������.", "��������! ��� ������ ������� �� �����������")
	notify_station()


/decl/security_level/default/sierradept/code_orange
	name = "code orange"

	light_max_bright = 0.25
	light_inner_range = 1
	light_outer_range = 2
	light_color_alarm = COLOR_ORANGE
	light_color_status_display = COLOR_ORANGE
	overlay_alarm = "alarm_orange"
	overlay_status_display = "status_display_orange"
	airlock_override = 1
	psionic_control_level = PSI_IMPLANT_LOG

/decl/security_level/default/sierradept/code_orange/switching_up_to()
	security_announcement_up.Announce("������� ��������� � ������ ������������ � ����������� ���������. \
	����� ����������� ��������� ��������� ���������� � ����������� ����������� ��� ��������� ����������. \
	���� ��-���������� �������� ������ �������� ���������� ������������� ������. ������������� ������� ���������� � \
	���������� ��������� ����������� ���������.", "��������! ��������� ���")
	notify_station()

/decl/security_level/default/sierradept/code_orange/switching_down_to()
	security_announcement_down.Announce("������� ��������� � ������ ������������ � ����������� ���������. \
	����� ����������� ��������� ��������� ���������� � ����������� ����������� ��� ��������� ����������. \
	���� ��-���������� �������� ������ �������� ���������� ������������� ������. ������������� ������� ���������� � \
	���������� ��������� ����������� ���������.", "��������! ��� ������ ������� �� ���������")
	notify_station()

/decl/security_level/default/sierradept/code_blue
	name = "code blue"
	icon = 'icons/misc/security_state.dmi'

	light_max_bright = 0.5
	light_inner_range = 1
	light_outer_range = 2
	light_color_alarm = COLOR_BLUE
	light_color_status_display = COLOR_BLUE
	overlay_alarm = "alarm_blue"
	overlay_status_display = "status_display_blue"

	psionic_control_level = PSI_IMPLANT_LOG

/decl/security_level/default/sierradept/code_blue/switching_up_to()
	security_announcement_up.Announce("�� ����� ���������� �� ����� ����� �������������� ������ ��� ������������ �������. \
	���� ������ ��������� ���������� � ����������� ����������� ��� ��������� ��������; \
	��������� ���������� ����������� � ������, � ��� �� ������� ������ �� ����.", "��������! ����� ���")
	notify_station()

/decl/security_level/default/sierradept/code_blue/switching_down_to()
	security_announcement_down.Announce("������������� ������ ��� �������. \
	���� ������ ��������� ���������� � ����������� ����������� ��� ��������� ��������; \
	��������� ���������� ����������� � ������, � ��� �� ������� ������ �� ����.", "��������! ��� ������ ������� �� ������")
	notify_station()

/decl/security_level/default/sierradept/code_red
	name = "code red"
	icon = 'icons/misc/security_state.dmi'

	light_max_bright = 0.5
	light_inner_range = 1
	light_outer_range = 2
	light_color_alarm = COLOR_RED
	light_color_status_display = COLOR_RED
	overlay_alarm = "alarm_red"
	overlay_status_display = "status_display_red"

	airlock_override = 1
	psionic_control_level = PSI_IMPLANT_DISABLED
	var/static/datum/announcement/priority/security/security_announcement_red = new(do_log = 0, do_newscast = 1, new_sound = sound('sound/misc/redalert1.ogg'))

/decl/security_level/default/sierradept/code_red/switching_up_to()
	security_announcement_red.Announce("�� ����� ��������� ������������ ���������. \
	���� ������ ������ ���������� � ������ ��� ��������� ����������. \
	������ ��������� ���������� ����������� � ������, � ��� �� ������� ������ �� ����.", \
	"��������! ������� ���")
	notify_station()
	GLOB.using_map.unbolt_saferooms()

/decl/security_level/default/sierradept/code_red/switching_down_to()
	security_announcement_red.Announce("�������� ���������� ���� �����������. \
	���� ������ ������ ���������� � ������ ��� ��������� ����������. \
	������ ��������� ���������� ����������� � ������, � ��� �� ������� ������ �� ����.", \
	"��������! ��� ������ ������� �� ��������")
	notify_station()

/decl/security_level/default/sierradept/code_delta
	name = "code delta"

	light_max_bright = 0.7
	light_inner_range = 1
	light_outer_range = 3
	light_color_alarm = COLOR_RED
	light_color_status_display = COLOR_NAVY_BLUE

	icon = 'icons/misc/security_state.dmi'
	overlay_alarm = "alarm_delta"
	overlay_status_display = "status_display_delta"

	psionic_control_level = PSI_IMPLANT_DISABLED
	var/static/datum/announcement/priority/security/security_announcement_delta = new(do_log = 0, do_newscast = 1, new_sound = sound('sound/effects/siren.ogg'))

/decl/security_level/default/sierradept/code_delta/switching_up_to()
	security_announcement_delta.Announce("�������� ����� ���������! �� ����� ���������� �������� ���������� \
	������� �������� � �������������� �������� ��������. ���� ������ ������ ��������� ����������� ���� � ������. \
	��� �� ������� �������.", "��������! ��� ������")
	notify_station()

#undef PSI_IMPLANT_AUTOMATIC
#undef PSI_IMPLANT_SHOCK
#undef PSI_IMPLANT_WARN
#undef PSI_IMPLANT_LOG
#undef PSI_IMPLANT_DISABLED
