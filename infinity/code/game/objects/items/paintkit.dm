/obj/item/device/kit/egun
	name = "egun modification kit"
	desc = "A kit for modifying an energy gun."
	new_name = "egun"
	new_desc = "An energy gun"
	new_icon = "energy"
	var/list/new_item_icons = list()

/obj/item/device/kit/egun/inherit_custom_item_data(var/datum/custom_item/citem)
	. = ..()
	new_icon_file = CUSTOM_GUN_ICONS
	if(list_find(citem.additional_data, "gun_mob_icon"))
		var/mob_icon_override = citem.additional_data["gun_mob_icon"]
		for(var/side in list(slot_r_hand_str, slot_l_hand_str))
			var/true_mob_icon_override = "[mob_icon_override]_[side].dmi"
			if(!fexists(true_mob_icon_override))
				message_staff("GUN MODKIT ERROR: ckey: [citem.ckey], charname: [citem.character_name], name: [new_name]. Gun_mob_icon file entered but not found '[true_mob_icon_override]'")
				var/mob = get_mob_by_key(citem.ckey)
				if(!mob)
					message_staff("GUN MODKIT ERROR: чото мне совсем плохо - не могу найти моба у [citem.ckey], которому эта кастомка полагалась")	// Ну тип. Мы не создаем предмет, если нет моба которому его нужно сделать.
				else
					to_chat(mob, SPAN_WARNING("Мы потеряли иконки на моба для твоей пушки :(\n Напиши нам в ОР чтобы поискали их в файле '[true_mob_icon_override]'"))	// На случай если педалей нет, игрок может сам узнать о его проблеме.
			else
				new_item_icons[side] = true_mob_icon_override

/obj/item/gun/energy/attackby(var/obj/item/device/kit/egun/W, mob/user)
	. = ..()
	if(istype(W, /obj/item/device/kit/egun))
		var/check = TRUE
		var/list/old_icon_states = list()
		if(charge_meter)
			for(var/datum/firemode/mode in firemodes)
				var/icon = icon(W.new_icon_file, "[W.new_icon][mode.name]0")
				if(!icon)
					check = FALSE
					to_chat(user, SPAN_WARNING("Интересно а как бы украсить [src] в режиме '[mode.name]'?"))
				else
					old_icon_states += list(name = "[mode.name]", icon = "[mode.settings["modifystate"]]")
					mode.settings["modifystate"] = "[W.new_icon][mode.name]"
			if(!check)
				to_chat(user, SPAN_WARNING("Ты так и не смог придумать, по этому решил отложить покраску."))
				for(var/old_mode in old_icon_states)
					for(var/datum/firemode/actual_mode in firemodes)
						if(actual_mode.name == old_mode["name"])
							actual_mode.settings["modifystate"] = old_mode["icon"]
							break
				return
			// Make us reapply new iconstates
			var/datum/firemode/current_mode = firemodes[sel_mode]
//			current_mode.restore_original_settings(src)
//			current_mode.apply_to(src)
			modifystate = current_mode.settings["modifystate"]
		else
			icon_state = W.new_icon
		desc = W.new_desc
		SetName(W.new_name)
		if(W.new_icon_file)
			icon = W.new_icon_file
		for(var/item_side in W.new_item_icons)
			item_icons[item_side] = W.new_item_icons[item_side]
		update_icon()
		user.visible_message("[user] открывает [W] и быстро использует его содержимое на [src]. Что же получится?", "Ты быстро перекрашиваешь [src] с помощью [W].")
		W.use(1, user)

// Баллистический говнокод для михи

	else if(istype(W, /obj/item/device/kit/gun))
		to_chat(user, SPAN_WARNING("Ты понимаешь что баллистика и еган это 2 разных типа пушки?"))

/obj/item/device/kit/gun
	name = "NT-41 modification kit"
	desc = "Вы себе даже не представляете сколько говнокода повлек за собой этот модкит. Пасиб, Миха!"
	new_name = "ARS-Val"
	new_desc = "Hephaestus replica of old-Earth special forces qA rifle, adapted to submachine gun rounds."
	new_icon = "mixa"

