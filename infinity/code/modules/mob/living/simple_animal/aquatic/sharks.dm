/mob/living/simple_animal/hostile/aquatic/megacarp
	name = "megacarp"
	desc = "Legends says that those monsters live in the deepest and darkest caverns."
	icon = 'icons/mob/megacarp.dmi'
	icon_state = "megacarp"
	icon_living = "megacarp"
	icon_dead = "megacarp_dead"
	faction = list("shark", "fishes")
	meat_amount = 15
	maxHealth = 500
	health = 500
	harm_intent_damage = 5
	natural_weapon = /obj/item/natural_weapon/bite/strong
	turns_per_move = 2
	move_to_delay = 2
	attack_same = 1
	speed = 0
	pixel_x = -16
	pixel_y = -16
	mob_size = MOB_LARGE
	break_stuff_probability = 50
	meat_type = /obj/item/reagent_containers/food/snacks/fish/carp

/obj/item/natural_weapon/bite/megacarp
	force = 50

/mob/living/simple_animal/hostile/aquatic/deathsquid
	name = "giant squid"
	desc = "RELEASE THE KRAKEN!"
	icon = 'icons/mob/deathsquid_large.dmi'
	icon_state = "deathsquid"
	icon_living = "deathsquid"
	icon_dead = "deathsquiddead"
	faction = list("shark", "fishes")
	meat_amount = 30
	meat_type = /obj/item/reagent_containers/food/snacks/fish
	maxHealth = 1500
	health = 1500
	harm_intent_damage = 5
	natural_weapon = /obj/item/natural_weapon/bite/deathsquid
	turns_per_move = 3
	move_to_delay = 1
	attack_same = 0
	speed = 1
	pixel_x = -32
	pixel_y = -32
	mob_size = MOB_LARGE
	break_stuff_probability = 80

/obj/item/natural_weapon/bite/deathsquid
	force = 60
