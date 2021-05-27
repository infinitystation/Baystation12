/datum/computer_file/report/recipient/eng/
	logo = "\[sierralogo\]"
	available_on_ntnet = 0
	set_access(access_engine)

/datum/computer_file/report/recipient/eng/construction_work
	form_name = "NT-ENG-11"
	title = "Запрос на проведение строительных работ"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/eng/construction_work/generate_fields()
	..()
	add_field(/datum/report_field/text_label/header, "ИКН Сьерра - Инженерный департамент")
	add_field(/datum/report_field/text_label/header, "Запрос на проведение строительных работ")
	add_field(/datum/report_field/date, "Дата проведения работ")
	add_field(/datum/report_field/people/from_manifest, "Ответственный за процесс", required = 1)
	add_field(/datum/report_field/people/from_manifest, "Список привлеченных работников", required = 1)
	add_field(/datum/report_field/date,"Время начала")
	add_field(/datum/report_field/simple_text, "Вид работ", required = 1)
	add_field(/datum/report_field/simple_text, "Предоставленный доступ", required = 1)
	add_field(/datum/report_field/text_label/instruction, "Доступ обеспечивается сотрудником или его вышестоящим, рассмотревшим и принявшим данный запрос совместно с инженерным составом. Доступ может быть предоставлен на карту сотрудника(ов), выдан виде\
	гостевой карты или обеспечен иным способом, без дополнительных документов при условии, что он будет изъят по окончанию проведения соответствующих работ.")
	add_field(/datum/report_field/pencode_text, "Необходимые ресурсы", required = 1)
	add_field(/datum/report_field/signature, "Подпись ответственного", required = 1)
	add_field(/datum/report_field/signature, "Подпись утвердившего работы", required = 1)
	set_access(list(access_engine, access_ce), list(access_engine, access_ce))

/datum/computer_file/report/recipient/eng/report_work
	form_name = "NT-ENG-11a"
	title = "Отчёт о проведении ремонтных/строительных работ"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/eng/report_work/generate_fields()
	..()
	add_field(/datum/report_field/text_label/header, "ИКН Сьерра - Инженерный департамент")
	add_field(/datum/report_field/text_label/header, "Отчёт о проведении ремонтных/строительных работ")
	add_field(/datum/report_field/date, "Дата проведения работ")
	add_field(/datum/report_field/people/from_manifest, "Ответственный за процесс", required = 1)
	add_field(/datum/report_field/people/from_manifest, "Список привлеченных работников", required = 1)
	add_field(/datum/report_field/date,"Время начала")
	add_field(/datum/report_field/date,"Время окончания")
	add_field(/datum/report_field/simple_text, "Вид проведённой работы", required = 1)
	add_field(/datum/report_field/simple_text, "Доступ, предоставленный на время проведения работ", required = 1)
	add_field(/datum/report_field/pencode_text, "Затраченные ресурсы", required = 1)
	add_field(/datum/report_field/signature, "Подпись ответственного", required = 1)
	add_field(/datum/report_field/signature, "Подпись изъявшего временный доступ", required = 1)
	set_access(list(access_engine, access_ce), list(access_engine, access_ce))

/datum/computer_file/report/recipient/eng/request_eng
	form_name = "NT-ENG-12"
	title = "Запрос к инженерии"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/eng/request_eng/generate_fields()
	..()
	add_field(/datum/report_field/text_label/header, "ИКН Сьерра - Инженерный департамент")
	add_field(/datum/report_field/text_label/header, "Запрос к инженерному департаменту")
	add_field(/datum/report_field/date, "Дата запроса")
	add_field(/datum/report_field/people/from_manifest, "Запрашивающий", required = 1)
	add_field(/datum/report_field/pencode_text, "Содержание запроса", required = 1)
	add_field(/datum/report_field/simple_text,"Причина запроса", required = 1)
	add_field(/datum/report_field/people/from_manifest,"Ответственный за запрос", required = 1)
	add_field(/datum/report_field/options/yes_no, "Статус запроса (принят/отклонён)", required = 1)
	add_field(/datum/report_field/simple_text, "Предоставляемый доступ", required = 1)
	add_field(/datum/report_field/text_label/instruction, "Доступ обеспечивается сотрудником или его вышестоящим, рассмотревшим и принявшим данный запрос совместно с инженерным составом. Доступ может быть предоставлен на карту сотрудника/ов, выдан виде\
	гостевой карты или обеспечен иным способом, без дополнительных документов при условии, что он будет изъят по окончанию проведения соответствующих работ.")
	add_field(/datum/report_field/signature, "Подпись запросившего", required = 1)
	add_field(/datum/report_field/signature, "Подпись ответственного", required = 1)
	set_access(list(access_engine, access_ce), list(access_engine, access_ce))

/datum/computer_file/report/recipient/eng/startup_systems
	form_name = "NT-ENG-13"
	title = "Отчёт о подготовке судовых систем"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/eng/startup_systems/generate_fields()
	..()
	add_field(/datum/report_field/text_label/header, "ИКН Сьерра - Инженерный департамент")
	add_field(/datum/report_field/text_label/header, "Отчёт о подготовке судовых систем")
	add_field(/datum/report_field/date, "Дата")
	add_field(/datum/report_field/people/from_manifest, "Ответственный за процесс", required = 1)
	add_field(/datum/report_field/people/from_manifest, "Список привлечённых работников", required = 1)
	add_field(/datum/report_field/pencode_text,"Список систем судна и проведённое технического обслуживание", required = 1)
	add_field(/datum/report_field/signature,"Подпись ответственного", required = 1)
	set_access(list(access_engine, access_ce), list(access_engine, access_ce))
