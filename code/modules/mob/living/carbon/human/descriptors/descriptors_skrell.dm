/datum/mob_descriptor/headtail_length
	name = "headtail length"
	chargen_label = "headtails (gender)"
	skip_species_mention = TRUE
	standalone_value_descriptors = list(
		"короткие хвосты",
		"длинные хвосты"
		)
	chargen_value_descriptors = list(
		"короткий (мужчина)" =  1,
		"длинный (женщина)" = 2
		)

/datum/mob_descriptor/headtail_length/get_first_person_message_start()
	. = "У вас"

/datum/mob_descriptor/headtail_length/get_third_person_message_start(var/datum/gender/my_gender)
	. = "Имеет"

/datum/mob_descriptor/headtail_length/get_comparative_value_string_equivalent(var/my_value, var/datum/gender/my_gender, var/datum/gender/other_gender)
	. = "показывая, что это [my_value == 1 ? "мужчина" : "женщина"]"

/datum/mob_descriptor/headtail_length/get_comparative_value_string_smaller(var/value, var/datum/gender/my_gender, var/datum/gender/other_gender)
	. = "показывая, что это мужчина"

/datum/mob_descriptor/headtail_length/get_comparative_value_string_larger(var/value, var/datum/gender/my_gender, var/datum/gender/other_gender)
	. = "показывая, что это женщина"
