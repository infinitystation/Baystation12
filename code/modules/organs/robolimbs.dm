var/list/all_robolimbs = list()
var/list/chargen_robolimbs = list()
var/datum/robolimb/basic_robolimb

/proc/populate_robolimb_list()
	basic_robolimb = new()
	for(var/limb_type in typesof(/datum/robolimb))
		var/datum/robolimb/R = new limb_type()
		all_robolimbs[R.company] = R
		if(!R.unavailable_at_chargen)
			chargen_robolimbs[R.company] = R

/datum/robolimb
	var/company = "Unbranded"                            // Shown when selecting the limb.
	var/desc = "A generic unbranded robotic prosthesis." // Seen when examining a limb.
	var/icon = 'icons/mob/human_races/robotic.dmi'       // Icon base to draw from.
	var/unavailable_at_chargen                           // If set, not available at chargen.
	var/unavailable_at_fab                               // If set, cannot be fabricated.
	var/can_eat = 0
	var/brute_mod = 1
	var/speed_mod = 0
	var/burn_mod = 1
	var/use_eye_icon = "eyes_s"
	var/can_feel_pain
	var/skintone
	var/list/species_cannot_use = list(SPECIES_RESOMI)
	var/list/restricted_to = list()
	var/list/applies_to_part = list() //TODO.

/datum/robolimb/bishop
	company = "Bishop"
	desc = "This limb has a white polymer casing with blue holo-displays."
	icon = 'icons/mob/human_races/cyberlimbs/bishop/bishop_main.dmi'
	unavailable_at_fab = 1
	can_eat = 1

/datum/robolimb/bishop/special
	company = "Bishop Special"
	icon = 'icons/mob/human_races/cyberlimbs/bishop/bishop_special.dmi'
	use_eye_icon = "bishop_eyes"

/datum/robolimb/bishop/alt
	company = "Bishop Alt."
	icon = 'icons/mob/human_races/cyberlimbs/bishop/bishop_alt.dmi'
	applies_to_part = list(BP_HEAD)

/datum/robolimb/bishop/alt/monitor
	company = "Bishop Monitor."
	icon = 'icons/mob/human_races/cyberlimbs/bishop/bishop_monitor.dmi'
	restricted_to = list(SPECIES_IPC)

/datum/robolimb/hephaestus
	company = "Hephaestus Industries"
	desc = "This limb has a militaristic black and green casing with gold stripes."
	icon = 'icons/mob/human_races/cyberlimbs/hephaestus/hephaestus_main.dmi'
	unavailable_at_fab = 1

/datum/robolimb/hephaestus/special
	company = "Hephaestus Special Partial"
	icon = 'icons/mob/human_races/cyberlimbs/hephaestus/hephaestus_special.dmi'
	applies_to_part = list(BP_L_ARM, BP_R_ARM, BP_L_HAND, BP_R_HAND, BP_L_LEG, BP_R_LEG, BP_L_FOOT, BP_R_FOOT)
	use_eye_icon = "heph_eyes"
	brute_mod = 0.7
	burn_mod = 0.7
	speed_mod = 0.18

/datum/robolimb/hephaestus/special_full
	company = "Hephaestus Special Full"
	icon = 'icons/mob/human_races/cyberlimbs/hephaestus/hephaestus_special.dmi'
	use_eye_icon = "heph_eyes"
	restricted_to = list(SPECIES_IPC)
	brute_mod = 0.7
	burn_mod = 0.7
	speed_mod = 0.18

/datum/robolimb/hephaestus/alt
	company = "Hephaestus Alt."
	icon = 'icons/mob/human_races/cyberlimbs/hephaestus/hephaestus_alt.dmi'
	applies_to_part = list(BP_HEAD)

/datum/robolimb/hephaestus/alt/monitor
	company = "Hephaestus Monitor."
	icon = 'icons/mob/human_races/cyberlimbs/hephaestus/hephaestus_monitor.dmi'
	restricted_to = list(SPECIES_IPC)

/datum/robolimb/zenghu
	company = "Zeng-Hu"
	desc = "This limb has a rubbery fleshtone covering with visible seams."
	icon = 'icons/mob/human_races/cyberlimbs/zenghu/zenghu_main.dmi'
	can_eat = 1
	unavailable_at_fab = 1
	restricted_to = list(SPECIES_HUMAN, SPECIES_IPC)

/datum/robolimb/xion
	company = "Xion"
	desc = "This limb has a minimalist black and red casing."
	icon = 'icons/mob/human_races/cyberlimbs/xion/xion_main.dmi'

/datum/robolimb/xion/special
	company = "Xion Special"
	icon = 'icons/mob/human_races/cyberlimbs/xion/xion_special.dmi'
	use_eye_icon = "xion_eyes"

/datum/robolimb/xion/alt
	company = "Xion Alt."
	icon = 'icons/mob/human_races/cyberlimbs/xion/xion_alt.dmi'
	applies_to_part = list(BP_HEAD)

/datum/robolimb/xion/alt/monitor
	company = "Xion Monitor."
	icon = 'icons/mob/human_races/cyberlimbs/xion/xion_monitor.dmi'
	restricted_to = list(SPECIES_IPC)

/datum/robolimb/nanotrasen
	company = "NanoTrasen"
	desc = "This limb is made from a cheap polymer."
	icon = 'icons/mob/human_races/cyberlimbs/nanotrasen/nanotrasen_main.dmi'

/datum/robolimb/wardtakahashi
	company = "Ward-Takahashi"
	desc = "This limb features sleek black and white polymers."
	icon = 'icons/mob/human_races/cyberlimbs/wardtakahashi/wardtakahashi_main.dmi'
	can_eat = 1
	unavailable_at_fab = 1

