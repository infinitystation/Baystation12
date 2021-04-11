/mob/living/simple_animal/hostile/retaliate/poison
	var/poison_per_bite = 6
	var/list/poison_types = list(/datum/reagent/soporific, /datum/reagent/lexorin)

/mob/living/simple_animal/hostile/retaliate/poison/AttackingTarget()
	. = ..()
	if(.)
		var/amount = poison_per_bite / poison_types.len
		for(var/P in poison_types)
			if(target_mob.reagents && !poison_per_bite == 0)
				target_mob.reagents.add_reagent(P, amount)
		return .

/mob/living/simple_animal/hostile/retaliate/poison/snake
	name = "snake"
	desc = "A slithery snake. These legless reptiles are the bane of mice and adventurers alike."

	icon = 'infinity/icons/mob/mobs.dmi'
	icon_state = "snake"
	icon_living = "snake"
	icon_dead = "snake_dead"

	speak_emote = list("hisses")
	emote_hear = list("moves their head up.")
	emote_see = list("flick their tongue.")

	health = 20
	maxHealth = 20

	attacktext = "bitten"
	attack_sound = 'sound/weapons/bite.ogg'
	melee_damage_lower = 5
	melee_damage_upper = 6

	response_help = "pets"
	response_disarm = "shoos"
	response_harm = "steps on"

	faction = "hostile"
	density = FALSE
	pass_flags = PASS_FLAG_TABLE
	mob_size = MOB_SMALL
	can_pry = FALSE
	destroy_surroundings = FALSE
	holder_type = /obj/item/weapon/holder/snake
	var/list/target_types = list(/mob/living/simple_animal/mouse, /mob/living/carbon/alien/diona)
	var/list/consumable_types = list(/mob/living/simple_animal/mouse)

/mob/living/simple_animal/hostile/retaliate/poison/snake/Initialize()
	. = ..()
	
	verbs |= /mob/living/proc/ventcrawl
	verbs |= /mob/living/proc/hide

	if(name == initial(name))
		name = "[name] ([sequential_id(/mob/living/simple_animal/hostile/retaliate/poison/snake)])"
	real_name = name

/mob/living/simple_animal/hostile/retaliate/poison/snake/ListTargets(var/dist = world.view)
	. = ..(dist)	// Надо получить список мобов, ибо в enemies хранится weakref ~bear1ake
	var/list/possible_targets = oview(dist, src.loc)	// А еще глянем, кто рядом в поле зрения?
	var/list/living_mobs = list()
	var/list/snake_targets = list()
	for (var/T in possible_targets)
		if(is_type_in_list(T, target_types))
			snake_targets |= T
		if(isliving(T))
			living_mobs |= T

	if(length(snake_targets) == 0)	// Не на кого охотится?
		return living_mobs & .	// Отфильтруем список мобов с enemies и вернем его
	return snake_targets // Пора на охоту

/mob/living/simple_animal/hostile/retaliate/poison/snake/AttackingTarget()
	if(is_type_in_list(target_mob, consumable_types))
		visible_message("<span class='notice'>[name] consumes [target_mob] in a single gulp!</span>", "<span class='notice'>You consume [target_mob] in a single gulp!</span>")
		adjustBruteLoss(-2 * target_mob.mob_size)
		QDEL_NULL(target_mob)
	else
		return ..()

// Нужно для кастомки ~bear1ake
/mob/living/simple_animal/hostile/retaliate/poison/snake/imprinted
	name = "snake"
	desc = "A slithery snake. These legless reptiles are the bane of mice and adventurers alike. Seems to be neutral for everyone."
	faction = "neutral"

/mob/living/simple_animal/hostile/retaliate/poison/snake/imprinted/safe
	name = "snake"
	desc = "A slithery snake. These legless reptiles are the bane of mice and adventurers alike. Seems to be neutral for everyone and it would be safe."
	faction = "neutral"
	poison_per_bite = 0
	poison_types = null

/obj/item/weapon/holder/snake
	name = "snake"
	icon = 'infinity/icons/mob/mobs.dmi'
	icon_state = "snake"
	desc = "A slithery snake. These legless reptiles are the bane of mice and adventurers alike."
	origin_tech = list(TECH_BIO = 3)

/obj/item/weapon/holder/snake/prepared
	name = "snake"
	desc = "A slithery snake. These legless reptiles are the bane of mice and adventurers alike. Seems to be neutral for everyone."
	var/prepared_type = /mob/living/simple_animal/hostile/retaliate/poison/snake/imprinted

/obj/item/weapon/holder/snake/prepared/New()
	..()

	var/mob/living/simple_animal/hostile/retaliate/poison/snake/S = new prepared_type(loc)
	contents |= S

/obj/item/weapon/holder/snake/prepared/update_state()	
	for(var/mob/M in contents)
		if(M.name != "snake")
			M.SetName(name)
			M.real_name = name
	
	..()

/obj/item/weapon/holder/snake/prepared/safe
	name = "snake"
	desc = "A slithery snake. These legless reptiles are the bane of mice and adventurers alike. Seems to be neutral for everyone and it would be safe."
	prepared_type = /mob/living/simple_animal/hostile/retaliate/poison/snake/imprinted/safe
