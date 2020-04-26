/decl/cultural_info/culture/hidden/abductor
	name = CULTURE_ABDUCTOR_A
	language = LANGUAGE_ABDUCTORS
	default_language = LANGUAGE_ABDUCTORS
	additional_langs = null
	var/caste_name = "Agent"
	var/mothership_names = list("Alpha", "Beta", "Gamma", "Delta", "Epsilon", "Teta", "Sigma", "Tau", "Ipsilon", "Psi", "Omega")

/decl/cultural_info/culture/hidden/abductor/get_random_name()
	return "Mothership [pick(mothership_names)] [caste_name]"

/decl/cultural_info/culture/hidden/abductor/scientist
	name = CULTURE_ABDUCTOR_S
	caste_name = "Scientist"
