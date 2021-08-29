/obj/item/clothingbag/forryaniyar
	name = "custom bag"
	desc = "Large clothing bag wuth something inside"

/obj/item/clothingbag/forryaniyar/Initialize()
	. = ..()
	new /obj/item/storage/backpack/satchel/custom_forrya(src)
	new /obj/item/clothing/under/thermal/heat/thermosuit(src)

/obj/item/clothing/shoes/workboots/custom_forrya_winter
	name = "small winter boots"
	desc = "A pair of steel-toed winter boots designed for use in extremely settings. But their size and shape is unusual."
	icon = CUSTOM_ITEM_OBJ
	item_icons = list(slot_shoes_str = CUSTOM_ITEM_MOB)
	icon_state = "wintabuts"
	item_state = "wintabuts"
	body_parts_covered = FEET
	cold_protection = FEET
	item_flags = ITEM_FLAG_THICKMATERIAL
	min_cold_protection_temperature = T0C - 175
	max_heat_protection_temperature = T0C + 55
	species_restricted = list(SPECIES_TAJARA)

	trade_blacklisted = TRUE

/obj/item/storage/backpack/satchel/custom_forrya
	name = "winter satchel"
	desc = "White satchel with winter camouflage."
	icon = CUSTOM_ITEM_OBJ
	icon_state = "satchel-winta"
	item_state = "satchel-winta"
	startswith = list(
		/obj/item/storage/box/custom_forrya_whitebox,
		/obj/item/crowbar/custom_multishowel,
		/obj/item/clothing/accessory/storage/white_drop/custom_forrya,
		/obj/item/clothing/mask/gas/alt/custom_forrya,
		/obj/item/storage/belt/forrya
	)
	item_icons = list(
		slot_back_str = CUSTOM_ITEM_MOB)

	trade_blacklisted = TRUE

/obj/item/clothing/suit/storage/hooded/wintercoat/custom_forrya
	name = "winter cape-tent"
	desc = "This cape-tent looks slightly worn, it shows that it has been used for many years, but it is still strong as it was created. Such cape-tents were made on Ahdomai to protect from the cold in the northern regions. On this see the markings of the Zhan-Khazan clan. It seems this thing is created in order not to miss the cold both outside and inside, which is ideal for wearing in any weather. And it is waterproof!"
	icon = CUSTOM_ITEM_OBJ
	icon_state = "plash"
	item_icons = list(
		slot_wear_suit_str = CUSTOM_ITEM_MOB,
		)
	item_state_slots = list(
		slot_wear_suit_str = "plash",
	)
	hoodtype = /obj/item/clothing/head/winterhood/custom_forrya_winter
	sprite_sheets = list(
		SPECIES_UNATHI = CUSTOM_ITEM_MOB,
	)
	species_restricted = list(SPECIES_TAJARA)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS|HANDS
	cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS|FEET|ARMS|HANDS
	item_flags = ITEM_FLAG_THICKMATERIAL
	min_cold_protection_temperature = T0C - 175
	max_heat_protection_temperature = T0C + 55
	allowed = list(
		/obj/item/pen,/obj/item/paper,
		/obj/item/storage/fancy/cigarettes,
		/obj/item/storage/box/matches,
		/obj/item/reagent_containers/food/drinks/flask,
		/obj/item/device/flashlight,
		/obj/item/tank,
		/obj/item/shovel/custom_multishowel,
		/obj/item/pickaxe/silver/custom_multishowel,
		/obj/item/crowbar/custom_multishowel)
	flags_inv = HIDEJUMPSUIT|HIDETAIL
	valid_accessory_slots = list(
		ACCESSORY_SLOT_UTILITY, ACCESSORY_SLOT_HOLSTER,
		ACCESSORY_SLOT_ARMBAND, ACCESSORY_SLOT_RANK,
		ACCESSORY_SLOT_DEPT, ACCESSORY_SLOT_DECOR,
		ACCESSORY_SLOT_MEDAL, ACCESSORY_SLOT_INSIGNIA, ACCESSORY_SLOT_OVER)

	trade_blacklisted = TRUE

/obj/item/clothing/suit/storage/hooded/wintercoat/custom_forrya_winter/on_update_icon()
	if(suittoggled)
		item_state_slots = list(
			slot_wear_suit_str = "plash_t",
		)
	else
		item_state_slots = list(
			slot_wear_suit_str = "plash",
		)

