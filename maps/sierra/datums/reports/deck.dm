/datum/computer_file/report/recipient/shuttle
	logo = "\[logo\]"

/datum/computer_file/report/recipient/docked
	logo = "\[logo\]"
	form_name = "NT-SUP-12"
	title = "Доклад о стыковке"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/docked/New()
	..()
	set_access(access_cargo, access_cargo)
	set_access(access_heads, override = 0)

/datum/computer_file/report/recipient/docked/generate_fields()
	..()
	add_field(/datum/report_field/text_label/header, "Департамент снабжения и мененджемента ангара ИСН Сьерра")
	add_field(/datum/report_field/text_label/header, "Общая информация")
	add_field(/datum/report_field/date, "Дата")
	add_field(/datum/report_field/simple_text, "Название судна")
	add_field(/datum/report_field/simple_text, "Пилот/владелец судна")
	add_field(/datum/report_field/simple_text, "Род деятельности судна")
	add_field(/datum/report_field/people/from_manifest, "Стыковка авторизована")
	add_field(/datum/report_field/text_label/header, "Общая информация о грузе")
	add_field(/datum/report_field/pencode_text, "Список типов груза на борту")
	add_field(/datum/report_field/text_label/header, "Информация об опасном грузе")
	add_field(/datum/report_field/options/yes_no, "Оружие")
	add_field(/datum/report_field/options/yes_no, "Живой груз")
	add_field(/datum/report_field/options/yes_no, "Биологически опасные материалы")
	add_field(/datum/report_field/options/yes_no, "Химическая или радиоактивная опасность")
	add_field(/datum/report_field/signature, "Авторизация входа на судно")
	add_field(/datum/report_field/text_label/header, "Отстыковка и отправление")
	add_field(/datum/report_field/time, "Время отстыковки")
	add_field(/datum/report_field/pencode_text, "Дополнительные комментарии по отстыковке")
