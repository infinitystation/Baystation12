/mob/living/proc/agony_scream()
	if(stat || is_species(SPECIES_MONKEY))
		return
	var/scream_sound = null
	var/message = null

	if(ishuman(src))
		var/mob/living/carbon/human/H = src
		if(!is_muzzled())
			switch(gender)
				if(MALE)
					scream_sound = pick('infinity/sound/voice/pain_male_1.ogg','infinity/sound/voice/pain_male_2.ogg','infinity/sound/voice/pain_male_3.ogg')
				if(FEMALE)
					scream_sound = pick('infinity/sound/voice/agony_female_1.ogg','infinity/sound/voice/agony_female_1.ogg','infinity/sound/voice/agony_female_1.ogg')
			message = "кричит от боли!"
		else
			message = "издает громкое мычание!"

		if(scream_sound)
			if(H.species.name in SOUNDED_SPECIES)
				if(H.species.name == SPECIES_RESOMI)
					scream_sound = 'infinity/sound/voice/resomisneeze.ogg'
				playsound(src, scream_sound, 50, 0, 1)

	if(message)
		custom_emote(2, message)

/mob/living/proc/agony_moan()
	if(stat || is_species(SPECIES_MONKEY))
		return
	var/moan_sound = null
	var/message = null

	if(ishuman(src))
		var/mob/living/carbon/human/H = src
		if(!is_muzzled())
			switch(gender)
				if(MALE) moan_sound = pick('infinity/sound/voice/moan_male_1.ogg','infinity/sound/voice/moan_male_2.ogg','infinity/sound/voice/moan_male_3.ogg')
				if(FEMALE) moan_sound = pick('infinity/sound/voice/moan_female_1.ogg','infinity/sound/voice/moan_female_2.ogg','infinity/sound/voice/moan_female_3.ogg')
			message = "стонет от боли!"
		else
			message = "издает громкое мычание!"

		if(moan_sound)
			if(H.species.name in SOUNDED_SPECIES)
				playsound(src, moan_sound, 50, 0, 1)

	if(message)
		custom_emote(2, message)