/obj/item/clothing/head/winterhood/custom_forrya_winter
	name = "winter cape-tent"
	desc = "A hood attached to a heavy winter jacket."
	icon = CUSTOM_ITEM_OBJ
	icon_state = "plash_hood"
	item_icons = list(
		slot_head_str = CUSTOM_ITEM_MOB,
		)
	item_state_slots = list(
		slot_head_str = "plash_hood",
	)
	sprite_sheets = list(
		SPECIES_UNATHI = CUSTOM_ITEM_MOB,
	)
	species_restricted = list(SPECIES_TAJARA)
	body_parts_covered = HEAD|FACE
	cold_protection = HEAD
	item_flags = ITEM_FLAG_THICKMATERIAL
	min_cold_protection_temperature = T0C - 175
	max_heat_protection_temperature = T0C + 55
	flags_inv = HIDEEARS | BLOCKHAIR
	action_button_name = "Camouflaging"
	var/can_use = 1
	var/obj/effect/dummy/chameleon/active_dummy = null
	var/saved_item = /obj/item/trash/cigbutt
	var/saved_icon = CUSTOM_ITEM_MOB
	var/saved_icon_state = "sneg"
	var/saved_overlays

	trade_blacklisted = TRUE

/obj/item/clothing/head/winterhood/custom_forrya_winter/ui_action_click()
	toggle()

/obj/item/clothing/head/winterhood/custom_forrya_winter/dropped()
	disrupt()
	..()

/obj/item/clothing/head/winterhood/custom_forrya_winter/equipped()
	disrupt()
	..()

/obj/item/clothing/head/winterhood/custom_forrya_winter/proc/toggle()
	if(!can_use || !saved_item) return
	if(active_dummy)
		eject_all()
		qdel(active_dummy)
		active_dummy = null
		to_chat(usr, "<span class='notice'>You stop hiding under [src].</span>")
	else
		var/obj/O = new saved_item(src)
		if(!O) return
		var/obj/effect/dummy/custom_forrya_cam/C = new /obj/effect/dummy/custom_forrya_cam(usr.loc)
		C.activate(O, usr, saved_icon, saved_icon_state, saved_overlays, src)
		qdel(O)
		to_chat(usr, "<span class='notice'>You hide under [src].</span>")

/obj/item/clothing/head/winterhood/custom_forrya_winter/proc/disrupt(var/delete_dummy = 1)
	if(active_dummy)
		eject_all()
		if(delete_dummy)
			qdel(active_dummy)
		active_dummy = null
		can_use = 0
		spawn(50) can_use = 1

/obj/item/clothing/head/winterhood/custom_forrya_winter/proc/eject_all()
	for(var/atom/movable/A in active_dummy)
		A.forceMove(active_dummy.loc)
		if(ismob(A))
			var/mob/M = A
			M.reset_view(null)

/obj/effect/dummy/custom_forrya_cam
	name = ""
	desc = ""
	density = FALSE
	anchored = TRUE
	var/can_move = 1
	var/obj/item/device/chameleon/master = null

	trade_blacklisted = TRUE

/obj/effect/dummy/custom_forrya_cam/proc/activate(var/obj/O, var/mob/M, new_icon, new_iconstate, new_overlays, var/obj/item/device/chameleon/C)
	name = "Snow"
	desc = "Snow"
	icon = new_icon
	icon_state = new_iconstate
	overlays = new_overlays
	set_dir(O.dir)
	M.forceMove(src)
	master = C
	master.active_dummy = src

/obj/effect/dummy/custom_forrya_cam/attackby()
	for(var/mob/M in src)
		to_chat(M, "<span class='warning'>Your uncam.</span>")
	master.disrupt()

/obj/effect/dummy/custom_forrya_cam/attack_hand()
	for(var/mob/M in src)
		to_chat(M, "<span class='warning'>Your uncam.</span>")
	master.disrupt()

/obj/effect/dummy/custom_forrya_cam/ex_act()
	for(var/mob/M in src)
		to_chat(M, "<span class='warning'>Your uncam.</span>")
	master.disrupt()

