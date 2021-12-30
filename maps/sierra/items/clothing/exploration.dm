/obj/item/clothing/under/rank/field
	name = "grey exploration uniform"
	desc = "An utility uniform for NanoTrasen's field specialists. This one made for vessel's dull colors."
	icon = 'maps/sierra/icons/obj/obj_under_exploration.dmi'
	item_icons = list(slot_w_uniform_str = 'maps/sierra/icons/mob/onmob_under_exploration.dmi')
	icon_state = "greyutility"
	item_state = "greyutility"
	worn_state = "greyutility"
	gender_icons = 1

/obj/item/clothing/under/rank/field/tan
	name = "tan exploration uniform"
	desc = "An utility uniform for NanoTrasen's field specialists. This one made for hot exoplanets with dustlike ground. Or as beach's camouflage."
	icon_state = "tanutility"
	item_state = "tanutility"
	worn_state = "tanutility"

/obj/item/clothing/under/rank/field/navy
	name = "navy exploration uniform"
	desc = "An utility uniform for NanoTrasen's field specialists. This one made for blue-look exoplanets. Suspiciously, that SCG Fleet uses the same color."
	icon_state = "navycombat"
	item_state = "navycombat"
	worn_state = "navycombat"

/obj/item/clothing/under/rank/field/green
	name = "green exploration uniform"
	desc = "An utility uniform for NanoTrasen's field specialists. This one made for tropical, rainforest or just forested exoplanets. Don't forget your high boots."
	icon_state = "greenutility"
	item_state = "greenutility"
	worn_state = "greenutility"


//
// Void Suits
//
/obj/item/clothing/head/helmet/space/void/exploration/sierra
	name = "GI-EXPL voidsuit helmet"
	desc = "Although this helmet looks like an aquarium, it won't crush your head with pressure. \
			There is an inscription on the rear part - Galbex Interstellar."
	icon = 'maps/sierra/icons/obj/obj_head.dmi'
	item_icons = list(slot_head_str = 'maps/sierra/icons/mob/onmob_head.dmi')
	icon_state = "void_expl"
	item_state = "void_expl"
	light_overlay = "helmet_light_dual_alt"
	armor = list(
		melee = ARMOR_MELEE_RESISTANT,
		bullet = ARMOR_BALLISTIC_MINOR,
		laser = ARMOR_LASER_MINOR,
		energy = ARMOR_ENERGY_SMALL,
		bomb = ARMOR_BOMB_PADDED,
		bio = ARMOR_BIO_SHIELDED,
		rad = ARMOR_RAD_MINOR
	)
	sprite_sheets = list(
		SPECIES_SKRELL = 'maps/sierra/icons/mob/skrell/onmob_head.dmi',
		SPECIES_UNATHI = 'maps/sierra/icons/mob/unathi/onmob_head.dmi',
		SPECIES_TAJARA = 'maps/sierra/icons/mob/tajara/onmob_head.dmi',
		SPECIES_RESOMI = 'maps/sierra/icons/mob/resomi/onmob_head.dmi',
	)
	sprite_sheets_obj = list(
		SPECIES_SKRELL = 'maps/sierra/icons/obj/skrell/obj_head.dmi',
		SPECIES_UNATHI = 'maps/sierra/icons/obj/unathi/obj_head.dmi'
	)


/obj/item/clothing/suit/space/void/exploration/sierra
	name = "GI-EXPL voidsuit"
	desc = "A voidsuit that allows you to arrange walks in deep, dark space. \
			There is an inscription on the chest - Galbex Interstellar."
	icon = 'maps/sierra/icons/obj/obj_suit.dmi'
	item_icons = list(slot_wear_suit_str = 'maps/sierra/icons/mob/onmob_suit.dmi')
	item_state_slots = list(slot_wear_suit_str = "void_expl")
	icon_state = "void_expl"
	item_state = "void_expl"
	armor = list(
		melee = ARMOR_MELEE_RESISTANT,
		bullet = ARMOR_BALLISTIC_MINOR,
		laser = ARMOR_LASER_MINOR,
		energy = ARMOR_ENERGY_SMALL,
		bomb = ARMOR_BOMB_PADDED,
		bio = ARMOR_BIO_SHIELDED,
		rad = ARMOR_RAD_MINOR
	)
	sprite_sheets = list(
		SPECIES_SKRELL = 'maps/sierra/icons/mob/skrell/onmob_suit.dmi',
		SPECIES_UNATHI = 'maps/sierra/icons/mob/unathi/onmob_suit.dmi',
		SPECIES_TAJARA = 'maps/sierra/icons/mob/tajara/onmob_suit.dmi',
		SPECIES_RESOMI = 'maps/sierra/icons/mob/resomi/onmob_suit.dmi',
	)
	sprite_sheets_obj = list(
		SPECIES_SKRELL = 'maps/sierra/icons/obj/skrell/obj_suit.dmi',
		SPECIES_UNATHI = 'maps/sierra/icons/obj/unathi/obj_suit.dmi',
		SPECIES_TAJARA = 'maps/sierra/icons/obj/tajara/obj_suit.dmi',
		SPECIES_RESOMI = 'maps/sierra/icons/obj/resomi/obj_suit.dmi',
	)

