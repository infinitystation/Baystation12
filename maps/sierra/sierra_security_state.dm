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
	all_security_levels = list(/decl/security_level/default/sierradept/code_green, /decl/security_level/default/sierradept/code_violet, /decl/security_level/default/sierradept/code_orange, /decl/security_level/default/sierradept/code_blue, /decl/security_level/default/sierradept/code_red, /decl/security_level/default/sierradept/code_red)

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
	security_announcement_green.Announce("Все угрозы для судна и его экипажа были устранены. \
	Экипажу следует вернуться к выполнению рабочих обязанностей в штатном режиме.", \
	"Внимание! Все угрозы устранены.")
	notify_station()

/decl/security_level/default/sierradept/code_violet
	name = "code violet"

	light_max_bright = 0.5
	light_inner_range = 1
	light_outer_range = 2
	light_color_alarm = COLOR_VIOLET
	light_color_status_display = COLOR_VIOLET

	psionic_control_level = PSI_IMPLANT_LOG

	overlay_alarm = "alarm_violet"
	overlay_status_display = "status_display_violet"

	up_description = "Объявлен Фиолетовый код угрозы судну - серьезная угроза от патогенов на борту. \
	Всему медицинскому персоналу требуется обратиться к вышестоящим сотрудникам для получения инструкций к действию. \
	Не-медицинскому персоналу следует выполнять инструкции от медицинского персонала."
	down_description = "Код угрозы снижен до Фиолетового уровня - серьезная угроза от патогенов на борту. \
	Всему медицинскому персоналу требуется обратиться к вышестоящим сотрудникам для получения инструкций к действию. \
	Не-медицинскому персоналу следует выполнять инструкции от медицинского персонала."

/decl/security_level/default/sierradept/code_orange
	name = "code orange"

	light_max_bright = 0.5
	light_inner_range = 1
	light_outer_range = 2
	light_color_alarm = COLOR_ORANGE
	light_color_status_display = COLOR_ORANGE
	overlay_alarm = "alarm_orange"
	overlay_status_display = "status_display_orange"

	psionic_control_level = PSI_IMPLANT_LOG

	up_description = "Объявлен Оранжевый уровень угрозы судну - нарушения в работе оборудования и повреждения переборок. \
	Всему инженерному персоналу требуется обратиться к вышестоящим сотрудникам для получения инструкций к действию. \
	Весь не-инженерный персонал должен покинуть затронутые повреждениями отсеки. Рекомендуется ношение скафандров и \
	следование указаниям инженерного персонала."
	down_description = "Код угрозы снижен до Оражевого уровня - арушения в работе оборудования и повреждения переборок. Всему инженерному персоналу требуется обратиться к вышестоящим сотрудникам для получения инструкций к действию. \
	Весь не-инженерный персонал должен покинуть затронутые повреждениями отсеки. Рекомендуется ношение скафандров и \
	следование указаниям инженерного персонала."


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

	up_description = "По новой информации на судне можно присутствовать угроза для безопасности экипажа. \
	Всей охране требуется обратиться к вышестоящим сотрудникам для получения указаний; \
	разрешено обыскивать сотрудников и отсеки, а так же держать оружие на виду."
	down_description = "Код угрозы снижен до потенциального. \
	Всей охране требуется обратиться к вышестоящим сотрудникам для получения указаний; \
	разрешено обыскивать сотрудников и отсеки, а так же держать оружие на виду."

/decl/security_level/default/sierradept/code_red
	name = "code red"
	icon = 'icons/misc/security_state.dmi'

	light_max_bright = 0.75
	light_inner_range = 1
	light_outer_range = 3
	light_color_alarm = COLOR_RED
	light_color_status_display = COLOR_RED
	overlay_alarm = "alarm_red"
	overlay_status_display = "status_display_red"

	up_description = "На судно объявлено чрезвычайное положение. \
	Весь экипаж должен обратиться к главам для получения приказов. \
	Весь экипаж должен следовать приказам оперативников ОБР. \
	хране разрешено обыскивать сотрудников и отсеки, а так же держать оружие на виду."
	psionic_control_level = PSI_IMPLANT_DISABLED


	var/static/datum/announcement/priority/security/security_announcement_red = new(do_log = 0, do_newscast = 1, new_sound = sound('sound/misc/redalert1.ogg'))

/decl/security_level/default/sierradept/code_red/switching_up_to()
	security_announcement_red.Announce("На судно объявлено чрезвычайное положение. \
	Весь экипаж должен обратиться к главам для получения приказов. \
	Весь экипаж должен следовать приказам оперативников ОБР. \
	хране разрешено обыскивать сотрудников и отсеки, а так же держать оружие на виду.", \
	"Внимание! Достигнут Красный уровень угрозы!")
	notify_station()
	GLOB.using_map.unbolt_saferooms()

/decl/security_level/default/sierradept/code_red/switching_down_to()
	security_announcement_red.Announce("Механизм самоуничтожения был де-активирован. \
	Всему экипажу требуется обратиться к вышестоящим лицам для получения новых указаний. \
	Весь экипаж должен следовать приказам оперативников ОБР. \
	Охране разрешено обыскивать сотрудников и отсеки, а так же держать оружие на виду.", \
	"Внимание! Уровень угрозы снижен до Красного уровня!")
	notify_station()

/decl/security_level/default/sierradept/code_delta
	name = "code delta"

	light_max_bright = 0.75
	light_inner_range = 0.1
	light_outer_range = 3
	light_color_alarm = COLOR_RED
	light_color_status_display = COLOR_NAVY_BLUE

	overlay_alarm = "alarm_delta"
	overlay_status_display = "status_display_delta"

	var/static/datum/announcement/priority/security/security_announcement_delta = new(do_log = 0, do_newscast = 1, new_sound = sound('sound/effects/siren.ogg'))

/decl/security_level/default/sierradept/code_delta/switching_up_to()
/*	security_announcement_delta.Announce("Внимание всему персоналу! Код Дельта вступил в силу - система экстренного \
	самоуничтожения судна запущена. Весь экипаж должен следовать инструкциям глав и охраны. \
	Это не учебная тревога.", "Внимание! Достигнут уровень угрозы Дельта!")*/
	security_announcement_delta.Announce("Внимание всему персоналу! Код Дельта вступил в силу - на судне обнаружено \
	взрывное устройство большой мощности с активированным обратным отсчетом. Весь экипаж должен следовать инструкциям \
	глав и охраны. Это не учебная тревога.", "Внимание! Достигнут уровень угрозы Дельта!")

	notify_station()

#undef PSI_IMPLANT_AUTOMATIC
#undef PSI_IMPLANT_SHOCK
#undef PSI_IMPLANT_WARN
#undef PSI_IMPLANT_LOG
#undef PSI_IMPLANT_DISABLED
