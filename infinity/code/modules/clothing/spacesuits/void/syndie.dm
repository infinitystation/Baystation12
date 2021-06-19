/obj/item/clothing/head/helmet/space/void/merc/heavy
	name = "elite tactical voidsuit helmet"
	desc = "A special and very rare helmet, designed to operate in very hostile envirements. Property of Gorlex Marauders."

	icon = 'infinity/icons/obj/clothing/obj_head.dmi'
	item_icons = list(slot_head_str = 'infinity/icons/mob/onmob/onmob_head.dmi')
	icon_state = "syndie_helm"

	armor = list(
		melee = ARMOR_MELEE_MAJOR,
		bullet = ARMOR_BALLISTIC_RIFLE,
		laser = ARMOR_LASER_MAJOR,
		energy = ARMOR_ENERGY_RESISTANT,
		bomb = ARMOR_BOMB_RESISTANT,
		bio = ARMOR_BIO_SHIELDED,
		rad = ARMOR_RAD_RESISTANT
		)
	siemens_coefficient = 0.3
	species_restricted = list(SPECIES_HUMAN, SPECIES_IPC)
	camera = /obj/machinery/camera/network/mercenary
	light_overlay = "helmet_light_red"
	max_heat_protection_temperature = FIRESUIT_MAX_HEAT_PROTECTION_TEMPERATURE
	tint = 1

/obj/item/clothing/suit/space/void/merc/heavy
	name = "elite tactical voidsuit"
	desc = "A very rare tactical voidsuit, designed to fight in very dangerous envirements. Property of Gorlex Marauders."

	icon = 'infinity/icons/obj/clothing/obj_suit.dmi'

	item_icons = list(
		slot_wear_suit_str = 'infinity/icons/mob/onmob/onmob_suit.dmi',
		slot_l_hand_str = 'icons/mob/onmob/items/lefthand_spacesuits.dmi',
		slot_r_hand_str = 'icons/mob/onmob/items/righthand_spacesuits.dmi',)


	item_state_slots = list(slot_l_hand_str = "syndie_voidsuit",
							slot_r_hand_str = "syndie_voidsuit",
							slot_wear_suit_str = "syndie_voidsuit")
	icon_state = "syndie_voidsuit"

	w_class = ITEM_SIZE_LARGE
	armor = list(
		melee = ARMOR_MELEE_MAJOR,
		bullet = ARMOR_BALLISTIC_RIFLE,
		laser = ARMOR_LASER_MAJOR,
		energy = ARMOR_ENERGY_RESISTANT,
		bomb = ARMOR_BOMB_RESISTANT,
		bio = ARMOR_BIO_SHIELDED,
		rad = ARMOR_RAD_RESISTANT
		)

	allowed = list(/obj/item/device/flashlight,/obj/item/tank,/obj/item/device/suit_cooling_unit,/obj/item/gun,/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/melee/baton,/obj/item/melee/energy/sword,/obj/item/handcuffs)
	siemens_coefficient = 0.3
	species_restricted = list(SPECIES_HUMAN, SPECIES_SKRELL, SPECIES_IPC)
	max_heat_protection_temperature = FIRESUIT_MAX_HEAT_PROTECTION_TEMPERATURE
	var/mode = 0

	var/armor_normal = list(
		melee = ARMOR_MELEE_MAJOR,
		bullet = ARMOR_BALLISTIC_RIFLE,
		laser = ARMOR_LASER_MAJOR,
		energy = ARMOR_ENERGY_RESISTANT,
		bomb = ARMOR_BOMB_RESISTANT,
		bio = ARMOR_BIO_SHIELDED,
		rad = ARMOR_RAD_RESISTANT
		)

	var/armor_combat = list(
		melee = ARMOR_MELEE_VERY_HIGH,
		bullet = ARMOR_BALLISTIC_AP,
		laser = ARMOR_LASER_RIFLES,
		energy = ARMOR_ENERGY_STRONG,
		bomb = ARMOR_BOMB_RESISTANT,
		bio = ARMOR_BIO_SHIELDED,
		rad = ARMOR_RAD_RESISTANT
		)

/obj/item/clothing/suit/space/void/merc/heavy/Initialize()
	. = ..()
	slowdown_per_slot[slot_wear_suit] = 1.5
	START_PROCESSING(SSobj, src)

/obj/item/clothing/suit/space/void/merc/heavy/prepared
	helmet = /obj/item/clothing/head/helmet/space/void/merc/heavy
	boots = /obj/item/clothing/shoes/magboots
	tank = /obj/item/tank/oxygen

/obj/item/clothing/suit/space/void/merc/heavy/verb/toggle_mode()

	set name = "Toggle Combat Mode"
	set category = "Object"
	set src in usr

	if(!istype(src.loc,/mob/living)) return

	if(!helmet)
		to_chat(usr, "There is no helmet installed.")
		return

	var/mob/living/carbon/human/H = usr

	if(!istype(H)) return
	if(H.incapacitated()) return
	if(H.wear_suit != src) return

	if(H.head == helmet)
		if(mode)
			to_chat(usr, "You disengaged combat mode on your suit. Now you will be much faster, but your suit will offer less protection.")
			slowdown_per_slot[slot_wear_suit] = 1.5
			helmet.armor = armor_normal
			armor = armor_normal
			mode = 0
		else
			to_chat(usr, "You engaged combat mode on your suit. It will give you much more protection in cost of speed.")
			slowdown_per_slot[slot_wear_suit] = 7.5
			helmet.armor = armor_combat
			armor = armor_combat
			mode = 1
	else
		to_chat(usr, "You can't toggle combat mode while your helmet is disengaged.")
		return
	helmet.update_light(H)
