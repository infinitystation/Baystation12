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
		melee = ARMOR_MELEE_KNIVES,
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
		melee = ARMOR_MELEE_KNIVES,
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
		melee = ARMOR_MELEE_KNIVES,
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
		melee = ARMOR_MELEE_KNIVES,
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

/obj/item/clothing/under/rank/medical/adro
	name = "cyber suit"
	desc = "Black comfortable uniform, modified for the user with a tail."
	species_restricted = list(SPECIES_TAJARA)
	icon_state = "adros"
	item_state = "adros"
	icon = CUSTOM_ITEM_OBJ
	item_icons = list(
		slot_w_uniform_str = CUSTOM_ITEM_MOB,
		)
	worn_state = "adros"
	trade_blacklisted = TRUE


/obj/item/clothing/glasses/hud/health/adro
	name = "cyber visor"
	desc = "A modern modified Ahdomanian made visor that allows the user to see while obscuring their eyes. This one has an in-built medical HUD."
	species_restricted = list(SPECIES_TAJARA)
	icon = CUSTOM_ITEM_OBJ
	icon_state = "adrov"
	item_icons = list(
		slot_glasses_str = CUSTOM_ITEM_MOB
	)
	item_state = "adrov"
	off_state = "adrov_off"
	hud_type = HUD_MEDICAL
	trade_blacklisted = TRUE

/obj/item/clothing/head/beret/adro
	name = "trauma-Team Beret"
	desc = "A modern beret with Venus Trauma-Team insiginia emblazoned on it. Also it looks like it was modified for Tajara needs."
	species_restricted = list(SPECIES_TAJARA)
	icon = CUSTOM_ITEM_OBJ
	icon_state = "adrob"
	item_icons = list(
		slot_head_str = CUSTOM_ITEM_MOB
	)
	item_state = "adrob"
	trade_blacklisted = TRUE

/obj/item/clothingbag/adro_edgy
	name = "clothing bag"
	desc = "This is clothing bag"
	trade_blacklisted = TRUE

/obj/item/clothingbag/adro_edgy/Initialize()
	. = ..()

	new /obj/item/clothing/head/helmet/space/void/medical/adro(src)
	new /obj/item/clothing/suit/space/void/medical/alt/adro(src)
	new /obj/item/clothing/gloves/latex/adro(src)
	new /obj/item/clothing/shoes/magboots/adro(src)
	new /obj/item/clothing/glasses/hud/health/adro(src)
	new /obj/item/clothing/head/beret/adro(src)
	new /obj/item/clothing/under/rank/medical/adro(src)

/obj/item/device/hailer/popit
	name = "pop it"
	desc = "Антистресс игрушка. Надпись на наклейке: Значок, что владелец дурачок."
	icon = CUSTOM_ITEM_OBJ
	icon_state = "popit"

/obj/item/device/hailer/popit/Initialize()
	. = ..()
	color = get_random_colour()

	use_message = "Попыт круче!"
	action_button_name = "Use Voice Helper"

/obj/item/device/hailer/popit/proc/reset_spamcheck()
	spamcheck = 0

/obj/item/device/hailer/popit/attack_self(mob/living/carbon/user as mob)
	if (spamcheck)
		return

	if(isnull(insults))
		playsound(get_turf(src), 'infinity/sound/customs/popit/popit.ogg', 60, 1, vary = 0)
		user.audible_message("<span class='warning'>[user]'s [name] rasps, \"[use_message]\"</span>", null, "<span class='warning'>\The [user] holds up \the [name].</span>")

		spamcheck = 1
		addtimer(CALLBACK(src, .proc/reset_spamcheck), 60 SECOND)

	else
		to_chat(user, SPAN_DANGER("*BZZZZZZZZT*"))

/obj/item/clothing/suit/space/vox/carapace/adro
	name = "blood-red armored raider spacesuit"
	desc = " Blood red space suit with reinforced inserts for loud raid, also has spikes, improved and reworked for vox by vox."
	icon = CUSTOM_ITEM_OBJ
	icon_state = "adrovoxs"
	item_state = "adrovoxs"
	item_icons = list(slot_wear_suit_str = CUSTOM_ITEM_MOB)
	sprite_sheets = list()
	trade_blacklisted = TRUE


