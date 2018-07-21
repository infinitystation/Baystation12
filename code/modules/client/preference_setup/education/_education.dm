#define EDU_PRIMARY 	0x1
#define EDU_SECONDARY 	0x2
#define EDU_EXTRA		0x4
#define EDU_SKILLS		0x8
#define EDU_ENV			0x10

/datum/education
	name = "education"
	var/list/datum/edu/primary = list()
	var/list/datum/edu/secondary = list()
	var/list/datum/edu/extra = list()
	var/list/datum/edu/skills = list()
	var/list/datum/edu/env = list()
	var/edu_points = 16

/datum/edu
	name = "high school"
	var/desc = "полное среднее образование"
	var/full_desc = ""
	var/duration = 144
	var/edu_points = 6

	var/list/compatible_profs = list()
	var/list/preset_skills = list()

	var/list/datum/edu/prim_reqs = list()
	var/list/datum/edu/sec_reqs = list()
	var/list/datum/edu/extra_reqs = list()
	var/list/datum/edu/skills_reqs = list()
	var/type = EDU_PRIMARY

/datum/edu/proc/compatible(datum/education/target)
	for(var/datum/edu/ED in prim_reqs)
		if(!target.primary.Find(ED))
			return 0

	for(var/datum/edu/ED in sec_reqs)
		if(!target.primary.Find(ED))
			return 0

	for(var/datum/edu/ED in extra_reqs)
		if(!target.primary.Find(ED))
			return 0

	for(var/datum/edu/ED in skills_reqs)
		if(!target.primary.Find(ED))
			return 0

/datum/edu/school
	name = "elementary school"
	var/desc = "4 класса начальной школы"
	var/full_desc = ""
	var/duration = 48
	var/list/compatible_profs = list()
	var/list/preset_skills = list()

/datum/edu/school/medium
	name = "medium school"
	var/desc = "9 классов средней школы"
	var/full_desc = ""
	var/duration = 108
	var/list/compatible_profs = list()
	var/list/preset_skills = list()

/datum/edu/school/high
	name = "medium school"
	var/desc = "9 классов средней школы"
	var/full_desc = ""
	var/duration = 108
	var/list/compatible_profs = list()
	var/list/preset_skills = list()