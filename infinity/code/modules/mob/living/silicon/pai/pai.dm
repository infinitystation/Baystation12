/mob/living/silicon/pai/proc/update_verbs()
	if(is_advanced_holo)
		verbs += /mob/living/silicon/pai/proc/choose_chassis

/mob/living/silicon/pai/proc/update_memory()
	ram = initial(ram)
	for(var/i in software)
		var/datum/pai_software/S = software[i]
		if(S && (ram >= S.ram_cost))
			ram -= S.ram_cost
	for(var/obj/item/paimod/P in card.contents)
		P.on_update_memory(src)
