/datum/say_list/lost_soul
	emote_see = list(
		"looks around",
		"shakes his body in all directions",
		"shakes his head in all directions",
	)

	speak = list(
		"He's coming...",
		"He's leading me...",
		"Life for Nar-Si",
		"Protect the temple...",
	)

	say_maybe_target = list(
		"Show yourself...",
		"Who... are... you...?",
	)

	say_got_target = list(
		"A heretic...",
		"Invasion...",
	)

	say_escalate = list(
		"You want to die... Don't run...",
		"You chose death... Don't try to run...",
		"Give yourself to him...",
	)

	say_threaten = list(
		"Go away...",
		"This is the temple of the Great. You're not supposed to be here...",
	)

	say_stand_down = list(
		"Where are you...?",
	)

	say_understood = list(
		"I obey...",
		"Yes...",
	)

	say_cannot = list(
		"No...",
	)


/mob/living/simple_animal/hostile/lost_soul
	name = "Lost soul"
	desc = "Wait what?!"

	icon = 'maps/away_inf/temple/icons/mob/simple_mobs.dmi'
	icon_state = "lost_soul"
	icon_living = "lost_soul"
	icon_dead = "lost_soul_dead"

	health = 100
	maxHealth = 100
	unsuitable_atmos_damage = 0
	harm_intent_damage = 5

	a_intent = I_HURT
	can_escape = TRUE

	response_help = "pokes"
	response_disarm = "shoves"
	response_harm = "hits"

	natural_weapon = /obj/item/natural_weapon/claws

	turns_per_move = 5
	speed = 4

	faction = "cult"

	say_list_type = /datum/say_list/lost_soul
	ai_holder_type = /datum/ai_holder/simple_animal/guard


/mob/living/simple_animal/hostile/lost_soul/Initialize()
	. = ..()
	ai_holder.speak_chance = 30
