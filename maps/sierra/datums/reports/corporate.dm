/datum/computer_file/report/recipient/nt
	logo = "\[logo\]"

/datum/computer_file/report/recipient/nt/proc/add_header()
	add_field(/datum/report_field/simple_text, "Судно", "ИСН Сьерра")
	add_field(/datum/report_field/date, "Дата")
	add_field(/datum/report_field/time, "Врем&#255;")
	add_field(/datum/report_field/simple_text, "Номер")

/datum/computer_file/report/recipient/nt/fire
	form_name = "NT-0102"
	title = "Форма прекращени&#255; трудового контракта NT"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/nt/fire/New()
	..()
	set_access(access_heads, access_heads)

/datum/computer_file/report/recipient/nt/fire/generate_fields()
	..()
	add_header()
	add_field(/datum/report_field/text_label/header, "Запись о разрыве трудового контакта")
	add_field(/datum/report_field/people/from_manifest, "Им&#255;")
	add_field(/datum/report_field/number, "Возраст")
	add_field(/datum/report_field/simple_text, "Должность")
	add_field(/datum/report_field/pencode_text, "Причина увольнени&#255;")
	add_field(/datum/report_field/signature, "Авторизовано")
	add_field(/datum/report_field/text_label/instruction, "Пожалуйста, прикрепите личное дело сотрудника к этой записи о разрыве трудового контракта.")

/datum/computer_file/report/recipient/nt/incident/New()
	..()
	set_access(access_edit = access_heads)

/datum/computer_file/report/recipient/nt/incident/generate_fields()
	..()
	add_header()
	add_field(/datum/report_field/pencode_text, "Резюме по инциденту")
	add_field(/datum/report_field/pencode_text, "Подробности инцидента")

/datum/computer_file/report/recipient/nt/incident/proc/add_signatures()
	add_field(/datum/report_field/signature, "Подпись официального лица")
	add_field(/datum/report_field/signature, "Подпись свидетел&#255;")
	add_field(/datum/report_field/options/yes_no, "Одобрено")

/datum/computer_file/report/recipient/nt/incident/ship
	form_name = "NT-3203"
	title = "Доклад об инциденте на судне NanoTrasen"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/nt/incident/ship/generate_fields()
	..()
	add_field(/datum/report_field/pencode_text, "Вовлеченные департаменты")
	add_signatures()


/datum/computer_file/report/recipient/nt/incident/personnel
	form_name = "NT-3205"
	title = "Доклад об инциденте с персоналом NanoTrasen"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/nt/incident/personnel/generate_fields()
	..()
	add_field(/datum/report_field/people/list_from_manifest, "Вовлеченный персонал")
	add_signatures()

/datum/computer_file/report/recipient/nt/incident/asset
	form_name = "NT-3201"
	title = "Доклад об инциденте с активами NanoTrasen"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/nt/incident/asset/generate_fields()
	..()
	add_field(/datum/report_field/pencode_text, "Травмы сотрудников NanoTrasen")
	add_field(/datum/report_field/pencode_text, "Потери активов NanoTrasen")
	add_signatures()

/datum/computer_file/report/recipient/nt/incident/xeno
	form_name = "NT-3213"
	title = "Доклад об инциденте с персоналом-не-людьми NanoTrasen"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/nt/incident/xeno/generate_fields()
	add_field(/datum/report_field/text_label/header, "Если у сотрудника не-человека отсутствует рабоча&#255; виза, используйте форму NT-3213A.")
	..()
	add_field(/datum/report_field/people/list_from_manifest, "Вовлеченный персонал-не-люди")
	add_signatures()

/datum/computer_file/report/recipient/nt/incident/xeno_no_visa/
	form_name = "NT-3213A"
	title = "Доклад об инциденте с персоналом-не-людьми NanoTrasen: Отсутствие визы"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/nt/incident/xeno_no_visa/generate_fields()
	add_field(/datum/report_field/text_label/header, "Если рабоча&#255; виза сотрудника не-человека валидна, используйте NT-3213.")
	..()
	add_field(/datum/report_field/people/list_from_manifest, "Вовлеченный персонал-не-люди")
	add_signatures()

/datum/computer_file/report/recipient/nt/incident/synth
	form_name = "NT-3213X"
	title = "Доклад об инциденте с персоналом-синтетиками NanoTrasen"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/nt/incident/synth/generate_fields()
	..()
	add_field(/datum/report_field/people/list_from_manifest, "Вовлеченный персонал-синтетики")
	add_signatures()

/datum/computer_file/report/recipient/nt/incident/crew
	form_name = "NT-3241"
	title = "Доклад об инциденте с судном и персоналом NanoTrasen"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/nt/incident/crew/generate_fields()
	add_field(/datum/report_field/text_label/header, "Дл&#255; несколькосторонних инцидентов, включающих в себ&#255; и корабль, и персонал.")
	..()
	add_field(/datum/report_field/people/list_from_manifest, "Вовлеченный персонал")
	add_signatures()

/datum/computer_file/report/recipient/nt/volunteer
	form_name = "NT-1443"
	title = "Форма подопытного-волонтера NanoTrasen"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/nt/volunteer/generate_fields()
	..()
	var/list/temp_fields = list()
	add_header()
	add_field(/datum/report_field/people/from_manifest, "Им&#255; волонтера")
	add_field(/datum/report_field/simple_text, "Планируемые процедуры")
	add_field(/datum/report_field/simple_text, "Компенсаци&#255; дл&#255; волонтера: (если есть)")
	add_field(/datum/report_field/people/list_from_manifest, "Ответственные исследователи")
	add_field(/datum/report_field/text_label/instruction, "Подписыва&#255; форму, \"Волонтер\" отказываетс&#255; от ответственности NanoTrasen и ее сотрудников за любые травмы, ранени&#255;, утрату собственности и прочие последстви&#255;, которые могут стать результатом назначенной процедуры. В случае подписани&#255; представителем NanoTrasen, таким как Директор Исследований, форма считаетс&#255; проверенной. Форма считаетс&#255; одобренной только после соответствующей записи.")
	add_field(/datum/report_field/signature, "Подпись волонтера")
	temp_fields += add_field(/datum/report_field/signature, "Подпись представител&#255; NanoTrasen")
	temp_fields += add_field(/datum/report_field/options/yes_no, "Одобрено")
	for(var/datum/report_field/temp_field in temp_fields)
		temp_field.set_access(access_edit = access_iaa)