/obj/effect/dummy/custom_forrya_cam/bullet_act()
	for(var/mob/M in src)
		to_chat(M, "<span class='warning'>Your uncam.</span>")
	..()
	master.disrupt()

/obj/effect/dummy/custom_forrya_cam/relaymove(var/mob/user, direction)
	var/area/A = get_area(src)
	if(!A || !A.has_gravity()) return //No magical space movement!

	if(can_move)
		can_move = 0
		switch(user.bodytemperature)
			if(300 to INFINITY)
				spawn(10) can_move = 1
			if(295 to 300)
				spawn(13) can_move = 1
			if(280 to 295)
				spawn(16) can_move = 1
			if(260 to 280)
				spawn(20) can_move = 1
			else
				spawn(25) can_move = 1
		if(isturf(loc))
			step(src, direction)
	return

/obj/effect/dummy/custom_forrya_cam/Destroy()
	master.disrupt(0)
	. = ..()

/obj/item/clothing/accessory/badge/dog_tags/tajamc
	name = "titanium amulet"
	desc = "A technological titanium amulet, also know as Soul Deliverance Device.\
	Various information about its owner engraved on sides. Looks pretty durable and has a strange glowing crystal inside."
	icon = 'infinity/icons/obj/clothing/obj_accessories.dmi'
	icon_state = "cls"
	var/open = 0

/obj/item/clothing/accessory/badge/dog_tags/tajamc/verb/verb_opam()
	set src in usr
	set category = "Object"
	set name = "Use yor paws on amulet"
	(open == 1 )?( open = 0) : (open = 1)
	update_icon()

/obj/item/clothing/accessory/badge/dog_tags/tajamc/on_update_icon()
	if(open)
		icon_state = "opn"
		set_light(0.2, 0.1, 1.5, 2, light_color)
	else
		icon_state = "cls"
		set_light(0)

/obj/item/clothing/accessory/inf_pin/ccapin
	name = "CCA patch"
	desc = "A small patch, decorated with a CCA symbol pattern embroidered with titanium threads. It looks minimalistic, beautiful and strict. "
	icon = 'infinity/icons/obj/clothing/obj_accessories.dmi'
	icon_state = "ccapatch"

/obj/item/clothing/accessory/cloak/custom_forrya_cam
	name = "winter camouflage cloak"
	desc = "Simple winter camouflaging cloak."
	icon = CUSTOM_ITEM_OBJ
	icon_state = "wintercloak"
	item_flags = ITEM_FLAG_THICKMATERIAL
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS|FEET|ARMS
	min_cold_protection_temperature = T0C - 175
	flags_inv = HIDETAIL
	allowed = list (
		/obj/item/shovel/custom_multishowel,
		/obj/item/pickaxe/silver/custom_multishowel,
		/obj/item/crowbar/custom_multishowel)
	accessory_icons = list(
		slot_w_uniform_str = CUSTOM_ITEM_MOB,
		slot_tie_str = CUSTOM_ITEM_MOB,
		slot_wear_suit_str = CUSTOM_ITEM_MOB)
	item_icons = list(
		slot_w_uniform_str = CUSTOM_ITEM_MOB,
		slot_tie_str = CUSTOM_ITEM_MOB,
		slot_wear_suit_str = CUSTOM_ITEM_MOB)

	trade_blacklisted = TRUE

/obj/item/storage/box/custom_forrya_whitebox
	name = "white box"
	icon = CUSTOM_ITEM_OBJ
	max_w_class = ITEM_SIZE_NORMAL
	max_storage_space = DEFAULT_LARGEBOX_STORAGE
	w_class = ITEM_SIZE_NORMAL
	icon_state = "clwbox"
	desc = "White box, similar to zinc with ammunition, but with something more light inside. Or not..."
	startswith = list(
		/obj/item/clothing/accessory/cloak/custom_forrya_cam,
		/obj/item/clothing/suit/storage/hooded/wintercoat/custom_forrya,
		/obj/item/clothing/shoes/workboots/custom_forrya_winter,
		/obj/item/clothing/accessory/badge/dog_tags/tajamc,
		/obj/item/clothing/accessory/inf_pin/ccapin,
		/obj/item/clothing/glasses/meson/prescription/tajvisor/hybrid/custom)
	can_hold = list(
		/obj/item/clothing/accessory/cloak/custom_forrya_cam,
		/obj/item/clothing/suit/storage/hooded/wintercoat/custom_forrya,
		/obj/item/clothing/shoes/workboots/custom_forrya_winter,
		/obj/item/clothing/accessory/badge/dog_tags/tajamc,
		/obj/item/clothing/accessory/inf_pin/ccapin,
		/obj/item/music_player/csplayer,
		/obj/item/clothing/glasses/meson/prescription/tajvisor/hybrid/custom,
		)

	trade_blacklisted = TRUE

