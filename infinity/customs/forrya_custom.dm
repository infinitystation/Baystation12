/obj/item/weapon/clothingbag/forryaniyar
	name = "custom bag"
	desc = "Large clothing bag wuth something inside"

/obj/item/weapon/clothingbag/forryaniyar/Initialize()
	. = ..()
	new /obj/item/weapon/storage/backpack/satchel/custom_forrya(src)
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

/obj/item/weapon/storage/backpack/satchel/custom_forrya
	name = "winter satchel"
	desc = "White satchel with winter camouflage."
	icon = CUSTOM_ITEM_OBJ
	icon_state = "satchel-winta"
	item_state = "satchel-winta"
	startswith = list(
		/obj/item/weapon/storage/box/custom_forrya_whitebox,
		/obj/item/weapon/crowbar/custom_multishowel,
		/obj/item/clothing/accessory/storage/drop_pouches/custom_forrya,
		/obj/item/clothing/mask/gas/alt/custom_forrya,
		/obj/item/clothing/glasses/meson/prescription/tajvisor/hybrid/custom,
		/obj/item/clothing/accessory/amulet/strong/frost)
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
		/obj/item/weapon/pen,/obj/item/weapon/paper,
		/obj/item/weapon/storage/fancy/cigarettes,
		/obj/item/weapon/storage/box/matches,
		/obj/item/weapon/reagent_containers/food/drinks/flask,
		/obj/item/device/flashlight,
		/obj/item/weapon/tank,
		/obj/item/weapon/shovel/custom_multishowel,
		/obj/item/weapon/pickaxe/silver/custom_multishowel,
		/obj/item/weapon/crowbar/custom_multishowel)
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
	density = 0
	anchored = 1
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
		/obj/item/weapon/shovel/custom_multishowel,
		/obj/item/weapon/pickaxe/silver/custom_multishowel,
		/obj/item/weapon/crowbar/custom_multishowel)
	accessory_icons = list(
		slot_w_uniform_str = CUSTOM_ITEM_MOB,
		slot_tie_str = CUSTOM_ITEM_MOB,
		slot_wear_suit_str = CUSTOM_ITEM_MOB)
	item_icons = list(
		slot_w_uniform_str = CUSTOM_ITEM_MOB,
		slot_tie_str = CUSTOM_ITEM_MOB,
		slot_wear_suit_str = CUSTOM_ITEM_MOB)

	trade_blacklisted = TRUE

/obj/item/weapon/storage/box/custom_forrya_whitebox
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
		/obj/item/clothing/accessory/inf_pin/ccapin)
	can_hold = list(
		/obj/item/clothing/accessory/cloak/custom_forrya_cam,
		/obj/item/clothing/suit/storage/hooded/wintercoat/custom_forrya,
		/obj/item/clothing/shoes/workboots/custom_forrya_winter,
		/obj/item/clothing/accessory/badge/dog_tags/tajamc,
		/obj/item/clothing/accessory/inf_pin/ccapin,
		/obj/item/music_player/csplayer)

	trade_blacklisted = TRUE

/obj/item/weapon/shovel/custom_multishowel
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

/obj/item/weapon/shovel/custom_multishowel/attack_self(mob/user)
	playsound(get_turf(user),'infinity/sound/items/change_drill.ogg',50,1)
	var/obj/item/weapon/shovel/custom_multishowel/shovel = new /obj/item/weapon/crowbar/custom_multishowel
	to_chat(user, "<span class='notice'> You put forward crowbar to [src].</span>")
	qdel(src)
	user.put_in_active_hand(shovel)

/obj/item/weapon/pickaxe/silver/custom_multishowel
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

/obj/item/weapon/pickaxe/silver/custom_multishowel/attack_self(mob/user)
	playsound(get_turf(user),'infinity/sound/items/change_drill.ogg',50,1)
	var/obj/item/weapon/pickaxe/silver/custom_multishowel/kilrka = new /obj/item/weapon/shovel/custom_multishowel
	to_chat(user, "<span class='notice'>You collapsed your [src].</span>")
	qdel(src)
	user.put_in_active_hand(kilrka)

/obj/item/weapon/pickaxe/silver/custom_multishowel/Initialize()
	. = ..()
	icon_state = "set-pickaxe"

/obj/item/weapon/crowbar/custom_multishowel
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

/obj/item/weapon/crowbar/custom_multishowel/attack_self(mob/user)
	playsound(get_turf(user),'infinity/sound/items/change_drill.ogg',50,1)
	var/obj/item/weapon/crowbar/custom_multishowel/lomos = new /obj/item/weapon/pickaxe/silver/custom_multishowel
	to_chat(user, "<span class='notice'> You put forward pickaxe head to [src].</span>")
	qdel(src)
	user.put_in_active_hand(lomos)

/*
 * A SMALL POUCH WITH GASMASK
 * ==========================
 */

/obj/item/clothing/accessory/storage/drop_pouches/custom_forrya
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

/obj/item/clothing/accessory/storage/drop_pouches/custom_forrya/Initialize()
	. = ..()
	hold.max_w_class = ITEM_SIZE_NORMAL

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

/obj/item/clothing/accessory/amulet/strong/frost
	name = "frosty averter"
	desc = "The amulet of Tajara, which looks old enough, as if it has passed through the ages. The runes on the amulet are etched with acid, it is also covered with silvery metal and seems even covered with frost. It looks very cold, and it seems that touching it can burn with frost."
	icon = CUSTOM_ITEM_OBJ
	icon_state = "forrya_amulet"

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
