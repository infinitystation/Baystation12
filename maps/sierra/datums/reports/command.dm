/datum/computer_file/report/recipient/crew_transfer
	form_name = "CTA-NTF-01"
	title = "Заявление на перевод"
	logo = "\[sierralogo\]"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/crew_transfer/generate_fields()
	..()
	add_field(/datum/report_field/text_label/header, "ИКН Сьерра - Командный департамент")
	add_field(/datum/report_field/people/from_manifest, "Полное имя Исполнителя (ГП/Капитан)", required = 1)
	add_field(/datum/report_field/people/from_manifest, "Полное имя Заявителя", required = 1)
	add_field(/datum/report_field/date, "Дата заполнения")
	add_field(/datum/report_field/time, "Время заполнения")
	add_field(/datum/report_field/simple_text, "Текущая должность", required = 1)
	add_field(/datum/report_field/simple_text, "Запрашиваемая должность", required = 1)
	add_field(/datum/report_field/pencode_text, "Причина перевода", required = 1)
	add_field(/datum/report_field/text_label/instruction, "Документ является недействительным в случае отсутствия подписи или печати.")
	add_field(/datum/report_field/signature, "Подпись Заявителя", required = 1)
	add_field(/datum/report_field/signature, "Подпись Исполнителя (ГП/Капитан)", required = 1)
	add_field(/datum/report_field/options/yes_no, "Одобрено")
	set_access(list(access_hop, access_captain),list(access_hop,access_captain))

/datum/computer_file/report/recipient/access_modification
	form_name = "AMA-NTF-02"
	title = "Заявление на изменение доступа"
	logo = "\[sierralogo\]"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/access_modification/generate_fields()
	..()
	add_field(/datum/report_field/text_label/header, "ИКН Сьерра - Командный департамент")
	add_field(/datum/report_field/people/from_manifest, "Полное имя Исполнителя (ГП/Капитан)", required = 1)
	add_field(/datum/report_field/people/from_manifest, "Полное имя Заявителя", required = 1)
	add_field(/datum/report_field/date, "Дата заполнения", required = 1)
	add_field(/datum/report_field/time, "Время заполнения", required = 1)
	add_field(/datum/report_field/simple_text, "Текущая должность", required = 1)
	add_field(/datum/report_field/simple_text, "Запрашиваемый доступ", required = 1)
	add_field(/datum/report_field/pencode_text, "Причина расширения доступа", required = 1)
	add_field(/datum/report_field/simple_text, "Срок расширения доступа", required = 1)
	add_field(/datum/report_field/text_label/instruction, "Документ является недействительным в случае отсутствия подписи или печати.")
	add_field(/datum/report_field/signature, "Подпись Заявителя", required = 1)
	add_field(/datum/report_field/signature, "Подпись Исполнителя (ГП/Капитан)", required = 1)
	add_field(/datum/report_field/options/yes_no, "Одобрено")
	set_access(list(access_hop, access_captain),list(access_hop,access_captain))

/datum/computer_file/report/recipient/fire
	form_name = "D-NTF-01"
	title = "Форма прекращения трудового контракта NT"
	logo = "\[sierralogo\]"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/fire/generate_fields()
	..()
	var/list/heads_fields = list()
	add_field(/datum/report_field/text_label/header, "ИКН Сьерра - Командный департамент")
	add_field(/datum/report_field/text_label/instruction, "К документу должно быть прикрепленно личное дело сотрудника.")
	add_field(/datum/report_field/people/from_manifest, "Полное имя Исполнителя (ГП/Капитан)", required = 1)
	add_field(/datum/report_field/people/from_manifest, "Полное имя Уволенного", required = 1)
	add_field(/datum/report_field/date, "Дата заполнения")
	add_field(/datum/report_field/time, "Время заполнения")
	add_field(/datum/report_field/simple_text, "Занимаемая должность Уволенного", required = 1)
	add_field(/datum/report_field/simple_text, "Новая должность Уволенного", required = 1)
	add_field(/datum/report_field/pencode_text, "Причина увольнения", required = 1)
	add_field(/datum/report_field/simple_text, "Срок расширения доступа", required = 1)
	add_field(/datum/report_field/text_label/instruction, "Документ является недействительным в случае отсутствия подписи или печати.")
	add_field(/datum/report_field/signature, "Подпись Увольняемого (если требуется)")
	heads_fields += add_field(/datum/report_field/signature, "Подпись Исполнителя (Глава отдела/ГП/Капитан)", required = 1)
	heads_fields += add_field(/datum/report_field/options/yes_no, "Одобрено")
	for(var/datum/report_field/field in heads_fields)
		field.set_access(access_edit = access_heads)