/obj/item/clothing/head/helmet/space/vox/carapace/adro
	name = "blood-red armored raider helmet"
	desc = "Blood red helmet with reinforced inserts and five luminous visors, has a lot of tubes and it's clearly non-human shape."
	icon = CUSTOM_ITEM_OBJ
	icon_state = "adrovoxh"
	item_icons = list(
		slot_head_str = CUSTOM_ITEM_MOB
	)
	item_state = "adrovoxh"
	trade_blacklisted = TRUE

/obj/item/clothing/shoes/magboots/vox/adro
	name = "blood-red magclaws"
	desc = "Caw-caw."
	icon = CUSTOM_ITEM_OBJ
	icon_state = "adrovoxm"
	item_icons = list(
		slot_shoes_str = CUSTOM_ITEM_MOB
	)
	item_state = "adrovoxm"
	sprite_sheets = list(
		SPECIES_VOX = CUSTOM_ITEM_MOB
		)
	trade_blacklisted = TRUE

/obj/item/clothing/mask/gas/vox/adro
	name = "merchant mask"
	desc = "Modified vox mask, allow user to breath nitrogen from  atmosphere, consume food and drink."
	icon = CUSTOM_ITEM_OBJ
	icon_state = "adrovoxv"
	item_icons = list(
		slot_wear_mask_str = CUSTOM_ITEM_MOB
	)
	item_state = "adrovoxv"
	down_icon_state = "adrovoxv"
	sprite_sheets = list(
		SPECIES_VOX = CUSTOM_ITEM_MOB
		)
	trade_blacklisted = TRUE

/obj/item/clothing/glasses/night/adro
	name = "night-vision meson googles"
	desc = "Two in one, allow user to see in dark, also it look nice."
	icon = CUSTOM_ITEM_OBJ
	icon_state = "adrovoxn"
	item_icons = list(
		slot_glasses_str = CUSTOM_ITEM_MOB
	)
	sprite_sheets = list(
		SPECIES_VOX = CUSTOM_ITEM_MOB
		)
	item_state = "adrovoxn"
	off_state = "adrovoxn"
	trade_blacklisted = TRUE

/obj/item/clothing/under/vox/vox_robes/adro
	name = "modern suit"
	desc = "Just fashionable and comfortable suit for vox"
	icon = CUSTOM_ITEM_OBJ
	icon_state = "adrovoxr"
	item_icons = list(
		slot_w_uniform_str = CUSTOM_ITEM_MOB
	)
	item_state = "adrovoxr"
	worn_state = "adrovoxr"
	sprite_sheets = list(
		SPECIES_VOX = CUSTOM_ITEM_MOB
		)
	trade_blacklisted = TRUE

/obj/item/clothing/head/beret/adrovox
	name = "leader beret"
	desc = "Brilliant beautiful beret, show who is in charge here"
	icon = CUSTOM_ITEM_OBJ
	icon_state = "adrovoxb"
	item_icons = list(
		slot_head_str = CUSTOM_ITEM_MOB
	)
	item_state = "adrovoxb"
	species_restricted = list(SPECIES_VOX, SPECIES_VOX_ARMALIS)
	trade_blacklisted = TRUE

/obj/item/clothingbag/adro_vox
	name = "clothing bag"
	desc = "This is clothing bag"
	trade_blacklisted = TRUE

/obj/item/clothingbag/adro_vox/Initialize()
	. = ..()

	new /obj/item/clothing/suit/space/vox/carapace/adro(src)
	new /obj/item/clothing/head/helmet/space/vox/carapace/adro(src)
	new /obj/item/clothing/shoes/magboots/vox/adro(src)
	new /obj/item/clothing/mask/gas/vox/adro(src)
	new /obj/item/clothing/glasses/night/adro(src)
	new /obj/item/clothing/under/vox/vox_robes/adro(src)
	new /obj/item/clothing/head/beret/adrovox(src)
	new /obj/item/device/hailer/popit(src)
	new /obj/item/device/radio/headset/syndicate(src)
