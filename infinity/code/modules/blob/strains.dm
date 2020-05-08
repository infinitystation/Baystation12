/datum/blob_strain
	var/name = "Blob Strain"

	var/blob_color = "#9ACD32"
	var/tendril_damage_types = list(BRUTE)
	var/tendril_damages = list(BRUTE = 30)
	var/brute_resist = 0.25
	var/fire_resist = 0.5
	var/laser_resist = 0.5
	var/bomb_resist = 0.75
	var/pulsing = 1

	var/resource_gain = 1

/datum/blob_strain/proc/damaged(var/obj/effect/biomass/blob, var/mob/living/attacker, var/shot = 0)
	return

/datum/blob_strain/proc/killed(var/obj/effect/biomass/blob)
	return

/datum/blob_strain/proc/empd(var/obj/effect/biomass/blob, var/severity)
	return

/datum/blob_strain/proc/expanded(var/obj/effect/biomass/blob, var/obj/effect/biomass/new_blob)
	return

/datum/blob_strain/proc/attack(var/obj/effect/biomass/blob, var/mob/living/victim)
	return



/datum/blob_strain/blazing
	name = "Blazing Oil"

	blob_color = "#B68D00"
	tendril_damage_types = list(BRUTE, BURN)
	tendril_damages = list(BRUTE = 5, BURN = 20)
	brute_resist = 1
	fire_resist = 0.25

	resource_gain = 1

/datum/blob_strain/blazing/damaged(var/obj/effect/biomass/blob, var/mob/living/attacker, var/shot = 0)
	if(shot)
		return

	attacker.fire_stacks += 1
	attacker.IgniteMob()
	attacker.emote("scream")



/datum/blob_strain/cryo
	name = "Cryogenic Poison"

	blob_color = "#8BA6E9"
	tendril_damage_types = list(BRUTE)
	tendril_damages = list(BRUTE = 10)

	resource_gain = 1

/datum/blob_strain/cryo/damaged(var/obj/effect/biomass/blob, var/mob/living/attacker, var/shot = 0)
	if(shot)
		return

	if(attacker.reagents)
		attacker.reagents.add_reagent(/datum/reagent/frostoil, 5)
		attacker.reagents.add_reagent(/datum/reagent/drink/ice, 5)



/datum/blob_strain/debris
	name = "Debris Devourver"

	blob_color = "#8B1000"
	tendril_damage_types = list(BRUTE)
	tendril_damages = list(BRUTE = 5)

	resource_gain = 1

/datum/blob_strain/debris/expanded(var/obj/effect/biomass/blob, var/obj/effect/biomass/new_blob)
	for(var/obj/item/item in get_turf(new_blob))
		if(item.canremove && !item.anchored)
			item.forceMove(blob.core)
			new_blob.core.resources += 1

/datum/blob_strain/debris/damaged(var/obj/effect/biomass/blob, var/mob/living/attacker, var/shot = 0)
	var/obj/item/item = pick(blob.core.contents)
	item.forceMove(get_turf(blob))
	item.throw_at(attacker, 3, 3)

/datum/blob_strain/debris/attack(var/obj/effect/biomass/blob, var/mob/living/victim)
	var/obj/item/item = pick(blob.core.contents)
	item.forceMove(get_turf(blob))
	item.throw_at(victim, 3, 3)

/datum/blob_strain/debris/killed(var/obj/effect/biomass/blob)
	for(var/count = 1 to rand(1, 3))
		var/obj/item/item = pick(blob.core.contents)
		item.forceMove(get_turf(blob))
		item.throw_at(get_edge_target_turf(item, rand(1, 8)),3,3)


/datum/blob_strain/emp
	name = "Electromagnetic Web"

	blob_color = "#83ECEC"
	tendril_damage_types = list(BRUTE, BURN)
	tendril_damages = list(BRUTE = 5, BURN = 25)
	brute_resist = 1
	fire_resist = 0.75

	resource_gain = 1

/datum/blob_strain/emp/damaged(var/obj/effect/biomass/blob, var/mob/living/attacker, var/shot = 0)
	if(shot)
		return

	if(prob(20))
		empulse(get_turf(attacker), 0, 1)

/datum/blob_strain/emp/attack(var/obj/effect/biomass/blob, var/mob/living/victim)

	if(prob(20))
		empulse(get_turf(victim), 0, 1)

/datum/blob_strain/emp/killed(var/obj/effect/biomass/blob)
	empulse(get_turf(blob), 1, 2)



/datum/blob_strain/jelly
	name = "Energized Jelly"

	blob_color = "#EFD65A"
	tendril_damage_types = list(BRUTE, OXY)
	tendril_damages = list(BRUTE = 5, OXY = 15)
	fire_resist = 0.3

	resource_gain = 1

/datum/blob_strain/jelly/empd(var/obj/effect/biomass/blob, var/severity)
	blob.take_damage(rand(5, 15) * fire_resist * severity)



