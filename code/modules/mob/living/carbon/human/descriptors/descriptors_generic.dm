/datum/mob_descriptor/height
	name = "height"
	examine_name = "рост" //INF
	standalone_value_descriptors = list(
		"очень низкий рост",
		"низкий роста",
		"средний рост",
		"высокий роста",
		"очень выскокий роста"
		)
	comparative_value_descriptor_equivalent = "практически одного с вами"
	comparative_value_descriptors_smaller = list(
		"чуть ниже вашего",
		"ниже вашего",
		"куда ниже вашего",
		"крошечного роста - в полтора раза ниже вашего"
		)
	comparative_value_descriptors_larger = list(
		"чуть выше вашего",
		"выше вашего",
		"куда выше вашего",
		"возвышается над вами - в полтора раза выше вас"
		)

/datum/mob_descriptor/build
	name = "build"
	examine_name = "телосложение" //INF
	comparative_value_descriptor_equivalent = "практически одного с вами"
	standalone_value_descriptors = list(
		"худое телосложение",
		"стройное телосложение",
		"среднее телосложение",
		"подтянутое телосложение",
		"крепкое телосложение"
		)
	comparative_value_descriptors_smaller = list(
		"чуть меньше вашего",
		"меньше вашего",
		"куда меньше вашего",
		"тумбочка со шкафом на вашем фоне"
		)
	comparative_value_descriptors_larger = list(
		"чуть крепче вашего",
		"крупнее вашего",
		"куда крупнее вашего",
		"шкаф по сравнению с вами"
		)
