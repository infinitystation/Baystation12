/mob/living/simple_animal/hostile/locust
	name = "locust"
	desc = "A small, scorpion-like animal. It's covered in purple chitin and looks dangerous."
	icon = 'infinity/icons/mob/purplebugs.dmi'
	icon_state = "locust"
	icon_living = "locust"
	icon_dead = "locust"
	icon_gib = "locust_gib"
	speak_emote = list("chitters")
	emote_hear = list("chitters")
	emote_see = list("rubs its forelegs together", "wipes its fangs", "stops suddenly")
	speak_chance = 0
	turns_per_move = 5
	see_in_dark = 7
	meat_type = /obj/item/weapon/reagent_containers/food/snacks/xenomeat
	meat_amount = 3
	response_help  = "pets"
	response_disarm = "gently pushes aside"
	response_harm   = "smashes"
	maxHealth = 15
	health = 15
	melee_damage_lower = 5
	melee_damage_upper = 10
	heat_damage_per_tick = 20
	cold_damage_per_tick = 20
	faction = "locust"
	pass_flags = PASS_FLAG_TABLE
	move_to_delay = 1
	speed = 0
	max_gas = list(GAS_N2O = 5)
	bleed_colour = "#baca07"
	break_stuff_probability = 0

/mob/living/simple_animal/hostile/locust/on_update_icon()
	if(stunned)
		icon_state = "[initial(icon_state)]_stunned"

/mob/living/simple_animal/hostile/locust/gib()
	create_reagents(25)
	reagents.add_reagent(/datum/reagent/acid/alien, 10) //HEHEHE
	reagents.add_reagent(/datum/reagent/potassium, 5)
	reagents.add_reagent(/datum/reagent/sugar, 5)
	reagents.add_reagent(/datum/reagent/phosphorus, 5)
	. = ..()

/mob/living/simple_animal/hostile/locust/death(var/gibbed)
	gib()
	. = ..()

/mob/living/simple_animal/hostile/locust/explosive
	name = "scuttler"
	desc = "A purple bug, filled with acid to the brim. It's fat and round."
	icon_state = "scuttler"
	icon_living = "scuttler"
	icon_dead = "scuttler"
	icon_gib = "scuttler_gib"
	speed = 1
	maxHealth = 10
	health = 10
	melee_damage_lower = 1
	melee_damage_upper = 1

/mob/living/simple_animal/hostile/locust/explosive/MoveToTarget()
	icon_state = "scuttler_rolling"
	speed = -1
	. = ..()

/mob/living/simple_animal/hostile/locust/explosive/LostTarget()
	icon_state = initial(icon_state)
	speed = initial(speed)
	. = ..()

/mob/living/simple_animal/hostile/locust/explosive/Bump(atom/A)
	gib() // hehe

/mob/living/simple_animal/hostile/locust/explosive/AttackingTarget()
	gib()