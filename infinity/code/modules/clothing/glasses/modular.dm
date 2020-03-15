/obj/item/clothing/glasses/modular
	name = "modular glasses"
	desc = "It's using different cartridges to grant user additional vision modifiers. This is a cheap mass-factory version."
	icon_state = "medhud_visor"
	item_state = "medhud_visor"
	var/list/cartridges = list()
	var/maxcart = 1
	electric = TRUE

/obj/item/clothing/glasses/modular/Initialize()
	. = ..()
	updatecartridges()

/obj/item/clothing/glasses/modular/emp_act(severity)
	..()
	for(var/obj/item/glass_cartridge/I in cartridges)
		I.active = FALSE
	updatecartridges()

/obj/item/clothing/glasses/modular/equipped(var/mob/user, var/slot)
	. = ..(user, slot)
	for(var/obj/item/glass_cartridge/I in cartridges)
		if(I.action)
			I.action.Grant(user)

/obj/item/clothing/glasses/modular/process_hud(var/mob/M)
	if(hud)
		hud.process_hud(M)
	for(var/obj/item/glass_cartridge/I in cartridges)
		if(I.active)
			I.process_hud(M)

/obj/item/clothing/glasses/modular/proc/updatecartridges()
	prescription = 0
	darkness_view = 0
	vision_flags = 0
	light_protection = 0
	see_invisible = 0
	flash_protection = initial(flash_protection)
	tint = 0
	overlay = null
	for(var/obj/item/glass_cartridge/I in cartridges)
		if(!I.active)	continue
		prescription = max(prescription, I.prescription)
		darkness_view = max(darkness_view, I.darkness_view)
		vision_flags |= I.vision_flags
		light_protection = max(light_protection, I.light_protection)
		see_invisible = max(see_invisible, I.see_invisible)
		flash_protection = max(flash_protection, I.flash_protection)
		tint = max(tint, I.tint)
		overlay |= I.overlay
	update_vision()

/obj/item/clothing/glasses/modular/attackby(var/obj/item/I, var/mob/user)
	if(isScrewdriver(I))
		var/obj/item/glass_cartridge/C
		if(!cartridges.len)
			to_chat(user, SPAN_WARNING("There is no cartridges to remove."))
			. = ..()
			return
		else if(cartridges.len == 1)
			C = pick(cartridges)
		else
			C = input("Which cartridge do you want to remove?", "Removing cartridge", null) as null | anything in cartridges
		if(C)
			to_chat(user, SPAN_NOTICE("You remove [C] from [src]."))
			cartridges -= C
			if(!user.put_in_any_hand_if_possible(C))	C.dropInto(get_turf(src))
			updatecartridges()
	else if(istype(I, /obj/item/glass_cartridge))
		if(cartridges.len >= maxcart)	to_chat(user, SPAN_WARNING("There is no more slots for [I]."))
		else if(user.unEquip(I, src))
			cartridges += I
			updatecartridges()
			to_chat(user, SPAN_NOTICE("You slide [I] into one of [src]'s slots."))
			if(I.action)	I.action.Grant(user)
	user.update_action_buttons()
	. = ..()

/obj/item/glass_cartridge
	name = "glasses cartridge"
	desc = "Used in modular glasses to upgrade them."
	icon = 'infinity/icons/obj/glass_cartridge.dmi'
	w_class = ITEM_SIZE_TINY
	slot_flags = SLOT_EARS
	var/prescription = 0
	var/darkness_view = 0
	var/vision_flags
	var/light_protection = 0
	var/see_invisible = 0
	var/flash_protection = 0
	var/tint = 0
	var/overlay

	var/list/conflicting_carts = list()
	var/hud_type

	var/active = FALSE
	action_button_name = "Toggle Cartridge"
	default_action_type = /datum/action/item_action/remote

/obj/item/glass_cartridge/Initialize()
	. = ..()
	if(!action)
		action = new default_action_type
		action.name = action_button_name
		action.SetTarget(src)

/obj/item/glass_cartridge/emp_act(severity)
	active = FALSE

/obj/item/glass_cartridge/proc/process_hud(var/mob/M)
	return

