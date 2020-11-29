/mob/living/simple_animal/hostile/blobspore
	name = "blob spore"
	desc = "A floating, fragile spore."
	icon = 'infinity/icons/mob/blob.dmi'
	layer = BLOB_CORE_LAYER + 0.2
	speak_emote = list("gibbers")
	icon_state = "blobpod"
	icon_living = "blobpod"
	icon_dead = "blobpod"
	health = 25
	maxHealth = 25
	melee_damage_lower = 2
	melee_damage_upper = 4
	attacktext = "slams into"
	emote_see = list("sways", "inflates briefly")
	attack_sound = 'sound/effects/attackblob.ogg'
	faction = "blob"
	speed = 4

	cold_damage_per_tick = 0
	fire_alert = 0

	min_gas = list()
	max_gas = list()

	var/mob/living/carbon/human/infested = null
	var/can_infest = FALSE
	var/is_infesting = FALSE

	var/obj/effect/biomass/core/core

/mob/living/simple_animal/hostile/blobspore/death()
	. = ..()
	if(core)
		core.strain.spore_death(src)
	var/datum/effect/effect/system/smoke_spread/bad/BS = new
	var/turf/T = get_turf(src)
	BS.attach(T)
	BS.set_up(3, 0, T)
	playsound(T, 'sound/effects/smoke.ogg', 50, 1, -3)
	BS.start()
	qdel(src)


/mob/living/simple_animal/hostile/blobspore/Destroy()
	if(infested)
		infested.forceMove(get_turf(src))
		visible_message("<span class='warning'>\The [infested] falls to the ground as the blob spore bursts.</span>")
		infested = null
	. = ..()

/mob/living/simple_animal/hostile/blobspore/infesting
	name = "infesting blob spore"
	can_infest = TRUE

/mob/living/simple_animal/hostile/blobspore/weak
	name = "fragile blob spore"
	health = 15
	maxHealth = 15
	melee_damage_lower = 1
	melee_damage_upper = 2

/mob/living/simple_animal/hostile/blobspore/on_update_icon()
	. = ..()
	if(core)
		color = core.strain.blob_color
		set_light(3, 5, color)
	else
		color = null
		set_light(0)

	if(is_infesting)
		overlays.Cut()
		icon = infested.icon
		overlays = infested.overlays
		var/mutable_appearance/blob_head_overlay = mutable_appearance('infinity/icons/mob/blob.dmi', "blob_head")
		if(core)
			blob_head_overlay.color = core.strain.blob_color
		color = initial(color)//looks better.
		overlays += blob_head_overlay



mob/living/simple_animal/hostile/blobspore/Life()
	if(core)
		color = core.strain.blob_color
		faction = core.faction

	if(can_infest && !is_infesting && isturf(src.loc))
		for(var/mob/living/carbon/human/H in view(src,1))
			if(H.stat != DEAD) // We want zombies.
				continue
			if(H.isSynthetic()) // Not philosophical zombies.
				continue
			infest(H)
			break
	if(core && z != core.z) // This is to prevent spores getting lost in space and making the factory useless.
		qdel(src)
	..()

/mob/living/simple_animal/hostile/blobspore/proc/infest(mob/living/carbon/human/H)
	is_infesting = TRUE
	if(H.wear_suit)
		var/obj/item/clothing/suit/A = H.wear_suit
		if(A.armor && A.armor["melee"])
			maxHealth += A.armor["melee"]

	maxHealth += 40
	health = maxHealth
	name = "Infested [H.real_name]" // Not using the Z word.
	desc = "A parasitic organism attached to a deceased body, controlling it directly as if it were a puppet."
	melee_damage_lower += 8  // 10 total.
	melee_damage_upper += 11 // 15 total.
	emote_see = list("shambles around", "twitches", "stares")
	attacktext = "clawed"

	H.forceMove(src)
	infested = H

	update_icon()
	visible_message("<span class='warning'>The corpse of [H.name] suddenly rises!</span>")

/mob/living/simple_animal/hostile/blobspore/GetIdCard()
	if(infested) // If we've infested someone, use their ID.
		return infested.GetIdCard()
