/obj/item/device/electronic_assembly/proc/loading(var/obj/item/I, var/mob/living/user)
	var/list/icomponents = list()
	var/list/ircomponents = list()
	if(istype(I, /obj/item/gun/energy/))
		for (var/obj/item/integrated_circuit/manipulation/weapon_firing/P in assembly_components)
			if(!P.installed_gun)
				icomponents+=P.displayed_name
				ircomponents+=P
	else if(istype(I, /obj/item/grenade/))
		for (var/obj/item/integrated_circuit/manipulation/grenade/P in assembly_components)
			if(!P.attached_grenade)
				icomponents+=P.displayed_name
				ircomponents+=P
	else
		var/obj/item/card = I
		var/mob/living/L = locate(/mob/living) in card.contents
		if(L && L.key)
			for (var/obj/item/integrated_circuit/manipulation/ai/P in assembly_components)
				if(!P.controlling)
					icomponents+=P.displayed_name
					ircomponents+=P
	var/component_choice = input("Please choose a component to insert the [I].","[src]") as null|anything in icomponents
	var/obj/item/integrated_circuit/circuit = ircomponents[list_find(icomponents, component_choice)]
	if(in_range(user, circuit) && get_dist(I, user) < 1)
		circuit.attackby(I, user)