/obj/item/glass_cartridge/attack_self(mob/user)
	if(!user.incapacitated())
		active = !active
		to_chat(user, SPAN_NOTICE("You toggle [src] [active ? "on" : "off"]."))
		var/obj/item/clothing/glasses/modular/glasses = src.loc
		if(istype(glasses))
			for(var/obj/item/glass_cartridge/I in glasses.cartridges)
				if(I.active && is_type_in_list(I, conflicting_carts))
					to_chat(user, SPAN_WARNING("With quite click [I] is turning off."))
			glasses.updatecartridges()
		user.update_action_buttons()

/datum/action/item_action/remote
	check_flags = AB_CHECK_RESTRAINED|AB_CHECK_STUNNED|AB_CHECK_ALIVE

/datum/action/item_action/remote/CheckRemoval(mob/living/user)
	var/obj/item/clothing/glasses/modular/glasses = target.loc
	if(istype(glasses))
		if(glasses in user)
			return 0
	return	1

////////////////////////////////////
/////    CARTRIGE   PRESETS    /////
////////////////////////////////////

/obj/item/glass_cartridge/meson
	name = "meson HUD cartridge"
	desc = "Used for seeing walls, floors, and stuff through anything."
	icon_state = "mes"
	action_button_name = "Toggle Meson"
	vision_flags = SEE_TURFS
	see_invisible = SEE_INVISIBLE_NOLIGHTING

/obj/item/glass_cartridge/meson/Initialize()
	. = ..()
	overlay = GLOB.global_hud.meson

/obj/item/glass_cartridge/material
	name = "material HUD cartridge"
	desc = "Used to observe various interesting things even through walls..."
	icon_state = "mat"
	action_button_name = "Toggle Material"
	vision_flags = SEE_OBJS

/obj/item/glass_cartridge/mesmat
	name = "MesMat HUD cartridge"
	desc = "Two catridges connected by wires and duct tape to work simultaneously."
	icon_state = "mes3"
	action_button_name = "Toggle Material"
	vision_flags = SEE_TURFS|SEE_OBJS
	see_invisible = SEE_INVISIBLE_NOLIGHTING

/obj/item/glass_cartridge/welding
	name = "WeldProt cartridge"
	desc = "Used for eye protection during welding."
	icon_state = "wel"
	action_button_name = "Toggle WeldProt"
	flash_protection = FLASH_PROTECTION_MAJOR
	tint = TINT_HEAVY

/obj/item/glass_cartridge/night
	name = "night vision cartridge"
	desc = "Used for seeing walls, floors, and stuff through anything."
	icon_state = "niw"
	action_button_name = "Toggle night vision"
	see_invisible = SEE_INVISIBLE_NOLIGHTING

/obj/item/glass_cartridge/night/Initialize()
	. = ..()
	overlay = GLOB.global_hud.nvg

/obj/item/glass_cartridge/thermal
	name = "thermal HUD cartridge"
	desc = "Used for seeing walls, floors, and stuff through anything."
	icon_state = "thw"
	action_button_name = "Toggle thermal vision"
	vision_flags = SEE_MOBS
	see_invisible = SEE_INVISIBLE_NOLIGHTING

/obj/item/glass_cartridge/thermal/Initialize()
	. = ..()
	overlay = GLOB.global_hud.thermal

/obj/item/glass_cartridge/prescription
	name = "prescription cartridge"
	desc = "Used for seeing better..."
	icon_state = "pre"
	action_button_name = "Toggle Lenes"
	prescription = 6

/obj/item/glass_cartridge/medhud
	name = "MedHUD cartridge"
	desc = "Used for seeing patient status."
	icon_state = "meh"
	action_button_name = "Toggle MedHud"

/obj/item/glass_cartridge/medhud/process_hud(var/mob/M)
	process_med_hud(M, 1)

/obj/item/glass_cartridge/sechud
	name = "SecHUD cartridge"
	desc = "Used for seeing criminal scums status."
	icon_state = "seh"
	action_button_name = "Toggle SecHud"

/obj/item/glass_cartridge/sechud/process_hud(var/mob/M)
	process_sec_hud(M, 1)

/obj/item/glass_cartridge/janihud
	name = "janiHUD cartridge"
	desc = "Good for finding puddles hiding under catwalks."
	icon_state = "jah"
	action_button_name = "Toggle janiHUD"

/obj/item/glass_cartridge/janihud/process_hud(var/mob/M)
	process_jani_hud(M)

