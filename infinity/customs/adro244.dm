//	Hephaestus_outfit
/obj/item/clothing/mask/gas/half/rivalmask
	name = "thermal cover"
	desc = "A close-fitting mask with a single tear in the middle."
	icon = CUSTOM_ITEM_OBJ
	icon_state = "rivalmask_obj"
	item_state = "rivalmask"
	item_icons = list(slot_wear_mask_str = CUSTOM_ITEM_MOB)
	trade_blacklisted = TRUE

/obj/item/clothing/suit/storage/rivalcoat
	name = "hazard greatcoat"
	desc = "A large coat made of tarp-like material held together by a synthfiber layering and dotted with various hazard labels. An organic, almost heart-like cooling device is fit to the chest."
	icon = CUSTOM_ITEM_OBJ
	icon_state = "rivalcoat_obj"
	item_state = "rivalcoat"
	item_icons = list(slot_wear_suit_str = CUSTOM_ITEM_MOB)
	sprite_sheets = list()
	slots = 2
	valid_accessory_slots = list(ACCESSORY_SLOT_ARMOR_C)
	species_restricted = list(SPECIES_IPC)
	trade_blacklisted = TRUE

/obj/item/clothing/under/rank/security/rivalpants
	name = "dark slacks"
	desc = "Tight-fitting military-styled slacks held up on a sturdy green belt, shirt not included. Where you're going, you won't need one."
	icon = CUSTOM_ITEM_OBJ
	icon_state = "rivalpants_obj"
	item_state = "rivalpants"
	item_icons = list(slot_w_uniform_str = CUSTOM_ITEM_MOB)
	worn_state = null
	body_parts_covered = LOWER_TORSO|LEGS
	trade_blacklisted = TRUE

/obj/item/clothing/gloves/thick/duty/rivalgloves
	name = "thick fingerless gloves"
	desc = "A pair of hard-knuckled synthleather gloves."
	icon = CUSTOM_ITEM_OBJ
	icon_state = "rivalgloves_obj"
	item_state = "rivalgloves"
	item_icons = list(slot_gloves_str = CUSTOM_ITEM_MOB)
	trade_blacklisted = TRUE

/obj/item/clothing/shoes/jackboots/heph_boots/rivalboots
	name = "polished jackboots"
	desc = "A pair of steel-toed boots, a thunderous stomp accompanying each heavy step."
	icon = CUSTOM_ITEM_OBJ
	item_icons = list(slot_shoes_str = CUSTOM_ITEM_MOB)
	icon_state = "rivalboots_obj"
	item_state = "rivalboots"
	species_restricted = list(SPECIES_IPC)
	trade_blacklisted = TRUE

/obj/item/clothingbag/rivalset
	name = "outfit delivery package"
	desc = "A utility bag stamped with a Hephaestus logo and a 'prototype' warning label."

/obj/item/clothingbag/rivalset/New()
	..()
	new /obj/item/clothing/mask/gas/half/rivalmask(src)
	new /obj/item/clothing/suit/storage/rivalcoat(src)
	new /obj/item/clothing/under/rank/security/rivalpants(src)
	new /obj/item/clothing/gloves/thick/duty/rivalgloves(src)
	new /obj/item/clothing/shoes/jackboots/heph_boots/rivalboots(src)

//	dEUS VULT
/obj/item/clothing/head/helmet/space/void/pilot/adro
	name = "Knight helmet"
	desc = "This helmet look like part of ancient armor, but this one from Avalon and has hight-teck technologies, wich makes it more easier to wear and support HUDs."
	icon = CUSTOM_ITEM_OBJ
	icon_state = "adro_knight_helmet"
	item_state = "adro_knight_helmet"
	item_icons = list(slot_head_str = CUSTOM_ITEM_MOB)
	trade_blacklisted = TRUE

/obj/item/clothing/suit/space/void/pilot/adro
	name = "Knight armor"
	desc = "Personal metall armor with parts of hydraulic mechanism inside, they make this armor easier to wear and support their owner in all situations"
	icon = CUSTOM_ITEM_OBJ
	icon_state = "adro_knight_suit"
	item_state = "adro_knight_suit"
	item_icons = list(slot_wear_suit_str = CUSTOM_ITEM_MOB)
	trade_blacklisted = TRUE

	helmet = /obj/item/clothing/head/helmet/space/void/pilot/adro


// Edgy Furry suit
/obj/item/clothing/suit/space/void/medical/alt/adro
	name = "Trauma-Team Armour Carapace"
	desc = "TBlack and red suit with Central Venus Trauma-Team logo on it, modified for Tajara."
	icon = CUSTOM_ITEM_OBJ
	icon_state = "adro_edgy_furry_suit"
	item_icons = list(
		slot_wear_suit_str = CUSTOM_ITEM_MOB
	)
	item_state = "adro_edgy_furry_suit"
	armor = list(
		melee = ARMOR_MELEE_MAJOR,
		bullet = ARMOR_BALLISTIC_SMALL,
		laser = ARMOR_LASER_SMALL,
		bomb = ARMOR_BOMB_PADDED,
		bio = ARMOR_BIO_SHIELDED,
		rad = ARMOR_RAD_SMALL
		)
	body_parts_covered = UPPER_TORSO | LOWER_TORSO | LEGS | ARMS
	flags_inv = HIDEJUMPSUIT | HIDETAIL | CLOTHING_BULKY
	heat_protection = UPPER_TORSO | LOWER_TORSO | LEGS | ARMS
	max_heat_protection_temperature = SPACE_SUIT_MAX_HEAT_PROTECTION_TEMPERATURE
	max_pressure_protection = VOIDSUIT_MAX_PRESSURE
	species_restricted = list(SPECIES_TAJARA)
	trade_blacklisted = TRUE
	slowdown_general = 0

