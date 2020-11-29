/mob/living/silicon/robot
	icon_selected = 0

/mob/living/silicon/robot/choose_icon(triesleft, list/module_sprites)
	set waitfor = 0
	if(!module_sprites.len)
		to_chat(src, FONT_LARGE(SPAN_BOLD("Что-то пошло не так в системе выбора вашего корпуса. Сообщите разработчикам об этом приложив информацию о выбранном вами модуле.")))
		CRASH("Can't setup cyborg's icon for [src] ([src.client]). Module: [module?.name]")

	if(module_sprites.len == 1 || !client)
		if(!(icontype in module_sprites))
			icontype = module_sprites[1]
	else
		var/list/options = list()
		for(var/i in module_sprites)
			var/image/j = image(icon = src.icon, icon_state = module_sprites[i])
			j.name = i
			options[i] = j
		icontype = show_radial_menu(src, src, options, radius = 42)
	if(!icontype)
		choose_icon(triesleft, module_sprites)
		return

	icon_state = module_sprites[icontype]
	update_icon()
	if(icontype)
		switch(alert(src, "Вы уверены что хотите этот корпус?", "Подтвердите", "Да", "Нет"))
			if("Нет")
				choose_icon(triesleft, module_sprites)
				return
	icon_selected = TRUE
	to_chat(src, "Вы выбрали ваш корпус. Вы можете сменить его только после сброса модуля.")