/obj/item/clothing/suit/space/void/exploration/sierra/Initialize()
	. = ..()
	slowdown_per_slot[slot_wear_suit] = 0.8


/obj/item/clothing/suit/space/void/exploration/sierra/prepared
	helmet = /obj/item/clothing/head/helmet/space/void/exploration/sierra
	boots = /obj/item/clothing/shoes/magboots


/obj/item/clothing/suit/space/void/exploration/sierra/prepared/noboots
	boots = null


/obj/item/clothing/head/helmet/space/void/exploration/sierra/med
	name = "GI-EXPL-M voidsuit helmet"
	icon_state = "void_expl_med"
	item_state = "void_expl_med"
	armor = list(
		melee = ARMOR_MELEE_SMALL,
		bullet = ARMOR_BALLISTIC_MINOR,
		laser = ARMOR_LASER_MINOR,
		energy = ARMOR_ENERGY_MINOR,
		bomb = ARMOR_BOMB_MINOR,
		bio = ARMOR_BIO_SHIELDED,
		rad = ARMOR_RAD_MINOR
	)


/obj/item/clothing/suit/space/void/exploration/sierra/med
	name = "GI-EXPL-M voidsuit"
	icon_state = "void_expl_med"
	item_state = "void_expl_med"
	item_state_slots = list(slot_wear_suit_str = "void_expl_med")
	armor = list(
		melee = ARMOR_MELEE_SMALL,
		bullet = ARMOR_BALLISTIC_MINOR,
		laser = ARMOR_LASER_MINOR,
		energy = ARMOR_ENERGY_MINOR,
		bomb = ARMOR_BOMB_MINOR,
		bio = ARMOR_BIO_SHIELDED,
		rad = ARMOR_RAD_MINOR
	)

/obj/item/clothing/suit/space/void/exploration/sierra/med/Initialize()
	. = ..()
	slowdown_per_slot[slot_wear_suit] = 0.70


/obj/item/clothing/suit/space/void/exploration/sierra/med/prepared
	helmet = /obj/item/clothing/head/helmet/space/void/exploration/sierra/med
	boots = /obj/item/clothing/shoes/magboots


/obj/item/clothing/suit/space/void/exploration/sierra/med/prepared/noboots
	boots = null


/obj/item/clothing/head/helmet/space/void/exploration/sierra/eng
	name = "GI-EXPL-E voidsuit helmet"
	icon_state = "void_expl_eng"
	item_state = "void_expl_eng"
	armor = list(
		melee = ARMOR_MELEE_RESISTANT,
		bullet = ARMOR_BALLISTIC_SMALL,
		laser = ARMOR_LASER_SMALL,
		energy = ARMOR_ENERGY_RESISTANT,
		bomb = ARMOR_BOMB_PADDED,
		bio = ARMOR_BIO_SHIELDED,
		rad = ARMOR_RAD_SMALL
	)


/obj/item/clothing/suit/space/void/exploration/sierra/eng
	name = "GI-EXPL-E voidsuit"
	icon_state = "void_expl_eng"
	item_state = "void_expl_eng"
	item_state_slots = list(slot_wear_suit_str = "void_expl_eng")
	armor = list(
		melee = ARMOR_MELEE_RESISTANT,
		bullet = ARMOR_BALLISTIC_SMALL,
		laser = ARMOR_LASER_SMALL,
		energy = ARMOR_ENERGY_RESISTANT,
		bomb = ARMOR_BOMB_PADDED,
		bio = ARMOR_BIO_SHIELDED,
		rad = ARMOR_RAD_SMALL
	)

