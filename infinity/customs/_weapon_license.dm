/obj/item/weapon/paper/custom_weapon_license
	info = "<i>This is just blunk text. Yep, it was shitspawned.</i>"

	var/serial_number = "NT-UW-000-000-AIP"
	var/serial_weapon_type = "UW"
	var/owner = "Unassigned"
	var/weapon_name = "Honk-inator"
	var/weapon_type = "Cheat weapon"


/obj/item/weapon/paper/custom_weapon_license/proc/set_info()
	info = replacetext(info, "%SERIAL_NUMBER%", serial_number)
	info = replacetext(info, "%OWNER%", owner)
	info = replacetext(info, "%WEAPON_TYPE%", weapon_type)
	info = replacetext(info, "%WEAPON_NAME%", weapon_name)
	set_content(info, "License [serial_number]")

/obj/item/weapon/paper/custom_weapon_license/Initialize()
	. = ..()
	serial_weapon_type = "EW"
	serial_number = "NT-[serial_weapon_type]-[rand(100, 999)]-[rand(100, 999)]-AIP"
	info = @"[center][ntlogo][/center][br][center][large] Лицензия на хранение личного оружия.[/large][/center][br][center]<b>Серийный номер документа и привязаного к нему оружия:</b>[/center][br][center]%SERIAL_NUMBER%[/center][br]Данный документ утверждает, что %OWNER%, именуемый(ая) в дальнейшем 'Владелец оружия', имеет полное право на хранение личного вооружения в виде %WEAPON_TYPE% %WEAPON_NAME%. Оружию присваивается уникальный индетификатор <b>%SERIAL_NUMBER%</b>.[br]Имея при себе данный документ, Владелец оружия не будет нарушать 210 Статью Корпоративного Закона 'Незаконное хранение, либо производство оружия'. Данный документ не даёт право нарушать остальные статьи Корпоративного Закона. В качестве примера можно привести 211 статью Корпоративного Закона.[br] Сотрудники Департамента Охраны имеют право конфисковать оружие в следующих случаях:[br] 1) Оружие является уликой в расследовании.[br]2) Владелец оружия попадает под арест до конца полёта.[br] Сотрудники Департамента Охраны обязаны вернуть Владельцу оружия его оружие после освобождения из-под ареста.[br][hr]"
	set_info()
	preStampPaper(/obj/item/weapon/stamp/boss)
