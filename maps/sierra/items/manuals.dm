/obj/item/weapon/book/manual/solgov_law
	name = "Sol Central Government Law"
	desc = "A brief overview of SolGov Law."
	icon_state = "bookSolGovLaw"
	author = "The Sol Central Government"
	title = "Sol Central Government Law"

/obj/item/weapon/book/manual/solgov_law/Initialize()
	. = ..()
	dat = {"

		<html><head>
		</head>

		<body>
		<iframe width='100%' height='97%' src="[config.wikiurl]index.php?title=Закон_ЦПСС&printable=yes&remove_links=1" frameborder="0" id="main_frame"></iframe>
		</body>

		</html>

		"}


/obj/item/weapon/book/manual/military_law
	name = "The Sol Code of Military Justice"
	desc = "A brief overview of military law."
	icon_state = "bookSolGovLaw"
	author = "The Sol Central Government"
	title = "The Sol Code of Military Justice"

/obj/item/weapon/book/manual/military_law/Initialize()
	. = ..()
	dat = {"

		<html><head>
		</head>

		<body>
		<iframe width='100%' height='97%' src="[config.wikiurl]index.php?title=Военно-Юридический_Кодекс_ПСС&printable=yes&remove_links=1" frameborder="0" id="main_frame"></iframe>
		</body>

		</html>

		"}

/obj/item/weapon/book/manual/sol_sop
	name = "Standard Operating Procedures"
	desc = "SOP aboard the NES Sierra."
	icon_state = "booksolregs"
	author = "The Sol Central Government"
	title = "Standard Operating Procedure"

/obj/item/weapon/book/manual/sol_sop/Initialize()
	. = ..()
	dat = {"

		<html><head>
		</head>

		<body>
		<iframe width='100%' height='97%' src="[config.wikiurl]index.php?title=Стандартные_Процедуры_ЦПСС&printable=yes&remove_links=1" frameborder="0" id="main_frame"></iframe>
		</body>

		</html>

		"}

/obj/item/weapon/book/manual/nt_sop
	name = "NT Standard Operating Procedures"
	desc = "SOP aboard the NSV Sierra."
	icon = 'infinity/icons/obj/library.dmi'
	icon_state = "bookNTsop"
	author = "Employee Materials"
	title = "Standard Operating Procedure"

/obj/item/weapon/book/manual/nt_sop/Initialize()
	. = ..()
	dat = {"

		<html><head>
		</head>

		<body>
		<iframe width='100%' height='97%' src="[config.wikiurl]index.php?title=Стандартные_процедуры_НТ&printable=yes&remove_links=1" frameborder="0" id="main_frame"></iframe>
		</body>

		</html>

		"}

/obj/item/weapon/book/manual/nt_tc
	name = "NT Threat Codes"
	desc = "TC aboard the NSV Sierra."
	icon = 'infinity/icons/obj/library.dmi'
	icon_state = "bookNTtc"
	author = "Ship Rule Materials"
	title = "Threat Codes"

/obj/item/weapon/book/manual/nt_tc/Initialize()
	. = ..()
	dat = {"

		<html><head>
		</head>

		<body>
		<iframe width='100%' height='97%' src="[config.wikiurl]index.php?title=Коды_угрозы_НТ&printable=yes&remove_links=1" frameborder="0" id="main_frame"></iframe>
		</body>

		</html>

		"}

/obj/item/weapon/folder/nt/rd

/obj/item/weapon/folder/envelope/blanks
	desc = "A thick envelope. The NT logo is stamped in the corner, along with 'CONFIDENTIAL'."

/obj/item/weapon/folder/envelope/blanks/Initialize()
	. = ..()
	new/obj/item/weapon/paper/sierra/blanks(src)

/obj/item/weapon/paper/sierra/blanks
	name = "RE: Regarding testing supplies"
	info = {"
	<tt><center><b><font color='red'>КОНФИДЕЦИАЛЬНО</font></b>
	<h3>ИССЛЕДОВАТЕЛЬКИЙ ДЕПАРТАМЕНТ НАНОТРЕЙЗЕН</h3>
	<img src = ntlogo.png>
	</center>
	<b>ОТ:</b> Swadian Barwuds<br>
	<b>КОМУ:</b> Исследовательскому Директору NSV Sierra<br>
	<b>А ТАКЖЕ:</b> Агенту Внутренних Дел NSV Sierra<br>
	<b>ТЕМА:</b> Дополнительные Материалы (пересмотр)<br>
	<hr>
	Я пересмотрел ваш отчет о проведенных экспериментах и запрос о более совершенных тестовых материалов, РД.<br>
	Мы склонны ожидать от вашего проекта только лучшего - особенно в свете того, что этому /"лучше/" следует наступить как можно скорее. Депарамент Аналитики подсчитал, что на данный момент, потениальная прибыль от проведенных на судне исследований недостаточна для покрытия всех расходов. <br>
	В РНД вы можете найти подсобку с подписью 'Aux Custodial Supplies'. Там находятся ваши новые тестовые материалы - 4 человека из пробирок с рядом отсутствующих высших нервными функций. Наш департамент по вопросам законодательства не обнаружил ничего нелегальнго в том, чтобы использовать их в медицинских опытов для более точных результатов.<br>
	Они помещены в специально мешки с продвинутой системой поддержания жизни - их не нужно кормить, поить или выгуливать. Если вам нужны образцы - берите их.<br>
	Сейчас не время для того, чтобы проводить долгие научные изыскания, РД. Мы ждем от вас впечатляющих результатов в ближайшем будущем.<br>
	<i>S.B.</i></tt>
	"}

/obj/item/weapon/folder/envelope/captain
	desc = "A thick envelope. The NT logo is stamped in the corner, along with 'TOP SECRET - SIERRA UMBRA'."

/obj/item/weapon/folder/envelope/captain/Initialize()
	. = ..()
	var/obj/effect/overmap/sierra = map_sectors["[z]"]
	var/memo = {"
	<tt><center><b><font color='red'>СЕКРЕТНО - КОДОВОЕ СЛОВО: СЬЕРРА</font></b>
	<h3>ЦЕНТРАЛЬНОЕ КОМАНДОВАНИЕ</h3>
	<img src = ntlogo.png>
	</center>
	<b>ОТ:</b> Swadian Barwuds<br>
	<b>КОМУ:</b> Капитану NSV Sierra<br>
	<b>ТЕМА:</b> Общий Приказ<br>
	<hr>
	Капитан,<br>
	Ваше судно в текущий вылет должно посетить следующие звёздные системы. Имейте ввиду, что ваши ресурсы ограничены; распор&#255;дитесь временем рационально.
	<li>[generate_system_name()]</li>
	<li>[generate_system_name()]</li>
	<li>[generate_system_name()]</li>
	<li>[GLOB.using_map.system_name]</li>
	<li>[generate_system_name()]</li>
	<li>[generate_system_name()]</li>
	<li>[generate_system_name()]</li>
	<li>[generate_system_name()]</li>
	<li>Locutus System</li>
	<br>
	Приоритетной целью &#255;вл&#255;ютс&#255;: артефакты, неизвестные формы жизни и сигналы неизвестного происхождени&#255;.<br>
	Ни одна из этих систем не &#255;вл&#255;етс&#255; опознанной официальными организаци&#255;ми, по этому у вас имеетс&#255; полное право на исследование и демонтаж всех заброшенных объектов по пути.<br>
	В случае обнаружени&#255; мира с богатыми минеральными залежами, форонового гиганта или просто удобного дл&#255; колонизации, составьте отчет и оставьте на планете ма&#255;чок дальней св&#255;зи.<br>
	Ни одно из государств не действует на этих территори&#255;х на официальном уровне. В случае обнаружени&#255; сигнала бедстви&#255; без наличи&#255; суден ТКК или ПСС в секторе, не игнорируйте их. Спасенный персонал представл&#255;ет исключительную дипломатическую ценность.<br>
	Текущий код стыковки: [sierra.docking_codes]<br>
	Сообщайте о всех незарегистрированных или исключительных находках при перемещении в системах.<br>

	<i>Swadian Barwuds</i></tt><br>
	<i>This paper has been stamped with the stamp of Central Command.</i>
	"}
	new/obj/item/weapon/paper/important(src, memo, "Standing Orders")

	new/obj/item/weapon/paper/sierra/umbra(src)

/obj/item/weapon/folder/envelope/rep
	desc = "A thick envelope. The NT logo is stamped in the corner, along with 'TOP SECRET - SIERRA UMBRA'."

/obj/item/weapon/folder/envelope/rep/Initialize()
	. = ..()
	new/obj/item/weapon/paper/sierra/umbra(src)

/obj/item/weapon/paper/sierra/umbra
	name = "UMBRA Protocol"
	icon = 'maps/sierra/icons/obj/uniques.dmi'
	icon_state = "paper_words"
	info = {"
	<tt><center><b><font color='red'>СОВЕРШЕННО СЕКРЕТНО - КОДОВОЕ СЛОВО: ТЕНЬ СЬЕРРЫ</font></b>
	<h3>ЦЕНТРАЛЬНОЕ КОМАНДОВАНИЕ</h3>
	<img src = ntlogo.png>
	</center>
	<b>ОТ:</b> Kim Taggert, операционный директор НТ<br>
	<b>КОМУ:</b> Капитану NSV Sierra<br>
	<b>А ТАКЖЕ:</b> Агенту Внутренних Дел NSV Sierra<br>
	<b>ТЕМА:</b> Протокол ТЕНЬ<br>
	<hr>
	<li>Это - небольшое дополнение к стандартным процедурам. В отлчии от остальных СОП, данна&#255; процедура не должна оглашатьс&#255; персоналу судна. Данный протокол необходим дл&#255; избежани&#255; непри&#255;тных казусов после миссии.</li>
	<li>Процедура может быть начата только после получени&#255; сообщени&#255; от ЦК по защищенному источнику. Отправитель может не называть себ&#255;, но у вас не должно быть проблем с подтверждением причастности участника к процедуре. Мы надеемс&#255;.</li>
	<li>Сигналом дл&#255; инициации процедуры &#255;вл&#255;етс&#255; кодова&#255; фраза 'Спокойного вечера, подготовитель' использованна&#255; без иных слов в предложении. Вам не нужно отправл&#255;ть подтверждение о начале ЦК.</li>
	<li>Информаци&#255; об экспедиционных находках, которые представл&#255;ют угрозу НаноТрейзен как организации, должна быть отправлена на ЦК под кодовым именем ТЕНЬ. Только капитан и АВД могут иметь полный доступ к полуенной информации. Главы могут обладать необходимым для работы минимумов, если информация их касается.</li>

	<li>Конфидециальность данной информации имеет наивысший приоритет. Каждое недоверенное лицо, которому станет известно о полученных данных, не должно покидать судно до и после прибыти&#255; в указанную точку вне конвоировани&#255; сотрудниками департамента Защиты Активов.</li>
	<li>Все устройства способные передавать информацию на межзвездном радиусе должны быть конфискованы из частного пользовани&#255;.</li>
	<li>Вне зависимости от оставшихс&#255; систем в вашем основном приказе, вы должны как можно скорее добратьс&#255; до Сектора Никс, Административной Станции НаноТрейзен 'Crescent'. С вами св&#255;жутс&#255; по прибытию. Не совершайте остановок по пути без критической необходимости.

	<br>
	Не смотр&#255; на всю жесткость процедуры, Я увер&#255;ю вас, что это - обычна&#255; предосторожность дл&#255; обеспечени&#255; личной безопасности персонала и корпоративных активов. Продолжайте миссию до в обычном пор&#255;дке.
	<i>Всего наилучшего, Kim.</i></tt><br>
	<i>This paper has been stamped with the stamp of Central Command.</i>
	"}