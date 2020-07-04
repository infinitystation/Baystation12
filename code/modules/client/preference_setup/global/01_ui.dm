/datum/preferences
	var/clientfps = 0
	var/ooccolor = "#010000" //Whatever this is set to acts as 'reset' color and is thus unusable as an actual custom color

	var/UI_style = "Midnight"
	var/UI_style_color = "#ffffff"
	var/UI_style_alpha = 255

/datum/category_item/player_setup_item/player_global/ui
	name = "UI"
	sort_order = 1

/datum/category_item/player_setup_item/player_global/ui/load_preferences(var/savefile/S)
	S["UI_style"]		>> pref.UI_style
	S["UI_style_color"]	>> pref.UI_style_color
	S["UI_style_alpha"]	>> pref.UI_style_alpha
	S["ooccolor"]		>> pref.ooccolor
	S["clientfps"]		>> pref.clientfps

/datum/category_item/player_setup_item/player_global/ui/save_preferences(var/savefile/S)
	S["UI_style"]		<< pref.UI_style
	S["UI_style_color"]	<< pref.UI_style_color
	S["UI_style_alpha"]	<< pref.UI_style_alpha
	S["ooccolor"]		<< pref.ooccolor
	S["clientfps"]		<< pref.clientfps

/datum/category_item/player_setup_item/player_global/ui/sanitize_preferences()
	pref.UI_style		= sanitize_inlist(pref.UI_style, all_ui_styles, initial(pref.UI_style))
	pref.UI_style_color	= sanitize_hexcolor(pref.UI_style_color, initial(pref.UI_style_color))
	pref.UI_style_alpha	= sanitize_integer(pref.UI_style_alpha, 0, 255, initial(pref.UI_style_alpha))
	pref.ooccolor		= sanitize_hexcolor(pref.ooccolor, initial(pref.ooccolor))
	pref.clientfps	    = sanitize_integer(pref.clientfps, CLIENT_MIN_FPS, CLIENT_MAX_FPS, initial(pref.clientfps))

/datum/category_item/player_setup_item/player_global/ui/content(var/mob/user)
	. += "<b>Настройки интерфейса</b><br>"
	. += "<b>Стиль:</b> <a href='?src=\ref[src];select_style=1'><b>[pref.UI_style]</b></a><br>"
	. += "<b>Настройка стиля</b> (рекомендуется использовать с White UI):<br>"
	. += "-Цвет: <a href='?src=\ref[src];select_color=1'><b>[pref.UI_style_color]</b></a> <table style='display:inline;' bgcolor='[pref.UI_style_color]'><tr><td>__</td></tr></table> <a href='?src=\ref[src];reset=ui'>сброс</a><br>"
	. += "-Прозрачность: <a href='?src=\ref[src];select_alpha=1'><b>[pref.UI_style_alpha]</b></a> <a href='?src=\ref[src];reset=alpha'>сброс</a><br>"
	if(can_select_ooc_color(user))
		. += "<b>Цвет в OOC:</b> "
		if(pref.ooccolor == initial(pref.ooccolor))
			. += "<a href='?src=\ref[src];select_ooc_color=1'><b>Стандартный</b></a><br>"
		else
			. += "<a href='?src=\ref[src];select_ooc_color=1'><b>[pref.ooccolor]</b></a> <table style='display:inline;' bgcolor='[pref.ooccolor]'><tr><td>__</td></tr></table> <a href='?src=\ref[src];reset=ooc'>сброс</a><br>"
	. += "<b>ФПС:</b> <a href='?src=\ref[src];select_fps=1'><b>[pref.clientfps]</b></a><br>"

/datum/category_item/player_setup_item/player_global/ui/OnTopic(var/href,var/list/href_list, var/mob/user)
	if(href_list["select_style"])
		var/UI_style_new = input(user, "Выберите стиль инетрфейса.", CHARACTER_PREFERENCE_INPUT_TITLE, pref.UI_style) as null|anything in all_ui_styles
		if(!UI_style_new || !CanUseTopic(user)) return TOPIC_NOACTION
		pref.UI_style = UI_style_new
		return TOPIC_REFRESH

	else if(href_list["select_color"])
		var/UI_style_color_new = input(user, "Выберите цвет стиля интерфейса (тёмные цвета не рекомендуются!)", "Глобальные Предпочтения", pref.UI_style_color) as color|null
		if(isnull(UI_style_color_new) || !CanUseTopic(user)) return TOPIC_NOACTION
		pref.UI_style_color = UI_style_color_new
		return TOPIC_REFRESH

	else if(href_list["select_alpha"])
		var/UI_style_alpha_new = input(user, "Выберите уровень прозрачности интерфейса (между 50 и 255).", "Глобальные Предпочтения", pref.UI_style_alpha) as num|null
		if(isnull(UI_style_alpha_new) || (UI_style_alpha_new < 50 || UI_style_alpha_new > 255) || !CanUseTopic(user)) return TOPIC_NOACTION
		pref.UI_style_alpha = UI_style_alpha_new
		return TOPIC_REFRESH

	else if(href_list["select_ooc_color"])
		var/new_ooccolor = input(user, "Выберите цвет Вашего текста в OOC:", "Глобальные Предпочтения") as color|null
		if(new_ooccolor && can_select_ooc_color(user) && CanUseTopic(user))
			pref.ooccolor = new_ooccolor
			return TOPIC_REFRESH

	else if(href_list["select_fps"])
		var/version_message
		if (user.client && user.client.byond_version < 511)
			version_message = "\nВам необходимо использовать версию byond 511 или выше, чтобы использовать эту функцию. Версия [user.client.byond_version] слишком устарела."
		if (world.byond_version < 511)
			version_message += "\nВ настоящий момент, сервер не поддерживает эту функцию."
		var/new_fps = input(user, "Выберите желаемое количество кадров в секунду.[version_message]\n(0 = синхронизация с ФПС сервера (текущий:[world.fps]))", "Глобальные Предпочтения") as num|null
		if (isnum(new_fps) && CanUseTopic(user))
			pref.clientfps = Clamp(new_fps, CLIENT_MIN_FPS, CLIENT_MAX_FPS)

			var/mob/target_mob = preference_mob()
			if(target_mob && target_mob.client)
				target_mob.client.apply_fps(pref.clientfps)
			return TOPIC_REFRESH

	else if(href_list["reset"])
		switch(href_list["reset"])
			if("ui")
				pref.UI_style_color = initial(pref.UI_style_color)
			if("alpha")
				pref.UI_style_alpha = initial(pref.UI_style_alpha)
			if("ooc")
				pref.ooccolor = initial(pref.ooccolor)
		return TOPIC_REFRESH

	return ..()

/proc/can_select_ooc_color(var/mob/user)
	return config.allow_admin_ooccolor && check_rights(R_PERMISSIONS, 0, user)