/obj/item/clothing/suit/space/void/medical/alt/adro/Initialize()
	. = ..()
	allowed += /obj/item/clothing/head/helmet/space/void/medical/adro
	verbs -= /obj/item/clothing/suit/space/void/verb/toggle_helmet

/obj/item/clothing/suit/space/void/medical/alt/adro/attackby(obj/item/W as obj, mob/user as mob)
	if ( !istype(user, /mob/living) )
		return

	else if ( istype(W, /obj/item/clothing/head/helmet/space) )
		to_chat(user, "Oh, no! \The [src] can not fit \the [W], all the space is occupied by wires and armor plates!")
		return

	else if ( istype(W, /obj/item/clothing/shoes/magboots) )
		to_chat(user, "Oh, no! \The [src] can not fit \the [W], this suit doesn't has boots!")
		return

	..()

/obj/item/clothing/head/helmet/space/void/medical/adro
	name = "Trauma-Team Helmet"
	desc = "A black helmet with Central Venus Trauma-Team logo"
	icon = CUSTOM_ITEM_OBJ
	icon_state = "adro_edgy_furry_mask"
	item_icons = list(
		slot_head_str = CUSTOM_ITEM_MOB
	)
	item_state = "adro_edgy_furry_mask"
	armor = list(
		melee = ARMOR_MELEE_MAJOR,
		bullet = ARMOR_BALLISTIC_SMALL,
		laser = ARMOR_LASER_SMALL,
		bomb = ARMOR_BOMB_PADDED,
		bio = ARMOR_BIO_SHIELDED,
		rad = ARMOR_RAD_SMALL
		)
	action_button_name = "TURN EDGY MODE"
	max_heat_protection_temperature = SPACE_SUIT_MAX_HEAT_PROTECTION_TEMPERATURE
	max_pressure_protection = VOIDSUIT_MAX_PRESSURE
	species_restricted = list(SPECIES_TAJARA)
	trade_blacklisted = TRUE

	var/edgy_mode = FALSE

/obj/item/clothing/head/helmet/space/void/medical/adro/attack_self(mob/user)
	if (edgy_mode)
		edgy_mode = FALSE
		icon_state = "[initial(icon_state)]_on"
		item_state = "[initial(item_state)]_on"
		set_light(0.5, 1, 4, l_color = COLOR_RED)

	else
		edgy_mode = TRUE
		icon_state = initial(icon_state)
		item_state = initial(item_state)
		set_light(0)

	update_icon()
	update_clothing_icon()
	user.update_action_buttons()

/obj/item/clothing/gloves/latex/adro
	name = "Cyber gloves"
	desc = "Space-proof black gloves with metal padding, red parts and cybernetics in it."
	icon = CUSTOM_ITEM_OBJ
	icon_state = "adro_edgy_furry_gloves"
	item_icons = list(
		slot_gloves_str = CUSTOM_ITEM_MOB
	)
	item_state = "adro_edgy_furry_gloves"
	siemens_coefficient = 0
	armor = list(
		melee = ARMOR_MELEE_MAJOR,
		bullet = ARMOR_BALLISTIC_SMALL,
		laser = ARMOR_LASER_SMALL,
		bomb = ARMOR_BOMB_PADDED,
		bio = ARMOR_BIO_SHIELDED,
		rad = ARMOR_RAD_SMALL
		)
	max_heat_protection_temperature = SPACE_SUIT_MAX_HEAT_PROTECTION_TEMPERATURE
	max_pressure_protection = VOIDSUIT_MAX_PRESSURE
	species_restricted = list(SPECIES_TAJARA)
	trade_blacklisted = TRUE

/obj/item/clothing/shoes/magboots/adro
	name = "Cyber boots"
	desc = "Space-proof black boots with metal padding and cybernetics in it"
	icon = CUSTOM_ITEM_OBJ
	icon_state = "adro_edgy_furry_boots"
	item_icons = list(
		slot_shoes_str = CUSTOM_ITEM_MOB
	)
	item_state = "adro_edgy_furry_boots"
	armor = list(
		melee = ARMOR_MELEE_MAJOR,
		bullet = ARMOR_BALLISTIC_SMALL,
		laser = ARMOR_LASER_SMALL,
		bomb = ARMOR_BOMB_PADDED,
		bio = ARMOR_BIO_SHIELDED,
		rad = ARMOR_RAD_SMALL
		)
	action_button_name = "Turn on mag-mode"
	icon_base = null
	max_heat_protection_temperature = SPACE_SUIT_MAX_HEAT_PROTECTION_TEMPERATURE
	max_pressure_protection = VOIDSUIT_MAX_PRESSURE
	overshoes = 0
	species_restricted = list(SPECIES_TAJARA)
	trade_blacklisted = TRUE

/obj/item/clothingbag/adro_edgy
	name = "clothing bag"
	desc = "This is clothing bag"

/obj/item/clothingbag/adro_edgy/Initialize()
	. = ..()

	new /obj/item/clothing/head/helmet/space/void/medical/adro(src)
	new /obj/item/clothing/suit/space/void/medical/alt/adro(src)
	new /obj/item/clothing/gloves/latex/adro(src)
	new /obj/item/clothing/shoes/magboots/adro(src)
