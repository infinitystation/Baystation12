/datum/reagent/ethanol/champagne //Glass
	name = "Champagne"
	id = "champagne"
	description = "Is this gold?"
	taste_description = "bitter taste"
	color = "#A89410"
	strength = 45

	value = 0.15 // Cost

	glass_name = "champagne"
	glass_desc = "Wow, it's bubbling!"
	glass_special = list(DRINK_FIZZ)

/obj/item/weapon/reagent_containers/food/drinks/bottle/champagne //Bottle
	name = "Champagne bottle"
	desc = "A champagne bottle."
	icon_state = "champagnebottle"
	volume = 100
	center_of_mass = "x=12;y=5"

	flags = 0 // starts closed

	New()
		..()
		reagents.add_reagent("champagne", 100)

	attack_self(mob/user as mob)
		if(!is_open_container())
			open(user)
		..()

	open(mob/user)
		if(do_after(user, 10, src))
			playsound(loc,'code/testCode/open.ogg', 100, 1)
			var/chance = rand(0,10)
			if (chance<2)
				playsound(loc,'code/testCode/psh.ogg', 100)
				user.visible_message("<span class='notice'>\The [user] unsuccessfully opens \the [src]</span>")
				new /obj/effect/decal/cleanable/champagne(usr.loc)
			else
				user.visible_message("<span class='notice'>\The [user] professional opens \the [src]</span>")
			flags |= OPENCONTAINER

/obj/effect/decal/cleanable/champagne //liquid
	name = "champagne"
	desc = "Is this gold?"
	gender = PLURAL
	density = 0
	anchored = 1
	icon = 'code/testCode/champagne.dmi'
	icon_state = "fchampagne1"
	random_icon_states = list("fchampagne1", "fchampagne2", "fchampagne3", "fchampagne4")
