#define MIN_LARVA_BLOOD_DRINK 1

/mob/living/carbon/alien/larva/Process()
	. = ..()
	if(stat != DEAD && auto_progress)
		update_progression(FALSE)

/mob/living/carbon/alien/larva/update_living_sight()
	set_sight(sight&(~(SEE_TURFS|SEE_MOBS|SEE_OBJS)))

//Larvae regenerate health and nutrition from plasma and alien weeds.
/mob/living/carbon/alien/larva/handle_environment(var/datum/gas_mixture/environment)

	if(!environment) return

	var/turf/T = get_turf(src)
	var/obj/structure/alien/weeds/plant = locate() in T
	if(environment.gas["phoron"] > 0 || plant)
		update_progression(FALSE) //it will boost them
		adjustBruteLoss(-1)
		adjustFireLoss(-1)
		adjustToxLoss(-1)
		adjustOxyLoss(-1)
	else


// Maybe not the -best- place but it's semiappropriate and fitting.
// Drink the blood of your host!
/mob/living/carbon/alien/larva/handle_chemicals_in_body()
	if(!loc)
		return
	if(!istype(loc, /obj/item/holder))
		return
	var/mob/living/carbon/human/M = loc.loc //ergh, replace with a flag sometime
	if(!istype(M))
		return
	if(amount_grown >= max_grown)
		to_chat(src, SPAN_ALIEN("Вы готовы к продолжению эволюции!"))
		leave_host()
		return
	if(M.vessel.total_volume > M.vessel.total_volume/2)
		M.vessel.trans_to(src,min(M.vessel.total_volume,MIN_LARVA_BLOOD_DRINK))
		update_progression(TRUE)
	else
		to_chat(src, SPAN_ALIEN("Это существо уже слишком обескровлено..."))
		leave_host()

#undef MIN_LARVA_BLOOD_DRINK
