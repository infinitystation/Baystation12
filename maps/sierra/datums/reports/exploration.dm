/datum/computer_file/report/recipient/exp
	logo = "\[eclogo\]"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/fauna
	logo = "\[logo\]"
	form_name = "NT-EXP-19f"
	title = "Доклад об инопланетной фауне"

/datum/computer_file/report/recipient/fauna/generate_fields()
	..()
	add_field(/datum/report_field/text_label/header, "Экспедиционный департамент ИСН Сьерра")
	add_field(/datum/report_field/text_label/instruction, "Следующая форма должна быть заполнена членами экспедиционной команды после открытия и изучения новой формы инопланетной жизни.")
	add_field(/datum/report_field/date, "Дата")
	add_field(/datum/report_field/people/list_from_manifest, "Вовлеченный персонал")
	add_field(/datum/report_field/pencode_text, "Анатомия/внешность")
	add_field(/datum/report_field/pencode_text, "Способ передвижения")
	add_field(/datum/report_field/pencode_text, "Рацион")
	add_field(/datum/report_field/pencode_text, "Ареал")
	add_field(/datum/report_field/simple_text, "Планета происхождения")
	add_field(/datum/report_field/pencode_text, "Поведение")
	add_field(/datum/report_field/pencode_text, "Привычки нападения/обороны")
	add_field(/datum/report_field/pencode_text, "Особые характеристики")
	add_field(/datum/report_field/pencode_text, "Классификация")
	add_field(/datum/report_field/text_label/instruction, "По заполнению и одобрению данной формы, Директор Исследований должен отправить ее по факсу и Агенту Внутренних Дел, и Капитану, а также сохранить копию в своем офисе наравне с другими докладами об экспедициях.")
