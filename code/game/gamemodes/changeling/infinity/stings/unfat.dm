/datum/stings/unfat
	name = "Unfat Sting (5)"
	desc = "Sting target"
	icon_state = "sting_unfat"
	chemical_cost = 5

/datum/stings/unfat/sting_action(user, mob/living/carbon/T)
	. = ..()
	spawn(rand(20 SECONDS, 40 SECONDS))
		T.nutrition -= 100
		T.hydration -= 100
	SSstatistics.add_field_details("changeling_powers","US")
