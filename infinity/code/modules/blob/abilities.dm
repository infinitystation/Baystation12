/mob/living/blobHolder/proc/blob_factory()
	set category = "Blob"
	set name = "Create Factory(40)"
	set desc="Create a blob factory which produces resources for your core."

	if(!locate(/obj/effect/biomass) in get_turf(eye))
		to_chat(src, "There is no blob on this tile!")
		return

	for(var/obj/effect/biomass/factory/blob in range(get_turf(eye), 4))
		if(istype(blob))
			to_chat(src, "You need to place it at least 4 tiles far from [blob]!")
			return

	if(locate(/obj/effect/biomass/core) in get_turf(eye) || locate(/obj/effect/biomass/node) in get_turf(eye) || locate(/obj/effect/biomass/factory) in get_turf(eye) || locate(/obj/effect/biomass/spore) in get_turf(eye))
		to_chat(src, "You need normal blob to place on!")
		return

	if(core.resources >= 40)
		core.resources -= 40
		for(var/obj/effect/biomass/blob in get_turf(eye))
			qdel(blob)
		var/obj/effect/biomass/factory/new_blob = new(get_turf(eye))
		new_blob.color = color

		new_blob.core = src.core


/mob/living/blobHolder/proc/blob_node()
	set category = "Blob"
	set name = "Create Node(50)"
	set desc="Create a blob node which act like a secondary core."

	if(!locate(/obj/effect/biomass) in get_turf(eye))
		to_chat(src, "There is no blob on this tile!")
		return

	for(var/obj/effect/biomass/node/blob in range(get_turf(eye), 5))
		if(istype(blob))
			to_chat(src, "You need to place it at least 5 tiles far from [blob]!")
			return

	if(locate(/obj/effect/biomass/core) in get_turf(eye) || locate(/obj/effect/biomass/node) in get_turf(eye) || locate(/obj/effect/biomass/factory) in get_turf(eye) || locate(/obj/effect/biomass/spore) in get_turf(eye))
		to_chat(src, "You need normal blob to place on!")
		return

	if(core.resources >= 50)
		core.resources -= 50
		for(var/obj/effect/biomass/blob in get_turf(eye))
			qdel(blob)
		var/obj/effect/biomass/node/new_blob = new(get_turf(eye))
		new_blob.color = color
		new_blob.core = src.core

/mob/living/blobHolder/proc/blob_spore()
	set category = "Blob"
	set name = "Create Spore Blob(60)"
	set desc="Create a blob node which will produce hostile spores."

	if(!locate(/obj/effect/biomass) in get_turf(eye))
		to_chat(src, "There is no blob on this tile!")
		return

	if(locate(/obj/effect/biomass/core) in get_turf(eye) || locate(/obj/effect/biomass/node) in get_turf(eye) || locate(/obj/effect/biomass/factory) in get_turf(eye) || locate(/obj/effect/biomass/spore) in get_turf(eye))
		to_chat(src, "You need normal blob to place on!")
		return

	for(var/obj/effect/biomass/spore/blob in range(get_turf(eye), 6))
		if(istype(blob))
			to_chat(src, "You need to place it at least 6 tiles far from [blob]!")
			return

	if(core.resources >= 60)
		core.resources -= 60
		for(var/obj/effect/biomass/blob in get_turf(eye))
			qdel(blob)
		var/obj/effect/biomass/spore/new_blob = new(get_turf(eye))
		new_blob.color = color
		new_blob.core = src.core

/mob/living/blobHolder/proc/reroll_strain()
	set category = "Blob"
	set name = "Reroll Strain(80)"
	set desc="Choose your new strain from 4 random to rapidly change your strategy."

	if(core.resources >= 80)
		core.resources -= 80
		var/list/strains = subtypesof(/datum/blob_strain)
		var/choose_strains = list()
		for(var/i = 1 to 4)
			var/strain_type = pick(strains)
			var/datum/blob_strain/strain = new strain_type
			choose_strains[strain.name] = strain_type
			strains.Remove(strain_type)
		var/choice = input(src, "Choose strain", "Choose strain") as null|anything in choose_strains
		var/strain_type = choose_strains[choice]
		core.strain = new strain_type

/mob/living/blobHolder/proc/blobbernaut()
	set category = "Blob"
	set name = "Produce Blobbernaut(60)"
	set desc="Produce a giant monster made out of blob."

	if(!locate(/obj/effect/biomass/factory) in get_turf(eye))
		to_chat(src, "There is no factory blob on this tile!")
		return

	if(core.resources >= 60)
		core.resources -= 60
		var/mob/living/simple_animal/hostile/blobbernaut/blobbernaut = new(get_turf(eye))
		blobbernaut.color = color
		blobbernaut.core = src.core