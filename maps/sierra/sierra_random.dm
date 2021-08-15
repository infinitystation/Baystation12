/obj/random/animal
	name = "random animal"
	desc = "This is a random animal."
	icon = 'icons/obj/power.dmi'
	icon_state = "hcell"
	
/obj/random/animal/spawn_choices()
	return list(
	/mob/living/simple_animal/hostile/meat/horror=1,
	/mob/living/simple_animal/hostile/antlion/mega=3,
	/mob/living/simple_animal/hostile/giant_spider/hunter=3,
	/mob/living/simple_animal/hostile/creature=1
	)
