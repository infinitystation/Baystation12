/*
 * BASE TYPE
 */
/obj/item/weapon/rig/command
	name = "command HCM"
	suit_type = "command hardsuit"
	icon = 'maps/sierra/icons/obj/uniques.dmi'
	desc = "A specialized hardsuit rig control module issued to command staff of the NanoTrasen and their peers."
	icon_state = "command_rig"
	armor = list(melee = 25, bullet = 25, laser = 15, energy = 25, bomb = 40, bio = 100, rad = 40)
	online_slowdown = 0.50
	offline_slowdown = 2
	offline_vision_restriction = TINT_HEAVY

	chest_type = /obj/item/clothing/suit/space/rig/command
	helm_type = /obj/item/clothing/head/helmet/space/rig/command
	boot_type = /obj/item/clothing/shoes/magboots/rig/command
	glove_type = /obj/item/clothing/gloves/rig/command

	allowed = list(/obj/item/weapon/gun, /obj/item/device/flashlight, /obj/item/weapon/tank, /obj/item/device/suit_cooling_unit)
	req_access = list(access_heads) //bridge

/obj/item/clothing/head/helmet/space/rig/command
	light_overlay = "helmet_light_dual"
	icon = 'maps/sierra/icons/obj/solgov-head.dmi'
	item_icons = list(slot_head_str = 'maps/sierra/icons/mob/solgov-head.dmi')
	camera = /obj/machinery/camera/network/security
	species_restricted = list(SPECIES_HUMAN) //no available icons for aliens

/obj/item/clothing/suit/space/rig/command
	icon = 'maps/sierra/icons/obj/solgov-suit.dmi'
	item_icons = list(slot_wear_suit_str = 'maps/sierra/icons/mob/solgov-suit.dmi')
	species_restricted = list(SPECIES_HUMAN)

/obj/item/clothing/shoes/magboots/rig/command
	icon = 'maps/sierra/icons/obj/solgov-feet.dmi'
	item_icons = list(slot_shoes_str = 'maps/sierra/icons/mob/solgov-feet.dmi')
	species_restricted = list(SPECIES_HUMAN)

/obj/item/clothing/gloves/rig/command
	icon = 'maps/sierra/icons/obj/solgov-hands.dmi'
	item_icons = list(slot_gloves_str = 'maps/sierra/icons/mob/solgov-hands.dmi')
	species_restricted = list(SPECIES_HUMAN)


/obj/item/weapon/rig/command/equipped

	initial_modules = list(
		/obj/item/rig_module/maneuvering_jets,
		/obj/item/rig_module/device/flash,
		/obj/item/rig_module/cooling_unit
		)

/*
 * HEAD OF PERSONELL
 */
/obj/item/weapon/rig/command/hop
	name = "HoP's HCM"
	suit_type = "advanced command hardsuit"
	desc = "A specialized hardsuit rig control module issued to ranking personnel command staff of the NanoTrasen and their peers."
	icon_state = "command_XO_rig"
	armor = list(melee = 45, bullet = 35, laser = 30, energy = 15, bomb = 35, bio = 100, rad = 50)

	chest_type = /obj/item/clothing/suit/space/rig/command/hop
	helm_type = /obj/item/clothing/head/helmet/space/rig/command/hop

	allowed = list(/obj/item/weapon/gun, /obj/item/ammo_magazine, /obj/item/device/flashlight, /obj/item/weapon/tank, /obj/item/device/suit_cooling_unit, /obj/item/weapon/storage/secure/briefcase)
	req_access = list(access_hop)

/obj/item/clothing/head/helmet/space/rig/command/hop
	icon_state = "command_XO_rig"
/obj/item/clothing/suit/space/rig/command/hop
	icon_state = "command_XO_rig"

/obj/item/weapon/rig/command/hop/equipped
	initial_modules = list(
		/obj/item/rig_module/maneuvering_jets,
		/obj/item/rig_module/device/flash/advanced,
		/obj/item/rig_module/grenade_launcher/smoke,
		/obj/item/rig_module/cooling_unit)

/*
 * COMMANDING OFFICER
 */
/obj/item/weapon/rig/command/captain
	name = "captain's HCM"
	suit_type = "advanced command hardsuit"
	desc = "A specialized hardsuit rig control module issued to captains of the NanoTrasen."
	icon_state = "command_CO_rig"
	armor = list(melee = 50, bullet = 40, laser = 30, energy = 20, bomb = 40, bio = 100, rad = 50)

	chest_type = /obj/item/clothing/suit/space/rig/command/captain
	helm_type = /obj/item/clothing/head/helmet/space/rig/command/captain
	allowed = list(/obj/item/weapon/gun, /obj/item/ammo_magazine, /obj/item/device/flashlight, /obj/item/weapon/tank, /obj/item/device/suit_cooling_unit, /obj/item/weapon/storage/secure/briefcase)

	req_access = list(access_captain)

