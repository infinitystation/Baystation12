//Report datums for use with the report editor and other programs.

/datum/computer_file/report/recipient/crew_transfer
	form_name = "CTA-NTF-01"
	title = "Заявление на перевод"
	logo = "\[logo\]"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/crew_transfer/generate_fields()
	..()
	var/list/hop_fields = list()
	add_field(/datum/report_field/instruction, "ИСН Сьерра - Офис Главы Персонала")
	add_field(/datum/report_field/people/from_manifest, "Имя (ГП)")
	add_field(/datum/report_field/people/from_manifest, "Имя (заявитель)", required = 1)
	add_field(/datum/report_field/date, "Дата заполнения")
	add_field(/datum/report_field/time, "Время заполнения")
	add_field(/datum/report_field/simple_text, "Текущая должность")
	add_field(/datum/report_field/simple_text, "Запрашиваемая должность")
	add_field(/datum/report_field/pencode_text, "Причина перевода")
	add_field(/datum/report_field/instruction, "Докупент является недействительным в случае некорректного заполнения следующих полей.")
	add_field(/datum/report_field/signature, "Подпись заявителя")
	hop_fields += add_field(/datum/report_field/signature, "Подпись Главы Персонала")
	hop_fields += add_field(/datum/report_field/number, "Количество персонала на текущей должности")
	hop_fields += add_field(/datum/report_field/number, "Количество персонала на запрашиваемой должности")
	hop_fields += add_field(/datum/report_field/options/yes_no, "Одобрено")
	for(var/datum/report_field/field in hop_fields)
		field.set_access(access_edit = access_hop)

/datum/computer_file/report/recipient/access_modification
	form_name = "AMA-NTF-02"
	title = "Заявление на изменение доступа"
	logo = "\[logo\]"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/access_modification/generate_fields()
	..()
	var/list/hop_fields = list()
	add_field(/datum/report_field/instruction, "ИСН Сьерра - Офис Главы Персонала")
	add_field(/datum/report_field/people/from_manifest, "Имя (ГП)")
	add_field(/datum/report_field/people/from_manifest, "Имя (заявитель)", required = 1)
	add_field(/datum/report_field/date, "Дата заполнения")
	add_field(/datum/report_field/time, "Время заполнения")
	add_field(/datum/report_field/simple_text, "Текущая должность")
	add_field(/datum/report_field/simple_text, "Запрашиваемый доступ")
	add_field(/datum/report_field/pencode_text, "Причина расширения доступа")
	add_field(/datum/report_field/simple_text, "Срок расширения доступа")
	add_field(/datum/report_field/instruction, "Докупент признается недействительным в случае некорректного заполнения следующих полей.")
	add_field(/datum/report_field/signature, "Подпись заявителя")
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
	add_field(/datum/report_field/instruction, "ИСН Сьерра - Офис Главы Персонала")
	add_field(/datum/report_field/people/from_manifest, "Имя (ГП)")
	add_field(/datum/report_field/people/from_manifest, "Имя (субъект)", required = 1)
	add_field(/datum/report_field/date, "Дата заполнения")
	add_field(/datum/report_field/time, "Время заполнения")
	add_field(/datum/report_field/instruction, "Я, нижеподписавшийся, настоящим соглашаюсь на прохождение Полной Лоботомии с целью киборгинизации или ассимиляции с ИИ. Я осведомлен обо всех рисках такого действия. Я также понимаю, что эта операция может быть необратимой, а мой трудовой контракт с NanoTrasen будет аннулирован.")
	add_field(/datum/report_field/signature, "Подпись субъекта")
	hop_fields += add_field(/datum/report_field/signature, "Подпись Главы Персонала")
	hop_fields += add_field(/datum/report_field/options/yes_no, "Одобрено")
	for(var/datum/report_field/field in hop_fields)
		field.set_access(access_edit = access_hop)

/datum/computer_file/report/recipient/sec
	logo = "\[logo\]"

