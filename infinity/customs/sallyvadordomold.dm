/obj/item/clothing/suit/lux_tunic/custom
	name = "white captain's tunic"
	desc = "This tunic looks quite expensive and seems has a rich past of space naval commander. \
	It has a lot of golden lines, large shoulder straps and looks like is made of expensive, durable fabric. \
	On the left side of the chest is the NT symbol in a golden frame. \
	Tunic fastens with powerful magnets with latches. Very captain."
	trade_blacklisted = TRUE

/datum/robolimb/sally/torso
	company = "BiVeyPheus Upper"
	icon = 'infinity/icons/mob/human_races/cyberlimbs/sally/sally.dmi'
	applies_to_part = list(BP_L_ARM, BP_R_ARM, BP_L_HAND, BP_R_HAND, BP_HEAD, BP_CHEST, BP_GROIN)
	brute_mod = 1.2
	burn_mod = 1.2
	speed_mod = -0.05
	can_eat = 1
	allowed_ckeys = list("sallyvadordomold")

/datum/robolimb/sally/legs
	company = "BiVeyPheus Running Prosthesis"
	icon = 'infinity/icons/mob/human_races/cyberlimbs/sally/sally.dmi'
	applies_to_part = list(BP_L_LEG, BP_R_LEG, BP_L_FOOT, BP_R_FOOT)
	brute_mod = 1.5
	burn_mod = 1.5
	speed_mod = -0.16
	allowed_ckeys = list("sallyvadordomold")