/datum/computer_file/report/recipient/record
	form_name = "PC-NTF"
	title = "Личное дело"
	logo = "\[sierralogo\]"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/record/generate_fields()
	..()
	add_field(/datum/report_field/text_label/header, "Личное дело")
	add_field(/datum/report_field/text_label/instruction, "Фотографии должны быть прикреплены к личному делу")
	add_field(/datum/report_field/number, "Номер дела")
	add_field(/datum/report_field/simple_text, "Полное имя", required = 1)
	add_field(/datum/report_field/simple_text, "Профессия", required = 1)
	add_field(/datum/report_field/simple_text, "Пол", required = 1)
	add_field(/datum/report_field/simple_text, "Возраст", required = 1)
	add_field(/datum/report_field/simple_text, "Раса", required = 1)
	add_field(/datum/report_field/simple_text, "Группа крови")
	add_field(/datum/report_field/simple_text, "Религия")
	add_field(/datum/report_field/pencode_text, "Криминальный статус")
	add_field(/datum/report_field/simple_text, "ДНК-код", required = 1)
	add_field(/datum/report_field/simple_text, "Отпечаток пальца", required = 1)
	add_field(/datum/report_field/simple_text, "Домашняя система", required = 1)
	add_field(/datum/report_field/simple_text, "Гражданство", required = 1)
	add_field(/datum/report_field/pencode_text, "Квалификации")
	add_field(/datum/report_field/date, "Дата заполнения")
	add_field(/datum/report_field/time, "Время заполнения")
	add_field(/datum/report_field/signature, "Подпись", required = 1)
	add_field(/datum/report_field/options/yes_no, "Одобрено")
	set_access(access_heads, access_heads)

/datum/computer_file/report/recipient/decree
	form_name = "DEC-NTF"
	title = "Корпоративный Указ"
	logo ="\[logo\]"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/decree/generate_fields()
	..()
	add_field(/datum/report_field/text_label/header, "Корпоративный Указ")
	add_field(/datum/report_field/number, "Номер указа")
	add_field(/datum/report_field/people/from_manifest, "Полное имя распорядителя", required = 1)
	add_field(/datum/report_field/pencode_text, "Содержание распоряжения")
	add_field(/datum/report_field/pencode_text, "Причина распоряжения")
	add_field(/datum/report_field/date, "Дата заполнения")
	add_field(/datum/report_field/time, "Время заполнения")
	add_field(/datum/report_field/text_label/instruction, "Документ является недействительным в случае отсутствия подписи или печати.")
	add_field(/datum/report_field/signature, "Подпись", required = 1)
	set_access(access_heads, access_heads)

/datum/computer_file/report/recipient/request
	form_name = "REQ-NTF"
	title = "Корпоративный Запрос"
	logo = "\[logo\]"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/request/generate_fields()
	..()
	add_field(/datum/report_field/text_label/header, "Корпоративный Запрос")
	add_field(/datum/report_field/number, "Номер запроса ")
	add_field(/datum/report_field/people/from_manifest, "Полное имя распорядителя", required = 1)
	add_field(/datum/report_field/pencode_text, "Содержание распоряжения")
	add_field(/datum/report_field/pencode_text, "Причина распоряжения")
	add_field(/datum/report_field/date, "Дата заполнения")
	add_field(/datum/report_field/time, "Время заполнения")
	add_field(/datum/report_field/text_label/instruction, "Документ является недействительным в случае отсутствия подписи или печати.")
	add_field(/datum/report_field/signature, "Подпись", required = 1)
	set_access(list(access_heads, access_qm), list(access_heads, access_qm))