/obj/item/clothing/suit/space/void/exploration/sierra/eng/Initialize()
	. = ..()
	slowdown_per_slot[slot_wear_suit] = 0.85


/obj/item/clothing/suit/space/void/exploration/sierra/eng/prepared
	helmet = /obj/item/clothing/head/helmet/space/void/exploration/sierra/eng
	boots = /obj/item/clothing/shoes/magboots


/obj/item/clothing/suit/space/void/exploration/sierra/eng/prepared/noboots
	boots = null


/obj/item/clothing/head/helmet/space/void/exploration/sierra/rad
	name = "GI-EXPL-RP voidsuit helmet"
	desc = "Although this helmet looks like an aquarium, it won't crush your head with pressure. \
			There is an inscription on the rear part - Galbex Interstellar. Now you can joke about roleplay."
	icon_state = "void_expl_rad"
	item_state = "void_expl_rad"
	armor = list(
		melee = ARMOR_MELEE_KNIVES,
		bullet = ARMOR_BALLISTIC_MINOR,
		laser = ARMOR_LASER_MINOR,
		energy = ARMOR_ENERGY_MINOR,
		bomb = ARMOR_BOMB_PADDED,
		bio = ARMOR_BIO_SHIELDED,
		rad = ARMOR_RAD_SHIELDED
	)


/obj/item/clothing/suit/space/void/exploration/sierra/rad
	name = "GI-EXPL-RP voidsuit"
	desc = "A voidsuit that allows you to arrange walks in deep, dark space. \
			There is an inscription on the chest - Galbex Interstellar. Now you can joke about roleplay."
	icon_state = "void_expl_rad"
	item_state = "void_expl_rad"
	item_state_slots = list(slot_wear_suit_str = "void_expl_rad")
	armor = list(
		melee = ARMOR_MELEE_KNIVES,
		bullet = ARMOR_BALLISTIC_MINOR,
		laser = ARMOR_LASER_MINOR,
		energy = ARMOR_ENERGY_MINOR,
		bomb = ARMOR_BOMB_PADDED,
		bio = ARMOR_BIO_SHIELDED,
		rad = ARMOR_RAD_SHIELDED
	)


/obj/item/clothing/suit/space/void/exploration/sierra/rad/prepared
	helmet = /obj/item/clothing/head/helmet/space/void/exploration/sierra/rad
	boots = /obj/item/clothing/shoes/magboots


/obj/item/clothing/suit/space/void/exploration/sierra/rad/prepared/noboots
	boots = null


/obj/item/clothing/head/helmet/space/void/exploration/sierra/pilot
	name = "GI-EXPL-P voidsuit"
	icon_state = "void_expl_pilot"
	item_state = "void_expl_pilot"
	light_overlay = "helmet_light_alt"
	armor = list(
		melee = ARMOR_MELEE_MINOR,
		bullet = ARMOR_BALLISTIC_MINOR,
		laser = ARMOR_LASER_MINOR,
		energy = ARMOR_ENERGY_MINOR,
		bomb = ARMOR_BOMB_MINOR,
		bio = ARMOR_BIO_SHIELDED,
		rad = ARMOR_RAD_MINOR
	)


/obj/item/clothing/suit/space/void/exploration/sierra/pilot
	name = "GI-EXPL-P voidsuit"
	icon_state = "void_expl_pilot"
	item_state = "void_expl_pilot"
	item_state_slots = list(slot_wear_suit_str = "void_expl_pilot")
	armor = list(
		melee = ARMOR_MELEE_MINOR,
		bullet = ARMOR_BALLISTIC_MINOR,
		laser = ARMOR_LASER_MINOR,
		energy = ARMOR_ENERGY_MINOR,
		bomb = ARMOR_BOMB_MINOR,
		bio = ARMOR_BIO_SHIELDED,
		rad = ARMOR_RAD_MINOR
	)


/obj/item/clothing/suit/space/void/exploration/sierra/pilot/prepared
	helmet = /obj/item/clothing/head/helmet/space/void/exploration/sierra/pilot
	boots = /obj/item/clothing/shoes/magboots


/obj/item/clothing/suit/space/void/exploration/sierra/pilot/prepared/noboots
	boots = null