/obj/item/clothing/head/helmet/space/rig/command/captain
	icon_state = "command_CO_rig"
/obj/item/clothing/suit/space/rig/command/captain
	icon_state = "command_CO_rig"

/obj/item/weapon/rig/command/captain/equipped
	initial_modules = list(
		/obj/item/rig_module/ai_container,
		/obj/item/rig_module/maneuvering_jets,
		/obj/item/rig_module/device/flash/advanced,
		/obj/item/rig_module/grenade_launcher/smoke,
		/obj/item/rig_module/cooling_unit)

/*
 * CHIEF MEDICAL OFFICER
 */
/obj/item/weapon/rig/command/cmo
	name = "CMO's HCM"
	suit_type = "medical command hardsuit"
	desc = "A specialized hardsuit rig control module issued to ranking medical command staff of the NanoTrasen and their peers."
	icon_state = "command_med_rig"
	armor = list(melee = 35, bullet = 25, laser = 25, energy = 25, bomb = 40, bio = 100, rad = 100)

	chest_type = /obj/item/clothing/suit/space/rig/command/cmo
	helm_type = /obj/item/clothing/head/helmet/space/rig/command/cmo

	allowed = list(/obj/item/weapon/gun, /obj/item/device/flashlight, /obj/item/weapon/tank, /obj/item/device/suit_cooling_unit, /obj/item/weapon/storage/firstaid, /obj/item/device/healthanalyzer, /obj/item/stack/medical, /obj/item/roller)

	req_access = list(access_cmo)

/obj/item/clothing/head/helmet/space/rig/command/cmo
	icon_state = "command_med_rig"
/obj/item/clothing/suit/space/rig/command/cmo
	icon_state = "command_med_rig"


/obj/item/weapon/rig/command/cmo/equipped
	initial_modules = list(
		/obj/item/rig_module/maneuvering_jets,
		/obj/item/rig_module/device/flash,
		/obj/item/rig_module/device/healthscanner,
		/obj/item/rig_module/chem_dispenser/injector,
		/obj/item/rig_module/vision/medhud,
		/obj/item/rig_module/cooling_unit)

/*
* CHIEF OF SECURITY
*/
/obj/item/weapon/rig/command/hos
	name = "HoS' HCM"
	suit_type = "security command hardsuit"
	desc = "A specialized hardsuit rig control module issued to ranking security command staff of the NanoTrasen and their peers."
	icon_state = "command_sec_rig"
	armor = list(melee = 45, bullet = 35, laser = 30, energy = 15, bomb = 35, bio = 100, rad = 40)

	chest_type = /obj/item/clothing/suit/space/rig/command/hos
	helm_type = /obj/item/clothing/head/helmet/space/rig/command/hos

	allowed = list(/obj/item/weapon/gun, /obj/item/ammo_magazine, /obj/item/ammo_casing, /obj/item/weapon/handcuffs, /obj/item/device/flashlight, /obj/item/weapon/tank, /obj/item/device/suit_cooling_unit, /obj/item/weapon/melee/baton)

	req_access = list(access_hos)

/obj/item/clothing/head/helmet/space/rig/command/hos
	icon_state = "command_sec_rig"
/obj/item/clothing/suit/space/rig/command/hos
	icon_state = "command_sec_rig"

/obj/item/weapon/rig/command/hos/equipped
	initial_modules = list(
		/obj/item/rig_module/maneuvering_jets,
		/obj/item/rig_module/device/flash,
		/obj/item/rig_module/vision/sechud,
		/obj/item/rig_module/cooling_unit)

//Exploration Leader
/obj/item/weapon/rig/command/el
	name = "exploration leader's HCM"
	suit_type = "exploration command hardsuit"
	desc = "A specialized hardsuit rig control module issued to Exploration Leaders of the NanoTrasen."
	icon_state = "command_exp_rig"
	armor = list(melee = 35, bullet = 25, laser = 25, energy = 35, bomb = 15, bio = 100, rad = 100)

	chest_type = /obj/item/clothing/suit/space/rig/command/el
	helm_type = /obj/item/clothing/head/helmet/space/rig/command/el

	allowed = list(/obj/item/weapon/gun, /obj/item/device/flashlight, /obj/item/weapon/tank, /obj/item/device/suit_cooling_unit)

	req_access = list(access_el)

/obj/item/clothing/head/helmet/space/rig/command/el
	icon_state = "command_exp_rig"
/obj/item/clothing/suit/space/rig/command/el
	icon_state = "command_exp_rig"

/obj/item/weapon/rig/command/el/equipped
	initial_modules = list(
		/obj/item/rig_module/maneuvering_jets,
		/obj/item/rig_module/device/flash,
		/obj/item/rig_module/device/anomaly_scanner,
		/obj/item/rig_module/grenade_launcher/light,
		/obj/item/rig_module/cooling_unit)
