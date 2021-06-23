/decl/cultural_info/education
	desc_type =          "Education"
	category =            TAG_EDUCATION
	economic_power =      null
	language =            null

	var/education_tier =  EDUCATION_TIER_NONE
	var/list/qualifications

/decl/cultural_info/education/get_education_tier()
	return education_tier

/decl/cultural_info/education/get_qualifications()
	return qualifications
