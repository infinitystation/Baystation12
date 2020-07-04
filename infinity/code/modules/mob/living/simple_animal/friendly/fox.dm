//Foxxy
/mob/living/simple_animal/fox
	name = "fox"
	desc = "It's a fox."
	icon = 'infinity/icons/mob/mobs.dmi'
	icon_state = "fox"
	icon_living = "fox"
	icon_dead = "fox_dead"
	speak = list("Ack-Ack","Ack-Ack-Ack-Ackawoooo","Geckers","Awoo","Tchoff")
	speak_emote = list("geckers", "barks")
	emote_hear = list("howls.","barks.")
	emote_see = list("shakes its head.", "shivers.")
	speak_chance = 1
	turns_per_move = 5
	see_in_dark = 6
	response_help = "pets"
	response_disarm = "gently pushes aside"
	response_harm = "kicks"

//Captain fox
/mob/living/simple_animal/fox/renault
	name = "Renault"
	desc = "Renault, the Captain's trustworthy female fox. Sometimes a bit smarter than an actual captain..."
	gender = FEMALE
	universal_speak = TRUE //actually smart. But rememer: Ack-Ack!