/datum/blob_strain/explosive
	name = "Explosive Lattice"

	blob_color = "#8B2500"
	tendril_damage_types = list(BRUTE)
	tendril_damages = list(BRUTE = 15)
	fire_resist = 1
	bomb_resist = 0

	resource_gain = 1

/datum/blob_strain/explosive/attack(var/obj/effect/biomass/blob, var/mob/living/victim)
	for(var/mob/living/mob in range(get_turf(victim), 1))
		mob.apply_damage(5, BRUTE, used_weapon = "blob tendril")

	if(prob(10))
		explosion(victim, -1, -1, 0, 1)




/datum/blob_strain/fibers
	name = "Networked Fibers"

	blob_color = "#CDC0B0"
	tendril_damage_types = list(BRUTE, BURN)
	tendril_damages = list(BRUTE = 20, BURN = 15)

	pulsing = 0
	resource_gain = 1

/datum/blob_strain/fibers/expanded(var/obj/effect/biomass/blob, var/obj/effect/biomass/new_blob)
	if(locate(/obj/effect/biomass/core) in range(get_turf(new_blob), 1))
		var/obj/effect/biomass/core/core = locate(/obj/effect/biomass/core)
		var/turf/T = get_turf(core)
		core.forceMove(get_turf(new_blob))
		new_blob.forceMove(get_turf(T))



/datum/blob_strain/slime
	name = "Pressurized Slime"

	blob_color = "#AAAABB"
	tendril_damage_types = list(BRUTE, OXY)
	tendril_damages = list(BRUTE = 15, OXY = 10)

	resource_gain = 1

/datum/blob_strain/slime/damaged(var/obj/effect/biomass/blob, var/mob/living/attacker, var/shot = 0)
	var/datum/effect/effect/system/smoke_spread/chem/S = new /datum/effect/effect/system/smoke_spread/chem
	var/datum/reagents/water = new
	water.add_reagent(/datum/reagent/water, 15)
	S.attach(get_turf(blob))
	S.set_up(water, 5, 0, get_turf(blob))
	S.start()



/datum/blob_strain/reactive
	name = "Reactive Spines"

	blob_color = "#9ACD32"
	tendril_damage_types = list(BRUTE)
	tendril_damages = list(BRUTE = 25)

	resource_gain = 1

/datum/blob_strain/reactive/damaged(var/obj/effect/biomass/blob, var/mob/living/attacker, var/shot = 0)
	if(shot)
		return

	if(prob(50))
		tendril_damages = list(BRUTE = 15)
		blob.readapt()
		for(var/mob/living/L in range(get_turf(blob), 1))
			if(L.stat == DEAD || L.faction == "blob")
				continue
			else
				blob.attack_living(L)
		tendril_damages = initial(tendril_damages)
		blob.readapt()




/datum/blob_strain/materia
	name = "Regenerative Materia"

	blob_color = "#C8A5DC"
	tendril_damage_types = list(BRUTE, TOX)
	tendril_damages = list(BRUTE = 5, TOX = 15)

	resource_gain = 2



/datum/blob_strain/foam
	name = "Replicating Foam"

	blob_color = "#7B5A57"
	tendril_damage_types = list(BRUTE)
	tendril_damages = list(BRUTE = 20)
	brute_resist = 2

	resource_gain = 1

/datum/blob_strain/foam/damaged(var/obj/effect/biomass/blob, var/mob/living/attacker, var/shot = 0)
	if(shot)
		return

	if(prob(75))
		blob.expand(get_turf(attacker))



/datum/blob_strain/shifting
	name = "Shifting Fragments"

	blob_color = "#C8963C"
	tendril_damage_types = list(BRUTE)
	tendril_damages = list(BRUTE = 20)

	resource_gain = 1

/datum/blob_strain/shifting/damaged(var/obj/effect/biomass/blob, var/mob/living/attacker, var/shot = 0)
	if(shot)
		return

	var/list/swaps = list()

	for(var/obj/effect/biomass/swap in range(get_turf(blob), 1))
		if(!istype(swap, /obj/effect/biomass/core))
			swaps.Add(swap)

	var/obj/effect/biomass/swap = pick(swaps)

	var/turf/T = get_turf(swap)
	swap.forceMove(get_turf(blob))
	blob.forceMove(get_turf(T))



/datum/blob_strain/neurons
	name = "Distributed Neurons"

	blob_color = "#E88D5D"
	tendril_damage_types = list(BRUTE, TOX)
	tendril_damages = list(BRUTE = 5, TOX = 15)

	resource_gain = 1

/datum/blob_strain/neurons/killed(var/obj/effect/biomass/blob)
	if(prob(50))
		var/mob/living/simple_animal/hostile/blobspore/fragile/spore = new(get_turf(blob))
		spore.color = blob.color