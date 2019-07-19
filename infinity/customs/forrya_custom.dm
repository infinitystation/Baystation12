/obj/item/weapon/clothingbag/forrya_tajar/Initialize()
	new /obj/item/clothing/accessory/inf_pin/ccapin(src)
	new /obj/item/clothing/accessory/badge/tajamc(src)

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
	species_restricted = list("exclude", SPECIES_NABBER, SPECIES_HUMAN, SPECIES_VOX, SPECIES_IPC, SPECIES_SKRELL, SPECIES_SPACER, SPECIES_GRAVWORLDER, SPECIES_TRITONIAN, SPECIES_VATGROWN)

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
	species_restricted = list("exclude", SPECIES_NABBER, SPECIES_HUMAN, SPECIES_VOX, SPECIES_IPC, SPECIES_SKRELL, SPECIES_SPACER, SPECIES_GRAVWORLDER, SPECIES_TRITONIAN, SPECIES_VATGROWN)
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
		to_chat(usr, "<span class='notice'>You deactivate the [src].</span>")
	else
		var/obj/O = new saved_item(src)
		if(!O) return
		var/obj/effect/dummy/cam/C = new /obj/effect/dummy/cam(usr.loc)
		C.activate(O, usr, saved_icon, saved_icon_state, saved_overlays, src)
		qdel(O)
		to_chat(usr, "<span class='notice'>You activate the [src].</span>")

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