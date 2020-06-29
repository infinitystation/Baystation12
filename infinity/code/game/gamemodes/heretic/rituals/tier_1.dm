
/datum/ritual/convert
	name = "Conversion Ritual"
	desc = "Convert faithless creature in our religion and make it serve our god."

	requirments = list(/obj/effect/decal/cleanable/blood = 1) //We need some blood on the rune

	ritual_flags = NEEDS_KNIFE | NEEDS_BOOK | RITUAL_BLOODY

	required_cultists = 3 //You need whole starting cult, but hey, victims can't resist!
	ritual_radius = 1

/datum/ritual/convert/cast(var/obj/effect/ritual_rune, var/mob/living/user)
	. = ..()

	var/mob/living/carbon/target = null
	for(var/mob/living/carbon/M in get_turf(src))
		if(!iscultist(M) && M.stat != DEAD)
			target = M
			break

	if(!target)
		to_chat(src, SPAN_WARNING("You need somebody on the rune to convert!"))
		return

	mass_incantation(ritual_rune, "Ar'Ene theih plehe a e'nrathep!")

	sleep(5)

	if(target.species == SPECIES_IPC || target.species == SPECIES_DIONA)
		ritual_rune.visible_message(SPAN_WARNING("[ritual_rune] suddenly starts to glow, but just for a bit before darkening slowly..."))
		return

	to_chat(target, "<span class='cult'>Your blood pulses. Your head throbs. The world goes red. All at once you are aware of a horrible, horrible truth. The veil of reality has been ripped away and in the festering wound left behind something sinister takes root.</span>")

	sleep(5)

	if(!GLOB.cult.can_become_antag(target.mind, 1))
		to_chat(target, "<span class='danger'>Are you going insane?</span>")

	GLOB.cult.add_antagonist(target.mind, ignore_role = 1, do_not_equip = 1)

	sleep(5)

	if(!iscultist(target) && target.loc == get_turf(ritual_rune))
		mass_incantation(ritual_rune, "Ne'ahe ak delane ne'rsi!")
		if(target.stat == CONSCIOUS)
			target.take_overall_damage(0, 10)
			switch(target.getFireLoss())
				if(0 to 25)
					to_chat(target, "<span class='danger'>Your blood boils as you force yourself to resist the corruption invading every corner of your mind.</span>")
				if(25 to 45)
					to_chat(target, "<span class='danger'>Your blood boils and your body burns as the corruption further forces itself into your body and mind.</span>")
					target.take_overall_damage(0, 3)
				if(45 to 75)
					to_chat(target, "<span class='danger'>You begin to hallucinate images of a dark and incomprehensible being and your entire body feels like its engulfed in flame as your mental defenses crumble.</span>")
					target.take_overall_damage(0, 5)
				if(75 to 100)
					to_chat(target, "<span class='cult'>Your mind turns to ash as the burning flames engulf your very soul and images of an unspeakable horror begin to bombard the last remnants of mental resistance.</span>")
					target.take_overall_damage(0, 10)



/datum/ritual/astral
	name = "Astral Journey Ritual"
	desc = "A ritual, capable of separation of the soul from the body. Be careful, since it may end badly for the traveler's body."

	requirments = list(/obj/effect/decal/cleanable/blood = 1,
						/obj/item/organ/internal/eyes = 1) //Since it's more powerful than the rune + you can just gib a monkey :)

	ritual_flags = NEEDS_KNIFE

	required_cultists = 1
	ritual_radius = 1