/datum/computer_file/report/recipient/sec/New()
	..()
	set_access(access_security)
	set_access(access_heads, override = 0)

/datum/computer_file/report/recipient/sec/investigation
	form_name = "NT-SEC-43"
	title = "Доклад о расследовании"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/sec/investigation/generate_fields()
	..()
	add_field(/datum/report_field/instruction, "Департамент охраны ИСН Сьерра")
	add_field(/datum/report_field/instruction, "Только для внутреннего использования.")
	add_field(/datum/report_field/people/from_manifest, "Имя")
	add_field(/datum/report_field/date, "Дата")
	add_field(/datum/report_field/time, "Время")
	add_field(/datum/report_field/simple_text, "Название дела")
	add_field(/datum/report_field/pencode_text, "Заключение")
	add_field(/datum/report_field/pencode_text, "Наблюдения")
	add_field(/datum/report_field/signature, "Подпись")
	set_access(access_edit = access_security)

/datum/computer_file/report/recipient/sec/incident
	form_name = "NT-SEC-12"
	title = "Доклад об инциденте"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/sec/incident/generate_fields()
	..()
	add_field(/datum/report_field/instruction, "Департамент охраны ИСН Сьерра")
	add_field(/datum/report_field/instruction, "Заполняется офицером при исполнении, реагировавшим на инцидент. Должно быть заполнено и зарегистрировано до конца смены!")
	add_field(/datum/report_field/people/from_manifest, "Докладывающий офицер")
	add_field(/datum/report_field/simple_text, "Тип инциденте/Преступления")
	add_field(/datum/report_field/date, "Дата")
	add_field(/datum/report_field/time, "Время инцидента")
	add_field(/datum/report_field/people/list_from_manifest, "Офицер(ы), проводящие арест")
	add_field(/datum/report_field/simple_text, "Location")
	add_field(/datum/report_field/pencode_text, "Персонал вовлеченный в инцидент", "\[small\]\[i\](Ж-Жертва, Под-Подозреваемый, С-Свидетель, ПБВ-Пропавший без вести, А-Арестованный, Д-Докладывающий, Пог-Погибший)\[/i\]\[/small\]")
	add_field(/datum/report_field/pencode_text, "Описание предметов/собственности", "\[small\]\[i\](Пов-Повреждено, Д-Докатательство, Пот-Потеряно, Н-Найдено, У-Украдено)\[/i\]\[/small\]")
	add_field(/datum/report_field/pencode_text, "Изложение фактов")
	add_field(/datum/report_field/signature, "Подпись докладывающего офицера")
	set_access(access_edit = access_security)

/datum/computer_file/report/recipient/sec/evidence
	form_name = "NT-SEC-02b"
	title = "Форма Доказательств и Собственности"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/sec/evidence/generate_fields()
	..()
	var/datum/report_field/temp_field
	add_field(/datum/report_field/instruction, "Департамент охраны ИСН Сьерра")
	add_field(/datum/report_field/date, "Дата")
	add_field(/datum/report_field/time, "Время")
	add_field(/datum/report_field/people/from_manifest, "Конфисковано у")
	add_field(/datum/report_field/pencode_text, "Список предметов, взятых на хранение")
	set_access(access_edit = access_security)
	temp_field = add_field(/datum/report_field/signature, "Подпись сержанта/надзирателя")
	temp_field.set_access(access_edit = list(access_security, access_armory))
	temp_field = add_field(/datum/report_field/signature, "Подпись детектива")
	temp_field.set_access(access_edit = list(access_security, access_forensics_lockers))

