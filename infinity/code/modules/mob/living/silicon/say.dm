/mob/living/silicon/handle_speech_sound()
	if(prob(20))								//Chanse of making a sound is decent, but not to hight (a bit lower, that Adherent have)
		var/list/returns[2]
		returns[1] = sound(pick(speech_sounds))	//Right now ../silicon/AI, ../silicon/robot, ../silicon/robot/flying and ../silicon/robot/drone have sounds
		returns[2] = 20
		return returns
	return ..()
