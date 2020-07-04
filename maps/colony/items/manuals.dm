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
	desc = "SOP aboard the NES Colony."
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
	desc = "SOP aboard the NSV Colony."
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
	desc = "TC aboard the NSV Colony."
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
	new/obj/item/weapon/paper/blanks(src)

/obj/item/weapon/paper/blanks
	name = "RE: Regarding testing supplies"
	info = {"
	<tt><center><b><font color='red'>CONFIDENTIAL: UPPER MANAGEMENT ONLY</font></b>
	<h3>NANOTRASEN RESEARCH DIVISION</h3>
	<img src = ntlogo.png>
	</center>
	<b>FROM:</b> Hieronimus Blackstone, Overseer of colony Cooperation Project<br>
	<b>TO:</b> Research Director of NES Colony branch<br>
	<b>CC:</b> Liason with SCG services aboard NES Colony<br>
	<b>SUBJECT:</b> RE: Testing Materials<br>
	<hr>
	We have reviewed your request, and would like to make an addition to the list of needed materials.<br>
	As we hold very high hopes for this branch, it would be only right to provide our scientists with the most accurate testing environment. And by that we mean the living human subjects. Our Ethics Review Board suggested a workaround for that pesky 'consent' requierment.<br>
	In the Research Wing you should find a small section labeled 'Aux Custodial Supplies'. Inside we have provided several mind-blank vatgrown clones. Our Law Special Response Team so far had not found SCG legislation that explicitly forbids their use in research.<br>
	They come in self-contained life support bags, with additional measures to make them easier to use for, let's say, more sensitive personnel. As our preliminary study showed, 75% more subjects were more willing to harm a (consenting) intern if their face was fully hidden.<br>
	We are expecting great results from this program. Do not disappoint us.<br>
	<i>H.B.</i></tt>
	"}

/obj/item/weapon/paper/liason_note
	name = "note"
	info = {"
	<i>Eat pill. No surrender.<br>
	H.B.</i>
	"}

/obj/item/weapon/folder/envelope/captain
	desc = "A thick envelope. The NT logo is stamped in the corner, along with 'TOP SECRET - COLONY UMBRA'."

/obj/item/weapon/folder/envelope/captain/Initialize()
	. = ..()
	var/obj/effect/overmap/colony = map_sectors["[z]"]
	var/memo = {"
	<tt><center><b><font color='red'>СЕКРЕТНО - КОДОВОЕ СЛОВО: СЬЕРРА</font></b>
	<h3>ЦЕНТРАЛЬНОЕ КОМАНДОВАНИЕ</h3>
	<img src = ntlogo.png>
	</center>
	<b>ОТ:</b> Swadian Barwuds<br>
	<b>КОМУ:</b> Капитану NSV Colony<br>
	<b>ТЕМА:</b> Общий приказ<br>
	<hr>
	Капитан,<br>
	Ваше судно в текущий вылет должно посетить следующие звёздные системы. Имейте ввиду, что ваши ресурсы ограничены; распорядитесь временем рационально.
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
	Приоритетной целью являются: артефакты, неизвестные формы жизни и сигналы неизвестного происхождения.<br>
	Ни одна из этих систем не является опознанной официальными организациями, по этому у вас имеется полное право на исследование и демонтаж всех заброшенных объектов по пути.<br>
	В случае обнаружения мира с богатыми минеральными залежами, форонового гиганта или просто удобного для колонизации, составьте отчет и оставьте на планете маячок дальней связи.<br>
	Ни одно из государств не действует на этих территориях на официальном уровне. В случае обнаружения сигнала бедствия без наличия суден ТКК или ПСС в секторе, не игнорируйте их. Спасенный персонал представляет исключительную дипломатическую ценность.<br>
	Текущий код стыковки: [colony.docking_codes]<br>
	Сообщайте о всех незарегистрированных или исключительных находках при перемещении в системах.<br>

	<i>Swadian Barwuds</i></tt><br>
	<i>This paper has been stamped with the stamp of Central Command.</i>
	"}
	new/obj/item/weapon/paper/important(src, memo, "Standing Orders")

	new/obj/item/weapon/paper/umbra(src)

/obj/item/weapon/folder/envelope/rep
	desc = "A thick envelope. The NT logo is stamped in the corner, along with 'TOP SECRET - COLONY UMBRA'."

/obj/item/weapon/folder/envelope/rep/Initialize()
	. = ..()
	new/obj/item/weapon/paper/umbra(src)

/obj/item/weapon/paper/umbra
	name = "UMBRA Protocol"
	icon = 'maps/colony/icons/obj/uniques.dmi'
	icon_state = "paper_words"
	info = {"
	<tt><center><b><font color='red'>СОВЕРШЕННО СЕКРЕТНО - КОДОВОЕ СЛОВО: ТЕНЬ СЬЕРРЫ</font></b>
	<h3>ЦЕНТРАЛЬНОЕ КОМАНДОВАНИЕ</h3>
	<img src = ntlogo.png>
	</center>
	<b>ОТ:</b> Kim Taggert, операционный директор НТ<br>
	<b>КОМУ:</b> Капитану NSV Colony<br>
	<b>А ТАКЖЕ:</b> Агенту Внутренних Дел NSV Colony<br>
	<b>ТЕМА:</b> Протокол ТЕНЬ<br>
	<hr>
	<li>Это - небольшое дополнение к стандартным процедурам. В отлчии от остальных СОП, данная процедура не должна оглашаться персоналу судна. Данный протокол необходим для избежания неприятных казусов после миссии.</li>
	<li>Процедура может быть начата только после получения сообщения от ЦК по защищенному источнику. Отправитель может не называть себя, но у вас не должно быть проблем с подтверждением причастности участника к процедуре. Мы надеемся.</li>
	<li>Сигналом для инициации процедуры является кодовая фраза 'Спокойного вечера, подготовитель' использованная без иных слов в предложении. Вам не нужно отправлять подтверждение о начале ЦК.</li>
	<li>Информация об экспедиционных находках, которые представляют угрозу НаноТрейзен как организации, должна быть отправлена на ЦК под кодовым именем ТЕНЬ. Только капитан и АВД могут иметь полный доступ к полуенной информации. Главы могут обладать необходимым для работы минимумов, если информация их касается.</li>

	<li>Конфидециальность данной информации имеет наивысший приоритет. Каждое недоверенное лицо, которому станет известно о полученных данных, не должно покидать судно до и после прибытия в указанную точку вне конвоирования сотрудниками департамента Защиты Активов.</li>
	<li>Все устройства способные передавать информацию на межзвездном радиусе должны быть конфискованы из частного пользования.</li>
	<li>Вне зависимости от оставшихся систем в вашем основном приказе, вы должны как можно скорее добраться до Сектора Никс, Административной Станции НаноТрейзен 'Crescent'. С вами свяжутся по прибытию. Не совершайте остановок по пути без критической необходимости.

	<br>
	Не смотря на всю жесткость процедуры, Я уверяю вас, что это - обычная предосторожность для обеспечения личной безопасности персонала и корпоративных активов. Продолжайте миссию до в обычном порядке.
	<i>Всего наилучшего, Kim.</i></tt><br>
	<i>This paper has been stamped with the stamp of Central Command.</i>
	"}
