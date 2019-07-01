/mob/living/carbon/human/proc/agony_scream()
	if(src.stat)//No dead or unconcious people screaming pls.
		return

	if(src.isMonkey()|| gender == NEUTER)
		return

	var/screamsound = null
	if(gender == MALE)
		screamsound = "infinity/sound/voice/man_pain[rand(1,3)].ogg"

	if(gender == FEMALE)
		screamsound = "infinity/sound/voice/woman_pain[rand(1,4)].ogg"

	if(screamsound)
		playsound(src, screamsound, 25, 0, 1)

/mob/living/carbon/human/proc/agony_moan()
	if(src.stat)//No dead or unconcious people screaming pls.
		return

	if(src.isMonkey()|| gender == NEUTER)
		return

	var/moansound = null
	if(gender == MALE)
		moansound = "infinity/sound/voice/male_moan[rand(1,3)].ogg"

	if(gender == FEMALE)
		moansound = "infinity/sound/voice/woman_agony1.ogg"

	if(moansound)
		playsound(src, moansound, 25, 0, 1)