/obj/item/shovel/custom_multishowel
	name = "trenching multitool"
	desc = "Decades of evolution of trench tools have led \
	to the appearance of this ideal thing - a foldable \
	multi - tool for various works, combining many modules,\
	 but most importantly-a sharpened shovel, easily pushing\
	  ice, icy soil or someone else.\
	  This multi-tool has embossed stamp of CCA"
	icon = CUSTOM_ITEM_OBJ
	icon_state = "set-showel"
	attack_verb = list("bashed", "sliced", "stabbed", "pierced", "jeneved")

	trade_blacklisted = TRUE

/obj/item/shovel/custom_multishowel/attack_self(mob/user)
	playsound(get_turf(user),'infinity/sound/items/change_drill.ogg',50,1)
	var/obj/item/shovel/custom_multishowel/shovel = new /obj/item/crowbar/custom_multishowel
	to_chat(user, "<span class='notice'> You put forward crowbar to [src].</span>")
	qdel(src)
	user.put_in_active_hand(shovel)

/obj/item/pickaxe/silver/custom_multishowel
	name = "trenching multitool"
	desc = "Decades of evolution of trench tools have led \
	to the appearance of this ideal thing - a foldable \
	multi - tool for various works, combining many modules,\
	 but most importantly-a sharpened shovel, easily pushing\
	  ice, icy soil or someone else.\
	  This multi-tool has embossed stamp of CCA"
	icon = CUSTOM_ITEM_OBJ
	icon_state = "set-pickaxe"
	w_class = ITEM_SIZE_NORMAL

	trade_blacklisted = TRUE

/obj/item/pickaxe/silver/custom_multishowel/attack_self(mob/user)
	playsound(get_turf(user),'infinity/sound/items/change_drill.ogg',50,1)
	var/obj/item/pickaxe/silver/custom_multishowel/kilrka = new /obj/item/shovel/custom_multishowel
	to_chat(user, "<span class='notice'>You collapsed your [src].</span>")
	qdel(src)
	user.put_in_active_hand(kilrka)

/obj/item/pickaxe/silver/custom_multishowel/Initialize()
	. = ..()
	icon_state = "set-pickaxe"

/obj/item/crowbar/custom_multishowel
	name = "trenching multitool"
	desc = "Decades of evolution of trench tools have led \
	to the appearance of this ideal thing - a foldable \
	multi - tool for various works, combining many modules,\
	 but most importantly-a sharpened shovel, easily pushing\
	  ice, icy soil or someone else.\
	  This multi-tool has embossed stamp of CCA"
	icon = CUSTOM_ITEM_OBJ
	icon_state = "set-crowbar"
	w_class = ITEM_SIZE_NORMAL

	trade_blacklisted = TRUE

/obj/item/crowbar/custom_multishowel/attack_self(mob/user)
	playsound(get_turf(user),'infinity/sound/items/change_drill.ogg',50,1)
	var/obj/item/crowbar/custom_multishowel/lomos = new /obj/item/pickaxe/silver/custom_multishowel
	to_chat(user, "<span class='notice'> You put forward pickaxe head to [src].</span>")
	qdel(src)
	user.put_in_active_hand(lomos)

/*
 * A SMALL POUCH WITH GASMASK
 * ==========================
 */

/obj/item/clothing/accessory/storage/white_drop/custom_forrya
	name = "kahal'ket belt kit"
	desc = "Small, strong, rough to the touch belt kit for storage of various things made from natural materials."
	icon = CUSTOM_ITEM_OBJ
	icon_state = "podsumka"
	item_state = "podsumka"
	accessory_icons = CUSTOM_ITEM_MOB
	accessory_icons = list(slot_tie_str = CUSTOM_ITEM_MOB, slot_w_uniform_str = CUSTOM_ITEM_MOB)
	w_class = ITEM_SIZE_NORMAL
	slots = 3

	trade_blacklisted = TRUE

