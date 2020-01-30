/obj/item/clothing/suit/sc_labcoat
	name = "robotic bathrobe"
	desc = "A suit that protects against minor chemical spills."
	icon = 'infinity/icons/obj/clothing/obj_suit.dmi'
	item_icons = list(slot_wear_suit_str = 'infinity/icons/mob/onmob/onmob_suit.dmi')
	icon_state = "sc_labcoat"
	item_state = "sc_labcoat"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	allowed = list(/obj/item/device/scanner/gas,/obj/item/stack/medical,/obj/item/weapon/reagent_containers/dropper,/obj/item/weapon/reagent_containers/syringe,/obj/item/weapon/reagent_containers/hypospray,/obj/item/device/scanner/health,/obj/item/device/flashlight/pen,/obj/item/weapon/reagent_containers/glass/bottle,/obj/item/weapon/reagent_containers/glass/beaker,/obj/item/weapon/reagent_containers/pill,/obj/item/weapon/storage/pill_bottle,/obj/item/weapon/paper)
	armor = list(melee = 0, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 50, rad = 0)

/obj/item/clothing/suit/storage/toggle/civilian
	name = "black jacket"
	desc = "A black jacket for real white men."
	icon = 'infinity/icons/obj/clothing/obj_suit.dmi'
	item_icons = list(slot_wear_suit_str = 'infinity/icons/mob/onmob/onmob_suit.dmi')
	icon_state = "black_jacket_o"
	icon_open = "black_jacket_o"
	icon_closed = "black_jacket_c"

/obj/item/clothing/suit/storage/toggle/longjacket
	name = "long jacket"
	desc = "A long gray jacket"
	icon = 'infinity/icons/obj/clothing/obj_suit.dmi'
	item_icons = list(slot_wear_suit_str = 'infinity/icons/mob/onmob/onmob_suit.dmi')
	icon_state = "longjacket_o"
	icon_open = "longjacket_o"
	icon_closed = "longjacket_c"

/obj/item/clothing/suit/officerdnavyjacket
	name = "officer navy jacket"
	desc = "The utility jacket of the SCG Fleet, made from an insulated materials."
	icon = 'icons/obj/clothing/suits.dmi'
	icon_state = "officerdnavyjacket"
	body_parts_covered = UPPER_TORSO

/obj/item/clothing/suit/storage/hoscoat
	name = "armored trenchcoat"
	desc = "A trenchcoat augmented with a special alloy for some protection and style."
	icon_state = "hostrench"
	item_state = "hostrench"
	armor = list(melee = 65, bullet = 30, laser = 50, energy = 10, bomb = 25, bio = 0, rad = 0)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	siemens_coefficient = 0.6
	allowed = list(/obj/item/weapon/gun/energy,/obj/item/device/radio,/obj/item/weapon/reagent_containers/spray/pepper,/obj/item/weapon/gun/projectile,/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/weapon/melee/baton,/obj/item/weapon/handcuffs,/obj/item/weapon/gun/magnetic)

/obj/item/clothing/suit/storage/tgbomber
	name = "modern bomber jacket"
	desc = "A leather bomber jacket."
	icon = 'infinity/icons/obj/clothing/obj_suit.dmi'
	item_icons = list(slot_wear_suit_str = 'infinity/icons/mob/onmob/onmob_suit.dmi')
	icon_state = "bomberjacket"
	body_parts_covered = UPPER_TORSO|ARMS
	cold_protection = UPPER_TORSO|ARMS
	min_cold_protection_temperature = T0C - 20

/obj/item/clothing/suit/storage/janjacket
	name = "janitor jacket"
	desc = "A janitor's jacket. Gives unbelivable protection versus depression about your job."
	icon = 'infinity/icons/obj/clothing/obj_suit.dmi'
	item_icons = list(slot_wear_suit_str = 'infinity/icons/mob/onmob/onmob_suit.dmi')
	icon_state = "janitor_jacket"
	body_parts_covered = UPPER_TORSO|ARMS
	allowed = list(/obj/item/device/flashlight,/obj/item/device/lightreplacer,/obj/item/weapon/storage/bag/trash,/obj/item/weapon/grenade/chem_grenade/cleaner,/obj/item/weapon/reagent_containers/spray/cleaner, /obj/item/weapon/mop, /obj/item/weapon/reagent_containers/glass/bucket)

/obj/item/clothing/suit/storage/tgbomber/militaryjacket
	name = "military jacket"
	desc = "A canvas jacket styled classical American military garb. Feels sturdy, yet comfortable."
	icon_state = "militaryjacket"

/obj/item/clothing/suit/armor/pcarrier/mainkraft/plastic
	name = "plastic plate carrier"
	desc = "Someone made it out of plastic with their own hands. There you can hang a sheet of armor."
	icon = 'infinity/icons/obj/clothing/obj_suit.dmi'
	item_icons = list(slot_wear_suit_str = 'infinity/icons/mob/onmob/onmob_suit.dmi')
	icon_state = "plvest"

/obj/item/clothing/suit/armor/pcarrier/mainkraft/plastic/New()
	..()
	slowdown_per_slot[slot_wear_suit] = 0.75

/obj/item/clothing/suit/lux_tunic
	name = "luxury tunic"
	desc = "A luxury suit for some high-ranked officer."
	icon = 'infinity/icons/obj/clothing/obj_suit.dmi'
	item_icons = list(slot_wear_suit_str = 'infinity/icons/mob/onmob/onmob_suit.dmi')
	icon_state = "admiral_tunic"
	item_state = "admiral_tunic"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	valid_accessory_slots = list(ACCESSORY_SLOT_MEDAL)
	allowed = list(/obj/item/weapon/gun/energy, /obj/item/weapon/gun/projectile, /obj/item/weapon/melee/baton)
