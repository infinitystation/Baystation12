/obj/item/weapon/reagent_containers/food/snacks/meat
	name = "meat"
	desc = "A slab of meat."
	icon = 'icons/obj/food_ingredients.dmi'
	icon_state = "meat"
	slice_path = /obj/item/weapon/reagent_containers/food/snacks/rawcutlet
	slices_num = 3
	health = 180
	filling_color = "#ff1c1c"
	center_of_mass = "x=16;y=14"
	New()
		..()
		reagents.add_reagent(/datum/reagent/nutriment/protein, 9)
		src.bitesize = 3
//[INF]
/obj/item/weapon/reagent_containers/food/snacks/meat/attack(mob/living/carbon/slime/M as mob, mob/user as mob)
	var/slimenutrition = 100
	if(!istype(M, /mob/living/carbon/slime)) //If the target is not a slime.
		return ..()
	if (reagents.has_reagent(/datum/reagent/blood, 10) && M.nutrition < (M.get_max_nutrition()-slimenutrition))
		to_chat(user, SPAN_WARNING("[M] would like this!"))
		M.adjust_nutrition(slimenutrition)
		qdel(src)
	else
		to_chat(user, SPAN_WARNING("[M] does not show any interest..."))
		return ..()
//[/INF]

/obj/item/weapon/reagent_containers/food/snacks/meat/syntiflesh
	name = "synthetic meat"
	desc = "A slab of flesh synthetized from reconstituted biomass or artificially grown from chemicals."
	icon = 'icons/obj/food.dmi'

// Separate definitions because some food likes to know if it's human.
// TODO: rewrite kitchen code to check a var on the meat item so we can remove
// all these sybtypes.
/obj/item/weapon/reagent_containers/food/snacks/meat/human
/obj/item/weapon/reagent_containers/food/snacks/meat/monkey
	//same as plain meat

/obj/item/weapon/reagent_containers/food/snacks/meat/corgi
	name = "corgi meat"
	desc = "Tastes like... well, you know."

/obj/item/weapon/reagent_containers/food/snacks/meat/beef
	name = "beef slab"
	desc = "The classic red meat."

/obj/item/weapon/reagent_containers/food/snacks/meat/goat
	name = "chevon slab"
	desc = "Goat meat, to the uncultured."

/obj/item/weapon/reagent_containers/food/snacks/meat/chicken
	name = "chicken piece"
	desc = "It tastes like you'd expect."

/obj/item/weapon/reagent_containers/food/snacks/meat/chicken/game
	name = "game bird piece"
	desc = "Fresh game meat, harvested from some wild bird."