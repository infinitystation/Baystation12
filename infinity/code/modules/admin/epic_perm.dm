
//This will spawn a cool guy with a sword that will kill the fucker

proc/epic_perm(var/mob/living/carbon/human/target)
	var/turf/T = null

	for(var/turf/simulated/floor/floor in range(get_turf(target), 2))
		if(istype(floor))
			T = floor
			break

	if(!T)
		return

	var/mob/living/carbon/human/dummy/guy = new(T)
	guy.real_name = "Dark Reaper"
	guy.h_style = "CIA"


	var/outfit_type = pick(/decl/hierarchy/outfit/permaban_guy)
	var/decl/hierarchy/outfit/permaban_guy = outfit_by_type(outfit_type)
	permaban_guy.equip(guy, equip_adjustments = 0)
	var/obj/item/weapon/material/sword/katana/vibro/katana = new(guy)
	guy.put_in_hands(katana)

	sleep(15)

	katana.attack(target, guy, BP_HEAD)
	target.setBrainLoss(target.maxHealth) //E

	sleep(5)

	playsound(guy.loc, 'sound/effects/smoke.ogg', 50, 1, -3)

	var/datum/effect/effect/system/smoke_spread/bad/smoke

	smoke = new /datum/effect/effect/system/smoke_spread/bad
	smoke.attach(guy)
	smoke.set_up(10, 0, get_turf(guy))

	sleep(10)

	qdel(guy)