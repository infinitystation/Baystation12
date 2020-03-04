/datum/stings/deaf
	name = "Deaf Sting (5)"
	desc = "Sting target"
	icon_state = "sting_deaf"
	chemical_cost = 5
	no_lesser = 0

/datum/stings/deaf/sting_action(mob/user, mob/living/T)
	. = ..()
	to_chat(T, SPAN_DANGER("Your ears pop and begin ringing loudly!"))
	T.sdisabilities |= DEAF
	spawn(300)	T.sdisabilities &= ~DEAF
	SSstatistics.add_field_details("changeling_powers","DS")
