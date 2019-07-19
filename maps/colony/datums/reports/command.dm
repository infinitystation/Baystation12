/datum/computer_file/report/recipient/crew_transfer
	form_name = "CTA-NTF-01"
	title = "За&#255;вление на перевод"
	logo = "\[logo\]"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/crew_transfer/generate_fields()
	..()
	var/list/hop_fields = list()
	add_field(/datum/report_field/text_label/header, "ИСН Сьерра - Офис Главы Персонала")
	add_field(/datum/report_field/people/from_manifest, "Им&#255; (ГП)")
	add_field(/datum/report_field/people/from_manifest, "Им&#255; (за&#255;витель)", required = 1)
	add_field(/datum/report_field/date, "Дата заполнени&#255;")
	add_field(/datum/report_field/time, "Врем&#255; заполнени&#255;")
	add_field(/datum/report_field/simple_text, "Текуща&#255; должность")
	add_field(/datum/report_field/simple_text, "Запрашиваема&#255; должность")
	add_field(/datum/report_field/pencode_text, "Причина перевода")
	add_field(/datum/report_field/text_label/instruction, "Докупент &#255;вл&#255;етс&#255; недействительным в случае некорректного заполнени&#255; следующих полей.")
	add_field(/datum/report_field/signature, "Подпись за&#255;вител&#255;")
	hop_fields += add_field(/datum/report_field/signature, "Подпись Главы Персонала")
	hop_fields += add_field(/datum/report_field/number, "Количество персонала на текущей должности")
	hop_fields += add_field(/datum/report_field/number, "Количество персонала на запрашиваемой должности")
	hop_fields += add_field(/datum/report_field/options/yes_no, "Одобрено")
	for(var/datum/report_field/field in hop_fields)
		field.set_access(access_edit = access_hop)

/datum/computer_file/report/recipient/access_modification
	form_name = "AMA-NTF-02"
	title = "За&#255;вление на изменение доступа"
	logo = "\[logo\]"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/access_modification/generate_fields()
	..()
	var/list/hop_fields = list()
	add_field(/datum/report_field/text_label/header, "ИСН Сьерра - Офис Главы Персонала")
	add_field(/datum/report_field/people/from_manifest, "Им&#255; (ГП)")
	add_field(/datum/report_field/people/from_manifest, "Им&#255; (за&#255;витель)", required = 1)
	add_field(/datum/report_field/date, "Дата заполнени&#255;")
	add_field(/datum/report_field/time, "Врем&#255; заполнени&#255;")
	add_field(/datum/report_field/simple_text, "Текуща&#255; должность")
	add_field(/datum/report_field/simple_text, "Запрашиваемый доступ")
	add_field(/datum/report_field/pencode_text, "Причина расширени&#255; доступа")
	add_field(/datum/report_field/simple_text, "Срок расширени&#255; доступа")
	add_field(/datum/report_field/text_label/instruction, "Докупент признаетс&#255; недействительным в случае некорректного заполнени&#255; следующих полей.")
	add_field(/datum/report_field/signature, "Подпись за&#255;вител&#255;")
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
	add_field(/datum/report_field/people/from_manifest, "Им&#255; (ГП)")
	add_field(/datum/report_field/people/from_manifest, "Им&#255; (субъект)", required = 1)
	add_field(/datum/report_field/date, "Дата заполнени&#255;")
	add_field(/datum/report_field/time, "Врем&#255; заполнени&#255;")
	add_field(/datum/report_field/text_label/instruction, "Я, нижеподписавшийс&#255;, насто&#255;щим соглашаюсь на прохождение Полной Лоботомии с целью киборгинизации или ассимил&#255;ции с ИИ. Я осведомлен обо всех рисках такого действи&#255;. Я также понимаю, что эта операци&#255; может быть необратимой, а мой трудовой контракт с NanoTrasen будет аннулирован.")
	add_field(/datum/report_field/signature, "Подпись субъекта")
	hop_fields += add_field(/datum/report_field/signature, "Подпись Главы Персонала")
	hop_fields += add_field(/datum/report_field/options/yes_no, "Одобрено")
	for(var/datum/report_field/field in hop_fields)
		field.set_access(access_edit = access_hop)
