/datum/stings/blind
	name = "Blind Sting (20)"
	desc = "Sting target"
	icon_state = "sting_blind"
	chemical_cost = 20
	no_lesser = 0
	visible = 1

/datum/stings/blind/sting_action(mob/user, mob/living/T)
	. = ..()
	to_chat(T, SPAN_DANGER("Your eyes burn horrificly!"))
	T.disabilities |= NEARSIGHTED
	spawn(300) T.disabilities &= ~NEARSIGHTED
	T.eye_blind = 10
	T.eye_blurry = 20
	SSstatistics.add_field_details("changeling_powers","BS")
