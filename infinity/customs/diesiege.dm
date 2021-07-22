/obj/item/clothing/under/thermal/siegeuni
	name = "IonLok Suit"
	desc = "The IonLok suit AP-04-SL has advanced technology within tight body-hugging garments and materials. \
			It provides environmental protection from various temperatures. \
			This one is a special model with shorts made for amputees. \
			It has a patch with \"M. Werner B(III)-\" written on it."
	icon = CUSTOM_ITEM_OBJ
	item_icons = list(slot_w_uniform_str = CUSTOM_ITEM_MOB)
	icon_state = "siegeuni"
	item_state = "siegeuni"
	worn_state = "siegeuni"
	thermostat = T0C + 36
	trade_blacklisted = TRUE

/obj/item/storage/backpack/siegepack
	name = "Belt Poaches"
	desc = "A belt designed to be a convenient way of carrying supplies in countless poaches while keeping the hands free. \
			It is made out of durable material to survive the struggles a field researcher may face."
	max_storage_space = DEFAULT_BACKPACK_STORAGE + 8
	icon = CUSTOM_ITEM_OBJ
	icon_state = "siegepack"
	item_state = "siegepack"
	item_icons = list(slot_back_str = CUSTOM_ITEM_MOB)
	trade_blacklisted = TRUE

/datum/robolimb/siegecustom/auronsol
	company = "Auron Solutions partial legs prothetics"
	icon = 'infinity/icons/mob/human_races/cyberlimbs/auronsol/auronsol.dmi'
	applies_to_part = list(BP_L_LEG, BP_R_LEG, BP_L_FOOT, BP_R_FOOT)
	brute_mod = 1.5
	burn_mod = 1.5
	speed_mod = -0.18
	allowed_ckeys = list("diesiege")

/obj/item/clothingbag/diesiegeset
	name = "IonLok outfit pack"
	desc = "A utility bag. Simple as that"

/obj/item/clothingbag/diesiegeset/New()
	. = ..()
	new /obj/item/clothing/mask/gas/siegemask(src)
	new /obj/item/clothing/under/thermal/siegeuni(src)
	new /obj/item/storage/backpack/siegepack(src)
	new /obj/item/clothing/head/helmet/space/void/atmos/alt/diesiege(src)
	new /obj/item/clothing/suit/space/void/atmos/alt/diesiege(src)

/obj/item/clothing/suit/storage/hooded/diesiege
	name = "Rogue Trenchcoat"
	desc = "Fashionable trenchcoat with a hood and almost no trace of wear. The wool base contrasts with the synthetic details."
	icon = CUSTOM_ITEM_OBJ
	icon_state = "siegecoat"
	min_cold_protection_temperature = ARMOR_MIN_COLD_PROTECTION_TEMPERATURE
	cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	item_flags = ITEM_FLAG_THICKMATERIAL
	item_icons = list(slot_wear_suit_str = CUSTOM_ITEM_MOB)
	allowed = list(
		/obj/item/device/flashlight,
		/obj/item/paper,
		/obj/item/pen,
		/obj/item/reagent_containers/food/drinks/flask,
		/obj/item/storage/box/matches,
		/obj/item/storage/fancy/cigarettes,
		/obj/item/tank
	)
	action_button_name = "Toggle Hood"
	hoodtype = /obj/item/clothing/head/siegecoathood
	siemens_coefficient = 0.6
	trade_blacklisted = TRUE

/obj/item/clothing/head/siegecoathood
	name = "Trenchcoat Hood"
	desc = "A hood attached to a trenchcoat."
	icon_state = "siegecoat_hood"
	icon = CUSTOM_ITEM_OBJ
	item_icons = list(slot_head_str = CUSTOM_ITEM_MOB)
	body_parts_covered = HEAD
	item_flags = ITEM_FLAG_THICKMATERIAL
	min_cold_protection_temperature = ARMOR_MIN_COLD_PROTECTION_TEMPERATURE
	cold_protection = HEAD
	flags_inv = HIDEEARS | BLOCKHAIR
	trade_blacklisted = TRUE

