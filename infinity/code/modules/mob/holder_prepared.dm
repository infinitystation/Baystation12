/obj/item/holder
	var/prepared_type // Может быть кому-нибудь понадобится животное сразу? ~bear1ake

/obj/item/holder/New()
	..()

	if(prepared_type)
		var/mob/living/S = new prepared_type(loc)
		contents |= S

/obj/item/holder/update_state()
	if(prepared_type)
		for(var/mob/M in contents)
			M.SetName(name)
			M.real_name = name

	..()

/obj/item/holder/crab/prepared
	name = "crab"
	desc = "A hard-shelled crustacean. Seems quite content to lounge around all the time."
	prepared_type = /mob/living/simple_animal/friendly/crab

/obj/item/holder/crow/prepared
	name = "crow"
	desc = "A large crow. Caw caw."
	prepared_type = /mob/living/simple_animal/crow

/obj/item/holder/fox/prepared
	name = "fox"
	desc = "It's a fox."
	prepared_type = /mob/living/simple_animal/friendly/fox

/obj/item/holder/rabbit/prepared
	name = "rabbit"
	desc = "The hippiest hop around."
	prepared_type = /mob/living/simple_animal/rabbit

/obj/item/holder/kitten/prepared
	name = "kitten"
	desc = "It's a kitten."
	prepared_type = /mob/living/simple_animal/friendly/cat/kitten
