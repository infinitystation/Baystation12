/datum/stings/hallucination
	name = "Hallucination Sting (15)"
	desc = "Sting target"
	icon_state = "sting_lsd"
	chemical_cost = 15
	no_lesser = 0

/datum/stings/hallucination/sting_action(user, mob/living/carbon/T)
	. = ..()
	spawn(rand(30 SECONDS, 60 SECONDS))
		if(T) T.hallucination(400, 80)
	SSstatistics.add_field_details("changeling_powers","HS")
