/datum/computer_file/report/recipient/exp/
	logo = "\[sierralogo\]"
	available_on_ntnet = 0
	set_access(access_explorer)

/datum/computer_file/report/recipient/exp/mission_manifest
	form_name = "NT-EXP-19m"
	title = "Манифест миссии на вылет челнока"

/datum/computer_file/report/recipient/exp/mission_manifest/generate_fields()
	..()
	add_field(/datum/report_field/text_label/header, "ИКН Сьерра - Экспедиционный департамент")
	add_field(/datum/report_field/text_label/header, "Манифест Миссии")
	add_field(/datum/report_field/text_label/instruction, "Следующие колонки должны быть заполнены лицами, которые входят в состав экспедиции\
	для сохранения точного количества участников с последующим оформлением документов на них.")
	add_field(/datum/report_field/people/from_manifest, "Лидер Экспедиционной команды", required = 1)
	add_field(/datum/report_field/people/from_manifest, "Экспедиционный пилот", required = 1)
	add_field(/datum/report_field/people/from_manifest, "Экспедитор", required = 1)
	add_field(/datum/report_field/people/from_manifest, "Экспедитор", required = 1)
	add_field(/datum/report_field/people/from_manifest, "Экспедитор", required = 1)
	add_field(/datum/report_field/people/from_manifest, "Экспедитор", required = 1)
	add_field(/datum/report_field/people/from_manifest, "Экспедитор", required = 1)
	add_field(/datum/report_field/people/from_manifest, "Учёные, шахтёры и прочий персонал", required = 1)
	add_field(/datum/report_field/text_label/instruction, "Манифест составляется для единоразового использования на одной миссии.")

/datum/computer_file/report/recipient/exp/planet
	form_name = "NT-EXP-19p"
	title = "Отчет по экзопланете"

/datum/computer_file/report/recipient/exp/planet/generate_fields()
	..()
	add_field(/datum/report_field/text_label/header, "ИКН Сьерра - Экспедиционный департамент")
	add_field(/datum/report_field/text_label/header, "Отчет об экзопланете")
	add_field(/datum/report_field/text_label/instruction, "Следующие колонки заполняются членом, входящего в состав экспедиционной команды, после возвращения с планеты на Сьерру.")
	add_field(/datum/report_field/people/from_manifest, "Местоположение", required = 1)
	add_field(/datum/report_field/date, "Дата")
	add_field(/datum/report_field/people/from_manifest, "Участники экспедиции", required = 1)
	add_field(/datum/report_field/pencode_text, "Информация по атмосфере", required = 1)
	add_field(/datum/report_field/pencode_text, "Информация по местности", required = 1)
	add_field(/datum/report_field/pencode_text, "Обитаемость планеты", required = 1)
	add_field(/datum/report_field/pencode_text, "Наличие фауны", required = 1)
	add_field(/datum/report_field/pencode_text, "Наличие флоры", required = 1)
	add_field(/datum/report_field/pencode_text, "Материалы/Инструменты, которые были использованы", required = 1)
	add_field(/datum/report_field/pencode_text, "Найденные предметы или материалы", required = 1)
	add_field(/datum/report_field/pencode_text, "Наблюдения", required = 1)
	add_field(/datum/report_field/signature,"Подпись ответственного, за заполнение документа", required = 1)
	add_field(/datum/report_field/text_label/instruction, "После заполнения данного документы, а также последующего его утверждения,\
	директор исследований должен отправить данный документ по факсу Центральному Командованию и Капитану, после чего занести этот документ в архив.")

/datum/computer_file/report/recipient/exp/fauna
	form_name = "NT-EXP-19f"
	title = "Отчет по фауне"

/datum/computer_file/report/recipient/exp/fauna/generate_fields()
	..()
	add_field(/datum/report_field/text_label/header, "ИКН Сьерра - Экспедиционный департамент")
	add_field(/datum/report_field/text_label/header, "Рапорт об обнаружении инопланетной фауны")
	add_field(/datum/report_field/text_label/instruction, "Следующие колонки заполняются членом, входящего в состав экспедиционной команды, после открытия и изучения инопланетной жизни.")
	add_field(/datum/report_field/people/from_manifest, "Местоположение", required = 1)
	add_field(/datum/report_field/date, "Дата")
	add_field(/datum/report_field/people/from_manifest, "Участники экспедиции", required = 1)
	add_field(/datum/report_field/pencode_text, "Анатомия/Внешний вид", required = 1)
	add_field(/datum/report_field/pencode_text, "Локомоция", required = 1)
	add_field(/datum/report_field/pencode_text, "Чем питается", required = 1)
	add_field(/datum/report_field/pencode_text, "Среда обитания", required = 1)
	add_field(/datum/report_field/pencode_text, "Поведение", required = 1)
	add_field(/datum/report_field/pencode_text, "Защита/Нападение", required = 1)
	add_field(/datum/report_field/pencode_text, "Специальная характеристика(и)", required = 1)
	add_field(/datum/report_field/pencode_text, "Классификация", required = 1)
	add_field(/datum/report_field/text_label/instruction, "После заполнения данного документы, а также последующего его утверждения,\
	директор исследований должен отправить данный документ по факсу Центральному Командованию и Капитану, после чего занести этот документ в архив, закрепив его с документом об экзопланете.")
