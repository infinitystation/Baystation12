/obj/item/weapon/soap/wet()
	. = ..()
	START_PROCESSING(SSobj, src)

/obj/item/weapon/soap/Process()
	. = ..()
	for(var/i in reagents?.reagent_list) reagents.remove_reagent(i, 0.2)
	if(!reagents.reagent_list.len) STOP_PROCESSING(SSobj, src)
