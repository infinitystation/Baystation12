/obj/item/crowbar/kek
	name = "gold crowbar"
	desc = "A crowbar cast in gold with a mahogany handle. On the handle you can notice an engraving with the inscription: \"RAMPAGE!!!\""
	icon = CUSTOM_ITEM_OBJ
	icon_state = "kekcrowbar"
	item_state = "kekcrowbar"
	item_icons = list(
		slot_r_hand_str = CUSTOM_ITEM_INHANDS_RIGHT,
		slot_l_hand_str = CUSTOM_ITEM_INHANDS_LEFT
	)
	matter = list(MATERIAL_GOLD = 200)
	trade_blacklisted = TRUE

/obj/item/crowbar/kek/attack_self(mob/user)
	. = ..()
	playsound(src, 'infinity/sound/customs/thekekman666/crowbar/crowbar_attack_self.ogg', 100, 1)


// Another HL BS item - Suit
/obj/item/clothing/head/helmet/space/void/excavation/thekekman666
	name = "HEVY Suit Helmet"
	desc = "A stupid Helmet."
	icon = CUSTOM_ITEM_OBJ
	item_icons = list(slot_head_str = CUSTOM_ITEM_MOB)
	icon_state = "kekman_hev_helmet"
	item_state = "kekman_hev_helmet"
	trade_blacklisted = TRUE

/obj/item/clothing/suit/space/void/excavation/thekekman666
	name = "HEVY Suit"
	desc = "A full-body protective suit designed to protect scientists working in dangerous conditions."
	icon = CUSTOM_ITEM_OBJ
	item_icons = list(slot_wear_suit_str = CUSTOM_ITEM_MOB)
	icon_state = "kekman_hev_orange"
	item_state = "kekman_hev_orange"
	trade_blacklisted = TRUE

/obj/item/clothing/suit/space/void/excavation/thekekman666/attackby(obj/item/W, mob/user)
	. = ..()
	playsound(src, 'infinity/sound/customs/thekekman666/hevy_suit/hevy_suit_attack_by.ogg', 10, 1)

/obj/item/clothing/suit/space/void/excavation/thekekman666/create_breaches(damtype, amount)
	. = ..()
	playsound(src, 'infinity/sound/customs/thekekman666/hevy_suit/hevy_suit_destroyed.ogg', 10, 1)

/obj/item/custkit/thekekman666_hevy_helmet
	name = "hevy helmet modkit"
	input = /obj/item/clothing/head/helmet/space/void/excavation
	output = /obj/item/clothing/head/helmet/space/void/excavation/thekekman666
	trade_blacklisted = TRUE

/obj/item/custkit/thekekman666_hevy_suit
	name = "hevy suit modkit"
	input = /obj/item/clothing/suit/space/void/excavation
	output = /obj/item/clothing/suit/space/void/excavation/thekekman666
	trade_blacklisted = TRUE

/obj/item/clothingbag/thekekman666_hevy
	name = "HEVY suit modkit bag"
	desc = "The owner of this bag is not very smart"
	trade_blacklisted = TRUE

/obj/item/clothingbag/thekekman666_hevy/Initialize()
	. = ..()
	new /obj/item/custkit/thekekman666_hevy_helmet(src)
	new /obj/item/custkit/thekekman666_hevy_suit(src)
