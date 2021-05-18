/obj/item/toy/ringbell/tajalarm
	name = "Alarm terminal"
	desc = "Very suspicious red button. I really want to click on it."
	icon = 'infinity/icons/obj/toy.dmi'
	icon_state= "terminal"
	anchored = TRUE

/obj/item/toy/ringbell/tajalarm/attack_hand(mob/user as mob)
	if (user.a_intent == I_GRAB)
		user.visible_message("<span class='notice'>[user] press \the [src] orange button, signalling general gathering.</span>")
		playsound(user.loc, 'infinity/sound/items/sbortj.ogg', 40, extrarange=100)
	else if (user.a_intent == I_HURT)
		user.visible_message("<span class='warning'>[user] hit \the [src] red button, signalling an ALARM!!!</span>")
		playsound(user.loc, 'infinity/sound/items/tajalarm.ogg', 40, extrarange=100)
