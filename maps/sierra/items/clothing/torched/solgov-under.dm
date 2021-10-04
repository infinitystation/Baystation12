/obj/item/clothing/under/solgov
	name = "master solgov uniform"
	desc = "You shouldn't be seeing this."
	icon = 'maps/torch/icons/obj/obj_under_solgov.dmi'
	item_icons = list(slot_w_uniform_str = 'maps/torch/icons/mob/onmob_under_solgov.dmi')
	siemens_coefficient = 0.8
	gender_icons = 1

/obj/item/clothing/under/solgov/utility
	name = "utility uniform"
	desc = "A comfortable turtleneck and black utility trousers."
	icon_state = "blackutility"
	item_state = "bl_suit"
	worn_state = "blackutility"
	sprite_sheets = list(
		SPECIES_UNATHI = 'icons/mob/species/unathi/onmob_under_unathi.dmi'
		)
	armor = list(
		melee = ARMOR_MELEE_MINOR,
		energy = ARMOR_ENERGY_MINOR
		)

/obj/item/clothing/under/solgov/utility/expeditionary/monkey
	name = "adjusted expeditionary uniform"
	desc = "The utility uniform of the SCG Expeditionary Corps, made from biohazard resistant material. This one has silver trim. It was also mangled to fit a monkey. This better be worth the NJP you'll get for making it."
	icon_state = "blackutility_crew"
	worn_state = "blackutility_crew"
	item_state = "bl_suit"

	species_restricted = list(SPECIES_MONKEY)
	sprite_sheets = list("Monkey" = 'icons/mob/species/monkey/onmob_under_monkey.dmi')
	starting_accessories = list(/obj/item/clothing/accessory/solgov/rank/fleet/officer/wo1_monkey)

/obj/item/clothing/under/solgov/utility/army
	name = "army fatigues"
	desc = "The utility uniform of the SCG Army, made from durable material."
	icon_state = "greenutility"
	item_state = "jensensuit"
	worn_state = "greenutility"

/obj/item/clothing/under/solgov/utility/army/urban
	name = "urban fatigues"
	desc = "An urban version of the SCG Army utility uniform, made from durable material."
	icon_state = "greyutility"
	item_state = "gy_suit"
	worn_state = "greyutility"

/obj/item/clothing/under/solgov/pt/expeditionary
	name = "expeditionary pt uniform"
	desc = "A baggy shirt bearing the seal of the SCG Expeditionary Corps and some dorky looking blue shorts."
	icon_state = "expeditionpt"
	worn_state = "expeditionpt"
	sprite_sheets = list(
		SPECIES_UNATHI = 'icons/mob/species/unathi/onmob_under_unathi.dmi'
		)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO
