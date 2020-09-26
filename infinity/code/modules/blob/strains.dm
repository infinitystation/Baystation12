/datum/blob_strain
	var/name = "Blob Strain"

	var/blob_color = "#9acd32"
	var/tendril_damage_types = list(BRUTE)
	var/tendril_damages = list(BRUTE = 30)
	var/brute_resist = 0.25
	var/fire_resist = 0.5
	var/laser_resist = 0.5
	var/bomb_resist = 0.75
	var/pulsing = 1
	var/can_core = 0

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

/datum/blob_strain/proc/spore_death(var/mob/living/simple_animal/hostile/blobspore/spore)
	return

/datum/blob_strain/proc/core_squash(var/obj/item/blob_core/core, var/mob/living/user)
	return

/datum/blob_strain/proc/pre_expanded(var/turf/T, var/obj/effect/biomass/biomass)
	return T



/datum/blob_strain/blazing
	name = "Blazing Oil"

	blob_color = "#b68d00"
	tendril_damage_types = list(BRUTE, BURN)
	tendril_damages = list(BRUTE = 5, BURN = 20)
	brute_resist = 1
	fire_resist = 0.1
	can_core = 1
	resource_gain = 1

/datum/blob_strain/blazing/damaged(var/obj/effect/biomass/blob, var/mob/living/attacker, var/shot = 0)
	if(shot)
		return

	attacker.fire_stacks += 1
	attacker.IgniteMob()
	attacker.emote("scream")

/datum/blob_strain/blazing/core_squash(var/obj/item/blob_core/core, var/mob/living/user)
	user.fire_stacks += 3
	user.IgniteMob()
	user.emote("scream")



/datum/blob_strain/cryo
	name = "Cryogenic Poison"

	blob_color = "#8ba6e9"
	tendril_damage_types = list(BRUTE)
	tendril_damages = list(BRUTE = 10)
	can_core = 1
	resource_gain = 1

/datum/blob_strain/cryo/damaged(var/obj/effect/biomass/blob, var/mob/living/attacker, var/shot = 0)
	if(shot)
		return

	if(attacker.reagents)
		attacker.reagents.add_reagent(/datum/reagent/frostoil, 5)
		attacker.reagents.add_reagent(/datum/reagent/drink/ice, 5)

/datum/blob_strain/cryo/core_squash(var/obj/item/blob_core/core, var/mob/living/user)
	if(user.reagents)
		user.reagents.add_reagent(/datum/reagent/frostoil, 10)
		user.reagents.add_reagent(/datum/reagent/clonexadone, 15)



/datum/blob_strain/debris
	name = "Debris Devourver"

	blob_color = "#8b1000"
	tendril_damage_types = list(BRUTE)
	tendril_damages = list(BRUTE = 15, OXY = 5)
	can_core = 1
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
	if(blob.core.contents.len == 0)
		return
	for(var/count = 1 to rand(1, 3))
		var/obj/item/item = pick(blob.core.contents)
		item.forceMove(get_turf(blob))
		item.throw_at(get_edge_target_turf(item, rand(1, 8)),3,3)

/datum/blob_strain/debris/core_squash(var/obj/item/blob_core/core, var/mob/living/user)
	if(locate(/obj/item) in core)
		var/obj/item/item = pick(locate() in core)
		core.visible_message(SPAN_WARNING("[core] starts shaking and launches [item]!"))
		item.forceMove(get_turf(core))
		item.throw_at(get_edge_target_turf(item, rand(1, 8)),3,3)
	else
		var/obj/item/item = pick(locate() in get_turf(core))
		core.visible_message(SPAN_WARNING("[core] suddenly throws a bunch of tendrils and grabs [item] from the ground!"))



/datum/blob_strain/emp
	name = "Electromagnetic Web"

	blob_color = "#83ecec"
	tendril_damage_types = list(BRUTE, BURN)
	tendril_damages = list(BRUTE = 5, BURN = 25)
	brute_resist = 1
	fire_resist = 0.75
	can_core = 1
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

/datum/blob_strain/emp/core_squash(var/obj/item/blob_core/core, var/mob/living/user)
	empulse(get_turf(core), 1, 2)



/datum/blob_strain/jelly
	name = "Energized Jelly"

	blob_color = "#efd65a"
	tendril_damage_types = list(BRUTE, OXY)
	tendril_damages = list(BRUTE = 5, OXY = 15)
	fire_resist = 0.3

	resource_gain = 1

/datum/blob_strain/jelly/empd(var/obj/effect/biomass/blob, var/severity)
	blob.take_damage(rand(5, 15) * fire_resist * severity)



/datum/blob_strain/explosive
	name = "Explosive Lattice"

	blob_color = "#8b2500"
	tendril_damage_types = list(BRUTE)
	tendril_damages = list(BRUTE = 15)
	fire_resist = 1
	bomb_resist = 0
	can_core = 1
	resource_gain = 1

/datum/blob_strain/explosive/attack(var/obj/effect/biomass/blob, var/mob/living/victim)
	for(var/mob/living/mob in range(get_turf(victim), 1))
		mob.apply_damage(5, BRUTE, used_weapon = "blob tendril")

	if(prob(10))
		explosion(victim, -1, -1, 0, 1)

/datum/blob_strain/explosive/core_squash(var/obj/item/blob_core/core, var/mob/living/user)
	explosion(user, -1, -1, 0, 1)