/datum/computer_file/report/recipient/nt/deny
	form_name = "NT-1443D"
	title = "Rejection of Test Subject Volunteer Notice"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/nt/deny/generate_fields()
	..()
	add_header()
	add_field(/datum/report_field/text_label/instruction, "Уважаемый за&#255;витель, с сожалением сообщаем Вам, что Ваше за&#255;вление на волонтерство в качестве подопытного в корпорации NanoTrasen было отвергнуто. Мы благодарим Вас за интерес, про&#255;вленный к компании и научному прогрессу. В приложении Вы найдете оригинал Вашего за&#255;влени&#255;. С уважением,")
	add_field(/datum/report_field/signature, "Подпись представител&#255; NanoTrasen")
	add_field(/datum/report_field/people/from_manifest, "Им&#255; волонтера")
	add_field(/datum/report_field/text_label/header, "Причина отказа")
	add_field(/datum/report_field/options/yes_no, "Физическа&#255; непригодность")
	add_field(/datum/report_field/options/yes_no, "Психологическа&#255; непригодность")
	add_field(/datum/report_field/options/yes_no, "Отмена проекта")
	add_field(/datum/report_field/simple_text, "Другое")
	add_field(/datum/report_field/options/yes_no, "Отчет одобрен")
	set_access(access_edit = access_iaa)

/datum/computer_file/report/recipient/nt/memo/generate_fields()
	..()
	add_header()
	add_field(/datum/report_field/simple_text, "Тема")
	add_field(/datum/report_field/pencode_text, "Текст")
	add_field(/datum/report_field/signature, "Авторизовано")
	add_field(/datum/report_field/options/yes_no, "Одобрено")

/datum/computer_file/report/recipient/nt/memo/internal
	form_name = "NT-0003"
	title = "Записка"
	available_on_ntnet = 1

//No access restrictions for easier use.
/datum/computer_file/report/recipient/nt/sales
	form_name = "NT-2192"
	title = "Торговый контракт и квитанци&#255; NanoTrasen"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/nt/sales/generate_fields()
	..()
	add_header()
	add_field(/datum/report_field/text_label/header, "Информаци&#255; о продукте")
	add_field(/datum/report_field/simple_text, "Название продукта")
	add_field(/datum/report_field/simple_text, "Тип продукта")
	add_field(/datum/report_field/number, "Стоимость одной единицы продукта (Т)")
	add_field(/datum/report_field/number, "Запрошенное количество продукта")
	add_field(/datum/report_field/number, "Обща&#255; стоимость (Т)")
	add_field(/datum/report_field/text_label/header, "Информаци&#255; о продавце")
	add_field(/datum/report_field/text_label/instruction, "Покупатель не имеет права на возврат купленных единиц продукта в обмен на компенсацию в талерах, но может обмен&#255;ть предмет на такой же предмет, или равную стоимость в предметах (не таллрах). Продавец соглашаетс&#255; сделать все от него завис&#255;щее дл&#255; ремонта или замены предметов, св&#255;занных с производственным браком или некорректной работой, но не урона, причиненного при использовании, с целью выполнени&#255; их предполагаемой задачи.")
	add_field(/datum/report_field/people/from_manifest, "Им&#255;")
	add_field(/datum/report_field/signature, "Подпись")
	add_field(/datum/report_field/options/yes_no, "Одобрено")

/datum/computer_file/report/recipient/nt/payout
	form_name = "NT-3310"
	title = "Авторизаци&#255; выплаты ближайшему родственнику"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/nt/payout/generate_fields()
	..()
	add_header()
	add_field(/datum/report_field/people/from_manifest, "Насто&#255;щий документ авторизует выплату оставшейс&#255; части зарплаты,")
	add_field(/datum/report_field/pencode_text, "а также стоимость личного имущества: (имущество, количество талеров),")
	add_field(/datum/report_field/pencode_text, "включа&#255; личные вещи")
	add_field(/datum/report_field/text_label/instruction, "Отправить и доставить ближайшему родственнику сотрудника без задержек.")
	add_field(/datum/report_field/signature, "Подпись")
	add_field(/datum/report_field/options/yes_no, "Одобрено")
	set_access(access_edit = access_iaa)

/datum/computer_file/report/recipient/nt/audit
	form_name = "NT-IAA-12"
	title = "Аудит департамента ИСН Сьерра"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/nt/audit/generate_fields()
	add_field(/datum/report_field/date, "Дата")
	add_field(/datum/report_field/time, "Врем&#255;")
	add_field(/datum/report_field/simple_text, "Глава департамента")
	add_field(/datum/report_field/pencode_text, "Положительные наблюдени&#255;")
	add_field(/datum/report_field/pencode_text, "Отрицательные наблюдени&#255;")
	add_field(/datum/report_field/pencode_text, "Прочие заметки")
	add_field(/datum/report_field/signature, "Подпись")
	add_field(/datum/report_field/options/yes_no, "Одобрено")
	set_access(access_edit = access_iaa)

/datum/computer_file/report/recipient/nt/audit/New()
	..()
	set_access(access_iaa, access_iaa)
