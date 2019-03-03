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
\tF5 = Aghost (admin-ghost)
\tF6 = player-panel-new
\tF7 = admin-pm
\tF8 = Invisimin
</font>"}

	var/hotkey_mode = {"<font color='purple'>
Hotkey-Mode: (Режим "горячих клавиш"(Hotkeys) включен)
\tTAB = переключить hotkey-mode
\ta = влево
\ts = вниз
\td = вправо
\tw = вверх
\t, = передвинуться на уровень выше
\t. = передвинуться на уровень ниже
\tq = бросить
\te = надеть
\tr = кинуть
\tt = сказать
\t5 = эмоций
\tx = поменять руку
\tz = активировать удерживаемый объект (or y)
\tj = переключить режим прицеливания
\tf = переключить-намерение-влево
\tg = переключить-намерение-вправо
\t1 = намеренье помочь
\t2 = намеренье разоружать
\t3 = намеренье схватить
\t4 = намеренье навредить
</font>"}

	var/other = {"<font color='purple'>
Any-Mode: (Режим "горячих клавиш"(Hotkeys) не включен)
\tCtrl+a = влево
\tCtrl+s = вниз
\tCtrl+d = вправо
\tCtrl+w = вверх
\tCtrl+q = бросить
\tCtrl+e = надеть
\tCtrl+r = кинуть
\tCtrl+x or Middle Mouse(нажать на колёсико мыши) = поменять руку
\tCtrl+z = активировать удерживаемый объект (or Ctrl+y)
\tCtrl+f = переключить-намерение-влево
\tCtrl+g = переключить-намерение-вправо
\tCtrl+1 = намеренье помочь
\tCtrl+2 = намеренье разоружать
\tCtrl+3 = намеренье схватить
\tCtrl+4 = намеренье навредить
\tF1 = АХ
\tF2 = ooc
\tF3 = сказать
\tF4 = эмоций
\tDEL = тянуть(pull)
\tINS = переключить-намерение-вправо
\tHOME = бросить
\tPGUP or Middle Mouse(нажать на колёсико мыши) = поменять руку
\tPGDN = активировать удерживаемый объект
\tEND = кинуть
\tCtrl + Click = тянуть(drag)
\tShift + Click = осмотреть
\tAlt + Click = показать объекты на клетке
\tCtrl + Alt + Click = указать на что-либо
</font>"}

	var/robot_hotkey_mode = {"<font color='purple'>
Hotkey-Mode: (Режим "горячих клавиш"(Hotkeys) включен)
\tTAB = toggle hotkey-mode
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
\t4 = переключить намеренье
\t5 = эмоций
</font>"}

	var/robot_other = {"<font color='purple'>
Any-Mode: (Режим "горячих клавиш"(Hotkeys) не включен)
\tCtrl+a = влево
\tCtrl+s = вниз
\tCtrl+d = вправо
\tCtrl+w = вверх
\tCtrl+q = деактивировать активный модуль
\tCtrl+x = задействовать активные модули
\tCtrl+z = активировать удерживаемый объект (or Ctrl+y)
\tCtrl+f = переключить-намерение-влево
\tCtrl+g = переключить-намерение-вправо
\tCtrl+1 = активировать модуль 1
\tCtrl+2 = активировать модуль 2
\tCtrl+3 = активировать модуль 3
\tCtrl+4 = переключить намеринье("интенс")
\tF1 = АХ
\tF2 = ooc
\tF3 = сказать
\tF4 = эмоций
\tDEL = тянуть(pull)
\tINS = переключить намеринье("интенс")
\tPGUP = задействовать активные модули
\tPGDN = активировать удерживаемый объект
\tCtrl + Click = тащить(drag) или болтировать двери
\tShift + Click = осмотреть или открыть дверь
\tAlt + Click = показать объекты на клетке
\tCtrl + Alt + Click = Электролизация двери
</font>"}
	var/alarm = {"<font color='red'>
Внимание! Перед использованием горячих клавиш в первый раз надо переключить раскладку на английский, так как если начать использовать клавиши на русской раскладке, то клавиши не будут работать и после первого нажатия переключение раскладки не поможет, только перезабуск DreamMaker(закрыть и открыть окно игры через лаунчер). После первого нажатия горячих клавишь раскладку можно переключить на русскую.
</font>"}
	if(isrobot(src.mob))
		to_chat(src, robot_hotkey_mode)
		to_chat(src, robot_other)
		to_chat(src, alarm)
	else
		to_chat(src, hotkey_mode)
		to_chat(src, other)
		to_chat(src, alarm)
	if(holder)
		to_chat(src, admin)