//Supply and Exploration; these are not shown in deck manager.

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
	add_field(/datum/report_field/instruction, "Департамент снабжения и мененджемента ангара ИСН Сьерра")
	add_field(/datum/report_field/instruction, "Общая информация")
	add_field(/datum/report_field/date, "Дата")
	add_field(/datum/report_field/simple_text, "Название судна")
	add_field(/datum/report_field/simple_text, "Пилот/владелец судна")
	add_field(/datum/report_field/simple_text, "Род деятельности судна")
	add_field(/datum/report_field/people/from_manifest, "Стыковка авторизована")
	add_field(/datum/report_field/instruction, "Общая информация о грузе")
	add_field(/datum/report_field/pencode_text, "Список типов груза на борту")
	add_field(/datum/report_field/instruction, "Информация об опасном грузе")
	add_field(/datum/report_field/options/yes_no, "Оружие")
	add_field(/datum/report_field/options/yes_no, "Живой груз")
	add_field(/datum/report_field/options/yes_no, "Биологически опасные материалы")
	add_field(/datum/report_field/options/yes_no, "Химическая или радиоактивная опасность")
	add_field(/datum/report_field/signature, "Авторизация входа на судно")
	add_field(/datum/report_field/instruction, "Отстыковка и отправление")
	add_field(/datum/report_field/time, "Время отстыковки")
	add_field(/datum/report_field/pencode_text, "Дополнительные комментарии по отстыковке")

/datum/computer_file/report/recipient/fauna
	logo = "\[logo\]"
	form_name = "NT-EXP-19f"
	title = "Доклад об инопланетной фауне"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/docked/New()
	..()
	set_access(access_edit = access_hangar)
	set_access(access_edit = access_research, override = 0)

/datum/computer_file/report/recipient/fauna/generate_fields()
	..()
	add_field(/datum/report_field/instruction, "Экспедиционный департамент ИСН Сьерра")
	add_field(/datum/report_field/instruction, "Следующая форма должна быть заполнена членами экспедиционной команды после открытия и изучения новой формы инопланетной жизни.")
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
	add_field(/datum/report_field/instruction, "По заполнению и одобрению данной формы, Директор Исследований должен отправить ее по факсу и Агенту Внутренних Дел, и Капитану, а также сохранить копию в своем офисе наравне с другими докладами об экспедициях.")

//NT reports, mostly for liason but can be used by any NT personnel.

/datum/computer_file/report/recipient/nt
	logo = "\[logo\]"

/datum/computer_file/report/recipient/nt/proc/add_header()
	add_field(/datum/report_field/simple_text, "Судно", "ИСН Сьерра")
	add_field(/datum/report_field/date, "Дата")
	add_field(/datum/report_field/time, "Время")
	add_field(/datum/report_field/simple_text, "Номер")

/datum/computer_file/report/recipient/nt/anomaly
	form_name = "NT-1546"
	title = "Отчет об объекте аномалистики"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/nt/anomaly/New()
	..()
	set_access(access_research, access_research)

/datum/computer_file/report/recipient/nt/anomaly/generate_fields()
	..()
	add_header()
	add_field(/datum/report_field/simple_text, "Кодовое название объекта")
	add_field(/datum/report_field/people/from_manifest, "Отчитывающийся ученый")
	add_field(/datum/report_field/people/from_manifest, "Проверяющий Директор Исследований")
	add_field(/datum/report_field/pencode_text, "Процедуры содержания")
	add_field(/datum/report_field/pencode_text, "Общее описание")
	add_field(/datum/report_field/simple_text, "Примерный возраст объекта")
	add_field(/datum/report_field/simple_text, "Уровень опасности объекта")

/datum/computer_file/report/recipient/nt/fire
	form_name = "NT-0102"
	title = "Форма прекращения трудового контракта NT"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/nt/fire/New()
	..()
	set_access(access_heads, access_heads)
	set_access(access_nanotrasen, override = 0)

/datum/computer_file/report/recipient/nt/fire/generate_fields()
	..()
	add_header()
	add_field(/datum/report_field/instruction, "Запись о разрыве трудового контакта")
	add_field(/datum/report_field/people/from_manifest, "Имя")
	add_field(/datum/report_field/number, "Возраст")
	add_field(/datum/report_field/simple_text, "Должность")
	add_field(/datum/report_field/pencode_text, "Причина увольнения")
	add_field(/datum/report_field/signature, "Авторизовано")
	add_field(/datum/report_field/instruction, "Пожалуйста, прикрепите личное дело сотрудника к этой записи о разрыве трудового контракта.")

