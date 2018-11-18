/datum/reagent/ethanol/champagne
	name = "Champagne"
	description = "Is this gold?"
	taste_description = "bitter taste"
	color = "#a89410"
	strength = 45

	value = 0.15 // Cost

	glass_name = "champagne"
	glass_desc = "Wow, it's bubbling!"
	glass_special = list(DRINK_FIZZ)

/obj/effect/decal/cleanable/champagne //dunno where it beter to be placed.
	name = "champagne"
	desc = "Is this gold?"
	gender = PLURAL
	icon = 'icons/obj/infinity_champagne.dmi'
	icon_state = "fchampagne1"
	random_icon_states = list("fchampagne1", "fchampagne2", "fchampagne3", "fchampagne4")

/obj/item/weapon/reagent_containers/food/drinks/bottle/champagne //Bottle
	name = "Champagne bottle"
	desc = "Sparkling wine made from exquisite grape varieties by the method of secondary fermentation in a bottle. Bubbling."
	icon = 'icons/obj/infinity_champagne.dmi' //redefine - true or not ? dunno
	icon_state = "champagnebottle"
	volume = 100
	center_of_mass = "x=12;y=5"

	atom_flags = 0 //starts closed

/obj/item/weapon/reagent_containers/food/drinks/bottle/champagne/New()
	..()
	reagents.add_reagent(/datum/reagent/ethanol/champagne, 100)

/obj/item/weapon/reagent_containers/food/drinks/bottle/champagne/attack_self(mob/user as mob)
	if(!is_open_container())
		open(user)
	..()

/obj/item/weapon/reagent_containers/food/drinks/bottle/champagne/open(mob/user)
	if(do_after(user, 25, src))
		playsound(loc,'sound/effects/open.ogg', 100, 1)
		var/chance = rand(0, 10)
		if (chance < 2)
			playsound(loc,'sound/effects/psh.ogg', 100)
			user.visible_message(SPAN_WARNING("[user] unsuccessfully opens \the [src]!"))
			new /obj/effect/decal/cleanable/champagne(user.loc)
		else
			user.visible_message(SPAN_NOTICE("[user] professional opens \the [src]!"))
		obj_flags |= ATOM_FLAG_OPEN_CONTAINER
/*
ÏÐÈ ÄÀËÜÍÅÉØÅÌ ÄÎËÁÀÂËÅÍÈÈ ÍÀÏÈÒÊÎÂ ÍÅ ÁÓÄÜÒÅ ÌÍÎÉ - ÏËÞÉÒÅ ÍÀ ÊÎÍÒÐÈÁÜÞÒÈÍÃ È ÏÈØÈÒÅ ÊÎÌÀÏÀÊÒÍÎ È ÁÛÑÒÐÎ
ÏÎËÍÛÅ ÈÌÅÍÀ ÏÐÎÊÎÂ ÄËß ÑÎÇÄÀÍÈß ÁÓÒÛËÎ ÁÓÕËÀ ÍÅ ÍÓÆÍÛ.
*/