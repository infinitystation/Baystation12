/datum/computer_file/report/recipient/sci/anomaly
	logo = "\[sierralogo\]"
	form_name = "NT-SCI-05"
	title = "Изучение Аномалий"

/datum/computer_file/report/recipient/sci/anomaly/generate_fields()
	..()
	add_field(/datum/report_field/text_label/header, "ИКН Сьерра - Научный департамент")
	add_field(/datum/report_field/text_label/header, "Отчет об аномальном объекте")
	add_field(/datum/report_field/simple_text, "Кодовое название AO", required = 1)
	add_field(/datum/report_field/people/from_manifest, "Отчет заполнял", required = 1)
	add_field(/datum/report_field/pencode_text, "Заметки Директора Исследований", required = 1)
	add_field(/datum/report_field/pencode_text, "Процедуры сдерживания", required = 1)
	add_field(/datum/report_field/pencode_text, "Общее описание", required = 1)
	add_field(/datum/report_field/simple_text, "Примерный возраст AO", required = 1)
	add_field(/datum/report_field/simple_text, "Уровень угрозы AO", required = 1)
	set_access(access_research, access_research)

/datum/computer_file/report/recipient/sci/volunteer
	logo = "\[sierralogo\]"
	form_name = "HR-NTCO-02b"
	title = "Форма добровольца для исследований"

/datum/computer_file/report/recipient/sci/volunteer/generate_fields()
	..()
	add_field(/datum/report_field/text_label/header, "ИКН Сьерра - Научный департамент")
	add_field(/datum/report_field/text_label/header, "Форма добровольца, участвующего в исследованиях")
	add_field(/datum/report_field/date, "Дата")
	add_field(/datum/report_field/people/from_manifest, "Имя и должность добровольца", required = 1)
	add_field(/datum/report_field/text_label/instruction, "Фото обязательно")
	add_field(/datum/report_field/simple_text, "Область исследования", required = 1)
	add_field(/datum/report_field/people/from_manifest, "Полное имя и должность ответственного за проведения исследования", required = 1)
	add_field(/datum/report_field/signature, "Подпись ответственного", required = 1)
	add_field(/datum/report_field/signature, "Подпись добровольца", required = 1)
	set_access(access_research, access_research)

/datum/computer_file/report/recipient/sci/volunteer_denied
	logo = "\[sierralogo\]"
	form_name = "HR-NTCO-02b-D"
	title = "Форма добровольца о завершении исследований"

/datum/computer_file/report/recipient/sci/volunteer_denied/generate_fields()
	..()
	add_field(/datum/report_field/text_label/header, "ИКН Сьерра - Научный департамент")
	add_field(/datum/report_field/text_label/header, "Прекращение добровольного исследования")
	add_field(/datum/report_field/date, "Дата")
	add_field(/datum/report_field/people/from_manifest, "Имя и должность добровольца", required = 1)
	add_field(/datum/report_field/simple_text, "Причина прекращения", required = 1)
	add_field(/datum/report_field/signature, "Подпись", required = 1)
	set_access(access_research, access_research)

/datum/computer_file/report/recipient/sci/prototype
	logo = "\[sierralogo\]"
	form_name = "NT-SCI-07"
	title = "Форма о передачи прототипов оборудования"

/datum/computer_file/report/recipient/sci/prototype/generate_fields()
	..()
	add_field(/datum/report_field/text_label/header, "ИКН Сьерра - Научный департамент")
	add_field(/datum/report_field/text_label/header, "Форма передачи прототипов оборудования")
	add_field(/datum/report_field/simple_text, "Отдел, в который передаются прототипы", required = 1)
	add_field(/datum/report_field/people/from_manifest, "Имя научного сотрудника, передающего прототипы", required = 1)
	add_field(/datum/report_field/signature, "Подпись научного сотрудника", required = 1)
	add_field(/datum/report_field/people/from_manifest, "Имя сотрудника, принимающего прототипы", required = 1)
	add_field(/datum/report_field/signature, "Подпись принимающего сотрудника", required = 1)
	add_field(/datum/report_field/date, "Дата передачи")
	add_field(/datum/report_field/time, "Время передачи")
	add_field(/datum/report_field/pencode_text, "Список передаваемых прототипов", required = 1)
	add_field(/datum/report_field/text_label/instruction, "При необходимости - вписать дополнительные пункты в списке. Пустые графы заполнить, как N/A")
	add_field(/datum/report_field/signature, "Подпись Директора Исследований", required = 1)
	set_access(access_research, access_research)

/datum/computer_file/report/recipient/sci/augmentations
	logo = "\[sierralogo\]"
	form_name = "AG17-N1"
	title = "Форма об установке аугментаций"

/datum/computer_file/report/recipient/sci/augmentations/generate_fields()
	..()
	add_field(/datum/report_field/text_label/header, "ИКН Сьерра - Научный департамент")
	add_field(/datum/report_field/text_label/header, "Форма AG17-N1 для аугментации сотрудника")
	add_field(/datum/report_field/simple_text, "Отдел, в котором работает аугментируемый", required = 1)
	add_field(/datum/report_field/people/from_manifest, "Имя сотрудника, в которого имплантируются аугментации", required = 1)
	add_field(/datum/report_field/people/from_manifest, "Имя сотрудника, проводящего операцию", required = 1)
	add_field(/datum/report_field/signature, "Подпись сотрудника, проводящего операцию", required = 1)
	add_field(/datum/report_field/date, "Дата аугментации")
	add_field(/datum/report_field/time, "Время аугментации")
	add_field(/datum/report_field/simple_text, "Причина аугментации", required = 1)
	add_field(/datum/report_field/pencode_text, "Список аугментаций", required = 1)
	add_field(/datum/report_field/text_label/instruction, "Каждую аугментацию оформить в виде: часть тела, если протез - описать марку протеза, функционал, название\
	При необходимости - вписать дополнительные пункты в списке. Пустые графы заполнить, как N/A.")
	add_field(/datum/report_field/signature, "Подпись Директора Исследований", required = 1)
	add_field(/datum/report_field/signature, "Подпись главы отдела аугментированного")
	set_access(access_research, access_research)