/datum/computer_file/report/recipient/nt/incident/New()
	..()
	set_access(access_edit = access_command)

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
	add_field(/datum/report_field/instruction, "Если у сотрудника не-человека отсутствует рабочая виза, используйте форму NT-3213A.")
	..()
	add_field(/datum/report_field/people/list_from_manifest, "Вовлеченный персонал-не-люди")
	add_signatures()

/datum/computer_file/report/recipient/nt/incident/xeno_no_visa/
	form_name = "NT-3213A"
	title = "Доклад об инциденте с персоналом-не-людьми NanoTrasen: Отсутствие визы"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/nt/incident/xeno_no_visa/generate_fields()
	add_field(/datum/report_field/instruction, "Если рабочая виза сотрудника не-человека валидна, используйте NT-3213.")
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
	add_field(/datum/report_field/instruction, "Для несколькосторонних инцидентов, включающих в себя и корабль, и экипаж/сотрудников.")
	..()
	add_field(/datum/report_field/people/list_from_manifest, "Вовлеченные члены экипажа")
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
	add_field(/datum/report_field/instruction, "Подписывая форму, \"Волонтер\" отказывается от ответственности NanoTrasen и ее сотрудников за любые травмы, ранения, утрату собственности и прочие последствия, которые могут стать результатом назначенной процедуры. В случае подписания представителем NanoTrasen, таким как Директор Исследований, форма считается проверенной. Форма считается одобренной только после соответствующей записи.")
	add_field(/datum/report_field/signature, "Подпись волонтера")
	temp_fields += add_field(/datum/report_field/signature, "Подпись представителя NanoTrasen")
	temp_fields += add_field(/datum/report_field/options/yes_no, "Одобрено")
	for(var/datum/report_field/temp_field in temp_fields)
		temp_field.set_access(access_edit = access_nanotrasen)

/datum/computer_file/report/recipient/nt/deny
	form_name = "NT-1443D"
	title = "Rejection of Test Subject Volunteer Notice"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/nt/deny/generate_fields()
	..()
	add_header()
	add_field(/datum/report_field/instruction, "Уважаемый заявитель, с сожалением сообщаем Вам, что Ваше заявление на волонтерство в качестве подопытного в корпорации NanoTrasen было отвергнуто. Мы благодарим Вас за интерес, проявленный к компании и научному прогрессу. В приложении Вы найдете оригинал Вашего заявления. С уважением,")
	add_field(/datum/report_field/signature, "Подпись представителя NanoTrasen")
	add_field(/datum/report_field/people/from_manifest, "Имя волонтера")
	add_field(/datum/report_field/instruction, "Причина отказа")
	add_field(/datum/report_field/options/yes_no, "Физическая непригодность")
	add_field(/datum/report_field/options/yes_no, "Психологическая непригодность")
	add_field(/datum/report_field/options/yes_no, "Отмена проекта")
	add_field(/datum/report_field/simple_text, "Другое")
	add_field(/datum/report_field/options/yes_no, "Отчет одобрен")
	set_access(access_edit = access_nanotrasen)

/datum/computer_file/report/recipient/nt/memo/generate_fields()
	..()
	add_header()
	add_field(/datum/report_field/simple_text, "Тема")
	add_field(/datum/report_field/pencode_text, "Текст")
	add_field(/datum/report_field/signature, "Авторизовано")
	add_field(/datum/report_field/options/yes_no, "Одобрено")

/datum/computer_file/report/recipient/nt/memo/internal
	form_name = "NT-0003"
	title = "Внутренняя записка"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/nt/memo/internal/New()
	..()
	set_access(access_nanotrasen, access_nanotrasen)

