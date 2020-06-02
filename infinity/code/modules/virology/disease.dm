/mob/living/carbon
	var/list/immunities = list()
	var/list/diseases = list()

/datum/disease
	var/name = "No disease"
	var/desc = ""
	var/form = "Virus"
	var/agent = "some microbes"
	var/spread_text = ""
	var/cure_text = "" //It shows only when disease is fully researched

	var/disease_flags = DISEASE_CUREABLE | DISEASE_CAN_CARRY | DISEASE_CAN_IMMUNE
	var/spread_flags = DISEASE_SPREAD_AIRBORNE | DISEASE_SPREAD_CONTACT_FLUIDS | DISEASE_SPREAD_CONTACT_SKIN

	var/stage = 1
	var/max_stages = 1
	var/stage_speed = 0.01

	var/list/viable_mobtypes = list()
	var/mob/living/carbon/host = null
	var/list/cures = list()
	var/infectivity = 65
	var/cure_chance = 8 //Per tick
	var/carrier = FALSE //Is host in safety?

	var/permeability_mod = 1
	var/severity = DISEASE_SEVERITY_NONTHREAT
	var/list/required_organs = list()
	var/needs_all_cures = TRUE

	var/infectable_biotypes = DISEASE_BIOTYPE_ORGANIC
	var/process_dead = FALSE
	var/mutation_prob = 0.0025
	var/copy_type = null
	var/bypasses_immunity = FALSE

	var/genekey = "abcdabcdabcdabcd" //Immunity key. It will be changed in mutations.

	var/list/symptomes = list()

	var/stats = list("Stealth" = 2, "Resistance" = 2, "Speed" = 2, "Transmittability" = 2) //Diseases with resistance < 4 can be cured with spacecillin without overdoses

/datum/disease/Destroy()
	if(host)
		host.diseases.Remove(src)
	. = ..()

/datum/disease/Process()
	. = ..()
	stage_act()

/datum/disease/proc/try_infect(var/mob/living/infectee, make_copy = TRUE)
	if(iscarbon(infectee))
		var/mob/living/carbon/new_host = infectee

		if(!new_host.type in viable_mobtypes)
			return FALSE

		if(!prob(infectivity))
			return FALSE

		if((disease_flags & DISEASE_CAN_IMMUNE) && GetID() in new_host.immunities)
			return FALSE

		for(var/datum/disease/D in new_host.diseases)
			if(D.genekey == genekey)
				return FALSE

		infect(new_host, make_copy)

	return FALSE


/datum/disease/proc/infect(var/mob/living/carbon/infectee, make_copy = TRUE)
	var/datum/disease/D = src

	if(make_copy)
		D = Copy()

	infectee.diseases.Add(D)
	D.host = infectee

	if(prob(mutation_prob))
		mutate_key()

	var/turf/source_turf = get_turf(infectee)
	log_and_message_admins("infected [key_name(infectee)] with [D.name] in [source_turf].")


/datum/disease/proc/stage_act()
	var/cure = has_cure()

	if(carrier && !cure)
		return

	stage = min(stage, max_stages)

	update_blood()

	if(stage == -1)
		return

	if(!cure)
		if(prob(stage_speed * stats["Speed"]))
			update_stage(min(stage + 1, max_stages))
	else
		if(prob(cure_chance))
			update_stage(max(stage - 1, 1))

	if(disease_flags & DISEASE_CUREABLE)
		if(cure && prob(cure_chance) && stage == 1)
			cure()

	if(stage > 1 || prob(20 / stats["Stealth"]))
		work_symptomes()


/datum/disease/proc/work_symptomes()
	for(var/datum/simptom/simptom in symptomes)
		simptom.activate(host, src)

/datum/disease/proc/update_blood()
	for(var/datum/reagent/blood/B in host.reagents)
		if(B.type == /datum/reagent/blood)
			if(!src in B.data["diseases"])
				B.data["diseases"].add(src)


/datum/disease/proc/update_stage(new_stage)
	stage = new_stage


/datum/disease/proc/has_cure()
	if(!(disease_flags & DISEASE_CUREABLE))
		return FALSE

	var/must_be = cures.len
	for(var/C_id in cures)
		if(!host.reagents.has_reagent(C_id))
			must_be -= 1

	if(stats["Resistance"] < host.virus_immunity() && !bypasses_immunity)
		return TRUE

	if(!must_be)
		return FALSE

	if(needs_all_cures && must_be < cures.len)
		return FALSE

	return TRUE

/datum/disease/proc/cure(add_resistance = TRUE)
	if(host)
		if(add_resistance && (disease_flags & DISEASE_CAN_IMMUNE))
			host.immunities |= GetID()
	qdel(src)

/datum/disease/proc/GetID()
	return genekey

/datum/disease/proc/Copy()
	var/static/list/copy_vars = list("name", "disease_flags", "spread_flags", "form", "desc", "agent", "spread_text",
									"cure_text", "max_stages", "stage_speed", "viable_mobtypes", "cures", "infectivity", "cure_chance",
									"bypasses_immunity", "permeability_mod", "severity", "required_organs", "needs_all_cures",
									"infectable_biotypes", "process_dead", "symptomes", "mutation_prob", "copy_type", "genekey", "stats")

	var/datum/disease/D = new src.type
	for(var/V in copy_vars)
		var/val = vars[V]
		if(islist(val))
			var/list/L = val
			val = L.Copy()
		D.vars[V] = val
	return D

/datum/disease/proc/mutate_key()
	genekey[rand(1, 16)] = pick("a", "b", "c", "d") //4^16 = 4b. It is genekey, it may be the same on some diseases


/datum/disease/proc/apply_simptomes()
	infectable_biotypes = initial(infectable_biotypes)

	for(var/datum/simptom/simptom in symptomes



/datum/disease/proc/spread_airborne(var/radius = 0)
	if(radius == 0)
		radius = stats["Transmittability"]

	if(!(spread_flags & DISEASE_SPREAD_AIRBORNE))
		return

	if(host.reagents.has_reagent(/datum/reagent/spaceacillin) || (host.virus_immunity() > stats["Transmittability"]))
		return

	var/turf/T = host.loc
	if(istype(T))
		for(var/mob/living/carbon/C in oview(radius, host))
			try_infect_airborne(C)

/datum/disease/proc/try_infect_airborne(var/mob/living/carbon/C)
	if(!((spread_flags & DISEASE_SPREAD_AIRBORNE) && prob((50*permeability_mod) - 1)))
		return

	if(!istype(C))
		return

	if(C.internal)
		return

	if(C.wear_mask && istype(C.wear_mask, /obj/item/clothing/mask/surgical) && prob(50))
		return

	try_infect(C)




/mob/living/carbon/human/Initialize()
	. = ..()
	addtimer(CALLBACK(src, .proc/handle_diseases), 1)

/mob/living/carbon/human/proc/handle_diseases()
	for(var/datum/disease/disease in diseases)
		disease.stage_act()
	addtimer(CALLBACK(src, .proc/handle_diseases), 1)

/mob/living/carbon/human/proc/get_worst_disease()
	var/worst = DISEASE_SEVERITY_POSITIVE
	var/listing = list(DISEASE_SEVERITY_POSITIVE = 0,
					   DISEASE_SEVERITY_NONTHREAT = 1,
					   DISEASE_SEVERITY_MINOR = 2,
					   DISEASE_SEVERITY_HARMFUL = 3,
					   DISEASE_SEVERITY_BIOHAZARD = 4)

	for(var/datum/disease/disease in diseases)
		if(listing[disease.severity] > listing[worst])
			worst = disease.severity

	return worst