/obj/item/clothing/accessory/storage/white_drop/custom_forrya/Initialize()
	. = ..()
	max_w_class = ITEM_SIZE_NORMAL

/obj/item/clothing/mask/gas/alt/custom_forrya
	name = "gas mask"
	desc = "A face-covering mask that can be connected to the air supply system. Filters harmful gases from the air, works with breathable gases. It has a special shape for wearing by tajaran and a special lining."
	icon_state = "forrya_gasmask"
	item_state = "forrya_gasmask"
	icon = CUSTOM_ITEM_OBJ
	item_icons = list(
		slot_wear_mask_str = CUSTOM_ITEM_MOB
		)
	sprite_sheets = list()

	trade_blacklisted = TRUE

/obj/item/clothing/glasses/meson/prescription/tajvisor/hybrid/custom
	name = "post-industrial visor"
	desc = "A modern Ahdominian made visor that allows the user to see while obscuring their eyes.  \
	It looks like a standard model, but has an unusual lens coating that seems to slightly absorb  \
	light. This one has installed as the mesons, and the add-on advanced shielding module."
	flash_protection = FLASH_PROTECTION_MODERATE

/obj/item/clothing/under/thermal/heat/thermosuit
	name = "modified uniform"
	desc = "Comfortable work uniform with a layer of fabric inside. It looks quite soft and comfortable. The decorative belt has a pair of invisible buttons and switches."
	icon_state = "thermosuit"
	worn_state = "thermosuit"
	icon = CUSTOM_ITEM_OBJ
	item_icons = list(
		slot_w_uniform_str = CUSTOM_ITEM_MOB,
		)

/obj/item/clothing/under/thermal/heat/thermosuit/attack_self(mob/user as mob)
	. = ..()
	var/input = input(user, "Установите поддерживаемую температуру", "Термостат", 20) as num
	input = clamp(input, 5, 55)
	thermostat = T0C + input
	to_chat(user, "<span class='notice'>Ты повернул термостат костюма на отметку в [input] градусов.</span>")

/obj/item/clothing/under/thermal/heat/thermosuit/examine(mob/user)
	. = ..()
	to_chat(user, "<span class='notice'>Термостат стоит на отметке [thermostat] градусов.</span>")

/obj/item/clothing/under/thermal/heat/thermosuit/verb/set_temp()
	set name = "Roll Thermostat"
	set category = "Object"
	set src in usr
	attack_self(usr)


//Пояс с инструментами

/obj/item/weldingtool/electric/forrya
	desc = "A man-portable arc welding tool. This one is orange."
	icon = CUSTOM_ITEM_OBJ
	icon_state = "forwt"
	trade_blacklisted = TRUE

/obj/item/weldingtool/electric/forrya/on_update_icon()
	icon_state = welding ? "forwt1" : "forwt"

/obj/item/screwdriver/forrya
	name = "schraubendreher"
	desc = "Your archetypal flathead screwdriver, with a nice, heavy polymer handle. This one is orange."
	icon = CUSTOM_ITEM_OBJ
	icon_state = "fors"
	build_from_parts = FALSE
	trade_blacklisted = TRUE

/obj/item/wrench/forrya
	desc = "A good, durable combination wrench, with self-adjusting, universal open- and ring-end mechanisms to match a wide variety of nuts and bolts. This one is orange."
	icon = CUSTOM_ITEM_OBJ
	icon_state = "forw"
	trade_blacklisted = TRUE

/obj/item/wrench/forrya/Initialize()
	. = ..()
	icon_state = initial(icon_state)
	item_state = initial(item_state)

/obj/item/crowbar/forrya
	desc = "A heavy crowbar of solid steel, good and solid in your hand. This one is orange."
	icon = CUSTOM_ITEM_OBJ
	icon_state = "forc"
	trade_blacklisted = TRUE

/obj/item/wirecutters/forrya
	desc = "A special pair of pliers with cutting edges. Various brackets and manipulators built into the handle allow it to repair severed wiring. This one is orange."
	icon = CUSTOM_ITEM_OBJ
	icon_state = "forwc"
	build_from_parts = FALSE
	trade_blacklisted = TRUE