////////////////////////////////
/////   VISORS   PRESETS   /////
////////////////////////////////

/obj/item/clothing/glasses/modular/meson/Initialize()
	. = ..()
	cartridges += new /obj/item/glass_cartridge/meson(src)
	updatecartridges()

/obj/item/clothing/glasses/modular/normal
	name = "modular glasses"
	desc = "It's using different cartridges to grant user additional vision modifiers. This is the standard model."
	maxcart = 2

/obj/item/clothing/glasses/modular/advanced
	name = "modular glasses"
	desc = "It's using different cartridges to grant user additional vision modifiers. This is an advanced model with an increased number of slots."
	maxcart = 4

//tajs
/obj/item/clothing/glasses/modular/normal/taj
	name = "modular visor"
	desc = "A modern Ahdominian made visor that allows the user to see while obscuring their eyes. This one has multiple cartridge slots installed. The visor glass is green."
	icon_state = "tajvisor_mes"
	item_state = "tajvisor_mes"
	item_icons = list(slot_glasses_str = 'infinity/icons/mob/onmob/onmob_eyes.dmi')
	icon = 'infinity/icons/obj/clothing/obj_eyes.dmi'

/obj/item/clothing/glasses/modular/normal/taj/b
	desc = "A modern Ahdominian made visor that allows the user to see while obscuring their eyes. This one has multiple cartridge slots installed. The visor glass is blue."
	icon_state = "tajvisor_med"
	item_state = "tajvisor_med"

/obj/item/clothing/glasses/modular/normal/taj/r
	desc = "A modern Ahdominian made visor that allows the user to see while obscuring their eyes. This one has multiple cartridge slots installed. The visor glass is red."
	icon_state = "tajvisor_sec"
	item_state = "tajvisor_sec"

/obj/item/clothing/glasses/modular/advanced/taj
	name = "modular visor"
	desc = "A modern Ahdominian made visor that allows the user to see while obscuring their eyes. This device has a large number of cartridge slots installed. The visor glass is green."
	icon_state = "tajvisor_mes"
	item_state = "tajvisor_mes"
	item_icons = list(slot_glasses_str = 'infinity/icons/mob/onmob/onmob_eyes.dmi')
	icon = 'infinity/icons/obj/clothing/obj_eyes.dmi'

/obj/item/clothing/glasses/modular/advanced/taj/b
	desc = "A modern Ahdominian made visor that allows the user to see while obscuring their eyes. This device has a large number of cartridge slots installed. The visor glass is blue."
	icon_state = "tajvisor_med"
	item_state = "tajvisor_med"

/obj/item/clothing/glasses/modular/advanced/taj/r
	desc = "A modern Ahdominian made visor that allows the user to see while obscuring their eyes. This device has a large number of cartridge slots installed. The visor glass is red."
	icon_state = "tajvisor_sec"
	item_state = "tajvisor_sec"

//mesmat

/obj/item/glass_cartridge/meson
	var/buildstate = 0

/obj/item/glass_cartridge/meson/on_update_icon()
	overlays.Cut()
	. = ..()
	if(buildstate)
		overlays += image(icon = 'infinity/icons/obj/glass_cartridge.dmi', icon_state = "mes[buildstate]")

/obj/item/glass_cartridge/meson/attackby(obj/item/W as obj, mob/user as mob)
	user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
	add_fingerprint(user)
	if(loc == user.loc)
		to_chat(user, SPAN_NOTICE("You cannot interact with [src] while it in your hands."))
		return
	switch(buildstate)
		if(0)
			if(istype(W, /obj/item/glass_cartridge/material))
				to_chat(user, SPAN_NOTICE("You attach [W]."))
				buildstate++
				qdel(W)
		if(1)
			if(isCoil(W))
				var/obj/item/stack/cable_coil/C = W
				if(C.use(5))
					to_chat(user, SPAN_NOTICE("You installed the wiring inside."))
					buildstate++
				else
					to_chat(user, SPAN_NOTICE("You need at least 5 segments of [W] to complete this task."))
		if(2)
			if(istype(W, /obj/item/weapon/tape_roll))
				to_chat(user, SPAN_NOTICE("You secure everything with [W]."))
				new /obj/item/glass_cartridge/mesmat(get_turf(src))
				qdel(src)
			return
	update_icon()
	..()