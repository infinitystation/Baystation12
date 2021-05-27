/datum/computer_file/report/recipient/sec/
	logo = "\[sierralogo\]"
	available_on_ntnet = 0
	set_access(access_security)

/datum/computer_file/report/recipient/sec/report_detective
	form_name = "NT-SEC-14"
	title = "Отчет Детектива"

/datum/computer_file/report/recipient/sec/report_detective/generate_fields()
	..()
	add_field(/datum/report_field/text_label/header, "ИКН Сьерра - Охранный департамент")
	add_field(/datum/report_field/text_label/header, "Отчет о расследовании")
	add_field(/datum/report_field/text_label/instruction, "Для ознакомления авторизованному персоналу.")
	add_field(/datum/report_field/people/from_manifest, "Имя", required = 1)
	add_field(/datum/report_field/date, "Дата", required = 1)
	add_field(/datum/report_field/pencode_text, "Отчёт по делу", required = 1)
	add_field(/datum/report_field/pencode_text, "Основная информация", required = 1)
	add_field(/datum/report_field/pencode_text, "Вложения", required = 1)
	add_field(/datum/report_field/pencode_text, "Наблюдения", required = 1)

/datum/computer_file/report/recipient/sec/report_incident
	form_name = "NT-SEC-16"
	title = "Служба Безопасности: Отчет об происшествии"

/datum/computer_file/report/recipient/sec/report_incident/generate_fields()
	..()
	add_field(/datum/report_field/text_label/header, "ИКН Сьерра - Охранный департамент")
	add_field(/datum/report_field/text_label/header, "Отчет о происшествии")
	add_field(/datum/report_field/text_label/instruction, "Заполняется дежурным офицером.")
	add_field(/datum/report_field/simple_text, "Тип происшествия/преступления", required = 1)
	add_field(/datum/report_field/simple_text, "Местоположение", required = 1)
	add_field(/datum/report_field/people/from_manifest, "Отчет заполнил", required = 1)
	add_field(/datum/report_field/people/from_manifest, "Офицер(ы), которые были на месте происшествия", required = 1)
	add_field(/datum/report_field/simple_text, "Персонал, участвующий в инциденте", required = 1)
	add_field(/datum/report_field/text_label/instruction, "(Ж-Жертва, П-Подозреваемый, С-Свидетель, Пр-Пропавший, A-Арестованный, М-Мертвец)")
	add_field(/datum/report_field/simple_text, "Описание предметов/Материального ущерба", required = 1)
	add_field(/datum/report_field/text_label/instruction, "(П-Поврежденный, У-Улика, Пр-Потерянный, В-Восстановленный, Ук-Украденный)")
	add_field(/datum/report_field/pencode_text, "Полное описание происшествия", required = 1)
	add_field(/datum/report_field/signature, "Подпись офицера, составившего отчет", required = 1)

/datum/computer_file/report/recipient/sec/report_evidence
	form_name = "NT-SEC-02b"
	title = "Безопасность: Отчет об уликах"

/datum/computer_file/report/recipient/sec/report_evidence/generate_fields()
	..()
	var/list/det_fields = list()
	add_field(/datum/report_field/text_label/header, "ИКН Сьерра - Охранный департамент")
	add_field(/datum/report_field/text_label/header, "Вещественные доказательства")
	add_field(/datum/report_field/date, "Дата")
	add_field(/datum/report_field/people/from_manifest, "Конфисковано у", required = 1)
	add_field(/datum/report_field/pencode_text, "Список конфискованных предметов", required = 1)
	add_field(/datum/report_field/signature, "Подпись Смотрителя брига")
	det_fields += add_field(/datum/report_field/signature, "Подпись Криминалиста", required = 1)
	for(var/datum/report_field/field in det_fields)
		field.set_access(access_edit = access_forensics_lockers)

/datum/computer_file/report/recipient/sec/patrol
	form_name = "NT-SEC-04"
	title = "Служба Безопасности: Назначение патрулей"

/datum/computer_file/report/recipient/sec/patrol/generate_fields()
	..()
	add_field(/datum/report_field/text_label/header, "ИКН Сьерра - Охранный департамент")
	add_field(/datum/report_field/text_label/header, "Назначение патрулей")
	add_field(/datum/report_field/date, "Дата утверждения")
	add_field(/datum/report_field/time, "Время утверждения")
	add_field(/datum/report_field/pencode_text, "Описание патрулей", required = 1)
	add_field(/datum/report_field/text_label/instruction, "Сменные позывные. Для синего кода и выше.")
	add_field(/datum/report_field/pencode_text, "Описание сменных позывных", required = 1)
	add_field(/datum/report_field/text_label/instruction, "Для патрулирующего. Проведите полный осмотр назначенной палубы, включая тех. туннели.\
	Отвечайте на вызовы с других палуб только при приказе. Вы ответственны за безопасность на закрепленной за вами палубе.")
	add_field(/datum/report_field/signature, "Подпись", required = 1)

