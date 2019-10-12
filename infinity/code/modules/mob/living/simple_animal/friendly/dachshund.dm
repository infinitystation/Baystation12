/mob/living/simple_animal/corgi/dachshund
	name = "dachshund"
	desc = "A little small dogge with small legs, oww, cute."
	icon = 'infinity/icons/mob/mobs.dmi'
	icon_state = "archie"
	icon_living = "archie"
	icon_dead = "archie_dead"
	maxHealth = 30
	health = 30
	speak = list("Rrr", "Grrr", "Awoooo!", "BARK!", "BARK-BARK!!")
	speak_emote = list("barks", "woofs")
	emote_hear = list("barks", "woofs", "yaps","pants")
	emote_see = list("shakes its head", "shivers")
	turns_per_move = 3
	response_help = "pets"
	response_disarm = "gently pushes aside"
	response_harm = "kicks"
	stop_automated_movement_when_pulled = 1

/mob/living/simple_animal/dachshund/archie
	name = "Archie"
	desc = "A lil angry dogge named Archibald. He's so angry, he's probably planning to take over the world."
	gender = MALE