/obj/item/weapon/clothingbag/forrya_tajar/Initialize()
	new /obj/item/weapon/storage/backpack/satchel/wintaforba(src)

/obj/item/clothing/shoes/workboots/winta
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
	max_heat_protection_temperature = T0C +55
	species_restricted = list(SPECIES_TAJARA)

/obj/item/weapon/storage/backpack/satchel/wintaforba
	name = "winter satchel"
	desc = "White satchel with winter camouflage."
	icon = CUSTOM_ITEM_OBJ
	icon_state = "satchel-winta"
	item_state = "satchel-winta"
	startswith = list(/obj/item/weapon/storage/box/wintershmotree,
	/obj/item/multishowel)

/obj/item/clothing/suit/storage/hooded/wintercoat/wintercam
	name = "Winter cape-tent"
	desc = "This cape-tent looks slightly worn, it shows that it has been used for many years, but it is still strong as it was created. Such cape-tents were made on Ahdomai to protect from the cold in the northern regions. On this see the markings of the Zhan-Khazan clan. It seems this thing is created in order not to miss the cold both outside and inside, which is ideal for wearing in any weather. And it is waterproof!"
	icon = CUSTOM_ITEM_OBJ
	icon_state = "plash"
	item_icons = list(
		slot_wear_suit_str = CUSTOM_ITEM_MOB,
		)
	item_state_slots = list(
		slot_wear_suit_str = "plash",
	)
	hoodtype = /obj/item/clothing/head/winterhood/wintercam
	sprite_sheets = list(
		SPECIES_UNATHI = CUSTOM_ITEM_MOB,
	)
	species_restricted = list(SPECIES_TAJARA)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS|HANDS
	cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS|FEET|ARMS|HANDS
	item_flags = ITEM_FLAG_THICKMATERIAL
	min_cold_protection_temperature = T0C - 175
	max_heat_protection_temperature = T0C +55
	valid_accessory_slots = list(ACCESSORY_SLOT_ARMOR_C,ACCESSORY_SLOT_ARMBAND,ACCESSORY_SLOT_UTILITY,ACCESSORY_SLOT_ARMBAND,ACCESSORY_SLOT_RANK,ACCESSORY_SLOT_DEPT,ACCESSORY_SLOT_DECOR,ACCESSORY_SLOT_MEDAL,ACCESSORY_SLOT_INSIGNIA,ACCESSORY_SLOT_OVER)
	slots = 4
	allowed = list (/obj/item/weapon/pen,/obj/item/weapon/paper,/obj/item/weapon/storage/fancy/cigarettes,/obj/item/weapon/storage/box/matches,/obj/item/weapon/reagent_containers/food/drinks/flask, /obj/item/device/flashlight,/obj/item/weapon/tank,/obj/item/weapon/gun,/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/weapon/melee/baton,/obj/item/weapon/melee/energy/sword,/obj/item/weapon/handcuffs,/obj/item/weapon/storage/briefcase/inflatable,/obj/item/weapon/shovel/multishowel,/obj/item/multishowel,/obj/item/weapon/pickaxe/silver/multishowel,/obj/item/weapon/crowbar/multishowel)
	siemens_coefficient = 0.6
	gas_transfer_coefficient = 0.90
	flags_inv = HIDEJUMPSUIT|HIDETAIL

/obj/item/clothing/suit/storage/hooded/wintercoat/wintercam/on_update_icon()
	if(suittoggled)
		item_state_slots = list(
			slot_wear_suit_str = "plash_t",
		)
	else
		item_state_slots = list(
			slot_wear_suit_str = "plash",
		)

/obj/item/clothing/head/winterhood/wintercam
	name = "Winter cape-tent"
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
	max_heat_protection_temperature = T0C +55
	flags_inv = HIDEEARS | BLOCKHAIR
	gas_transfer_coefficient = 0.90
	action_button_name = "Camouflaging"
	var/can_use = 1
	var/obj/effect/dummy/chameleon/active_dummy = null
	var/saved_item = /obj/item/trash/cigbutt
	var/saved_icon = CUSTOM_ITEM_MOB
	var/saved_icon_state = "sneg"
	var/saved_overlays

/obj/item/clothing/head/winterhood/wintercam/ui_action_click()
	toggle()

/obj/item/clothing/head/winterhood/wintercam/dropped()
	disrupt()
	..()

/obj/item/clothing/head/winterhood/wintercam/equipped()
	disrupt()
	..()

