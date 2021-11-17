//Please use mob or src (not usr) in these procs. This way they can be called in the same fashion as procs.
/client/verb/wiki()
	set name = "Wiki"
	set desc = "Visit the wiki."
	set hidden = 1
	if( config.wikiurl )
		if(alert("This will open the wiki in your browser. Are you sure?",,"Yes","No")=="No")
			return
		send_link(src, config.wikiurl)
	else
		to_chat(src, "<span class='warning'>The wiki URL is not set in the server configuration.</span>")
	return

/client/verb/github()
	set name = "GitHub"
	set desc = "Visit the GitHub repository."
	set hidden = 1
	if( config.githuburl )
		if(alert("This will open GitHub in your browser. Are you sure?",,"Yes","No")=="No")
			return
		send_link(src, config.githuburl)
	else
		to_chat(src, "<span class='warning'>The github URL is not set in the server configuration.</span>")
	return

/client/verb/bugreport()
	set name = "Bug Report"
	set desc = "Visit the GitHub repository to report an issue or bug."
	set hidden = 1
	if( config.issuereporturl )
		if(alert("This will open GitHub in your browser. Are you sure?",,"Yes","No")=="No")
			return
		send_link(src, config.issuereporturl)
	else
		to_chat(src, "<span class='warning'>The issue report URL is not set in the server configuration.</span>")
	return

/client/verb/forum()
	set name = "Forum"
	set desc = "Visit the forum."
	set hidden = 1
	if( config.forumurl )
		if(alert("This will open the forum in your browser. Are you sure?",,"Yes","No")=="No")
			return
		send_link(src, config.forumurl)
	else
		to_chat(src, "<span class='warning'>The forum URL is not set in the server configuration.</span>")
	return

/client/verb/discord()
	set name = "Discord"
	set desc = "Join our Discord server."
	set hidden = 1
	log_admin("[key_name(src)] has pressed the \'DISCORD\' button!")

	if( !config.discordurl )
		to_chat(src, "<span class='warning'>The Discord URL is not set in the server configuration.</span>")
		return

	if(alert("This will invite you to our Discord server. Are you sure?", null, "Yes", "No") == "No")
		return

	send_link(src, config.discordurl)

#define RULES_FILE "config/rules.html"
/client/verb/rules()
	set name = "Rules"
	set desc = "Show Server Rules."
	set hidden = 1
	show_browser(src, file(RULES_FILE), "window=rules;size=480x320")
#undef RULES_FILE

#define LORE_FILE "config/lore.html"
/client/verb/lore_splash()
	set name = "Lore"
	set desc = "Links to the beginner Lore wiki."
	set hidden = 1
	show_browser(src, file(LORE_FILE), "window=lore;size=480x320")
#undef LORE_FILE

/client/verb/hotkeys_help()
	set name = "Hotkeys Help"
	set category = "OOC"

	var/admin = {"<font color='purple'>
Admin:
\tF5 = Админ чат
\tF6 = стать призраком/вернуться в тело
\tF7 = панель игроков
\tF8 = отправить ПМ
\tF9 = невидимость
</font>"}

	var/hotkey_mode = {"<font color='purple'>
Hotkey-Mode: (Режим хоткеев включен)
\tTAB = переключить hotkey-mode
\ta = влево
\ts = вниз
\td = вправо
\tw = вверх
\t, = передвинуться на уровень выше (работает только на английской раскладке)
\t+ = передвинуться на уровень выше (работает на любой раскладке)
\t. = передвинуться на уровень ниже (работает только на английской раскладке)
\t- = передвинуться на уровень ниже (работает на любой раскладке)
\tq = выбросить
\te = надеть
\tr = метнуть
\tt = сказать
\tm = эмоция
\tx = поменять руку
\tc = перестать тащить
\tz = активировать объект в руке (или y)
\tj = переключить режим прицеливания
\tf = переключить-взаимодействие-влево
\tg = переключить-взаимодействие-вправо
\t1 = взаимодействие "помочь"
\t2 = взаимодействие "разоружать"
\t3 = взаимодействие "схватить"
\t4 = взаимодействие "навредить"
</font>"}

	var/other = {"<font color='purple'>
Any-Mode: (Режим хоткеев отключен)
\tCtrl+a = влево
\tCtrl+s = вниз
\tCtrl+d = вправо
\tCtrl+w = вверх
\tCtrl+q = выбросить
\tCtrl+e = надеть
\tCtrl+r = метнуть
\tCtrl+x или СрКнМыши = поменять руку
\tCtrl+z = активировать объект в руке (или Ctrl+y)
\tCtrl+f = переключить режим взаимодействия-влево
\tCtrl+g = переключить режим взаимодействия-вправо
\tCtrl+1 = взаимодействие "помочь"
\tCtrl+2 = взаимодействие "разоружать"
\tCtrl+3 = взаимодействие "схватить"
\tCtrl+4 = взаимодействие "навредить"
\tF1 = АХ
\tF2 = OOC
\tF3 = сказать
\tF4 = эмоция
\tDEL = прекратить тянуть
\tINS = переключить-намерение-вправо
\tHOME = выбросить
\tPGUP или СрКнМыши = поменять руку
\tPGDN = активировать объект в руке
\tEND = метнуть
\tCtrl + Click = тянуть
\tCtrl + CLick по кнопке смены режима ходьбы - фиксация взгляда
\tShift + Click = осмотреть
\tAlt + Click = показать объекты на клетке
\tCtrl + Alt + Click = указать на что-либо
</font>"}

	var/robot_hotkey_mode = {"<font color='purple'>
Hotkey-Mode: (Режим хоткеев включен)
\tTAB = включить режим хоткеев
\ta = влево
\ts = вниз
\td = вправо
\tw = вверх
\tq = деактивировать активный модуль
\tt = сказать
\tx = задействовать активные модули
\tz = активировать удерживаемый объект (or y)
\tf = переключить-намерение-влево
\tg = переключить-намерение-вправо
\t1 = активировать модуль 1
\t2 = активировать модуль 2
\t3 = активировать модуль 3
\t4 = переключить взаимодействие
\t5 = эмоций
</font>"}

	var/robot_other = {"<font color='purple'>
Any-Mode: (Режим хоткеев отключен)
\tCtrl+a = влево
\tCtrl+s = вниз
\tCtrl+d = вправо
\tCtrl+w = вверх
\tCtrl+q = деактивировать активный модуль
\tCtrl+x = задействовать активные модули
\tCtrl+z = активировать удерживаемый объект (or Ctrl+y)
\tCtrl+f = переключить режим взаимодействия-влево
\tCtrl+g = переключить режим взаимодействия-вправо
\tCtrl+1 = активировать модуль 1
\tCtrl+2 = активировать модуль 2
\tCtrl+3 = активировать модуль 3
\tCtrl+4 = переключить режим взаимодействия (интент)
\tF1 = АХ
\tF2 = OOC
\tF3 = сказать
\tF4 = эмоция
\tDEL = тянуть
\tINS = переключить режим взаимодействия (интент)
\tPGUP = задействовать активные модули
\tPGDN = активировать удерживаемый объект
\tCtrl + Click = тянуть или болтировать шлюз
\tShift + Click = осмотреть или открыть шлюз
\tAlt + Click = показать объекты на клетке
\tCtrl + Alt + Click = наэлектризовать шлюз
</font>"}
	if(isrobot(src.mob))
		to_chat(src, robot_hotkey_mode)
		to_chat(src, robot_other)
	else
		to_chat(src, hotkey_mode)
		to_chat(src, other)
	if(holder)
		to_chat(src, admin)
