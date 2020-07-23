#define TAILBIOMODS(X) "Tail Biomodification (" + X + ")"

/datum/sprite_accessory/marking/booster/tail
	icon = 'infinity/icons/mob/human_races/species/human/subspecies/booster_mods.dmi'
	body_parts = list(BP_GROIN)
	do_colouration = TRUE
	disallows = list(/datum/sprite_accessory/marking/booster/tail)

/datum/sprite_accessory/marking/booster/tail/cat
	name = TAILBIOMODS("Cat")
	icon_state = "tail_cat"

/datum/sprite_accessory/marking/booster/tail/lizard
	name = TAILBIOMODS("Lizard")
	icon_state = "tail_lizard"

#undef TAILBIOMODS
