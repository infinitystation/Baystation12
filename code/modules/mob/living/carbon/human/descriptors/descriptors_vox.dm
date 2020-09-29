/datum/mob_descriptor/vox_markings
	name = "neck markings"
	chargen_label = "neck markings (rank)"
	skip_species_mention = TRUE
	standalone_value_descriptors = list(
		"очень простые",
		"довольно простые",
		"сложные",
		"довольно сложные",
		"невообразимо сложные"
		)
	chargen_value_descriptors = list(
		"servitor"  =     1,
		"labourer" =      2,
		"cannon fodder" = 3,
		"raider" =        4,
		"leader" =        5
		)
	comparative_value_descriptor_equivalent = "той же важности, что и вы"
	comparative_value_descriptors_smaller = list(
		"чуть менее важные, чем ваши",
		"куда менее важные, чем ваши",
		"недойтосные вашего внимания"
		)
	comparative_value_descriptors_larger = list(
		"чуть важнее ваших",
		"куда важнее ваших",
		"внушающшие вам бесприкословное подчинение и уважение"
		)

/datum/mob_descriptor/vox_markings/get_first_person_message_start()
	. = "Ваши узоры на шее"

/datum/mob_descriptor/vox_markings/get_third_person_message_start(var/datum/gender/my_gender)
	. = "Узоры на шее"