/datum/blob_strain/fibers
	name = "Networked Fibers"

	blob_color = "#cdc0b0"
	tendril_damage_types = list(BRUTE, BURN)
	tendril_damages = list(BRUTE = 20, BURN = 15)

	pulsing = 0
	resource_gain = 1

/datum/blob_strain/fibers/pre_expanded(var/turf/T, var/obj/effect/biomass/biomass)
	if(biomass.core != biomass)
		if(get_dist(biomass, biomass.core) <= 1)
			var/obj/effect/biomass/core/core = biomass.core
			var/turf/T2 = get_turf(core)
			biomass.forceMove(T2)
			core.forceMove(T)
			return T2
	else
		var/turf/T2 = get_turf(biomass)
		biomass.forceMove(T)
		return T2
	return T



/datum/blob_strain/slime
	name = "Pressurized Slime"

	blob_color = "#aaaabb"
	tendril_damage_types = list(BRUTE, OXY)
	tendril_damages = list(BRUTE = 15, OXY = 10)
	can_core = 1
	resource_gain = 1

/datum/blob_strain/slime/damaged(var/obj/effect/biomass/blob, var/mob/living/attacker, var/shot = 0)
	wet_surroundings(blob, 50)

/datum/blob_strain/slime/killed(var/obj/effect/biomass/blob)
	wet_surroundings(blob, 100)

/datum/blob_strain/slime/proc/wet_surroundings(var/obj/effect/biomass/B, var/probability = 50)
	for(var/turf/simulated/T in range(1, get_turf(B)))
		if(prob(probability))
			T.wet_floor()
		for(var/atom/movable/AM in T)
			AM.water_act(2)

/datum/blob_strain/slime/core_squash(var/obj/item/blob_core/core, var/mob/living/user)
	var/obj/effect/biomass/blob = new(get_turf(core))
	wet_surroundings(blob, 100)
	qdel(blob)



/datum/blob_strain/reactive
	name = "Reactive Spines"

	blob_color = "#9acd32"
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

	blob_color = "#c8a5dc"
	tendril_damage_types = list(BRUTE, TOX)
	tendril_damages = list(BRUTE = 5, TOX = 15)

	resource_gain = 2



/datum/blob_strain/foam
	name = "Replicating Foam"

	blob_color = "#7b5a57"
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

	blob_color = "#c8963c"
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

	blob_color = "#e88d5d"
	tendril_damage_types = list(BRUTE, TOX)
	tendril_damages = list(BRUTE = 5, TOX = 15)

	resource_gain = 1

/datum/blob_strain/neurons/killed(var/obj/effect/biomass/blob)
	if(prob(25))
		var/mob/living/simple_animal/hostile/blobspore/weak/spore = new(get_turf(blob))
		spore.color = blob.color


/datum/blob_strain/fungal
	name = "Fungal Bloom"
	can_core = 1
	blob_color = "#b57d7d"
	brute_resist = 0.4
	tendril_damage_types = list(BRUTE, TOX)
	tendril_damages = list(BRUTE = 10, TOX = 10)

/datum/blob_strain/fungal/spore_death(var/mob/living/simple_animal/hostile/blobspore/spore)
	if(prob(10) && !locate(/obj/effect/biomass) in get_turf(spore))
		var/obj/effect/biomass/node/node = new(get_turf(spore))
		node.core = spore.core

/datum/blob_strain/fungal/core_squash(var/obj/item/blob_core/core, var/mob/living/user)
	new /mob/living/simple_animal/hostile/blobspore(get_turf(core))


/datum/blob_strain/macrophage
	name = "Ravenous Macrophage"

	blob_color = "#d1ec3c"

	fire_resist = 0.25

	tendril_damage_types = list(BURN, TOX)
	tendril_damages = list(BURN = 15, TOX = 10)

/datum/blob_strain/macrophage/attack(var/obj/effect/biomass/blob, var/mob/living/victim)
	var/mob/living/L = locate() in range(world.view, blob)
	if(prob(1) && L.mind && !L.stat)
		var/turf/T = get_turf(blob)
		var/datum/effect/effect/system/smoke_spread/bad/BS = new
		BS.attach(T)
		BS.set_up(3, 0, T)
		playsound(T, 'sound/effects/smoke.ogg', 50, 1, -3)
		BS.start()

/datum/blob_strain/macrophage/killed(var/obj/effect/biomass/blob)
	var/obj/effect/biomass/other = locate() in oview(2, blob)
	if(other && other.core)
		other.core.resources += rand(1, 3)



/datum/blob_strain/volatile
	name = "Volatile Alluvium"

	blob_color = "#6b481e"
	tendril_damage_types = list(BURN, BRUTE)
	tendril_damages = list(BURN = 5, BRUTE = 15)

/datum/blob_strain/volatile/damaged(var/obj/effect/biomass/blob, var/mob/living/attacker, var/shot = 0)
	if(shot)
		return

	if(prob(35) && istype(attacker, /mob/living/carbon/human))
		var/mob/living/carbon/human/H = attacker
		var/obj/item/I = H.get_active_hand()
		H.drop_item()
		if(I)
			if((I.sharp || I.edge) && !istype(I, /obj/item/weapon/gun))
				I.forceMove(get_turf(blob)) // Disarmed entirely.
				blob.visible_message("<span class='danger'>The [name] heaves, \the [attacker]'s weapon becoming stuck in the churning mass!</span>")
			else
				I.throw_at(blob, 2, 4) // Just yoinked.
				blob.visible_message("<span class='danger'>The [name] heaves, pulling \the [attacker]'s weapon from their hands!</span>")