/datum/computer_file/report/recipient/sec/armory
	form_name = "NT-SEC-05"
	title = "Инвентаризация оружейной"

/datum/computer_file/report/recipient/sec/armory/generate_fields()
	..()
	add_field(/datum/report_field/text_label/header, "ИКН Сьерра - Охранный департамент")
	add_field(/datum/report_field/text_label/header, "Инвентаризация оружейной")
	add_field(/datum/report_field/text_label/header, "Снаряжение")
	add_field(/datum/report_field/number, "Портативные укрепления")
	add_field(/datum/report_field/number, "Фальшфейеры")
	add_field(/datum/report_field/number, "Наручники")
	add_field(/datum/report_field/number, "Гранаты с слезоточивым газом")
	add_field(/datum/report_field/number, "Светошумовые гранаты")
	add_field(/datum/report_field/text_label/header, "Броня")
	add_field(/datum/report_field/number, "Противоударная броня")
	add_field(/datum/report_field/number, "Пуленепробиваемая броня")
	add_field(/datum/report_field/number, "Аблятивная броня")
	add_field(/datum/report_field/number, "Противоударные шлемы")
	add_field(/datum/report_field/number, "Пуленепробиваемае шлемы")
	add_field(/datum/report_field/number, "Аблятивные шлемы")
	add_field(/datum/report_field/number, "Бронещиты")
	add_field(/datum/report_field/text_label/header, "Оружие")
	add_field(/datum/report_field/number, "ЛАЕПЫ")
	add_field(/datum/report_field/number, "Электрокарабины")
	add_field(/datum/report_field/number, "Ионные ружья и пистолеты")
	add_field(/datum/report_field/number, "Лазерные карабины")
	add_field(/datum/report_field/number, "Пистолет-Пулемёт НТ41")
	add_field(/datum/report_field/number, "Боевой дробовик")
	add_field(/datum/report_field/number, "Бронещиты")
	add_field(/datum/report_field/pencode_text, "Прочее оружие", required = 1)
	add_field(/datum/report_field/time, "Опись арсенала проведена в")
	add_field(/datum/report_field/signature, "Подпись сотрудника проводившего опись", required = 1)

/datum/computer_file/report/recipient/weapon
	form_name = "NT-SEC-15"
	title = "Регистрация хранения и ношения личного оружия"
	available_on_ntnet = 1
	logo = "\[sierralogo\]"

/datum/computer_file/report/recipient/weapon/generate_fields()
	..()
	var/datum/report_field/temp_field
	add_field(/datum/report_field/text_label/header, "Оружие")
	add_field(/datum/report_field/simple_text, "Наименование")
	add_field(/datum/report_field/simple_text, "Тип")
	add_field(/datum/report_field/simple_text, "Калибр")
	add_field(/datum/report_field/simple_text, "Тип ствола")
	add_field(/datum/report_field/simple_text, "Комплектация")
	add_field(/datum/report_field/simple_text, "Производство")
	temp_field = add_field(/datum/report_field/simple_text, "Серийный номер")
	temp_field.set_access(access = access_security, access_edit = access_security)
	temp_field.set_access(access_heads, override = 0)
	temp_field = add_field(/datum/report_field/pencode_text, "Дополнительно")
	temp_field.set_access(access = access_security, access_edit = access_security)
	temp_field.set_access(access_heads, override = 0)
	add_field(/datum/report_field/text_label/header, "Носитель")
	add_field(/datum/report_field/people/from_manifest, "Имя и должность")
	temp_field = add_field(/datum/report_field/simple_text, "ДНК")
	temp_field.required = TRUE
	temp_field = add_field(/datum/report_field/simple_text, "Дактилоскопический слепок")
	temp_field.required = TRUE
	add_field(/datum/report_field/text_label/instruction, "Место для подписей")
	add_field(/datum/report_field/signature, "Подпись заявителя")
	temp_field = add_field(/datum/report_field/signature, "Подпись ревизора")
	temp_field.set_access(access_edit = access_security)
	temp_field.required = TRUE

