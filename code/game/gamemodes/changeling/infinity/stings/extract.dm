/datum/stings/extract_dna
	name = "Extract DNA Sting (40)"
	desc = "Sting a target to extract their DNA."
	icon_state = "sting_extract"
	chemical_cost = 40
	no_lesser = 1

/datum/stings/extract_dna/can_sting(user, mob/living/carbon/human/T)
	. = ..()
	if((MUTATION_HUSK in T.mutations) || (T.species.species_flags & SPECIES_FLAG_NO_SCAN))
		to_chat(user, SPAN_LING("We cannot extract DNA from this creature!"))
		return 0
	if(T.species.species_flags & SPECIES_FLAG_NEED_DIRECT_ABSORB)
		to_chat(user, SPAN_LING("That species must be absorbed directly."))
		return
	if(islesserform(T))
		to_chat(user, SPAN_LING("The sting appears ineffective against this creature."))
		return 0
	if(T.stat == DEAD)
		to_chat(user, SPAN_LING("The sting can only be used against alive targets."))
		return 0

/datum/stings/extract_dna/sting_action(mob/user, mob/living/carbon/human/T)
	. = ..()
	var/datum/absorbed_dna/newDNA = new(T.real_name, T.dna, T.species.name, T.languages)
	user.absorbDNA(newDNA)
	SSstatistics.add_field_details("changeling_powers","ES")