/obj/item/clothing/suit/storage/hooded/diesiege/on_update_icon()
	if(suittoggled)
		item_state_slots = list(slot_wear_suit_str = "siegecoat_t")
	else
		item_state_slots = list(slot_wear_suit_str = "siegecoat")

/obj/item/clothing/under/thermal/siegecyberuni
	name = "Casual tight suit"
	desc = "Tight leather pants made of durable leather, short jacket with long sleeves - The current rage of Verlise City"
	icon = CUSTOM_ITEM_OBJ
	item_icons = list(slot_w_uniform_str = CUSTOM_ITEM_MOB)
	icon_state = "siegecyberuni"
	item_state = "siegecyberuni"
	worn_state = "siegecyberuni"
	thermostat = T0C + 36
	trade_blacklisted = TRUE

/obj/item/storage/backpack/siegesatchel
	name = "Leather satchel"
	desc = "Leather satchel with a huge amount of synthetic patches. Looks expensive."
	max_storage_space = DEFAULT_BACKPACK_STORAGE + 8
	icon = CUSTOM_ITEM_OBJ
	icon_state = "siegesatchel"
	item_state = "siegesatchel"
	item_icons = list(slot_back_str = CUSTOM_ITEM_MOB)
	trade_blacklisted = TRUE

/obj/item/clothingbag/diesiegekayset
	name = "CasualClothes outfit pack"
	desc = "A utility bag. Simple as that"
	trade_blacklisted = TRUE

/obj/item/clothingbag/diesiegekayset/New()
	. = ..()
	new /obj/item/clothing/suit/storage/hooded/diesiege(src)
	new /obj/item/clothing/under/thermal/siegecyberuni(src)
	new /obj/item/storage/backpack/siegesatchel(src)


// Voidsuit
/obj/item/clothing/mask/gas/siegemask
	name = "IonLok panoramic gasmask"
	desc = "The IonLok gasmask AP-04-  is a face-covering globose mask that can be connected to an air supply. \
			It has robust layer of anti-reflective coating combined with phoron-hardened ultra-clear glass. \
			Filters harmful gases from the air."
	icon = CUSTOM_ITEM_OBJ
	icon_state = "siegemask"
	item_state = "siegemask"
	item_icons = list(slot_wear_mask_str = CUSTOM_ITEM_MOB)
	tint = 0
	flash_protection = FLASH_PROTECTION_MAJOR
	armor = list(
		melee = ARMOR_MELEE_MINOR,
		bullet = ARMOR_BALLISTIC_MINOR,
		laser = ARMOR_LASER_MINOR,
		bomb = ARMOR_BOMB_PADDED,
		bio = ARMOR_BIO_SHIELDED,
		rad = ARMOR_RAD_SHIELDED
	)
	max_heat_protection_temperature = FIRE_HELMET_MAX_HEAT_PROTECTION_TEMPERATURE
	max_pressure_protection = FIRESUIT_MAX_PRESSURE
	action_button_name = "Scan user"
	trade_blacklisted = TRUE

/obj/item/clothing/mask/gas/siegemask/proc/scan_user(var/mob/living/carbon/human/owner)
	var/dat = display_medical_data(owner.get_raw_medical_data(), SKILL_MAX)
	dat += text("<BR><A href='?src=\ref[];mach_close=scanconsole'>Close</A>", usr)
	show_browser(owner, dat, "window=scanconsole;size=430x600")

/obj/item/clothing/mask/gas/siegemask/ui_action_click()
	scan_user(usr)


