/datum/simptom
	var/name = "Basic Simptom"
	var/desc = "If you see this, tell a dev about this"

	var/level_needed = 1

	var/needed_biotype = DISEASE_BIOTYPE_ORGANIC
	var/biotype_added =  DISEASE_BIOTYPE_ORGANIC


/datum/simptom/proc/activate(var/mob/living/carbon/host, var/datum/disease/D)
	if(D.stage < level_needed)
		return


/datum/simptom/minor
	name = "Minor Simptom"
	desc = "If you see this, tell a dev about this"

	level_needed = 2

/datum/simptom/major
	name = "Major Simptom"
	desc = "If you see this, tell a dev about this"

	level_needed = 3

/datum/simptom/deadly
	name = "Deadly Simptom"
	desc = "If you see this, tell a dev about this"

	level_needed = 4
