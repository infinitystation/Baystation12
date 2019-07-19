/datum/computer_file/report/recipient/sci
	logo = "\[logo\]"

/datum/computer_file/report/recipient/sci/proc/add_header()
	add_field(/datum/report_field/simple_text, "Судно", "ИСН Сьерра")
	add_field(/datum/report_field/date, "Дата")
	add_field(/datum/report_field/time, "Врем&#255;")
	add_field(/datum/report_field/simple_text, "Номер")

/datum/computer_file/report/recipient/sci/anomaly
	form_name = "NT-1546"
	title = "Отчет об объекте аномалистики"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/sci/anomaly/New()
	..()
	set_access(access_research, access_research)

/datum/computer_file/report/recipient/sci/anomaly/generate_fields()
	..()
	add_header()
	add_field(/datum/report_field/simple_text, "Кодовое название объекта")
	add_field(/datum/report_field/people/from_manifest, "Отчитывающийс&#255; ученый")
	add_field(/datum/report_field/people/from_manifest, "Провер&#255;ющий Директор Исследований")
	add_field(/datum/report_field/pencode_text, "Процедуры содержани&#255;")
	add_field(/datum/report_field/pencode_text, "Общее описание")
	add_field(/datum/report_field/simple_text, "Примерный возраст объекта")
	add_field(/datum/report_field/simple_text, "Уровень опасности объекта")
