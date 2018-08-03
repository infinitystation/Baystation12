/mob/living/simple_animal/lizard
	name = "lizard"
	desc = "A cute tiny lizard."
	icon = 'icons/mob/critter.dmi'
	icon_state = "lizard"
	icon_living = "lizard"
	icon_dead = "lizard-dead"
	speak_emote = list("hisses")
	health = 5
	maxHealth = 5
	attacktext = "bitten"
	melee_damage_lower = 1
	melee_damage_upper = 2
	response_help  = "pets"
	response_disarm = "shoos"
	response_harm   = "stomps on"
	mob_size = MOB_MINISCULE
	can_escape = 1
	possession_candidate = 1
	holder_type = /obj/item/weapon/holder/lizard
	pass_flags = PASS_FLAG_TABLE

/mob/living/simple_animal/lizard/wizard
	name = "Wizard"
	desc = "A very rare lizard species often said to possess supernatural powers. Very cute and tiny."

	icon_state = "lizardwizard"
	icon_living = "lizardwizard"
	icon_dead = "lizardwizard_dead"

	var/jaunting = FALSE

/mob/living/simple_animal/lizard/wizard/Life()
	..()

	if(!jaunting && prob(2))
		jaunt()

/mob/living/simple_animal/lizard/wizard/proc/jaunt()
	jaunting = TRUE
	flick("lizardwizard_liquify", src)

	#define liquify_anim_duration 8.4

	spawn(liquify_anim_duration)
		set_invisibility(101)

		sleep (5 SECONDS)

		set_invisibility(initial(invisibility))
		flick("lizardwizard_reappear", src)
		jaunting = FALSE

	#undef liquify_anim_duration

