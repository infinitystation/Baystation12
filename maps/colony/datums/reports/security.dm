/datum/computer_file/report/recipient/sec
	logo = "\[logo\]"

/datum/computer_file/report/recipient/sec/New()
	..()
	set_access(access_security)
	set_access(access_heads, override = 0)

/datum/computer_file/report/recipient/sec/investigation
	form_name = "NT-SEC-43"
	title = "Доклад о расследовании"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/sec/investigation/generate_fields()
	..()
	add_field(/datum/report_field/text_label/header, "Департамент охраны ИСН Сьерра")
	add_field(/datum/report_field/text_label/instruction, "Только дл&#255; внутреннего использовани&#255;.")
	add_field(/datum/report_field/people/from_manifest, "Им&#255;")
	add_field(/datum/report_field/date, "Дата")
	add_field(/datum/report_field/time, "Врем&#255;")
	add_field(/datum/report_field/simple_text, "Название дела")
	add_field(/datum/report_field/pencode_text, "Заключение")
	add_field(/datum/report_field/pencode_text, "Наблюдени&#255;")
	add_field(/datum/report_field/signature, "Подпись")
	set_access(access_edit = access_security)

/datum/computer_file/report/recipient/sec/incident
	form_name = "NT-SEC-12"
	title = "Доклад об инциденте"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/sec/incident/generate_fields()
	..()
	add_field(/datum/report_field/text_label/header, "Департамент охраны ИСН Сьерра")
	add_field(/datum/report_field/text_label/instruction, "Заполн&#255;етс&#255; офицером при исполнении, реагировавшим на инцидент. Должно быть заполнено и зарегистрировано до конца смены!")
	add_field(/datum/report_field/people/from_manifest, "Докладывающий офицер")
	add_field(/datum/report_field/simple_text, "Тип инциденте/Преступлени&#255;")
	add_field(/datum/report_field/date, "Дата")
	add_field(/datum/report_field/time, "Врем&#255; инцидента")
	add_field(/datum/report_field/people/list_from_manifest, "Офицер(ы), провод&#255;щие арест")
	add_field(/datum/report_field/simple_text, "Location")
	add_field(/datum/report_field/pencode_text, "Персонал вовлеченный в инцидент", "\[small\]\[i\](Ж-Жертва, Под-Подозреваемый, С-Свидетель, ПБВ-Пропавший без вести, А-Арестованный, Д-Докладывающий, Пог-Погибший)\[/i\]\[/small\]")
	add_field(/datum/report_field/pencode_text, "Описание предметов/собственности", "\[small\]\[i\](Пов-Повреждено, Д-Докатательство, Пот-Потер&#255;но, Н-Найдено, У-Украдено)\[/i\]\[/small\]")
	add_field(/datum/report_field/pencode_text, "Изложение фактов")
	add_field(/datum/report_field/signature, "Подпись докладывающего офицера")
	set_access(access_edit = access_security)

/datum/computer_file/report/recipient/sec/evidence
	form_name = "NT-SEC-02b"
	title = "Форма Доказательств и Собственности"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/sec/evidence/generate_fields()
	..()
	var/datum/report_field/temp_field
	add_field(/datum/report_field/text_label/header, "Департамент охраны ИСН Сьерра")
	add_field(/datum/report_field/date, "Дата")
	add_field(/datum/report_field/time, "Врем&#255;")
	add_field(/datum/report_field/people/from_manifest, "Конфисковано у")
	add_field(/datum/report_field/pencode_text, "Список предметов, вз&#255;тых на хранение")
	set_access(access_edit = access_security)
	temp_field = add_field(/datum/report_field/signature, "Подпись сержанта/надзирател&#255;")
	temp_field.set_access(access_edit = list(access_security, access_armory))
	temp_field = add_field(/datum/report_field/signature, "Подпись детектива")
	temp_field.set_access(access_edit = list(access_security, access_forensics_lockers))
