/obj/item/clothing/glasses/sidveld
	name = "smart goggles"
	desc = "The peak of fashion in the year 2308: smart glasses that help the user \
			in literally any job. This model has the inscription \"StarLine\"."
	icon = CUSTOM_ITEM_OBJ
	icon_state = "sid_googles"
	item_icons = list(slot_glasses_str = CUSTOM_ITEM_MOB)
	item_state = "sid_googles"
	action_button_name = "Toggle glasses"
	activation_sound = 'infinity/sound/weapons/selector.ogg'
	flash_protection = FLASH_PROTECTION_MINOR
	tint = TINT_ONE
	vision_flags = null
	see_invisible = -1
	overlay = null
	trade_blacklisted = TRUE

	var/mode = 1
	var/toggle_sound = 'infinity/sound/items/multitool_pulse.ogg'


/obj/item/clothing/glasses/sidveld/examine(mob/user)
	. = ..()

	if (user.skill_check(SKILL_CONSTRUCTION, SKILL_EXPERT))
		to_chat(user, SPAN_NOTICE(
			"The material is light, the edges are smoothed. \
			Everything was done to make it convenient... and stylish. \
			Definitely made on Venus."))

	if (user.skill_check(SKILL_ELECTRICAL, SKILL_EXPERT))
		to_chat(user, SPAN_NOTICE(
			"There are three modes of operation: meson, \
			welding and... sunglasses mode?"))


/obj/item/clothing/glasses/sidveld/proc/setup_googles(mob/user, var/cycle_modes)
	if (cycle_modes)
		switch(mode)
			if(1)
				mode = 2
			if(2)
				mode = 3
			if(3)
				mode = 1

		playsound(user, toggle_sound)

	switch(mode)
		if(1)
			flash_protection = FLASH_PROTECTION_MINOR
			tint = TINT_ONE
			vision_flags = null
			see_invisible = -1
			overlay = null
			to_chat(user, "\The [src] in sunglasses mode.")

		if(2)
			flash_protection = FLASH_PROTECTION_NONE
			tint = TINT_NONE
			vision_flags = SEE_TURFS
			see_invisible = SEE_INVISIBLE_NOLIGHTING
			overlay = GLOB.global_hud.meson
			to_chat(user, "\The [src] in meson mode.")

		if(3)
			flash_protection = FLASH_PROTECTION_MAJOR
			tint = TINT_HEAVY
			vision_flags = null
			see_invisible = -1
			overlay = null
			to_chat(user, "\The [src] to welding protection mode.")

	update_icon()
	update_clothing_icon()
	update_vision()
	usr.update_action_buttons()


/obj/item/clothing/glasses/sidveld/Initialize()
	. = ..()
	update_icon()


/obj/item/clothing/glasses/sidveld/on_update_icon()
	. = ..()
	switch(mode)
		if(1)
			icon_state = "[initial(icon_state)]_sun"
			item_state = "[initial(item_state)]_sun"

		if(2)
			icon_state = "[initial(icon_state)]_meson"
			item_state = "[initial(item_state)]_meson"

		if(3)
			icon_state = "[initial(icon_state)]_welding"
			item_state = "[initial(item_state)]_welding"

	if (!active)
		icon_state = "[initial(icon_state)]_off"
		item_state = "[initial(item_state)]_off"

	loc.update_icon()


/obj/item/clothing/glasses/sidveld/CtrlClick(mob/user)
	if (!active)
		to_chat(user, "You can't switch modes, when \the [src] is unactive")
		return

	setup_googles(user, TRUE)


/obj/item/clothing/glasses/sidveld/activate(mob/user)
	active = TRUE
	body_parts_covered = EYES
	sound_to(user, activation_sound)
	setup_googles(user, FALSE)


/obj/item/clothing/glasses/sidveld/deactivate(mob/user)
	flash_protection = FLASH_PROTECTION_NONE
	tint = TINT_NONE
	vision_flags = null
	active = FALSE
	body_parts_covered = null
	sound_to(user, activation_sound)
	update_icon()
	update_clothing_icon()
	update_vision()


/obj/item/clothing/glasses/sidveld/attack_self(mob/user)
	if (active)
		deactivate()

	else
		activate()

	user.update_action_buttons()
