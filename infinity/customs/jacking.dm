//military gas mask xM15

/obj/item/clothing/mask/gas/custom
	name = "military gas mask"
	desc = "An improved military gas mask M15, most often used by PMCs. It has built-in night vision device and improved breathing system."
	icon = CUSTOM_ITEM_OBJ
	icon_state = "gas_mask"
	item_state = "gas_mask_face"
	item_icons = list(
		slot_l_hand_str = CUSTOM_ITEM_MOB,
		slot_r_hand_str = CUSTOM_ITEM_MOB,
		slot_wear_mask_str = CUSTOM_ITEM_MOB
	)
	item_state_slots = list(
		slot_l_hand_str = "gas_mask_lh",
		slot_r_hand_str = "gas_mask_rh"
	)

//SCP helmet

/obj/item/clothing/head/helmet/x_four
	name = "\improper X-4 helmet"
	desc = "The glass of the helmet is made of armored glass, from the side you can see the laser designator. SCP inscription on back of helmet."
	icon = CUSTOM_ITEM_OBJ
	icon_state = "iconscphelmet"
	//item_state = "scphelmetonmob"
	item_icons = list(
		slot_head_str = CUSTOM_ITEM_MOB,
		slot_l_hand_str = CUSTOM_ITEM_MOB,
		slot_r_hand_str = CUSTOM_ITEM_MOB
	)
	item_state_slots = list(
		slot_head_str = "scphelmetonmob",
		slot_l_hand_str = "scphelmrlefthand",
		slot_r_hand_str = "scphelmrighthand"
	)

//visor

/obj/item/clothing/glasses/sunglasses/sechud/toggle/stv
	name = "tactical visor"
	desc = "The special tactical visor, pink one."
	icon = CUSTOM_ITEM_OBJ
	icon_state = "stv"
	item_state = "stv"
	off_state = "stv_off"
	item_icons = list(slot_glasses_str = CUSTOM_ITEM_MOB)
	electric = TRUE
	action_button_name = "Toggle Visor"

//biohazard kit

/obj/item/clothing/suit/bio_suit/virology/jacking
	name = "biohazard suit"
	desc = "A well-prepared kit for epidemiological analysis, planning anti-epidemic measures, epidemiological surveys of foci of infectious diseases."
	item_icons = list(
		slot_wear_suit_str = CUSTOM_ITEM_MOB,
		)
	item_state_slots = list(
		slot_wear_suit_str = "bhs",
	)

/obj/item/clothing/head/bio_hood/virology/jacking
	name = "biohazard hood"
	desc = "A well-prepared kit for epidemiological analysis, planning anti-epidemic measures, epidemiological surveys of foci of infectious diseases."
	item_state = "biohazard_hood"
	item_icons = list(
		slot_head_str = CUSTOM_ITEM_MOB,
		)

/obj/item/clothing/accessory/badge/holo/jacking
	name = "representation card"
	icon = CUSTOM_ITEM_OBJ
	icon_state = "IHO_badge"
	badge_string = "Medical"
	badge_access = access_medical

/obj/item/clothing/accessory/badge/holo/jacking/attackby(var/obj/item/O as obj, var/mob/user as mob)
	if(istype(O, /obj/item/weapon/card/id) || istype(O, /obj/item/modular_computer))
		var/obj/item/weapon/card/id/id_card = O.GetIdCard()
		if(!id_card)
			return
		if((badge_access in id_card.access) || emagged)
			to_chat(user, "You imprint your ID details onto the badge.")
			set_name("Doctor-Epidemiologist [id_card.registered_name]")
			set_desc("Doctor-Epidemiologist [user] Interstellar Health Organization")
		else
			to_chat(user, "[src] rejects your ID, and flashes 'Insufficient access!'")
		return
	..()

/obj/item/weapon/storage/backpack/dufflebag/biohazard
	name = "biohazard dufflebag"
	desc = "A well-prepared kit for epidemiological analysis, planning anti-epidemic measures, epidemiological surveys of foci of infectious diseases."
	icon = CUSTOM_ITEM_OBJ
	icon_state = "biohazard_duffle"
	item_state = "biohazard_duffle"
	item_icons = list(
		slot_l_hand_str = CUSTOM_ITEM_MOB,
		slot_r_hand_str = CUSTOM_ITEM_MOB,
		)

/obj/item/weapon/storage/backpack/dufflebag/biohazard/jacking
	startswith = list(
	/obj/item/weapon/clothingbag/biohazard
	)

/obj/item/weapon/clothingbag/biohazard/Initialize()
	new /obj/item/clothing/suit/bio_suit/virology/jacking(src)
	new /obj/item/clothing/head/bio_hood/virology/jacking(src)
	new /obj/item/clothing/accessory/badge/holo/jacking(src)
