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
	add_field(/datum/report_field/text_label/header, "Департамент снабжени&#255; и мененджемента ангара ИСН Сьерра")
	add_field(/datum/report_field/text_label/header, "Обща&#255; информаци&#255;")
	add_field(/datum/report_field/date, "Дата")
	add_field(/datum/report_field/simple_text, "Название судна")
	add_field(/datum/report_field/simple_text, "Пилот/владелец судна")
	add_field(/datum/report_field/simple_text, "Род де&#255;тельности судна")
	add_field(/datum/report_field/people/from_manifest, "Стыковка авторизована")
	add_field(/datum/report_field/text_label/header, "Обща&#255; информаци&#255; о грузе")
	add_field(/datum/report_field/pencode_text, "Список типов груза на борту")
	add_field(/datum/report_field/text_label/header, "Информаци&#255; об опасном грузе")
	add_field(/datum/report_field/options/yes_no, "Оружие")
	add_field(/datum/report_field/options/yes_no, "Живой груз")
	add_field(/datum/report_field/options/yes_no, "Биологически опасные материалы")
	add_field(/datum/report_field/options/yes_no, "Химическа&#255; или радиоактивна&#255; опасность")
	add_field(/datum/report_field/signature, "Авторизаци&#255; входа на судно")
	add_field(/datum/report_field/text_label/header, "Отстыковка и отправление")
	add_field(/datum/report_field/time, "Врем&#255; отстыковки")
	add_field(/datum/report_field/pencode_text, "Дополнительные комментарии по отстыковке")
