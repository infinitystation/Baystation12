/mob/living/simple_animal/hostile/retaliate/snake
	name = "snake"
	desc = "A slithery snake. These legless reptiles are the bane of mice and adventurers alike."

	icon = 'infinity/icons/mob/mobs.dmi'
	icon_state = "snake"
	icon_living = "snake"
	icon_dead = "snake_dead"

	speak_emote = list("hisses")

	health = 20
	maxHealth = 20

	natural_weapon = /obj/item/natural_weapon/bite/snake

	response_help = "pets"
	response_disarm = "shoos"
	response_harm = "steps on"

	faction = "hostile"
	density = FALSE
	pass_flags = PASS_FLAG_TABLE
	mob_size = MOB_SMALL
	can_pry = FALSE
	destroy_surroundings = FALSE
	holder_type = /obj/item/holder/snake

	var/poison_per_bite = 6
	var/list/poison_types = list(/datum/reagent/soporific, /datum/reagent/lexorin)

	var/list/target_types = list(/mob/living/simple_animal/friendly/mouse, /mob/living/carbon/alien/diona)
	var/list/consumable_types = list(/mob/living/simple_animal/friendly/mouse)

	ai_holder_type = /datum/ai_holder/simple_animal/retaliate/cooperative/snake
	say_list_type = /datum/say_list/snake

/datum/ai_holder/simple_animal/retaliate/cooperative/snake
	can_flee = TRUE

/obj/item/natural_weapon/bite/snake
	force = 5
	hitsound = 'sound/weapons/bite.ogg'

/mob/living/simple_animal/hostile/retaliate/snake/Initialize()
	. = ..()

	verbs |= /mob/living/proc/ventcrawl
	verbs |= /mob/living/proc/hide

	if(name == initial(name))
		name = "[name] ([sequential_id(/mob/living/simple_animal/hostile/retaliate/snake)])"
	real_name = name

/mob/living/simple_animal/hostile/retaliate/snake/apply_melee_effects(atom/A)
	var/mob/living/L
	if(isliving(A))
		L = A
	if(is_type_in_list(L, consumable_types))
		visible_message(SPAN_NOTICE("[name] consumes [L] in a single gulp!"), SPAN_NOTICE("You consume [L] in a single gulp!"))
		adjustBruteLoss(-2 * L.mob_size)
		QDEL_NULL(L)
	else
		var/amount = poison_per_bite / poison_types.len
		for(var/P in poison_types)
			if(L.reagents && !poison_per_bite == 0)
				var/target_zone = pick(BP_CHEST,BP_CHEST,BP_CHEST,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_HEAD)
				if(L.can_inject(src, null, target_zone))
					L.reagents.add_reagent(P, amount)

/*
/mob/living/simple_animal/hostile/retaliate/snake/ListTargets(var/dist = world.view)
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
*/

/datum/say_list/snake
	emote_hear = list("moves their head up.")
	emote_see = list("flick their tongue.")

// Нужно для кастомки ~bear1ake
/mob/living/simple_animal/hostile/retaliate/snake/imprinted
	name = "snake"
	desc = "A slithery snake. These legless reptiles are the bane of mice and adventurers alike. Seems to be neutral for everyone."
	faction = "neutral"

/mob/living/simple_animal/hostile/retaliate/snake/imprinted/safe
	name = "snake"
	desc = "A slithery snake. These legless reptiles are the bane of mice and adventurers alike. Seems to be neutral for everyone and it would be safe."
	poison_per_bite = 0
	poison_types = null

/obj/item/holder/snake
	name = "snake"
	icon = 'infinity/icons/mob/mobs.dmi'
	icon_state = "snake"
	desc = "A slithery snake. These legless reptiles are the bane of mice and adventurers alike."
	origin_tech = list(TECH_BIO = 3)

	item_icons = list(
		slot_l_hand_str = 'infinity/icons/mob/onmob/items/mob_holder.dmi',
		slot_r_hand_str = 'infinity/icons/mob/onmob/items/mob_holder.dmi',
		slot_head_str = 'infinity/icons/mob/onmob/items/mob_holder.dmi'
	)

	item_state_slots = list(
		slot_l_hand_str = "snake_l",
		slot_r_hand_str = "snake_r",
		slot_head_str = "snake_u"
	)

/obj/item/holder/snake/prepared
	name = "snake"
	desc = "A slithery snake. These legless reptiles are the bane of mice and adventurers alike. Seems to be neutral for everyone."
	prepared_type = /mob/living/simple_animal/hostile/retaliate/snake/imprinted

/obj/item/holder/snake/prepared/safe
	name = "snake"
	desc = "A slithery snake. These legless reptiles are the bane of mice and adventurers alike. Seems to be neutral for everyone and it would be safe."
	prepared_type = /mob/living/simple_animal/hostile/retaliate/snake/imprinted/safe
