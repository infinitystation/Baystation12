/obj/structure/railing/attack_hand(mob/user)
	if(isxenomorph(user))
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
		user.visible_message(SPAN_DANGER("[user] tears to pices [src] with it's claws!"), SPAN_DANGER("You tear [src]!"))
		take_damage(20)
	..()

/obj/structure/railing/mapped/ascent
	color = COLOR_PURPLE
