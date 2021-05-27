/datum/computer_file/report/recipient/med/generate_fields()
	..()
	set_access(access_medical)

/datum/computer_file/report/recipient/med/recipe
	form_name = "NT-MED-01"
	title = "Назначение рецепта медицинского препарата"

/datum/computer_file/report/recipient/med/recipe/generate_fields()
	..()
	var/list/cmo_fields = list()
	add_field(/datum/report_field/text_label/header, "ИКН Сьерра - Медицинский департамент")
	add_field(/datum/report_field/text_label/header, "Форма выдачи рецепта медицинского препарата")
	add_field(/datum/report_field/people/from_manifest, "Врач, выдающий рецепт", required = 1)
	add_field(/datum/report_field/signature, "Подпись врача", required = 1)
	add_field(/datum/report_field/simple_text, "Наименование препарата", required = 1)
	add_field(/datum/report_field/date, "Дата выдачи рецепта", required = 1)
	add_field(/datum/report_field/people/from_manifest, "Имя пациента", required = 1)
	add_field(/datum/report_field/simple_text, "Рекомендуемые дозировки", required = 1)
	add_field(/datum/report_field/pencode_text, "Постановление врача", required = 1)
	add_field(/datum/report_field/text_label/instruction,"Рецепт действителен 30 дней с момента выдачи, начиная со дня получения.")
	cmo_fields += add_field(/datum/report_field/signature, "Подпись главного врача", required = 1)
	for(var/datum/report_field/field in cmo_fields)
		field.set_access(access_edit = access_cmo)

/datum/computer_file/report/recipient/med/insanity_resolution
	logo = "\[sierralogo\]"
	form_name = "NT-MED-02"
	title = "Постановление о невменяемости"

/datum/computer_file/report/recipient/med/insanity_resolution/generate_fields()
	..()
	var/list/cmo_fields = list()
	add_field(/datum/report_field/text_label/header, "ИКН Сьерра - Медицинский департамент")
	add_field(/datum/report_field/text_label/header, "Постановление о невменяемости")
	add_field(/datum/report_field/people/from_manifest, "Имя и должность пациента", required = 1)
	add_field(/datum/report_field/simple_text, "Дата рождения", required = 1)
	add_field(/datum/report_field/number, "Возраст", required = 1)
	add_field(/datum/report_field/simple_text, "Диагноз", required = 1)
	cmo_fields += add_field(/datum/report_field/pencode_text, "Постановление главврача", required = 1)
	cmo_fields += add_field(/datum/report_field/signature, "Подпись главврача или менталиста(советника)", required = 1)
	add_field(/datum/report_field/date, "Дата", required = 1)
	add_field(/datum/report_field/text_label/instruction,"Признание невменяемым означает полное отстранение от выполнения должностных обязанностей.\
	Документ является недействительным при отсутствии подписи и печати главврача.")
	for(var/datum/report_field/field in cmo_fields)
		field.set_access(access_edit = access_cmo)

/datum/computer_file/report/recipient/med/report_autopsy
	logo = "\[sierralogo\]"
	form_name = "NT-MED-03"
	title = "Отчет о вскрытии"

/datum/computer_file/report/recipient/med/report_autopsy/generate_fields()
	..()
	add_field(/datum/report_field/text_label/header, "ИКН Сьерра - Медицинский департамент")
	add_field(/datum/report_field/text_label/header, "Отчет о вскрытии")
	add_field(/datum/report_field/people/from_manifest, "Имя и должность погибшего", required = 1)
	add_field(/datum/report_field/simple_text, "Раса", required = 1)
	add_field(/datum/report_field/simple_text, "Пол", required = 1)
	add_field(/datum/report_field/number, "Возраст", required = 1)
	add_field(/datum/report_field/date, "Дата смерти", required = 1)
	add_field(/datum/report_field/simple_text, "Время смерти", required = 1)
	add_field(/datum/report_field/simple_text, "Причина смерти", required = 1)
	add_field(/datum/report_field/pencode_text, "Дополнительные сведения", required = 1)
	add_field(/datum/report_field/date, "Дата вскрытия", required = 1)
	add_field(/datum/report_field/time, "Время вскрытия", required = 1)
	add_field(/datum/report_field/people/from_manifest, "Вскрытие проводил", required = 1)
	add_field(/datum/report_field/signature, "Подпись", required = 1)
	set_access(list(access_security, access_medical), list(access_security, access_medical))