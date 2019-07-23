/datum/department/science
	goals = null //we have no science department

/datum/goal/department/medical_fatalities/New()
	..()
	max_fatalities = rand(1,3) //few crew
