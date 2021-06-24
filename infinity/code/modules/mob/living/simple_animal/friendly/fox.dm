//Foxxy
/mob/living/simple_animal/friendly/fox
	name = "fox"
	desc = "It's a fox."
	icon = 'infinity/icons/mob/mobs.dmi'
	icon_state = "fox"
	icon_living = "fox"
	icon_dead = "fox_dead"
	speak_emote = list("geckers", "barks")
	turns_per_move = 5
	see_in_dark = 6
	response_help = "pets"
	response_disarm = "gently pushes aside"
	response_harm = "kicks"

	ai_holder_type = /datum/ai_holder/simple_animal/passive/fox
	say_list_type = /datum/say_list/fox

/datum/ai_holder/simple_animal/passive/fox // Как кошка, только лиса ~bear1ake
	can_flee = TRUE
	speak_chance = 1

/datum/say_list/fox
	speak = list("Ack-Ack","Ack-Ack-Ack-Ackawoooo","Geckers","Awoo","Tchoff")
	emote_hear = list("howls.","barks.")
	emote_see = list("shakes its head.", "shivers.")

//Captain fox
/mob/living/simple_animal/friendly/fox/renault
	name = "Renault"
	desc = "Renault, the Captain's trustworthy female fox. Sometimes a bit smarter than an actual captain..."
	gender = FEMALE
	universal_speak = TRUE //actually smart. But rememer: Ack-Ack!