/datum/ritual/astral/cast(var/obj/effect/ritual_rune, var/mob/living/user)
	. = ..()

	var/tmpkey = user.key
	if(user.loc != get_turf(src))
		return
	speak_incantation(user, "Fwe[pick("'","`")]sh mah erl nyag r'ya!")
	user.visible_message(SPAN_WARNING("\The [user]'s eyes glow blue as \he freezes in place, absolutely motionless."), SPAN_WARNING("The shadow that is your spirit separates itself from your body. You are now in the realm beyond. While this is a great sight, being here strains your mind and body. Hurry..."), "You hear only complete silence for a moment.")
	announce_ghost_joinleave(user.ghostize(1), 1, "You feel that they had to use some [pick("dark", "black", "blood", "forgotten", "forbidden")] magic to [pick("invade", "disturb", "disrupt", "infest", "taint", "spoil", "blight")] this place!")

	var/mob/observer/ghost/soul
	for(var/mob/observer/ghost/O in GLOB.ghost_mob_list)
		if(O.key == tmpkey)
			soul = O
			break
	while(user)
		if(user.stat == DEAD)
			return
		if(user.key)
			return
		else if(user.loc != get_turf(ritual_rune) && soul)
			soul.reenter_corpse()
		else
			user.take_overall_damage(0, 0.5) //We used a pair of eyes, so it must be more powerful
		sleep(20)



/datum/ritual/offering
	name = "Offering Ritual"
	desc = "A horrible, disguisting ritual, which allows to capture a soul into a soulstone in form of shade."

	requirments = list(/obj/effect/decal/cleanable/blood = 1,
						/obj/item/weapon/book/tome = 0)

	ritual_flags = NEEDS_KNIFE | RITUAL_VERY_BLOODY

	required_cultists = 3
	ritual_radius = 1

/datum/ritual/offering/cast(var/obj/effect/ritual_rune, var/mob/living/user)
	. = ..()

	var/turf/T = get_turf(ritual_rune)
	for(var/mob/living/M in T)
		if(M.stat != DEAD && !iscultist(M))
			victim = M
			break
	if(!victim)
		return

	mass_incantation("Barhah hra zar'garis!")

	while(victim && victim.loc == T && victim.stat != DEAD)

		if(!check_cultists(ritual_rune))
			return

		victim.fire_stacks = max(2, victim.fire_stacks)
		victim.IgniteMob()
		victim.take_organ_damage(2 + check_cultists(ritual_rune), 2 + check_cultists(ritual_rune))
		if(ishuman(victim))
			var/mob/living/carbon/human/H = victim
			if(H.is_asystole())
				H.adjustBrainLoss(2 + casters.len)
		sleep(40)

	if(victim && victim.loc == T && victim.stat == DEAD)
		GLOB.cult.add_cultiness(CULTINESS_PER_SACRIFICE)
		var/obj/item/device/soulstone/heretic/F = new(get_turf(ritual_rune))
		for(var/mob/M in cultists | get_cultists())
			to_chat(M, "<span class='warning'>The Geometer of Blood accepts this offering.</span>")
		visible_message("<span class='notice'>\The [F] appears over \the [src].</span>")
		GLOB.cult.sacrificed += victim.mind
		if(victim.mind == GLOB.cult.sacrifice_target)
			for(var/datum/mind/H in GLOB.cult.current_antagonists)
				if(H.current)
					to_chat(H.current, "<span class='cult'>Your objective is now complete.</span>")

		to_chat(victim, "<span class='cult'>The Geometer of Blood claims your body.</span>")
		F.attack(victim, user)

	if(victim)
		victim.ExtinguishMob()
		victim = null



/datum/ritual/curse_pain
	name = "Curse Of Pain"
	desc = "Make anybody, who last touched the item you will put on the rune, feel horrible pain."

	requirments = list(/obj/effect/decal/cleanable/blood = 1,
					   /obj/item/weapon/material/knife = 0)

	ritual_flags = NEEDS_KNIFE | RITUAL_BLOODY

	required_cultists = 1
	ritual_radius = 1

/datum/ritual/curse_pain/cast(var/obj/effect/ritual_rune, var/mob/living/user)
	. = ..()
	var/obj/item/cursed

	for(var/obj/item/curse in get_turf(ritual_rune))
		if(!istype(/obj/item/weapon/material/knife))
			cursed = curse

	var/mob/living/carbon/human/cursing = null

	for(var/mob/living/carbon/human/try_to_curse in cursed.fingerprintsmob)
		if(iscultist(try_to_curse) || try_to_curse.stat == DEAD || !istype(try_to_curse))
			continue

		cursing = try_to_curse
		break

	if(!cursing)
		return

	while(cursing.stat != DEAD && check_cultists(ritual_rune))
		cursing.custom_pain("You feel horrible pain, like your whole body is burning!", 50 * check_cultists(ritual_rune))
		mass_incantation("Yu'gular faras desdae!")
		sleep(40 * rand(1, 2.5))