/datum/computer_file/report/recipient/nt/memo/external
	form_name = "NT-0005"
	title = "Внешняя записка"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/nt/memo/external/New()
	..()
	set_access(access_edit = access_nanotrasen)

//No access restrictions for easier use.
/datum/computer_file/report/recipient/nt/sales
	form_name = "NT-2192"
	title = "Торговый контракт и квитанция NanoTrasen"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/nt/sales/generate_fields()
	..()
	add_header()
	add_field(/datum/report_field/instruction, "Информация о продукте")
	add_field(/datum/report_field/simple_text, "Название продукта")
	add_field(/datum/report_field/simple_text, "Тип продукта")
	add_field(/datum/report_field/number, "Стоимость одной единицы продукта (Т)")
	add_field(/datum/report_field/number, "Запрошенное количество продукта")
	add_field(/datum/report_field/number, "Общая стоимость (Т)")
	add_field(/datum/report_field/instruction, "Информация о продавце")
	add_field(/datum/report_field/instruction, "Покупатель не имеет права на возврат купленных единиц продукта в обмен на компенсацию в талерах, но может обменять предмет на такой же предмет, или равную стоимость в предметах (не таллрах). Продавец соглашается сделать все от него зависящее для ремонта или замены предметов, связанных с производственным браком или некорректной работой, но не урона, причиненного при использовании, с целью выполнения их предполагаемой задачи.")
	add_field(/datum/report_field/people/from_manifest, "Имя")
	add_field(/datum/report_field/signature, "Подпись")
	add_field(/datum/report_field/options/yes_no, "Одобрено")

/datum/computer_file/report/recipient/nt/visa
	form_name = "NT-0952"
	title = "Форма запроса визы Центрального Правительства Солнечной Системы NanoTrasen"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/nt/visa/generate_fields()
	..()
	add_header()
	var/datum/report_field/temp_field
	add_field(/datum/report_field/people/from_manifest, "Получатель визы")
	add_field(/datum/report_field/pencode_text, "Причина запроса")
	add_field(/datum/report_field/signature, "Подпись получателя визы")
	temp_field = add_field(/datum/report_field/signature, "Подпись составителя")
	temp_field.set_access(access_edit = access_nanotrasen)
	temp_field = add_field(/datum/report_field/options/yes_no, "Одобрено составителем")
	temp_field.set_access(access_edit = access_nanotrasen)
	temp_field = add_field(/datum/report_field/signature, "Подпись органа власти, подтверждающая получение")
	temp_field.set_access(access_edit = access_iaa)

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
	add_field(/datum/report_field/instruction, "Отправить и доставить ближайшему родственнику сотрудника без задержек.")
	add_field(/datum/report_field/signature, "Подпись")
	add_field(/datum/report_field/options/yes_no, "Одобрено")
	set_access(access_edit = access_nanotrasen)

//Solgov reports, mostly for the NR
/datum/computer_file/report/recipient/sol
	logo = "\[logo\]"
	form_name = "NT-REP-00"

/datum/computer_file/report/recipient/sol/audit
	form_name = "NT-REP-12"
	title = "Аудит департамента ИСН Сьерра"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/sol/audit/generate_fields()
	add_field(/datum/report_field/date, "Дата")
	add_field(/datum/report_field/time, "Время")
	add_field(/datum/report_field/simple_text, "Глава департамента")
	add_field(/datum/report_field/pencode_text, "Положительные наблюдения")
	add_field(/datum/report_field/pencode_text, "Отрицательные наблюдения")
	add_field(/datum/report_field/pencode_text, "Прочие заметки")
	add_field(/datum/report_field/signature, "Подпись")
	add_field(/datum/report_field/options/yes_no, "Одобрено")
	set_access(access_edit = access_iaa)

/datum/computer_file/report/recipient/sol/audit
	form_name = "NT-REP-4"
	title = "Отчет об инциденте"
	available_on_ntnet = 1
