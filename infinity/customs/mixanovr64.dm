/obj/item/material/hatchet/machete/deluxe/mixa
	name = "Energy deluxe machete"
	desc = "Black handle with button on bottom"
	icon = CUSTOM_ITEM_OBJ
	icon_state = "mach_active"
	item_icons = list(
		slot_l_hand_str = 'icons/mob/onmob/guns/guns_l.dmi',
		slot_r_hand_str = 'icons/mob/onmob/guns/guns_r.dmi',
		)
	item_state = null
	force = 16
	throwforce = 13
	trade_blacklisted = TRUE
	applies_material_name = FALSE
	var/active = TRUE

/obj/item/material/hatchet/machete/deluxe/mixa/Initialize()
	. = ..()
	icon_state = "mach_active"

/obj/item/material/hatchet/machete/deluxe/mixa/attack_self(mob/living/user as mob)
	active = !active

	if(active)
		force = initial(force)
		throwforce = initial(throwforce)
		icon_state = initial(icon_state)
		w_class = initial(w_class)
	else
		force = 3
		throwforce = 3
		icon_state = "mach_fold"
		w_class = ITEM_SIZE_SMALL
		update_icon()

	if(istype(user,/mob/living/carbon/human))
		var/mob/living/carbon/human/H = user
		H.update_inv_l_hand()
		H.update_inv_r_hand()
	add_fingerprint(user)
	return

// Pulse pistol "Venger"
/obj/item/gun/energy/pulse_rifle/pistol/mixa
	name = "Pulse pistol \"Venger\""
	desc = "The Hel-Tek PS-03 pulse pistol, highly rare personal defence weapon."
	icon = CUSTOM_GUN_ICONS
	item_icons = list(
		slot_r_hand_str = CUSTOM_GUN_INHANDS_RIGHT,
		slot_l_hand_str = CUSTOM_GUN_INHANDS_LEFT,
		)
	icon_state = "mixanov_pulse_pistol"
	item_state = "mixanov_pulse_pistol"
	trade_blacklisted = TRUE

/obj/item/weapon_case/custom/mixa
	owner = "Micheal White"
	holding_weapon = /obj/item/gun/energy/pulse_rifle/pistol/mixa
	trade_blacklisted = TRUE

/obj/item/clothingbag/mixa
	name = "clothing bag"
	desc = "Michael White's property"
	trade_blacklisted = TRUE

/obj/item/clothingbag/mixa/Initialize()
	. = ..()
	new /obj/item/weapon_case/custom/mixa(src)
	new /obj/item/clothing/accessory/storage/holster/hip(src)


// MDSF
/obj/item/clothing/under/mixa
	name = "MDSF Uniform"
	desc = "Martian Special Defence Forces uniform, reshaped into PCRC design."
	icon = CUSTOM_ITEM_OBJ
	item_icons = list(slot_w_uniform_str = CUSTOM_ITEM_MOB)
	icon_state = "novak_under"
	item_state = "novak_under"
	body_parts_covered = UPPER_TORSO | LOWER_TORSO | LEGS | ARMS
	trade_blacklisted = TRUE

/obj/item/clothing/suit/armor/pcarrier/medium/nt/mixa
	name = "MDSF plate carrier"
	desc = "Martian Special Defence Forces light plate carrier vest."
	icon = CUSTOM_ITEM_OBJ
	item_icons = list(
		slot_wear_suit_str = CUSTOM_ITEM_MOB,
		slot_r_hand_str = CUSTOM_ITEM_INHANDS_RIGHT,
		slot_l_hand_str = CUSTOM_ITEM_INHANDS_LEFT)
	icon_state = "novak_pcarrier"
	item_state = "novak_pcarrier"
	starting_accessories = list()
	trade_blacklisted = TRUE

/obj/item/clothing/accessory/legguards/mixa
	accessory_icons = list(
		slot_tie_str = CUSTOM_ITEM_MOB,
		slot_wear_suit_str = CUSTOM_ITEM_MOB)
	icon = CUSTOM_ITEM_OBJ
	icon_override = CUSTOM_ITEM_MOB
	icon_state = "novak_legguards"
	trade_blacklisted = TRUE

/obj/item/clothing/accessory/armguards/mixa
	accessory_icons = list(
		slot_tie_str = CUSTOM_ITEM_MOB,
		slot_wear_suit_str = CUSTOM_ITEM_MOB)
	icon = CUSTOM_ITEM_OBJ
	icon_override = CUSTOM_ITEM_MOB
	icon_state = "novak_armguards"
	trade_blacklisted = TRUE

/obj/item/custkit/legguard_mixa
	name = "MDSF legguard custom kit"
	input = /obj/item/clothing/accessory/legguards
	output = /obj/item/clothing/accessory/legguards/mixa
	trade_blacklisted = TRUE

/obj/item/custkit/armguard_mixa
	name = "MDSF armguard custom kit"
	input = /obj/item/clothing/accessory/armguards
	output = /obj/item/clothing/accessory/armguards/mixa
	trade_blacklisted = TRUE