/obj/item/clothing/head/winterhood/wintercam/proc/toggle()
	if(!can_use || !saved_item) return
	if(active_dummy)
		eject_all()
		qdel(active_dummy)
		active_dummy = null
		to_chat(usr, "<span class='notice'>You stop hiding under [src].</span>")
	else
		var/obj/O = new saved_item(src)
		if(!O) return
		var/obj/effect/dummy/cam/C = new /obj/effect/dummy/cam(usr.loc)
		C.activate(O, usr, saved_icon, saved_icon_state, saved_overlays, src)
		qdel(O)
		to_chat(usr, "<span class='notice'>You hide under [src].</span>")

/obj/item/clothing/head/winterhood/wintercam/proc/disrupt(var/delete_dummy = 1)
	if(active_dummy)
		eject_all()
		if(delete_dummy)
			qdel(active_dummy)
		active_dummy = null
		can_use = 0
		spawn(50) can_use = 1

/obj/item/clothing/head/winterhood/wintercam/proc/eject_all()
	for(var/atom/movable/A in active_dummy)
		A.forceMove(active_dummy.loc)
		if(ismob(A))
			var/mob/M = A
			M.reset_view(null)

/obj/effect/dummy/cam
	name = ""
	desc = ""
	density = 0
	anchored = 1
	var/can_move = 1
	var/obj/item/device/chameleon/master = null

/obj/effect/dummy/cam/proc/activate(var/obj/O, var/mob/M, new_icon, new_iconstate, new_overlays, var/obj/item/device/chameleon/C)
	name = "Snow"
	desc = "Snow"
	icon = new_icon
	icon_state = new_iconstate
	overlays = new_overlays
	set_dir(O.dir)
	M.forceMove(src)
	master = C
	master.active_dummy = src

/obj/effect/dummy/cam/attackby()
	for(var/mob/M in src)
		to_chat(M, "<span class='warning'>Your uncam.</span>")
	master.disrupt()

/obj/effect/dummy/cam/attack_hand()
	for(var/mob/M in src)
		to_chat(M, "<span class='warning'>Your uncam.</span>")
	master.disrupt()

/obj/effect/dummy/cam/ex_act()
	for(var/mob/M in src)
		to_chat(M, "<span class='warning'>Your uncam.</span>")
	master.disrupt()

/obj/effect/dummy/cam/bullet_act()
	for(var/mob/M in src)
		to_chat(M, "<span class='warning'>Your uncam.</span>")
	..()
	master.disrupt()

/obj/effect/dummy/cam/relaymove(var/mob/user, direction)
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

/obj/effect/dummy/cam/Destroy()
	master.disrupt(0)
	..()

/obj/item/clothing/accessory/cloak/wintercamfg
	name = "winter camouflage cloak"
	desc = "Simple winter camouflaging cloak."
	icon = 'infinity/icons/customs/infinity_custom_items_obj.dmi'
	icon_state = "wintercloak"
	item_flags = ITEM_FLAG_THICKMATERIAL
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS|FEET|ARMS
	min_cold_protection_temperature = T0C - 175
	allowed = list (/obj/item/weapon/shovel/multishowel,/obj/item/multishowel,/obj/item/weapon/pickaxe/silver/multishowel,/obj/item/weapon/crowbar/multishowel)
	flags_inv = HIDETAIL
	accessory_icons = list(
		slot_w_uniform_str = 'infinity/icons/customs/infinity_custom_items_mob.dmi', \
		slot_tie_str = 'infinity/icons/customs/infinity_custom_items_mob.dmi', \
		slot_wear_suit_str = 'infinity/icons/customs/infinity_custom_items_mob.dmi')
	item_icons = list(
		slot_w_uniform_str = 'infinity/icons/customs/infinity_custom_items_mob.dmi', \
		slot_tie_str = 'infinity/icons/customs/infinity_custom_items_mob.dmi', \
		slot_wear_suit_str = 'infinity/icons/customs/infinity_custom_items_mob.dmi')

/obj/item/weapon/storage/box/wintershmotree
	name = "white box"
	icon = CUSTOM_ITEM_OBJ
	max_w_class = ITEM_SIZE_LARGE
	max_storage_space = DEFAULT_LARGEBOX_STORAGE
	icon_state = "clwbox"
	desc = "White box, similar to zinc with ammunition, but with something more light inside. Or not..."
	startswith = list(/obj/item/clothing/accessory/cloak/wintercamfg = 1,
				/obj/item/clothing/suit/storage/hooded/wintercoat/wintercam = 1,
				/obj/item/clothing/shoes/workboots/winta = 1,
				/obj/item/clothing/accessory/badge/tajamc = 1,
				/obj/item/clothing/accessory/inf_pin/ccapin = 1)

