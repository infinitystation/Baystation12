/mob/living/silicon/robot
	icon_selected = 0

/mob/living/silicon/robot/choose_icon(triesleft, list/module_sprites)
	set waitfor = 0
	if(!module_sprites.len)
		to_chat(src, "Something is badly wrong with the sprite selection. Harass a coder.")
		return

	if(module_sprites.len == 1 || !client)
		if(!(icontype in module_sprites))
			icontype = module_sprites[1]
	else
		var/list/options = list()
		for(var/i in module_sprites)
			options[i] = image(icon = src.icon, icon_state = module_sprites[i])
		icontype = show_radial_menu(src, src, options, radius = 42)

	if(!icontype)
		return

	icon_state = module_sprites[icontype]
	update_icon()

	icon_selected = TRUE
	to_chat(src, "Your icon has been set. You now require a module reset to change it.")
