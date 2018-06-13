/datum/absorbed_dna
	var/name
	var/datum/dna/dna
	var/speciesName
	var/list/languages
	var/list/flavour_texts

/datum/absorbed_dna/New(var/newName, var/newDNA, var/newSpecies, var/newLanguages, var/list/newFlavour)
	..()
	name = newName
	dna = newDNA
	speciesName = newSpecies
	languages = newLanguages
	flavour_texts = newFlavour ? newFlavour.Copy() : null
