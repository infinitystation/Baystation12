/obj/effect/vine/HasProximity(var/atom/movable/AM)
	if(!is_mature() || seed.get_trait(TRAIT_SPREAD) != 2)
		return

	var/mob/living/M = AM
	if(!istype(M))
		return

	if(issmall(M) || prob(round(seed.get_trait(TRAIT_POTENCY)/6)))
		//wait a tick for the Entered() proc that called HasProximity() to finish (and thus the moving animation),
		//so we don't appear to teleport from two tiles away when moving into a turf adjacent to vines.
		spawn(1)
			if(prob(seed.get_trait(((TRAIT_POTENCY)/2)*3)))
				entangle(M)

/obj/effect/vine/attack_hand(var/mob/user)
	manual_unbuckle(user)

/obj/effect/vine/attack_generic(var/mob/user)
	manual_unbuckle(user)

/obj/effect/vine/Crossed(atom/movable/O)
	if(isliving(O))
		trodden_on(O)

/obj/effect/vine/proc/trodden_on(var/mob/living/victim)
	wake_neighbors()
	if(!is_mature())
		return
	if(prob(seed.get_trait(((TRAIT_POTENCY)/2)*3)))
		entangle(victim)
	var/mob/living/carbon/human/H = victim
	if(istype(H) && H.shoes)
		return
	seed.do_thorns(victim,src)
	seed.do_sting(victim,src,pick(BP_R_FOOT,BP_L_FOOT,BP_R_LEG,BP_L_LEG))

/obj/effect/vine/proc/manual_unbuckle(mob/user)
	if(!buckled_mob)
		return
	if(buckled_mob != user)
		to_chat(user, "<span class='notice'>You try to free \the [buckled_mob] from \the [src].</span>")
		var/chance = round(100/(20*seed.get_trait(TRAIT_POTENCY)/100))
		if(prob(chance))
			buckled_mob.visible_message(\
				"<span class='notice'>\The [user] frees \the [buckled_mob] from \the [src].</span>",\
				"<span class='notice'>\The [user] frees you from \the [src].</span>",\
				"<span class='warning'>You hear shredding and ripping.</span>")
			unbuckle_mob()
	else
		user.setClickCooldown(100)
		var/breakouttime = rand(600, 1200) //1 to 2 minutes.

		user.visible_message(
			"<span class='danger'>\The [user] attempts to get free from [src]!</span>",
			"<span class='warning'>You attempt to get free from [src].</span>")

		if(do_after(user, breakouttime, incapacitation_flags = INCAPACITATION_DEFAULT & ~INCAPACITATION_RESTRAINED))
			if(unbuckle_mob())
				user.visible_message(
					"<span class='danger'>\The [user] manages to escape [src]!</span>",
					"<span class='warning'>You successfully escape [src]!</span>")

/obj/effect/vine/proc/entangle(mob/living/victim)
	if(buckled_mob)
		return

	if(victim.anchored)
		return

	if(!Adjacent(victim))
		return

	if(ishuman(victim))
		var/mob/living/carbon/human/H = victim
		if(H.species.species_flags & SPECIES_FLAG_NO_TANGLE)
			return
		if(victim.loc != loc && istype(H.shoes, /obj/item/clothing/shoes/magboots) && (H.shoes.item_flags & ITEM_FLAG_NOSLIP) || H.species.check_no_slip(H))
			visible_message("<span class='danger'>Tendrils lash to drag \the [victim] but \the [src] can't pull them across the ground!</span>")
			return
	
	victim.visible_message("<span class='danger'>Tendrils lash out from \the [src] and drag \the [victim] in!</span>", "<span class='danger'>Tendrils lash out from \the [src] and drag you in!</span>")
	victim.forceMove(loc)
	if(buckle_mob(victim))
		victim.set_dir(pick(GLOB.cardinal))
		to_chat(victim, "<span class='danger'>The tendrils [pick("wind", "tangle", "tighten", "coil", "knot", "snag", "twist", "constrict", "squeeze", "clench", "tense")] around you!</span>")

/obj/effect/vine/buckle_mob()
	. = ..()
	if(.) START_PROCESSING(SSvines, src)

/*[INF]
/obj/effect/vine/proc/manual_unbuckle(var/mob/living/carbon/human/user)
	user.setClickCooldown(100)
	if(buckled_mob)
		var/breakouttime = rand(100, 200) //10 to 20 seconds.
		if(buckled_mob != user)
			if(isxenomorph(user))
				breakouttime = 20
			if(do_mob(user, buckled_mob, breakouttime, incapacitation_flags = INCAPACITATION_DEFAULT & ~INCAPACITATION_RESTRAINED))
				if(!buckled_mob)
					return
				buckled_mob.visible_message(\
					"<span class='notice'>\The [user] frees \the [buckled_mob] from \the [src].</span>",\
					"<span class='notice'>\The [user] frees you from \the [src]!</span>",\
					"<span class='warning'>You hear shredding and ripping.</span>")
				unbuckle()
		else
			breakouttime = rand(200, 300) //20 to 30 seconds.
			user.visible_message(
				"<span class='danger'>\The [user] attempts to get free from [src]!</span>",
				"<span class='warning'>You attempt to get free from [src].</span>")

			if(do_mob(user, user, breakouttime, incapacitation_flags = INCAPACITATION_DEFAULT & ~INCAPACITATION_RESTRAINED))
				if(!buckled_mob)
					return
				unbuckle_mob(user)
				user.visible_message(
					"<span class='danger'>\The [user] manages to escape [src]!</span>",
					"<span class='warning'>You successfully escape [src]!</span>")

	START_PROCESSING(SSvines, src)
	return

/obj/effect/vine/proc/entangle(var/mob/living/victim)
	var/mob/living/carbon/human/H = victim
	if(ishuman(H))
		if(H.species.species_flags & SPECIES_FLAG_NO_TANGLE)
			return

	if(buckled_mob)
		return

	if(victim.buckled || victim.anchored)
		return

	if(isspecies(victim.pulledby, SPECIES_XENO)) //if pulled by xeno, you don't tangle
		return

	//grabbing people
	if(!victim.anchored && victim.loc == src.loc) //(Adjacent(victim) (saved)
		var/can_grab = 1
		if(istype(victim, /mob/living/carbon/human))
			if(((istype(H.shoes, /obj/item/clothing/shoes/magboots) && (H.shoes.item_flags & ITEM_FLAG_NOSLIP)) || (H.species.check_no_slip(H))) && victim.loc == src.loc)
				if(prob(90))
					src.visible_message("<span class='danger'>Tendrils lash to drag \the [victim] but \the [src] can't pull them across the ground!</span>")
					can_grab = FALSE
		if(isalien(victim) || issilicon(victim))
			can_grab = FALSE
		if(can_grab)
			victim.visible_message("<span class='danger'>Tendrils lash out from \the [src] and drag \the [victim] in!</span>", "<span class='danger'>Tendrils lash out from \the [src] and drag you in!</span>")
			victim.forceMove(src.loc)
			sleep(1)
			//entangling people
			if(victim.loc == src.loc)
				buckle_mob(victim)
				victim.set_dir(pick(GLOB.cardinal))
				to_chat(victim, "<span class='danger'>The tendrils [pick("wind", "tangle", "tighten", "coil", "knot", "snag", "twist", "constrict", "squeeze", "clench", "tense")] around you!</span>")
			Process(0)
*/
//[/INF]
