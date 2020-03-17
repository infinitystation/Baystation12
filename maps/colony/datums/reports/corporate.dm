/datum/computer_file/report/recipient/nt
	logo = "\[logo\]"

/datum/computer_file/report/recipient/nt/proc/add_header()
	add_field(/datum/report_field/simple_text, "Судно", "ИСН Сьерра")
	add_field(/datum/report_field/date, "Дата")
	add_field(/datum/report_field/time, "Время")
	add_field(/datum/report_field/simple_text, "Номер")

/datum/computer_file/report/recipient/nt/fire
	form_name = "NT-0102"
	title = "Форма прекращения трудового контракта NT"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/nt/fire/New()
	..()
	set_access(access_heads, access_heads)

/datum/computer_file/report/recipient/nt/fire/generate_fields()
	..()
	add_header()
	add_field(/datum/report_field/text_label/header, "Запись о разрыве трудового контакта")
	add_field(/datum/report_field/people/from_manifest, "Имя")
	add_field(/datum/report_field/number, "Возраст")
	add_field(/datum/report_field/simple_text, "Должность")
	add_field(/datum/report_field/pencode_text, "Причина увольнения")
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
	add_field(/datum/report_field/signature, "Подпись свидетеля")
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
	add_field(/datum/report_field/text_label/header, "Если у сотрудника не-человека отсутствует рабочая виза, используйте форму NT-3213A.")
	..()
	add_field(/datum/report_field/people/list_from_manifest, "Вовлеченный персонал-не-люди")
	add_signatures()

/datum/computer_file/report/recipient/nt/incident/xeno_no_visa/
	form_name = "NT-3213A"
	title = "Доклад об инциденте с персоналом-не-людьми NanoTrasen: Отсутствие визы"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/nt/incident/xeno_no_visa/generate_fields()
	add_field(/datum/report_field/text_label/header, "Если рабочая виза сотрудника не-человека валидна, используйте NT-3213.")
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
	add_field(/datum/report_field/text_label/header, "Для несколькосторонних инцидентов, включающих в себя и корабль, и персонал.")
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
	add_field(/datum/report_field/people/from_manifest, "Имя волонтера")
	add_field(/datum/report_field/simple_text, "Планируемые процедуры")
	add_field(/datum/report_field/simple_text, "Компенсация для волонтера: (если есть)")
	add_field(/datum/report_field/people/list_from_manifest, "Ответственные исследователи")
	add_field(/datum/report_field/text_label/instruction, "Подписывая форму, \"Волонтер\" отказывается от ответственности NanoTrasen и ее сотрудников за любые травмы, ранения, утрату собственности и прочие последствия, которые могут стать результатом назначенной процедуры. В случае подписания представителем NanoTrasen, таким как Директор Исследований, форма считается проверенной. Форма считается одобренной только после соответствующей записи.")
	add_field(/datum/report_field/signature, "Подпись волонтера")
	temp_fields += add_field(/datum/report_field/signature, "Подпись представителя NanoTrasen")
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
	add_field(/datum/report_field/text_label/instruction, "Уважаемый заявитель, с сожалением сообщаем Вам, что Ваше заявление на волонтерство в качестве подопытного в корпорации NanoTrasen было отвергнуто. Мы благодарим Вас за интерес, проявленный к компании и научному прогрессу. В приложении Вы найдете оригинал Вашего заявления. С уважением,")
	add_field(/datum/report_field/signature, "Подпись представителя NanoTrasen")
	add_field(/datum/report_field/people/from_manifest, "Имя волонтера")
	add_field(/datum/report_field/text_label/header, "Причина отказа")
	add_field(/datum/report_field/options/yes_no, "Физическая непригодность")
	add_field(/datum/report_field/options/yes_no, "Психологическая непригодность")
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
	title = "Торговый контракт и квитанция NanoTrasen"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/nt/sales/generate_fields()
	..()
	add_header()
	add_field(/datum/report_field/text_label/header, "Информация о продукте")
	add_field(/datum/report_field/simple_text, "Название продукта")
	add_field(/datum/report_field/simple_text, "Тип продукта")
	add_field(/datum/report_field/number, "Стоимость одной единицы продукта (Т)")
	add_field(/datum/report_field/number, "Запрошенное количество продукта")
	add_field(/datum/report_field/number, "Общая стоимость (Т)")
	add_field(/datum/report_field/text_label/header, "Информация о продавце")
	add_field(/datum/report_field/text_label/instruction, "Покупатель не имеет права на возврат купленных единиц продукта в обмен на компенсацию в талерах, но может обменять предмет на такой же предмет, или равную стоимость в предметах (не таллрах). Продавец соглашается сделать все от него зависящее для ремонта или замены предметов, связанных с производственным браком или некорректной работой, но не урона, причиненного при использовании, с целью выполнения их предполагаемой задачи.")
	add_field(/datum/report_field/people/from_manifest, "Имя")
	add_field(/datum/report_field/signature, "Подпись")
	add_field(/datum/report_field/options/yes_no, "Одобрено")

/datum/computer_file/report/recipient/nt/payout
	form_name = "NT-3310"
	title = "Авторизация выплаты ближайшему родственнику"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/nt/payout/generate_fields()
	..()
	add_header()
	add_field(/datum/report_field/people/from_manifest, "Настоящий документ авторизует выплату оставшейся части зарплаты,")
	add_field(/datum/report_field/pencode_text, "а также стоимость личного имущества: (имущество, количество талеров),")
	add_field(/datum/report_field/pencode_text, "включая личные вещи")
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
	add_field(/datum/report_field/time, "Время")
	add_field(/datum/report_field/simple_text, "Глава департамента")
	add_field(/datum/report_field/pencode_text, "Положительные наблюдения")
	add_field(/datum/report_field/pencode_text, "Отрицательные наблюдения")
	add_field(/datum/report_field/pencode_text, "Прочие заметки")
	add_field(/datum/report_field/signature, "Подпись")
	add_field(/datum/report_field/options/yes_no, "Одобрено")
	set_access(access_edit = access_iaa)

/datum/computer_file/report/recipient/nt/audit/New()
	..()
	set_access(access_iaa, access_iaa)
