/mob/living/simple_animal/rabbit
	name = "\improper rabbit"
	desc = "The hippiest hop around."
	icon = 'icons/mob/Easter.dmi'
	icon_state = "rabbit_white"
	icon_living = "rabbit_white"
	icon_dead = "rabbit_white_dead"
	response_help  = "pets"
	response_disarm = "gently pushes aside"
	response_harm   = "stomps"
	speak_emote = list("sniffles","twitches")
	emote_hear = list("hops.")
	emote_see = list("hops around","bounces up and down")
	meat_type = /obj/item/weapon/reagent_containers/food/snacks/meat
	meat_amount = 1
	mob_size = MOB_SMALL

/mob/living/simple_animal/rabbit/brown
	icon_state = "rabbit_brown"
	icon_living = "rabbit_brown"
	icon_dead = "rabbit_brown_dead"

/mob/living/simple_animal/rabbit/black
	icon_state = "rabbit_black"
	icon_living = "rabbit_black"
	icon_dead = "rabbit_black_dead"

// Space one
/mob/living/simple_animal/rabbit/space
	icon_state = "s_rabbit_white"
	icon_living = "s_rabbit_white"
	icon_dead = "s_rabbit_white_dead"
	min_gas = list("oxygen" = 0)
	max_gas = list("phoron" = 0, "carbon_dioxide" = 0)
	minbodytemp = 0
	maxbodytemp = 1500

/mob/living/simple_animal/rabbit/space/brown
	icon_state = "s_rabbit_brown"
	icon_living = "s_rabbit_brown"
	icon_dead = "s_rabbit_brown_dead"

/mob/living/simple_animal/rabbit/space/black
	icon_state = "s_rabbit_black"
	icon_living = "s_rabbit_black"
	icon_dead = "s_rabbit_black_dead"
