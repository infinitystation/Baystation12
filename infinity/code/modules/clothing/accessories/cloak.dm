/obj/item/clothing/accessory/cloak // A colorable cloak
	name = "blank cloak"
	desc = "A simple, bland cloak."
	icon = 'infinity/icons/obj/clothing/obj_accessories.dmi'
	icon_state = "colorcloak"

	accessory_icons = list(
		slot_w_uniform_str = 'infinity/icons/mob/onmob/onmob_accessories.dmi', \
		slot_tie_str = 'infinity/icons/mob/onmob/onmob_accessories.dmi', \
		slot_wear_suit_str = 'infinity/icons/mob/onmob/onmob_accessories.dmi')
	item_icons = list(
		slot_wear_suit_str = 'infinity/icons/mob/onmob/onmob_accessories.dmi')

	var/fire_resist = T0C+100
	allowed = list(/obj/item/weapon/tank/emergency/oxygen)
	armor = list(melee = 0, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 0, rad = 0)
	slot_flags = SLOT_OCLOTHING
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	siemens_coefficient = 0.9
	w_class = ITEM_SIZE_NORMAL
	slot = ACCESSORY_SLOT_OVER
	high_visibility = 1

	species_restricted = null
	valid_accessory_slots = null

/obj/item/clothing/accessory/cloak/ce
	name = "chief engineer's cloak"
	desc = "An elaborate cloak worn by the chief engineer."
	icon_state = "cecloak"

/obj/item/clothing/accessory/cloak/cmo
	name = "chief medical officer's cloak"
	desc = "An elaborate cloak meant to be worn by the chief medical officer."
	icon_state = "cmocloak"

/obj/item/clothing/accessory/cloak/hop
	name = "head of personnel's cloak"
	desc = "An elaborate cloak meant to be worn by the head of personnel."
	icon_state = "hopcloak"

/obj/item/clothing/accessory/cloak/rd
	name = "research director's cloak"
	desc = "An elaborate cloak meant to be worn by the research director."
	icon_state = "rdcloak"

/obj/item/clothing/accessory/cloak/qm
	name = "quartermaster's cloak"
	desc = "An elaborate cloak meant to be worn by the quartermaster."
	icon_state = "qmcloak"

/obj/item/clothing/accessory/cloak/hos
	name = "head of security's cloak"
	desc = "An elaborate cloak meant to be worn by the head of security."
	icon_state = "hoscloak"

/obj/item/clothing/accessory/cloak/captain
	name = "captain's cloak"
	desc = "An elaborate cloak meant to be worn by the colony director."
	icon_state = "capcloak"

/obj/item/clothing/accessory/cloak/cargo
	name = "brown cloak"
	desc = "A simple brown and black cloak."
	icon_state = "cargocloak"

/obj/item/clothing/accessory/cloak/mining
	name = "trimmed purple cloak"
	desc = "A trimmed purple and brown cloak."
	icon_state = "miningcloak"

/obj/item/clothing/accessory/cloak/security
	name = "red cloak"
	desc = "A simple red and black cloak."
	icon_state = "seccloak"

/obj/item/clothing/accessory/cloak/service
	name = "green cloak"
	desc = "A simple green and blue cloak."
	icon_state = "servicecloak"

/obj/item/clothing/accessory/cloak/engineer
	name = "gold cloak"
	desc = "A simple gold and brown cloak."
	icon_state = "engicloak"

/obj/item/clothing/accessory/cloak/atmos
	name = "yellow cloak"
	desc = "A trimmed yellow and blue cloak."
	icon_state = "atmoscloak"

/obj/item/clothing/accessory/cloak/research
	name = "purple cloak"
	desc = "A simple purple and white cloak."
	icon_state = "scicloak"

/obj/item/clothing/accessory/cloak/medical
	name = "blue cloak"
	desc = "A simple blue and white cloak."
	icon_state = "medcloak"
