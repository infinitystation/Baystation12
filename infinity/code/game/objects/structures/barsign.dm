/obj/structure/sign/double/barsign/attack_ai(mob/user)
	var/sign_type = input(user, "What would you like to change the barsign to?") as null|anything in get_valid_states(0)
	if(!sign_type)
		return
	icon_state = sign_type
	to_chat(user, "<span class='notice'>You change the barsign.</span>")
