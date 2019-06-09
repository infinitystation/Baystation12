/obj/item/clothing/suit/bio_suit/virology/jacking
	name = "The biohazard suit"
	desc = "In general, the kit is a well-prepared kit for epidemiological analysis, planning anti-epidemic measures, epidemiological surveys of foci of infectious diseases."
	item_state = "biohazard_suit"
	item_icons = list(
		slot_wear_suit_str = CUSTOM_ITEM_MOB,
		)

/obj/item/clothing/head/bio_hood/virology/jacking
	name = "The biohazard suit"
	desc = "In general, the kit is a well-prepared kit for epidemiological analysis, planning anti-epidemic measures, epidemiological surveys of foci of infectious diseases."
	item_state = "biohazard_hood"
	item_icons = list(
		slot_head_str = CUSTOM_ITEM_MOB,
		)

/obj/item/clothing/accessory/badge/holo/jacking
	name = "IHO representation card"
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
	name = "The biohazard dufflebag."
	desc = "In general, the kit is a well-prepared kit for epidemiological analysis, planning anti-epidemic measures, epidemiological surveys of foci of infectious diseases."
	icon = CUSTOM_ITEM_OBJ
	icon_state = "biohazard_duffle"
	item_state = "biohazard_duffle"
	item_icons = list(
		slot_l_hand_str = CUSTOM_ITEM_MOB,
		slot_r_hand_str = CUSTOM_ITEM_MOB,
		)
/obj/item/clothing/accessory/badge/holo/jacking
	name = "The biohazard suit"
	desc = "In general, the kit is a well-prepared kit for epidemiological analysis, planning anti-epidemic measures, epidemiological surveys of foci of infectious diseases."

/obj/item/weapon/storage/backpack/dufflebag/biohazard/jacking
	startswith = list(
	/obj/item/weapon/clothingbag/biohazard
	)

/obj/item/weapon/clothingbag/biohazard/Initialize()
	new /obj/item/clothing/suit/bio_suit/virology/jacking(src)
	new /obj/item/clothing/head/bio_hood/virology/jacking(src)
	new /obj/item/clothing/accessory/badge/holo/jacking(src)