/obj/item/clothing/head/helmet/space/void/atmos/alt/diesiege
	name = "IonLok hooded helmet"
	desc = "The IonLok Hood AP-04-SL/H has advanced technology within tight body-hugging garments and materials. \
			Seems like a part of the environmental suit. \
			It provides environmental protection from various temperatures. \
			It has some bracings for a mask."
	armor = list(
		melee = ARMOR_MELEE_RESISTANT,
		bullet = ARMOR_BALLISTIC_MINOR,
		laser = ARMOR_LASER_MINOR,
		bomb = ARMOR_BOMB_PADDED,
		bio = ARMOR_BIO_SHIELDED,
		rad = ARMOR_RAD_SHIELDED
	)
	body_parts_covered = HEAD
	flags_inv = BLOCKHEADHAIR
	tint = TINT_NONE
	item_flags = ITEM_FLAG_THICKMATERIAL
	flash_protection = FLASH_PROTECTION_NONE
	light_overlay = "helmet_light_dual"
	icon = CUSTOM_ITEM_OBJ
	icon_state = "siegehood"
	item_state = "siegehood"
	item_icons = list(slot_head_str = CUSTOM_ITEM_MOB)
	trade_blacklisted = TRUE


/obj/item/clothing/suit/space/void/atmos/alt/diesiege
	name = "IonLok enviromental suit"
	desc = "The IonLok suit AP-04-SL-H has advanced \
			technology within tight body-hugging garments and materials. \
			It provides environmental protection from various temperatures. \
			It has a patch with \"M. Werner B(III)-\" written on it."
	armor = list(
		melee = ARMOR_MELEE_RESISTANT,
		bullet = ARMOR_BALLISTIC_MINOR,
		laser = ARMOR_LASER_MINOR,
		bomb = ARMOR_BOMB_PADDED,
		bio = ARMOR_BIO_SHIELDED,
		rad = ARMOR_RAD_SHIELDED
	)
	w_class = ITEM_SIZE_NORMAL
	icon_state = "siege_megan_suit"
	item_state = "siege_megan_suit"
	icon = CUSTOM_ITEM_OBJ
	item_icons = list(slot_wear_suit_str = CUSTOM_ITEM_MOB)
	boots = /obj/item/clothing/shoes/magboots
	trade_blacklisted = TRUE

/obj/item/clothing/suit/space/void/atmos/alt/diesiege/New()
	. = ..()
	slowdown_per_slot[slot_wear_suit] = null

/*
 * Lorriman's alcho
 */
/datum/reagent/ethanol/diesiege_lorrakevitt
	name = "Lorrimanian Akevitt"
	description = "A hearty and strong distilled spirit drink typically consumed on ice deserts of Lorriman."
	taste_description = "oaky aqua vitae and hearty spices"
	taste_mult = 1.5
	color = "#bdb6a9"
	strength = 12

	glass_name = "Lorrimanian Akevitt"
	glass_desc = "A hearty and strong distilled spirit drink typically consumed on ice deserts of Lorriman."

/obj/item/reagent_containers/food/drinks/bottle/diesiege_lorrakevitt
	name = "Hub's Choice Akevitt"
	desc = "A bottle of rare Lorrimanian distilled 88 proof (50%) spirit drink. \
			Label says - Flavoured with caraway, cardamom, cumin, anise, fennel and orange peel since 2225AD"
	icon = CUSTOM_ITEM_OBJ
	icon_state = "siege_bottle_akevitt"
	volume = 200
	center_of_mass = "x=16; y=16"
	isGlass = FALSE

/obj/item/reagent_containers/food/drinks/bottle/diesiege_lorrakevitt/Initialize()
	. = ..()
	reagents.add_reagent(/datum/reagent/ethanol/diesiege_lorrakevitt, 200)
	var/namepick = pick("Ice Desert", "Hub's Choice", "Academical", "Kelvin's", "Newtonian", "Pascal's")
	var/typepick = pick("Premium Akevitt", "Hearty Akvavit", "Aquavit", "Special Akevitt")
	var/agedyear = GLOB.using_map.game_year - rand(15, 75)
	SetName("[namepick] [typepick]")
	desc += " This bottle is marked as [agedyear] Vintage."