/obj/item/device/multitool/multimeter/forrya
	desc = "Используется для измерения потребления электроэнергии оборудования и прозвонки проводов. Рекомендуется докторами. This one is orange."
	icon = CUSTOM_ITEM_OBJ
	icon_state = "forwm"
	trade_blacklisted = TRUE

/obj/item/storage/belt/forrya
	name = "toolbelt"
	desc = "Can hold various things. This one is black."
	icon = CUSTOM_ITEM_OBJ
	item_icons = list(slot_belt_str = CUSTOM_ITEM_MOB)
	icon_state = "forwb"
	item_state = "forwb"
	storage_slots = 9
	overlay_flags = BELT_OVERLAY_ITEMS
	can_hold = list(
		/obj/item/shovel/custom_multishowel,
		/obj/item/pickaxe/silver/custom_multishowel,
		/obj/item/crowbar/custom_multishowel,
		/obj/item/weldingtool/electric,
		/obj/item/screwdriver,
		/obj/item/wrench,
		/obj/item/crowbar,
		/obj/item/wirecutters,
		/obj/item/device/multitool/multimeter,
		/obj/item/material/hatchet/machete,
		/obj/item/stack/cable_coil
	)
	startswith = list(
		/obj/item/weldingtool/electric/forrya,
		/obj/item/screwdriver/forrya,
		/obj/item/wrench/forrya,
		/obj/item/crowbar/forrya,
		/obj/item/wirecutters/forrya,
		/obj/item/device/multitool/multimeter/forrya
	)
	trade_blacklisted = TRUE

/**
 * ACU RIG
 */

/* MODULES */
/obj/item/rig_module/forrya_acu_ras
	name = "RAS module"
	interface_name = "mounted RAS reactor"
	interface_desc = "Small power reactor powered by built-in CTRL-K system."
	use_power_cost = 100
	selectable = 1
	module_cooldown = 5 SECONDS
	icon = 'icons/obj/power.dmi'
	icon_state = "potato_cell"

/obj/item/rig_module/forrya_acu_ras/engage()

	if(!check(use_power_cost))
		return 0

	holder.cell.charge = min(holder.cell.maxcharge, holder.cell.charge + use_power_cost * 3)

	next_use = world.time + module_cooldown
	return 1

/obj/item/rig_module/self_destruct/forrya_acu
	name = "CTRL-K system"
	desc = "Fuel distribution system for RAS module"

	activate_string = "Enable Auto Overcharge"
	deactivate_string = "Disable Auto Overcharge"

	engage_string = "Manual Overcharge"
	interface_desc = "An integrated automatic Overcharge module. Don`t enable."


/obj/item/rig_module/mounted/plasmacutter/forrya_acu

	name = "mounted microwave laser"
	desc = "An engineering microwave laser mounted on the RIG chestplate."
	icon_state = "plasmacutter"
	suit_overlay_active = "plasmacutter"
	interface_name = "mounted microwave laser"
	interface_desc = "An engineering microwave laser."

	gun = /obj/item/gun/energy/plasmacutter/forrya_acu

/obj/item/gun/energy/plasmacutter/forrya_acu
	name = "microwave lase"
	desc = "An engineering microwave laser."
	projectile_type = /obj/item/projectile/beam/plasmacutter/forrya_acu
	has_safety = FALSE

/obj/item/projectile/beam/plasmacutter/forrya_acu
	name = "maser"
	icon_state = "laser"
	fire_sound='sound/weapons/Laser.ogg'
	damage = 20
	armor_penetration = 55
	life_span = 7

	muzzle_type = /obj/effect/projectile/laser/heavy/muzzle
	tracer_type = /obj/effect/projectile/laser/heavy/tracer
	impact_type = /obj/effect/projectile/laser/heavy/impact

/* RIG PARTS */
/obj/item/clothing/head/helmet/space/rig/eva/forrya_acu
	icon = CUSTOM_ITEM_OBJ
	item_icons = list(slot_head_str = CUSTOM_ITEM_MOB)
	icon_state = "forrya_rig_helmet"
	species_restricted = list(SPECIES_TAJARA)

/obj/item/clothing/suit/space/rig/eva/forrya_acu
	icon = CUSTOM_ITEM_OBJ
	item_icons = list(slot_wear_suit_str = CUSTOM_ITEM_MOB)
	icon_state = "forrya_rig_chest"
	species_restricted = list(SPECIES_TAJARA)

