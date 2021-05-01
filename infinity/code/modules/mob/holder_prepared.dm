/obj/item/weapon/holder
	var/prepared_type // Может быть кому-нибудь понадобится животное сразу? ~bear1ake

/obj/item/weapon/holder/New()
	..()

	if(prepared_type)
		var/mob/living/S = new prepared_type(loc)
		contents |= S

/obj/item/weapon/holder/crab/prepared
	name = "crab"
	desc = "A hard-shelled crustacean. Seems quite content to lounge around all the time."
	prepared_type = /mob/living/simple_animal/crab

/obj/item/weapon/holder/crow/prepared
	name = "crow"
	desc = "A large crow. Caw caw."
	prepared_type = /mob/living/simple_animal/crow

/obj/item/weapon/holder/fox/prepared
	name = "fox"
	desc = "It's a fox."
	prepared_type = /mob/living/simple_animal/fox

/obj/item/weapon/holder/rabbit/prepared
	name = "rabbit"
	desc = "The hippiest hop around."
	prepared_type = /mob/living/simple_animal/rabbit