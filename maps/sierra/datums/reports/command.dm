/datum/computer_file/report/recipient/crew_transfer
	form_name = "CTA-NTF-01"
	title = "Заявление на перевод"
	logo = "\[logo\]"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/crew_transfer/generate_fields()
	..()
	var/list/hop_fields = list()
	add_field(/datum/report_field/text_label/header, "ИСН Сьерра - Офис Главы Персонала")
	add_field(/datum/report_field/people/from_manifest, "Имя (ГП)")
	add_field(/datum/report_field/people/from_manifest, "Имя (заявитель)", required = 1)
	add_field(/datum/report_field/date, "Дата заполнения")
	add_field(/datum/report_field/time, "Время заполнения")
	add_field(/datum/report_field/simple_text, "Текущая должность")
	add_field(/datum/report_field/simple_text, "Запрашиваемая должность")
	add_field(/datum/report_field/pencode_text, "Причина перевода")
	add_field(/datum/report_field/text_label/instruction, "Докупент является недействительным в случае некорректного заполнения следующих полей.")
	add_field(/datum/report_field/signature, "Подпись заявителя")
	hop_fields += add_field(/datum/report_field/signature, "Подпись Главы Персонала")
	hop_fields += add_field(/datum/report_field/number, "Количество персонала на текущей должности")
	hop_fields += add_field(/datum/report_field/number, "Количество персонала на запрашиваемой должности")
	hop_fields += add_field(/datum/report_field/options/yes_no, "Одобрено")
	for(var/datum/report_field/field in hop_fields)
		field.set_access(access_edit = access_hop)

/datum/computer_file/report/recipient/access_modification
	form_name = "AMA-NTF-02"
	title = "Заявление на изменение доступа"
	logo = "\[logo\]"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/access_modification/generate_fields()
	..()
	var/list/hop_fields = list()
	add_field(/datum/report_field/text_label/header, "ИСН Сьерра - Офис Главы Персонала")
	add_field(/datum/report_field/people/from_manifest, "Имя (ГП)")
	add_field(/datum/report_field/people/from_manifest, "Имя (заявитель)", required = 1)
	add_field(/datum/report_field/date, "Дата заполнения")
	add_field(/datum/report_field/time, "Время заполнения")
	add_field(/datum/report_field/simple_text, "Текущая должность")
	add_field(/datum/report_field/simple_text, "Запрашиваемый доступ")
	add_field(/datum/report_field/pencode_text, "Причина расширения доступа")
	add_field(/datum/report_field/simple_text, "Срок расширения доступа")
	add_field(/datum/report_field/text_label/instruction, "Докупент признается недействительным в случае некорректного заполнения следующих полей.")
	add_field(/datum/report_field/signature, "Подпись заявителя")
	hop_fields += add_field(/datum/report_field/signature, "Подпись Главы Персонала")
	hop_fields += add_field(/datum/report_field/number, "Количество персонала с соответствующим доступом")
	hop_fields += add_field(/datum/report_field/options/yes_no, "Одобрено")
	for(var/datum/report_field/field in hop_fields)
		field.set_access(access_edit = access_hop)

/datum/computer_file/report/recipient/borging
	form_name = "CC-NTF-09"
	title = "Контракт на киборгинизацию"
	logo = "\[logo\]"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/borging/generate_fields()
	..()
	var/list/hop_fields = list()
	add_field(/datum/report_field/text_label/header, "ИСН Сьерра - Офис Главы Персонала")
	add_field(/datum/report_field/people/from_manifest, "Имя (ГП)")
	add_field(/datum/report_field/people/from_manifest, "Имя (субъект)", required = 1)
	add_field(/datum/report_field/date, "Дата заполнения")
	add_field(/datum/report_field/time, "Время заполнения")
	add_field(/datum/report_field/text_label/instruction, "Я, нижеподписавшийся, настоящим соглашаюсь на прохождение Полной Лоботомии с целью киборгинизации или ассимиляции с ИИ. Я осведомлен обо всех рисках такого действия. Я также понимаю, что эта операция может быть необратимой, а мой трудовой контракт с NanoTrasen будет аннулирован.")
	add_field(/datum/report_field/signature, "Подпись субъекта")
	hop_fields += add_field(/datum/report_field/signature, "Подпись Главы Персонала")
	hop_fields += add_field(/datum/report_field/options/yes_no, "Одобрено")
	for(var/datum/report_field/field in hop_fields)
		field.set_access(access_edit = access_hop)