/obj/item/clothing/head/helmet/nt/mixa
	name = "MDSF helmet"
	desc = "A helmet painted with red markings. \
			Has a 'PRIVATE SECURITY' printed on the back in red lettering."
	icon = CUSTOM_ITEM_OBJ
	item_icons = list(
		slot_head_str = CUSTOM_ITEM_MOB,
		slot_r_hand_str = CUSTOM_ITEM_INHANDS_RIGHT,
		slot_l_hand_str = CUSTOM_ITEM_INHANDS_LEFT)
	icon_state = "novak_helmet"
	item_state = "novak_helmet"
	flags_inv = HIDEFACE | HIDEEYES | HIDEEARS | BLOCKHAIR
	body_parts_covered = HEAD | FACE | EYES
	trade_blacklisted = TRUE

/obj/item/custkit/helmet_mixa
	name = "MDSF helmet custom kit"
	input = /obj/item/clothing/head/helmet/nt
	output = /obj/item/clothing/head/helmet/nt/mixa
	trade_blacklisted = TRUE

/obj/item/clothingbag/mdsf_mixa
	name = "MDSF clothing bag"
	desc = "clothing bag with MDSF tag"
	trade_blacklisted = TRUE

/obj/item/clothingbag/mdsf_mixa/Initialize()
	. = ..()
	new /obj/item/clothing/suit/armor/pcarrier/medium/nt/mixa(src)
	new /obj/item/clothing/under/mixa(src)
	new /obj/item/custkit/armguard_mixa(src)
	new /obj/item/custkit/helmet_mixa(src)
	new /obj/item/custkit/legguard_mixa(src)
	new /obj/item/clothing/mask/ai/mixa(src)

/obj/item/clothing/mask/ai/mixa
	name = "CAM UI balaclava"
	desc = "Balaclava with connected to cameras glasses."
	icon = CUSTOM_ITEM_OBJ
	item_icons = list(
		slot_wear_mask_str = CUSTOM_ITEM_MOB
	)
	icon_state = "novak_mask"
	item_state = "novak_mask"
	flags_inv = BLOCKHAIR


// Exploration Leader's RIG
/obj/item/clothing/head/helmet/space/rig/command/exploration/mixanovr64
	icon = CUSTOM_ITEM_OBJ
	item_icons = list(slot_head_str = CUSTOM_ITEM_MOB)
	icon_state = "mixanovr64_el_rig_helmet"

/obj/item/clothing/suit/space/rig/command/mixanovr64
	icon = CUSTOM_ITEM_OBJ
	item_icons = list(slot_wear_suit_str = CUSTOM_ITEM_MOB)
	icon_state = "mixanovr64_el_rig_chest"

/obj/item/clothing/gloves/rig/command/mixanovr64
	icon = CUSTOM_ITEM_OBJ
	item_icons = list(slot_gloves_str = CUSTOM_ITEM_MOB)
	icon_state = "mixanovr64_el_rig_gloves"

/obj/item/clothing/shoes/magboots/rig/command/mixanovr64
	icon = CUSTOM_ITEM_OBJ
	item_icons = list(slot_shoes_str = CUSTOM_ITEM_MOB)
	icon_state = "mixanovr64_el_rig_boots"

/obj/item/rig/exploration/mixanovr64
	name = "modified EL RIG"
	desc = "Expedition Leader RIG, customly redisigned with new parts and paint."
	suit_type = "modified EL RIG"
	icon = CUSTOM_ITEM_OBJ
	icon_override = CUSTOM_ITEM_MOB
	icon_state = "mixanovr64_el_rig"
	custom = TRUE
	piece_icon_state_overrides = list(
		"helmet" = "mixanovr64_el_rig_helmet",
		"chest" = "mixanovr64_el_rig_chest",
		"gloves" = "mixanovr64_el_rig_gloves",
		"boots" = "mixanovr64_el_rig_boots"
	)

	helm_type = /obj/item/clothing/head/helmet/space/rig/command/exploration/mixanovr64
	chest_type = /obj/item/clothing/suit/space/rig/command/mixanovr64
	glove_type = /obj/item/clothing/gloves/rig/command/mixanovr64
	boot_type = /obj/item/clothing/shoes/magboots/rig/command/mixanovr64

	initial_modules = list(
		/obj/item/rig_module/cooling_unit,
		/obj/item/rig_module/device/anomaly_scanner,
		/obj/item/rig_module/device/flash,
		/obj/item/rig_module/grenade_launcher/light,
		/obj/item/rig_module/maneuvering_jets,
	)

	trade_blacklisted = TRUE

/obj/item/custkit/mixanovr64_el_rig
	name = "modkit for EL rig"
	input = /obj/item/rig/exploration
	output = /obj/item/rig/exploration/mixanovr64
	trade_blacklisted = TRUE

/obj/item/melee/energy/sword/mixanovr64
	name = "energy sabre"
	desc = "Strange energy sword with malfunctioned crystal, that reduced combat characteristics."
	icon = CUSTOM_ITEM_OBJ
	item_icons = list(
		slot_r_hand_str = CUSTOM_ITEM_INHANDS_RIGHT,
		slot_l_hand_str = CUSTOM_ITEM_INHANDS_LEFT
	)
	icon_state = "mixanovr64_saber"
	blade_color = "green"
	base_parry_chance = 40
	active_force = 16  // Like in titanium machete

/obj/item/melee/energy/sword/mixanovr64/Initialize()
	. = ..()
	active_icon = "[icon_state]_on"