/obj/item/clothing/gloves/rig/eva/forrya_acu
	icon = CUSTOM_ITEM_OBJ
	item_icons = list(slot_gloves_str = CUSTOM_ITEM_MOB)
	icon_state = "forrya_rig_gloves"
	species_restricted = list(SPECIES_TAJARA)

/obj/item/clothing/shoes/magboots/rig/eva/forrya_acu
	icon = CUSTOM_ITEM_OBJ
	item_icons = list(slot_shoes_str = CUSTOM_ITEM_MOB)
	icon_state = "forrya_rig_boots"
	species_restricted = list(SPECIES_TAJARA)

/obj/item/tank/air/forrya_acu
	volume = 360
	name = "high capacity oxygen tank"
	desc = "An unwieldy tank for lots of oxygen."

/* MAIN RIG PART */
/obj/item/rig/eva/forrya_acu
	name = "C-ACU exosuit"
	desc = "Heavy engineering RIG for emergency operation. This one has enhanced protection against aggressive environments."
	suit_type = "C-ACU exosuit"
	icon = CUSTOM_ITEM_OBJ
	icon_override = CUSTOM_ITEM_MOB
	icon_state = "forrya_rig"
	equipment_overlay_icon = CUSTOM_ITEM_MOB
	piece_icon_state_overrides = list(
		"helmet" = "forrya_rig_helmet",
		"chest" = "forrya_rig_chest",
		"gloves" = "forrya_rig_gloves",
		"boots" = "forrya_rig_boots"
	)

	helm_type = /obj/item/clothing/head/helmet/space/rig/eva/forrya_acu
	chest_type = /obj/item/clothing/suit/space/rig/eva/forrya_acu
	glove_type = /obj/item/clothing/gloves/rig/eva/forrya_acu
	boot_type = /obj/item/clothing/shoes/magboots/rig/eva/forrya_acu
	air_type = /obj/item/tank/air/forrya_acu

	action_button_name = "Toggle defensive mode"
	var/defensive_mode = FALSE
	var/list/defensive_mode_armor = list(
		melee = 60,
		bullet = 60,
		laser =  60,
		energy = 60,
		bomb = 60,
		bio = ARMOR_BIO_SHIELDED,
		rad = ARMOR_RAD_SHIELDED
	)
	emp_protection = 100

	initial_modules = list(
		/obj/item/rig_module/maneuvering_jets,
		/obj/item/rig_module/device/rcd,
		/obj/item/rig_module/vision/meson,
		/obj/item/rig_module/cooling_unit,
		/obj/item/rig_module/forrya_acu_ras,
		/obj/item/rig_module/self_destruct/forrya_acu,
		/obj/item/rig_module/mounted/plasmacutter/forrya_acu
	)

	custom = TRUE
	trade_blacklisted = TRUE

/datum/client_color/forrya_acu
	client_color = list(0.70,0.70,0.70, 0.28,0.28,0.28, 0.28,0.28,0.28)
	priority = 100

/obj/item/rig/eva/forrya_acu/ui_action_click()
	. = ..()
	if (offline)
		to_chat(usr, SPAN_WARNING(":: Toggle on ACU first. ::"))
		return

	defensive_mode = !defensive_mode

	for (var/obj/item/piece in list(gloves, helmet, boots, chest))
		if (defensive_mode)
			piece.armor = defensive_mode_armor

			slowdown_general = 4
		else
			piece.armor = armor
			slowdown_general = 0
	to_chat(usr, SPAN_WARNING("::DEFNSIVE MODE [defensive_mode ? "ENGAGED" : "DISENGAGED"]::"))

/obj/item/rig/eva/forrya_acu/toggle_seals(mob/initiator, instant)
	if (defensive_mode)
		ui_action_click()
	. = ..()

/obj/item/rig/eva/forrya_acu/reset()
	if (defensive_mode)
		ui_action_click()
	. = ..()

/obj/item/clothingbag/forrya_acu
	name = "ACU's bag"
	desc = "For Seton."
	trade_blacklisted = TRUE

/obj/item/clothingbag/forrya_acu/Initialize()
	. = ..()
	new /obj/item/rig/eva/forrya_acu(src)
