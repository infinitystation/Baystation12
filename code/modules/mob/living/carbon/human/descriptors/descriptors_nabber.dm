/datum/mob_descriptor/body_length
	name = "body length"
	examine_name = "длина тела" //INF
	comparative_value_descriptor_equivalent = "практически такое же, что и вы"
	standalone_value_descriptors = list(
		"очень короткое тело",
		"довольно короткое тело",
		"среднее тело",
		"длинное тело",
		"очень длинное тело"
		)
	comparative_value_descriptors_smaller = list(
		"чуть короче вашего",
		"короче вашего",
		"куда короче вашего",
		"в два раза меньше вашего"
		)
	comparative_value_descriptors_larger = list(
		"чуть длиньше вашего",
		"длиннее вашего",
		"куда длиннее вашего",
		"в два раза длиннее вашего"
		)

/datum/mob_descriptor/body_length/get_first_person_message_start()
	return "У вас"

/datum/mob_descriptor/body_length/get_third_person_message_start(var/datum/gender/my_gender)
	return "Имеет"