/obj/item/multishowel
	name = "trenching multitool"
	desc = "Decades of evolution of trench tools have led \
	to the appearance of this ideal thing - a foldable \
	multi - tool for various works, combining many modules,\
	 but most importantly-a sharpened shovel, easily pushing\
	  ice, icy soil or someone else.\
	  This multi-tool has embossed stamp of CCA"
	icon = CUSTOM_ITEM_OBJ
	icon_state = "set"
	w_class = ITEM_SIZE_SMALL
	force = 7

/obj/item/multishowel/attack_self(mob/user)
	playsound(get_turf(user),'infinity/sound/items/change_drill.ogg',50,1)
	var/obj/item/multishowel/lopatos = new /obj/item/weapon/shovel/multishowel
	to_chat(user, "<span class='notice'>You attach the sharp shovel to [src].</span>")
	qdel(src)
	user.put_in_active_hand(lopatos)

/obj/item/multishowel/Initialize()
	. = ..()
	icon_state = "set"

/obj/item/weapon/shovel/multishowel
	name = "trenching multitool"
	desc = "Decades of evolution of trench tools have led \
	to the appearance of this ideal thing - a foldable \
	multi - tool for various works, combining many modules,\
	 but most importantly-a sharpened shovel, easily pushing\
	  ice, icy soil or someone else.\
	  This multi-tool has embossed stamp of CCA"
	icon = CUSTOM_ITEM_OBJ
	icon_state = "set"
	w_class = ITEM_SIZE_NORMAL
	force = 15
	throwforce = 10
	sharp = 1
	edge = 1
	base_parry_chance = 30
	attack_verb = list("bashed", "sliced", "stabbed", "pierced", "jeneved")

/obj/item/weapon/shovel/multishowel/attack_self(mob/user)
	playsound(get_turf(user),'infinity/sound/items/change_drill.ogg',50,1)
	var/obj/item/weapon/shovel/multishowel/lppt = new /obj/item/weapon/crowbar/multishowel
	to_chat(user, "<span class='notice'> You put forward crowbar to [src].</span>")
	qdel(src)
	user.put_in_active_hand(lppt)

/obj/item/weapon/shovel/multishowel/Initialize()
	. = ..()
	icon_state = "set-showel"

/obj/item/weapon/pickaxe/silver/multishowel
	name = "trenching multitool"
	desc = "Decades of evolution of trench tools have led \
	to the appearance of this ideal thing - a foldable \
	multi - tool for various works, combining many modules,\
	 but most importantly-a sharpened shovel, easily pushing\
	  ice, icy soil or someone else.\
	  This multi-tool has embossed stamp of CCA"
	icon = CUSTOM_ITEM_OBJ
	icon_state = "set"
	w_class = ITEM_SIZE_NORMAL
	digspeed = 120

/obj/item/weapon/pickaxe/silver/multishowel/attack_self(mob/user)
	playsound(get_turf(user),'infinity/sound/items/change_drill.ogg',50,1)
	var/obj/item/weapon/pickaxe/silver/multishowel/kilrka = new /obj/item/multishowel
	to_chat(user, "<span class='notice'>You collapsed your [src].</span>")
	qdel(src)
	user.put_in_active_hand(kilrka)

/obj/item/weapon/pickaxe/silver/multishowel/Initialize()
	. = ..()
	icon_state = "set-pickaxe"

/obj/item/weapon/crowbar/multishowel
	name = "trenching multitool"
	desc = "Decades of evolution of trench tools have led \
	to the appearance of this ideal thing - a foldable \
	multi - tool for various works, combining many modules,\
	 but most importantly-a sharpened shovel, easily pushing\
	  ice, icy soil or someone else.\
	  This multi-tool has embossed stamp of CCA"
	icon = CUSTOM_ITEM_OBJ
	icon_state = "set"
	w_class = ITEM_SIZE_NORMAL

/obj/item/weapon/crowbar/multishowel/attack_self(mob/user)
	playsound(get_turf(user),'infinity/sound/items/change_drill.ogg',50,1)
	var/obj/item/weapon/crowbar/multishowel/lomos = new /obj/item/weapon/pickaxe/silver/multishowel
	to_chat(user, "<span class='notice'> You put forward pickaxe head to [src].</span>")
	qdel(src)
	user.put_in_active_hand(lomos)

/obj/item/weapon/crowbar/multishowel/Initialize()
	. = ..()
	icon_state = "set-crowbar"