/obj/item/gun/projectile/attackby(var/obj/item/W, mob/user)
	. = ..()
	if(istype(W, /obj/item/device/kit/egun))
		to_chat(user, SPAN_WARNING("Ты понимаешь что баллистика и еган это 2 разных типа пушки?"))
	// Больше говнокода богу говнокода
	else if(istype(W, /obj/item/device/kit/gun) && !istype(src, /obj/item/gun/projectile/automatic/nt41))
		to_chat(user, SPAN_WARNING("Ты понимаешь что такое НТ-41? Нет? Очень жаль!"))

/obj/item/gun/projectile/automatic/nt41/attackby(var/obj/item/device/kit/gun/W, mob/user)
	. = ..()
	if(istype(W))
		if(ammo_magazine)
			to_chat(user, SPAN_WARNING("Ты что совсем смерти захотел? Разряди пушку!"))
		else
			user.visible_message("[user] открывает [W] и быстро использует его содержимое на [src]. Что же получится?", "Ты быстро перекрашиваешь [src] с помощью [W].")
			process_chambered()	// Give me that bullet
			W.use(1, user)
			user.drop_from_inventory(src)
			var/gun = new /obj/item/gun/projectile/automatic/nt41/mixa_vintorez
			user.put_in_hands(gun)
			qdel(src)

/obj/item/gun/projectile/automatic/nt41/mixa_vintorez
	name = "ARS-Val"
	desc = "Hephaestus replica of old-Earth special forces qA rifle, adapted to submachine gun rounds."
	icon_state = "mixant41"
	item_state = "mixant41"
	wielded_item_state = "mixant41-wielded"
	icon = CUSTOM_GUN_ICONS
	starts_loaded = 0
	item_icons = list(
		slot_r_hand_str = 'infinity/icons/customs/infinity_custom_guns_slot_r_hand.dmi',
		slot_l_hand_str = 'infinity/icons/customs/infinity_custom_guns_slot_l_hand.dmi',
		)

/obj/item/gun/projectile/automatic/nt41/mixa_vintorez/on_update_icon()
	..()
	var/mob/living/M = loc
	if(istype(M))
		if(wielded_item_state)
			if(M.can_wield_item(src) && src.is_held_twohanded(M))
				item_state_slots[slot_l_hand_str] = (ammo_magazine)? "[wielded_item_state]" : "[wielded_item_state]-e"
				item_state_slots[slot_r_hand_str] = (ammo_magazine)? "[wielded_item_state]" : "[wielded_item_state]-e"
	icon_state = (ammo_magazine)? "mixant41" : "mixant41-e"

// Конец баллистического говнокода

/obj/item/device/kit/clothing
	name = "clothing modification kit"
	desc = "A kit for modifying an clothes."
	var/new_mob_icon_file
	var/strictly_type

/obj/item/device/kit/clothing/inherit_custom_item_data(var/datum/custom_item/citem)
	. = ..()
	name = "[new_name]'s modification kit"
	if(citem.additional_data["apply_kit_to"])
		strictly_type = text2path(citem.additional_data["apply_kit_to"]) || citem.additional_data["apply_kit_to"]
	new_mob_icon_file = CUSTOM_ITEM_MOB

/obj/item/device/kit/clothing/afterattack(obj/O, mob/user as mob, proximity)
	if(!proximity)
		return

	var/obj/item/clothing/I = O
	if(!istype(I))
		to_chat(user, SPAN_WARNING("Ты чувствуешь себя глупо пытаясь набором для шитья изменить [O]"))
		return
	if(!strictly_type || !istype(I, strictly_type))
		to_chat(user, SPAN_WARNING("Тебе не приходит в голову что можно с этим сделать. Может стоит взять другую одежду?"))
		return

	I.SetName("[new_name]")
	I.desc = new_desc
	I.icon_state = "[new_icon]"
	I.item_state = "[new_icon]"
	if(new_icon_file)
		I.icon = new_icon_file
	if(new_mob_icon_file)
		I.icon_override = new_mob_icon_file
	use(1,user)
