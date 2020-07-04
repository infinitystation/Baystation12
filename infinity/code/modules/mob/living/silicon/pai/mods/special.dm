/obj/item/weapon/paimod/special
	special_limit_tag = "special"

/obj/item/weapon/paimod/special/advanced_holo
	name = "advanced holo profector"
	desc = "This is advanced hologram projector, using to modificate PAI. It give to PAI opportunity to change it hologram and choose premium holograms."
	icon_state = "holo_proj"

/obj/item/weapon/paimod/special/advanced_holo/on_recalculate(var/mob/living/silicon/pai/P)
	. = ..()
	P.is_advanced_holo = 1



/obj/item/weapon/paimod/special/hack_camo
	name = "hacking camouflage"
	desc = "This is hacking camouflage. Using to cover hacking by PAI from central AI."
	icon_state = "camo"

/obj/item/weapon/paimod/special/hack_camo/on_recalculate(var/mob/living/silicon/pai/P)
	. = ..()
	P.is_hack_covered = 1



/obj/item/weapon/paimod/holoskins
	name = "PAI models' data card"
	desc = "This is PAI data card that storing hologram models for PAI."
	special_limit_tag = "skins"
	var/list/holochasises = list()

/obj/item/weapon/paimod/holoskins/on_recalculate(var/mob/living/silicon/pai/P)
	. = ..()
	var/is_chasises_in_possible = 0
	for(var/i in holochasises) is_chasises_in_possible = P.possible_chassis.Find(i)
	if(length(holochasises) && !is_chasises_in_possible) P.possible_chassis.Add(holochasises)

/obj/item/weapon/paimod/holoskins/paiwoman
	name = "PAI women models' data card"
	holochasises = list(
			"Human Female"		=	"h_female",
			"Human Female Red"	=	"h_female_dead"
			)
