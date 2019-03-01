/datum/robolimb/bionic
	company = "Bionic"
	desc = "Experimental development of the corporation NanoTrasen."
	icon = 'icons/mob/human_races/cyberlimbs/bionic/bionic.dmi'
	unavailable_at_fab = 1
	restricted_to = list(SPECIES_BIONIC)
	can_eat = 1
	speed_mod = -0.5
	brute_mod = 1.3
	burn_mod = 1.3

/datum/robolimb/morgan
	company = "Morgan Black"
	desc = "Most authenic faux-wood on the market. The actuators underneath are still metal though."
	icon = 'icons/mob/human_races/cyberlimbs/morgan/morgan_main.dmi'
	unavailable_at_fab = 1
	unavailable_at_chargen = 1

/datum/robolimb/terminator
	company = "Terminator"
	desc = "Hunter-Killer model. From where you got it?"
	icon = 'icons/mob/human_races/cyberlimbs/morpheus/terminator_main.dmi'
	unavailable_at_fab = 1
	unavailable_at_chargen = 1
	restricted_to = list(SPECIES_IPC, "Terminator")

/datum/robolimb/resomi
	company = "Small prosthetic"
	desc = "This prosthetic is small and fit for nonhuman proportions."
	icon = 'icons/mob/human_races/cyberlimbs/resomi/resomi_main.dmi'
	species_cannot_use = list(SPECIES_ADHERENT, SPECIES_YEOSA, SPECIES_EROSAN, SPECIES_UNATHI, SPECIES_NABBER, SPECIES_DIONA)
	restricted_to = list(SPECIES_RESOMI)
	applies_to_part = list(BP_L_ARM, BP_R_ARM, BP_L_LEG, BP_R_LEG, BP_L_FOOT, BP_R_FOOT, BP_L_HAND, BP_R_HAND)

/datum/robolimb/bishop/special
	company = "Bishop Special"
	icon = 'icons/mob/human_races/cyberlimbs/bishop/bishop_special.dmi'
	can_eat = 0

/datum/robolimb/hephaestus/special
	company = "Hephaestus Special Partial"
	icon = 'icons/mob/human_races/cyberlimbs/hephaestus/hephaestus_special.dmi'
	applies_to_part = list(BP_L_ARM, BP_R_ARM, BP_L_HAND, BP_R_HAND, BP_L_LEG, BP_R_LEG, BP_L_FOOT, BP_R_FOOT)
	brute_mod = 0.7
	burn_mod = 0.7
	speed_mod = 0.18

/datum/robolimb/hephaestus/special_full
	company = "Hephaestus Special Full"
	icon = 'icons/mob/human_races/cyberlimbs/hephaestus/hephaestus_special.dmi'
	restricted_to = list(SPECIES_IPC)
	brute_mod = 0.7
	burn_mod = 0.7
	speed_mod = 0.18

/datum/robolimb/xion/special
	company = "Xion Special"
	icon = 'icons/mob/human_races/cyberlimbs/xion/xion_special.dmi'

/datum/robolimb/wardtakahashi/special
	company = "Ward-Takahashi Special Upper"
	icon = 'icons/mob/human_races/cyberlimbs/wardtakahashi/wardtakahashi_special.dmi'
	applies_to_part = list(BP_L_ARM, BP_R_ARM, BP_L_HAND, BP_R_HAND, BP_HEAD, BP_CHEST, BP_GROIN)
	brute_mod = 1.2
	burn_mod = 1.2
	speed_mod = -0.05
	can_eat = 0

/datum/robolimb/wardtakahashi/running
	company = "Ward-Takahashi Running Prosthesis"
	icon = 'icons/mob/human_races/cyberlimbs/wardtakahashi/wardtakahashi_special.dmi'
	applies_to_part = list(BP_L_LEG, BP_R_LEG, BP_L_FOOT, BP_R_FOOT)
	brute_mod = 1.5
	burn_mod = 1.5
	speed_mod = -0.16

/datum/robolimb/morpheus/special
	company = "Morpheus Special"
	icon = 'icons/mob/human_races/cyberlimbs/morpheus/morpheus_special.dmi'