/datum/robolimb/wardtakahashi/special
	company = "Ward-Takahashi Special Upper"
	icon = 'icons/mob/human_races/cyberlimbs/wardtakahashi/wardtakahashi_special.dmi'
	use_eye_icon = "zenghu_eyes"
	applies_to_part = list(BP_L_ARM, BP_R_ARM, BP_L_HAND, BP_R_HAND, BP_HEAD, BP_CHEST, BP_GROIN)
	brute_mod = 1.2
	burn_mod = 1.2
	speed_mod = -0.05

/datum/robolimb/wardtakahashi/running
	company = "Ward-Takahashi Running Prosthesis"
	icon = 'icons/mob/human_races/cyberlimbs/wardtakahashi/wardtakahashi_special.dmi'
	applies_to_part = list(BP_L_LEG, BP_R_LEG, BP_L_FOOT, BP_R_FOOT)
	brute_mod = 1.5
	burn_mod = 1.5
	speed_mod = -0.16

/datum/robolimb/economy
	company = "Ward-Takahashi Econ."
	desc = "A simple robotic limb with retro design. Seems rather stiff."
	icon = 'icons/mob/human_races/cyberlimbs/wardtakahashi/wardtakahashi_economy.dmi'

/datum/robolimb/wardtakahashi/alt
	company = "Ward-Takahashi Alt."
	icon = 'icons/mob/human_races/cyberlimbs/wardtakahashi/wardtakahashi_alt.dmi'
	applies_to_part = list(BP_HEAD)

/datum/robolimb/wardtakahashi/alt/monitor
	company = "Ward-Takahashi Monitor."
	icon = 'icons/mob/human_races/cyberlimbs/wardtakahashi/wardtakahashi_monitor.dmi'
	restricted_to = list(SPECIES_IPC)

/datum/robolimb/morpheus
	company = "Morpheus"
	desc = "This limb is simple and functional; no effort has been made to make it look human."
	icon = 'icons/mob/human_races/cyberlimbs/morpheus/morpheus_main.dmi'
	unavailable_at_fab = 1

/datum/robolimb/morpheus/special
	company = "Morpheus Special"
	icon = 'icons/mob/human_races/cyberlimbs/morpheus/morpheus_special.dmi'
	use_eye_icon = "eyes_industry"
	restricted_to = list()

/datum/robolimb/mantis
	company = "Morpheus Mantis"
	desc = "This limb has a casing of sleek black metal and repulsive insectile design."
	icon = 'icons/mob/human_races/cyberlimbs/morpheus/morpheus_mantis.dmi'
	unavailable_at_fab = 1
	use_eye_icon = "blank_eyes"


/datum/robolimb/morpheus/monitor
	company = "Morpheus Monitor."
	icon = 'icons/mob/human_races/cyberlimbs/morpheus/morpheus_monitor.dmi'
	applies_to_part = list(BP_HEAD)
	unavailable_at_fab = 1
	use_eye_icon = "blank_eyes"
	restricted_to = list(SPECIES_IPC)

/datum/robolimb/veymed
	company = "Vey-Med"
	desc = "This high quality limb is nearly indistinguishable from an organic one."
	icon = 'icons/mob/human_races/cyberlimbs/veymed/veymed_main.dmi'
	can_eat = 1
	skintone = 1
	unavailable_at_fab = 1
	restricted_to = list(SPECIES_HUMAN)

/datum/robolimb/grayson
	company = "Grayson"
	desc = "This limb has a sturdy and heavy build to it."
	icon = 'icons/mob/human_races/cyberlimbs/grayson/grayson_main.dmi'

/datum/robolimb/grayson/alt
	company = "Grayson Alt."
	icon = 'icons/mob/human_races/cyberlimbs/grayson/grayson_alt.dmi'
	applies_to_part = list(BP_HEAD)
	unavailable_at_fab = 1

/datum/robolimb/grayson/alt/monitor
	company = "Grayson Monitor."
	icon = 'icons/mob/human_races/cyberlimbs/grayson/grayson_monitor.dmi'
	applies_to_part = list(BP_HEAD)
	unavailable_at_fab = 1
	restricted_to = list(SPECIES_IPC)

/datum/robolimb/resomi
	company = "Small prosthetic"
	desc = "This prosthetic is small and fit for nonhuman proportions."
	icon = 'icons/mob/human_races/cyberlimbs/resomi/resomi_main.dmi'
	restricted_to = list(SPECIES_RESOMI)
	species_cannot_use = list()
	applies_to_part = list(BP_L_ARM, BP_R_ARM, BP_L_LEG, BP_R_LEG, BP_L_FOOT, BP_R_FOOT, BP_L_HAND, BP_R_HAND)

//From Europa Station
/datum/robolimb/morgan
	company = "Morgan Black"
	desc = "Most authenic faux-wood on the market. The actuators underneath are still metal though."
	icon = 'icons/mob/human_races/cyberlimbs/morgan/morgan_main.dmi'
	use_eye_icon = "blank_eyes"
	unavailable_at_fab = 1
	unavailable_at_chargen = 1

/datum/robolimb/terminator
	company = "Terminator"
	desc = "Hunter-Killer model. From where you got it?"
	icon = 'icons/mob/human_races/cyberlimbs/morpheus/terminator_main.dmi'
	use_eye_icon = "eyes_terminator"
	unavailable_at_fab = 1
	unavailable_at_chargen = 1
	restricted_to = list(SPECIES_IPC, "Terminator")