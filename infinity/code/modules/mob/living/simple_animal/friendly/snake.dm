/mob/living/simple_animal/hostile/retaliate/poison
	var/poison_per_bite = 5
	var/poison_type = /datum/reagent/toxin

/mob/living/simple_animal/hostile/retaliate/poison/AttackingTarget()
	. = ..()
	if(.)
		if(target_mob.reagents && !poison_per_bite == 0)
			target_mob.reagents.add_reagent(poison_type, poison_per_bite)
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

	attacktext = "bites"
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

/mob/living/simple_animal/hostile/retaliate/poison/snake/Initialize()
	. = ..()
	
	verbs += /mob/living/proc/ventcrawl
	verbs += /mob/living/proc/hide

	if(name == initial(name))
		name = "[name] ([sequential_id(/mob/living/simple_animal/hostile/retaliate/poison/snake)])"
	real_name = name

/mob/living/simple_animal/hostile/retaliate/poison/snake/ListTargets(var/dist = world.view)
	. = ..(dist)	// Надо получить список мобов, ибо в enemies хранится weakref ~bear1ake
	var/list/L = oview(dist, src.loc)	// А еще глянем, кто рядом?
	var/list/living_mobs = list()
	var/list/mice_and_nymph = list()
	for (var/HM in L)
		if(istype(HM, /mob/living/simple_animal/mouse) || istype(HM, /mob/living/carbon/alien/diona))
			mice_and_nymph += HM
		if(isliving(HM))
			living_mobs += HM

	if(length(mice_and_nymph) == 0)	// Не на кого охотится?
		return living_mobs & .	// Отфильтруем список мобов с enemies и вернем его
	return mice_and_nymph // Пора на охоту

/mob/living/simple_animal/hostile/retaliate/poison/snake/AttackingTarget()
	if(istype(target_mob, /mob/living/simple_animal/mouse))
		visible_message("<span class='notice'>[name] consumes [target_mob] in a single gulp!</span>", "<span class='notice'>You consume [target_mob] in a single gulp!</span>")
		QDEL_NULL(target_mob)
		adjustBruteLoss(-2)
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
	poison_type = null

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

/obj/item/weapon/holder/snake/prepared/safe
	name = "snake"
	desc = "A slithery snake. These legless reptiles are the bane of mice and adventurers alike. Seems to be neutral for everyone and it would be safe."
	prepared_type = /mob/living/simple_animal/hostile/retaliate/poison/snake/imprinted/safe
