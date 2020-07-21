/mob/living/chorus/say(var/message, var/datum/language/speaking = null, var/verb="says", var/alt_name="")
	if(!..())
		return 0
	if(pylon)
		pylon.speak(message)
	else
		to_chat(src, "<span class='notice'>Broadcasting message to all followers...</span>")
		for(var/m in followers)
			var/datum/mind/mind = m
<<<<<<< HEAD
			to_chat(mind.current, "<span class='cult'><font size='3'>[message]</font></span>")
=======
			to_chat(mind.current, "<span class='cult'><font size='3'>[message]</font></span>")
>>>>>>> master
