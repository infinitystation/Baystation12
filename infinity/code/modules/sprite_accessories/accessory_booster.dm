#define TAILBIOMODS(nam) "Tail Biomodification (" + nam + ")"

/datum/sprite_accessory/marking/booster/tail
	icon = 'infinity/icons/mob/human_races/species/human/subspecies/booster_mods.dmi'
	body_parts = list(BP_HEAD)
	draw_target = MARKING_TARGET_HAIR
	do_colouration = TRUE

/datum/sprite_accessory/marking/booster/tail/cat
	name = TAILBIOMODS("Cat")
	icon_state = "tail_cat"

/datum/sprite_accessory/marking/booster/tail/lizard
	name = TAILBIOMODS("Lizard")
	icon_state = "tail_lizard"
