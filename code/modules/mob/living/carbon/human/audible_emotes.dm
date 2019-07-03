/proc/agony_scream(var/mob/M)
	var/screamsound = null
	if(M.stat)//No dead or unconcious people screaming pls.
		return

	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		if(H.isMonkey()|| M.gender == NEUTER)
			return

		if(M.gender == MALE)
			screamsound = "infinity/sound/voice/man_pain[rand(1,3)].ogg"

		if(M.gender == FEMALE)
			screamsound = "infinity/sound/voice/woman_pain[rand(1,4)].ogg"

		if(screamsound)
			playsound(M, screamsound, 25, 0, 1)

/proc/agony_moan(var/mob/M)
	var/moansound = null
	if(M.stat)//No dead or unconcious people screaming pls.
		return

	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		if(H.isMonkey()|| M.gender == NEUTER)
			return

		if(M.gender == MALE)
			moansound = "infinity/sound/voice/male_moan[rand(1,3)].ogg"

		if(M.gender == FEMALE)
			moansound = "infinity/sound/voice/woman_agony1.ogg"

		if(moansound)
			playsound(M, moansound, 25, 0, 1)
