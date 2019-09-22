/obj/item/weapon/reagent_containers/food/snacks/mandragora
	name = "mandragora's root"
	desc = "In the ancient legends of the times of the knights,\
			it is said that if you uproot out the root of a <font color='#640640'>mandragora</font> or damage a uprooted one,\
			the <font color='#640640'>mandragora</font> will scream, but only wizards will hear this scream, ordinary people will experience their deepest fears,\
			but if you are deaf, <font color='#640640'>mandragora</font> will not affect you."
	icon = 'infinity/icons/obj/hydroponics/products.dmi'
	icon_state = "mandragora"
	var/exhaustion = 10 //how many attacks you need to exhaust one root
	var/datum/hydroponics_effect/eff = new/datum/hydroponics_effect/halucination/mandragora_scream
	color = "#3a1700"
	reagents = list()
	var/reagents_on_new = list(/datum/reagent/mindbreaker)

/obj/item/weapon/reagent_containers/food/snacks/mandragora/New()
	..()
	for(var/i in reagents_on_new)
		reagents.add_reagent(i, 5)

/obj/item/weapon/reagent_containers/food/snacks/mandragora/attackby(var/obj/item/I, var/mob/living/user)
	..()
	if(exhaustion)
		if(I.sharp || I.edge)
			eff.triggeredby(user)
			eff.triggeredby(user)
		eff.triggeredby(user)
		exhaustion -= 1
		if(!exhaustion)
			visible_message(SPAN_NOTICE("The [src.name] dries out in [user.name]'s hands."))
		return 1
	else
		to_chat(user, "The [src.name] exhausted.")