/datum/active_effect
	var/duration //In ticks. Handled in Life()
	var/infinite = FALSE
	var/mob/living/carbon/human/owner

/datum/active_effect/proc/add_to_human(var/mob/living/carbon/human/H)
	H.active_effects.Add(src)
	owner = H

/datum/active_effect/proc/handle_effect()
	if(!infinite)
		duration -= 1
		if(duration < 1)
			handle_removal()
			owner.active_effects.Remove(src)
			qdel(src)

/datum/active_effect/proc/handle_removal()

/datum/active_effect/proc/handle_death()
	handle_removal()
	owner.active_effects.Remove(src)
	qdel(src)



/datum/active_effect/speech_affection

/datum/active_effect/speech_affection/proc/handle_heard_msg(var/message)
	return message

/datum/active_effect/speech_affection/proc/handle_heard_name(var/speaker_name)
	return speaker_name

/datum/active_effect/speech_affection/proc/handle_speech(var/message)
	return message

/datum/active_effect/speech_affection/mirror_curse
	duration = 5 MINUTES

/datum/active_effect/speech_affection/mirror_curse/handle_heard_name(var/speaker_name)
	speaker_name = owner.real_name
	return speaker_name



/datum/active_effect/no_pain

/datum/active_effect/no_pain/necromancy
	infinite = TRUE

/datum/active_effect/no_pain/blood_bond
	var/list/blood_bonded = list()
	infinite = TRUE

/datum/active_effect/no_pain/blood_bond/handle_death()
	handle_removal()
	owner.active_effects.Remove(src)
	for(var/mob/living/carbon/human/H in blood_bonded)
		if(H == owner)
			continue

		for(var/datum/active_effect/no_pain/blood_bond/effect in H.active_effects)
			effect.handle_removal() //So they won't recurse

		H.dust()

	owner.dust()

	qdel(src)