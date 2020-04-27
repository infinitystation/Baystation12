/datum/robolimb/bionic
	company = "Bionic"
	desc = "Experimental development of the corporation NanoTrasen."
	icon = 'infinity/icons/mob/human_races/cyberlimbs/bionic/bionic.dmi'
	unavailable_at_fab = 1
	restricted_to = list(SPECIES_BIONIC)
	can_eat = 1

/datum/robolimb/morgan
	company = "Morgan Black"
	desc = "Most authenic faux-wood on the market. The actuators underneath are still metal though."
	icon = 'infinity/icons/mob/human_races/cyberlimbs/morgan/morgan_main.dmi'
	unavailable_at_fab = 1
	unavailable_at_chargen = 1

/datum/robolimb/terminator
	company = "Terminator"
	desc = "Hunter-Killer model. From where you got it?"
	icon = 'infinity/icons/mob/human_races/cyberlimbs/morpheus/terminator_main.dmi'
	unavailable_at_fab = 1
	unavailable_at_chargen = 1
	restricted_to = list(SPECIES_IPC, "Terminator")

/datum/robolimb/resomi
	company = "Small prosthetic"
	desc = "This prosthetic is small and fit for nonhuman proportions."
	icon = 'infinity/icons/mob/human_races/cyberlimbs/resomi/resomi_main.dmi'
	species_cannot_use = list(SPECIES_ADHERENT, SPECIES_YEOSA, SPECIES_EROSAN, SPECIES_UNATHI, SPECIES_NABBER, SPECIES_DIONA)
	restricted_to = list(SPECIES_RESOMI)
	allowed_bodytypes = list(SPECIES_RESOMI)
	applies_to_part = list(BP_L_ARM, BP_R_ARM, BP_L_LEG, BP_R_LEG, BP_L_FOOT, BP_R_FOOT, BP_L_HAND, BP_R_HAND)

/datum/robolimb/hephaestus/titan/full
	company = "Hephaestus Tutan IPC model"
	restricted_to = list(SPECIES_IPC)
	applies_to_part = list() //full body

/datum/robolimb/hephaestus/athena
	company = "Hephaestus Athena"
	icon = 'infinity/icons/mob/human_races/cyberlimbs/hephaestus/hephaestus_athena.dmi'
	allowed_ckeys = list("woofwoof322")

/datum/robolimb/wardtakahashi/special
	company = "Ward-Takahashi Special Upper"
	icon = 'infinity/icons/mob/human_races/cyberlimbs/wardtakahashi/wardtakahashi_special.dmi'
	applies_to_part = list(BP_L_ARM, BP_R_ARM, BP_L_HAND, BP_R_HAND, BP_HEAD, BP_CHEST, BP_GROIN)
	brute_mod = 1.2
	burn_mod = 1.2
	speed_mod = -0.05
	can_eat = 0

/datum/robolimb/wardtakahashi/running
	company = "Ward-Takahashi Running Prosthesis"
	icon = 'infinity/icons/mob/human_races/cyberlimbs/wardtakahashi/wardtakahashi_special.dmi'
	applies_to_part = list(BP_L_LEG, BP_R_LEG, BP_L_FOOT, BP_R_FOOT)
	brute_mod = 1.5
	burn_mod = 1.5
	speed_mod = -0.16

/datum/robolimb/morpheus/stahan
	company = "Morpheus Stahan"
	icon = 'infinity/icons/mob/human_races/cyberlimbs/morpheus/morpheus_stahan.dmi'
