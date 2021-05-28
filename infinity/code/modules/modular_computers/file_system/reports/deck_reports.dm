//Reports for the deck management program.

/datum/computer_file/report/flight_plan
	form_name = "DC109"
	title = "Полётный план"

/datum/computer_file/report/flight_plan/generate_fields()
	add_field(/datum/report_field/text_label/instruction, "Эти поля являются обязательными к заполнению:")
	leader = add_field(/datum/report_field/people/from_manifest, "Лидер", required = 1)
	planned_depart = add_field(/datum/report_field/time, "Планируемое время отбытия", required = 1)
	add_field(/datum/report_field/text_label/instruction, "Эти поля являются не обязательными к заполнению:")
	manifest = add_field(/datum/report_field/people/list_from_manifest, "Манифест")
	add_field(/datum/report_field/pencode_text, "Цель")
	add_field(/datum/report_field/time, "Планируемое время прибытия/выхода на связь")
	add_field(/datum/report_field/simple_text, "Количество топлива")

/datum/computer_file/report/recipient/shuttle/generate_fields()
	..()
	shuttle = add_field(/datum/report_field/simple_text, "Шаттл", required = 1)
	shuttle.can_edit = 0
	mission = add_field(/datum/report_field/simple_text, "Миссия", required = 1)
	mission.can_edit = 0

/datum/computer_file/report/recipient/shuttle/damage
	form_name = "DC243"
	title = "После полётная проверка повреждений"

/datum/computer_file/report/recipient/shuttle/damage/generate_fields()
	..()
	add_field(/datum/report_field/text_label/instruction, "Оцените ущерб, нанесенный шаттлу, и его готовность к полету.")
	add_field(/datum/report_field/pencode_text, "Состояние шаттла по прибитию")
	add_field(/datum/report_field/simple_text, "Готовность к полету")
	add_field(/datum/report_field/pencode_text, "Необходимый ремонт")
	add_field(/datum/report_field/time, "Планируемое время окончания ремонта")

/datum/computer_file/report/recipient/shuttle/fuel
	form_name = "DC12"
	title = "После-полётная проверка уровня топлива"
/datum/computer_file/report/recipient/shuttle/fuel/generate_fields()
	..()
	add_field(/datum/report_field/simple_text, "Предыдущий уровень топлива")
	add_field(/datum/report_field/simple_text, "Текущий уровень топлива")
	add_field(/datum/report_field/time, "Время дозаправки")
	add_field(/datum/report_field/pencode_text, "Дополнительные заметки")

/datum/computer_file/report/recipient/shuttle/atmos
	form_name = "DC245"
	title = "После-полётная проверка атмосферы"

/datum/computer_file/report/recipient/shuttle/atmos/generate_fields()
	..()
	add_field(/datum/report_field/text_label/instruction, "Оцените состояние атмосферных систем шаттла.")
	add_field(/datum/report_field/pencode_text, "Состояние атмосферных запасов")
	add_field(/datum/report_field/time, "Планируемое время окончания запасов")
	add_field(/datum/report_field/simple_text, "Необходимые запасы")

/datum/computer_file/report/recipient/shuttle/gear
	form_name = "DC248b"
	title = "После-полётная проверка запасов для чрезвычайных ситуаций"

/datum/computer_file/report/recipient/shuttle/gear/generate_fields()
	..()
	add_field(/datum/report_field/text_label/instruction, "Оцените состояние запасов для чрезвычайных ситуаций шаттла.")
	add_field(/datum/report_field/pencode_text, "Состояние запасов при прибытии")
	add_field(/datum/report_field/pencode_text, "Пополненые запасы")
	add_field(/datum/report_field/time, "Время пополнения запасов")
	add_field(/datum/report_field/simple_text, "Готовность к полёту")
	add_field(/datum/report_field/pencode_text, "Дополнительные заметки")

/datum/computer_file/report/recipient/shuttle/post_flight
	form_name = "DC102"
	title = "Стандартный отчёт экспедиции"
/datum/computer_file/report/recipient/shuttle/post_flight/generate_fields()
	..()
	add_field(/datum/report_field/text_label/instruction, "Отчёт о находках, открытиях и результатах экспедиции.")
	add_field(/datum/report_field/simple_text, "Посещённые локации")
	add_field(/datum/report_field/simple_text, "Основная цель миссии")
	add_field(/datum/report_field/pencode_text, "Общее заключение по экспедиции")
	add_field(/datum/report_field/pencode_text, "Статус команды и потери")
	add_field(/datum/report_field/pencode_text, "Возвращённые объекты или материалы")
	add_field(/datum/report_field/pencode_text, "Рекомендуемые последующие мероприятия")
	add_field(/datum/report_field/pencode_text, "Дополнительные заметки")