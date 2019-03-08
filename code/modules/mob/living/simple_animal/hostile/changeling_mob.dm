/mob/living/simple_animal/hostile/true_changeling
	name = "shambling horror"
	desc = "A monstrous creature, made of twisted flesh and bone."
	speak_emote = list("gibbers")
	icon = 'icons/mob/infinity_mob.dmi'
	icon_state = "abomination"
	icon_living = "abomination"
	icon_dead = "abomination_dead"
	stop_automated_movement = 1
	universal_speak = 1
	universal_understand = 1

	mob_swap_flags = HUMAN|SIMPLE_ANIMAL|SLIME|MONKEY
	mob_push_flags = ALLMOBS

	response_help  = "pets"
	response_disarm = "shoves"
	response_harm   = "harmlessly punches"
	maxHealth = 750
	health = 750
	harm_intent_damage = 0
	melee_damage_lower = 20
	melee_damage_upper = 30
	mob_size = 25
	environment_smash = 2
	break_stuff_probability = 85
	attacktext = "mangled"
	attack_sound = 'sound/weapons/bloodyslice.ogg'

	see_in_dark = 8
	see_invisible = SEE_INVISIBLE_NOLIGHTING

	speed = 0.1 //a bit slower than healthy human

	minbodytemp = 0
	maxbodytemp = 350
	min_gas = null
	max_gas = null

	var/is_devouring = FALSE

/mob/living/simple_animal/hostile/true_changeling/Initialize()
	. = ..()
	if(prob(25))
		icon_state = "horror"
		icon_living = "horror"
		icon_dead = "horror_dead"
	else if(prob(25))
		icon_state = "horror_alt"
		icon_living = "horror_alt"
		icon_dead = "horror_alt_dead"

/mob/living/simple_animal/hostile/true_changeling/Life()
	..()
	adjustBruteLoss(-10) //it will slowly heal brute damage, making fire/laser a stronger option

/mob/living/simple_animal/hostile/true_changeling/mind_initialize()
	..()
	mind.assigned_role = "Changeling"

/mob/living/simple_animal/hostile/true_changeling/death(gibbed)
	..()
	if(!gibbed)
		visible_message("<b>[src]</b> lets out a waning scream as it falls, twitching, to the floor!")
		playsound(loc, 'sound/effects/creepyshriek.ogg', 30, 1)
		gibs(src.loc)
		qdel(src)
		return

/mob/living/simple_animal/hostile/true_changeling/verb/ling_devour(mob/living/target as mob in oview())
	set category = "Changeling"
	set name = "Devour"
	set desc = "Devours a creature, destroying its body and regenerating health."

	if(last_special > world.time)
		to_chat(src, "<span class='warning'>We must wait a little while before we can use this ability again!</span>")
		return

	if(!Adjacent(target))
		return

	if(target.isSynthetic())
		to_chat(src, "<span class='warning'>[target] looks disgusting! Just rip it appart!</span>")
		return

	if(src.is_devouring)
		to_chat(src, "<span class='warning'>We are already feasting on something!</span>")
		return 0

	if(!health)
		to_chat(src, "<span class='notice'>We are dead, we cannot use any abilities!</span>")
		return

	if(!target.incapacitated(INCAPACITATION_DEFAULT))
		to_chat(src, "<span class='notice'>The pray must be downed before we'll start!</span>")
		return

	src.visible_message("<span class='warning'>[src] begins ripping apart and feasting on [target]!</span>")
	to_chat(src, "<span class='warning'>We must stand still until [target] flesh will not be our!</span>")
	src.is_devouring = TRUE
	last_special = world.time + 250

	target.adjustBruteLoss(35)

	if(!do_mob(src, target, 150))
		to_chat(src, "<span class='warning'>You need to wait longer to devour \the [target]!</span>")
		src.is_devouring = FALSE
		return 0

	src.visible_message("<span class='warning'>[src] tears a chunk from \the [target]'s flesh!</span>")

	target.adjustBruteLoss(35)

	if(!do_mob(src, target, 150))
		to_chat(src, "<span class='warning'>You need to wait longer to devour \the [target]!</span>")
		src.is_devouring = FALSE
		return 0

	src.visible_message("<span class='warning'>[target] is completely devoured by [src]!</span>", \
						"<span class='danger'>You completely devour \the [target]!</span>")
	target.gib()
	rejuvenate()
	updatehealth()
	last_special = world.time + 250
	src.is_devouring = FALSE
	return

/mob/living/simple_animal/hostile/true_changeling/verb/dart(mob/living/target as mob in oview())
	set name = "Launch Bone Dart"
	set desc = "Launches a Bone Dart at a target."
	set category = "Changeling"

	if(!health)
		to_chat(usr, "<span class='notice'>We are dead, we cannot use any abilities!</span>")
		return

	if(last_special > world.time)
		return

	last_special = world.time + 45

	visible_message("<span class='warning'>\The [src]'s skin bulges and tears, launching a bone-dart at [target]!</span>")

	playsound(src.loc, 'sound/weapons/bloodyslice.ogg', 50, 1)
	var/obj/item/weapon/bone_dart/A = new /obj/item/weapon/bone_dart(usr.loc)
	A.throw_at(target, 10, 20, usr)
//	add_logs(src, target, "launched a bone dart at")
