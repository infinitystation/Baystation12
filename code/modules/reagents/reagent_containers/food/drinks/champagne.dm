/datum/reagent/ethanol/champagne
	name = "Champagne"
	description = "Is this a gold?"
	taste_description = "bitter taste"
	color = "#a89410"
	strength = 18

	value = 0.14 // cost

	glass_name = "champagne"
	glass_desc = "Wow, it's bubbling!"
	glass_special = list(DRINK_FIZZ)

/obj/effect/decal/cleanable/champagne
	name = "champagne"
	desc = "Is this gold?"
	gender = PLURAL
	icon = 'icons/obj/infinity_champagne.dmi'
	icon_state = "fchampagne1"
	color = COLOR_BRASS
	random_icon_states = list("fchampagne1", "fchampagne2", "fchampagne3", "fchampagne4")

/obj/item/weapon/reagent_containers/food/drinks/bottle/champagne
	name = "Champagne bottle"
	desc = "Sparkling wine made from exquisite grape varieties by the method of secondary fermentation in a bottle. Bubbling."
	icon = 'icons/obj/infinity_champagne.dmi'
	icon_state = "champagnebottle"
	center_of_mass = "x=12;y=5"

	atom_flags = 0 //starts closed
	var/opening

/obj/item/weapon/reagent_containers/food/drinks/bottle/champagne/New()
	..()
	reagents.add_reagent(/datum/reagent/ethanol/champagne, 100)

/obj/item/weapon/reagent_containers/food/drinks/bottle/champagne/open(mob/user)
	if(is_open_container())
		to_chat(user, SPAN_NOTICE("[src] is already open."))
		return
	else if(!opening)
		user.visible_message(SPAN_NOTICE("[user] tries to open \the [src]!"))
		opening = 1
	else
		to_chat(user, SPAN_NOTICE("You are already opening!"))
		return
	if(!do_after(user, 20, src))
		user.visible_message(SPAN_NOTICE("[user] tried to open \the [src], but failed!"))
		opening = 0
		return
	playsound(loc,'sound/effects/open.ogg', 100, 1)
	if(!user.skill_check(SKILL_COOKING, SKILL_BASIC))
		sleep(4)
		playsound(loc,'sound/effects/psh.ogg', 100)
		user.visible_message(SPAN_WARNING("[user] unprofessionaly opens \the [src]."))
		new /obj/effect/decal/cleanable/champagne(user.loc)
	else
		user.visible_message(SPAN_NOTICE("[user] professionaly opens \the [src]!"))
	atom_flags |= ATOM_FLAG_OPEN_CONTAINER
