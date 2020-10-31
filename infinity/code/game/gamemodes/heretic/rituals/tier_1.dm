
//Tier 1 rituals. Basically, they will be avalible roundstart

/datum/ritual/convert
	name = "Conversion Ritual"
	desc = "Convert faithless creature in our religion and make it serve our god."

	requirments = list(/obj/effect/decal/cleanable/blood = 1) //We need some blood on the rune

	ritual_flags = NEEDS_KNIFE | NEEDS_BOOK | RITUAL_BLOODY

	required_cultists = 1
	ritual_radius = 1

/datum/ritual/convert/cast(var/obj/effect/rune/ritual_rune, var/mob/living/user)
	. = ..()

	if(!.)
		return

	var/mob/living/carbon/target = null
	for(var/mob/living/carbon/M in get_turf(ritual_rune))
		if(!iscultist(M) && M.stat != DEAD)
			target = M
			break

	if(!target)
		to_chat(user, SPAN_WARNING("You need somebody on the rune to convert!"))
		performing = FALSE
		return

	mass_incantation(ritual_rune, "Ar'Ene theih plehe a e'nrathep!")

	sleep(15)

	if(!(target in GLOB.cult.chosens))
		ritual_rune.visible_message(SPAN_WARNING("[ritual_rune] suddenly starts to glow, but just for a bit before darkening slowly... [target] isn't chosen and can't be converted yet..."))
		performing = FALSE
		return

	if(target.species == SPECIES_IPC || target.species == SPECIES_DIONA)
		ritual_rune.visible_message(SPAN_WARNING("[ritual_rune] suddenly starts to glow, but just for a bit before darkening slowly..."))
		performing = FALSE
		return

	if(check_cultists(ritual_rune, user) < 3)
		var/choice = alert("Do you want to join the cult?",,"Yes","No")
		if(choice == "Yes")
			to_chat(target, "<span class='cult'>Your blood pulses. Your head throbs. The world goes red. All at once you are aware of a horrible, horrible truth. The veil of reality has been ripped away and in the festering wound left behind something sinister takes root.</span>")
			sleep(15)
			if(!GLOB.cult.can_become_antag(target.mind, 1))
				to_chat(target, "<span class='danger'>Are you going insane?</span>")
			else
				new /obj/item/weapon/melee/cultblade/dagger(get_turf(ritual_rune))

			GLOB.cult.add_antagonist(target.mind, ignore_role = 1, do_not_equip = 1)
	else
		to_chat(target, "<span class='cult'>Your blood pulses. Your head throbs. The world goes red. All at once you are aware of a horrible, horrible truth. The veil of reality has been ripped away and in the festering wound left behind something sinister takes root.</span>")
		sleep(15)
		if(!GLOB.cult.can_become_antag(target.mind, 1))
			to_chat(target, "<span class='danger'>Are you going insane?</span>")
		else
			new /obj/item/weapon/melee/cultblade/dagger(get_turf(ritual_rune))

		GLOB.cult.add_antagonist(target.mind, ignore_role = 1, do_not_equip = 1)

	sleep(15)

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
		sleep(15)

	performing = FALSE

/datum/ritual/spire
	name = "Spire Ritual"
	desc = "Create an unholy spire, which will allow you to imbue words of your dark god into your flesh."

	requirments = list(/obj/effect/decal/cleanable/blood = 1)

	ritual_flags = NEEDS_KNIFE | RITUAL_VERY_BLOODY

	required_cultists = 1
	ritual_radius = 1

/datum/ritual/spire/cast(var/obj/effect/rune/ritual_rune, var/mob/living/user)
	. = ..()

	if(!.)
		return

	mass_incantation(ritual_rune, "Ta'ruk ahe'abanar!")
	new /obj/structure/cult/spire(get_turf(ritual_rune))
	performing = FALSE

/datum/ritual/teleport
	name = "Teleportation Ritual"
	desc = "Teleport anybody above the rune to another one."

	requirments = list() //Its combat ritual, using blood is kinda stupid. Basically, its a god damn holder

	ritual_flags = 0

	required_cultists = 1
	ritual_radius = 1

/datum/ritual/teleport/cast(var/obj/effect/rune/ritual_rune, var/mob/living/user)
	. = ..()

	if(!.)
		return

	var/mob/living/target = locate() in get_turf(ritual_rune)
	if(!target)
		performing = FALSE
		return

	var/list/t = list()
	for(var/obj/effect/rune/teleport/T in GLOB.cult.teleport_runes)
		if(T == src)
			continue
		t[T.destination] = T

	var/choice = input(user,"Choose the rune to teleport to.") in t

	var/obj/effect/rune/teleport/targ = t[choice]
	if(istype(targ))
		target.forceMove(get_turf(targ))

	performing = FALSE

/datum/ritual/book_summon
	name = "Attributes Summoning Ritual"
	desc = "Completing this ritual will summon a tome."

	requirments = list(/obj/effect/decal/cleanable/blood = 1,
						/obj/item/weapon/book = 1)

	required_cultists = 1
	ritual_radius = 1

/datum/ritual/book_summon/cast(var/obj/effect/rune/ritual_rune, var/mob/living/user)
	. = ..()

	if(!.)
		return

	mass_incantation(ritual_rune, "Ya'dajake wa'yeha na'rp!")
	new /obj/item/weapon/book/tome(get_turf(ritual_rune))
	performing = FALSE


/datum/ritual/astral
	name = "Astral Journey Ritual"
	desc = "A ritual, capable of separation of the soul from the body. Be careful, since it may end badly for the traveler's body."

	requirments = list(/obj/effect/decal/cleanable/blood = 1)

	ritual_flags = NEEDS_KNIFE

	required_cultists = 1
	ritual_radius = 1

/datum/ritual/astral/cast(var/obj/effect/rune/ritual_rune, var/mob/living/user)
	. = ..()

	if(!.)
		return

	var/tmpkey = user.key
	if(user.loc != get_turf(ritual_rune))
		performing = FALSE
		return
	speak_incantation(user, "Fwe'sh mah erl nyag r'ya!")
	user.visible_message(SPAN_WARNING("\The [user]'s eyes glow blue as \he freezes in place, absolutely motionless."), SPAN_WARNING("The shadow that is your spirit separates itself from your body. You are now in the realm beyond. While this is a great sight, being here strains your mind and body. Hurry..."), "You hear only complete silence for a moment.")
	announce_ghost_joinleave(user.ghostize(1), 1, "You feel that they had to use some [pick("dark", "black", "blood", "forgotten", "forbidden")] magic to [pick("invade", "disturb", "disrupt", "infest", "taint", "spoil", "blight")] this place!")

	var/mob/observer/ghost/soul
	for(var/mob/observer/ghost/O in GLOB.ghost_mob_list)
		if(O.key == tmpkey)
			soul = O
			break
	while(user)
		if(user.stat == DEAD)
			performing = FALSE
			return
		if(user.key)
			performing = FALSE
			return
		else if(user.loc != get_turf(ritual_rune) && soul)
			soul.reenter_corpse()
		else
			user.take_overall_damage(0, 0.5) //We used a pair of eyes, so it must be more powerful
		sleep(20)
	performing = FALSE



/datum/ritual/offering
	name = "Offering Ritual"
	desc = "A horrible, disguisting ritual, which allows to capture a soul into a soulstone in form of shade."

	requirments = list(/obj/effect/decal/cleanable/blood = 1,
						/obj/item/weapon/book/tome = 0)

	ritual_flags = NEEDS_KNIFE | RITUAL_VERY_BLOODY

	required_cultists = 3
	ritual_radius = 1

/datum/ritual/offering/cast(var/obj/effect/rune/ritual_rune, var/mob/living/user)
	. = ..()

	if(!.)
		return

	var/mob/living/victim

	var/turf/T = get_turf(ritual_rune)
	for(var/mob/living/M in T)
		if(M.stat != DEAD && !iscultist(M))
			victim = M
			break
	if(!victim)
		performing = FALSE
		return

	mass_incantation(ritual_rune, "Barhah hra zar'garis!")

	while(victim && victim.loc == T && victim.stat != DEAD)

		if(!check_cultists(ritual_rune))
			performing = FALSE
			return

		victim.fire_stacks = max(2, victim.fire_stacks)
		victim.IgniteMob()
		victim.take_organ_damage(2 + check_cultists(ritual_rune), 2 + check_cultists(ritual_rune))
		if(ishuman(victim))
			var/mob/living/carbon/human/H = victim
			if(H.is_asystole())
				H.adjustBrainLoss(2 + check_cultists(ritual_rune))
		sleep(40)

	if(victim && victim.loc == T && victim.stat == DEAD)
		GLOB.cult.add_cultiness(CULTINESS_PER_SACRIFICE)
		var/obj/item/device/soulstone/heretic/F = new(get_turf(ritual_rune))

		ritual_rune.visible_message(SPAN_WARNING("The Geometer of Blood accepts this offering."))

		ritual_rune.visible_message(SPAN_NOTICE("\The [F] appears over \the [src]."))
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

	performing = FALSE



/datum/ritual/curse_pain
	name = "Curse Of Pain"
	desc = "Make anybody, who last touched the item you will put on the rune feel horrible pain."

	requirments = list(/obj/effect/decal/cleanable/blood = 1,
					   /obj/item/weapon/material/knife = 0)

	ritual_flags = NEEDS_KNIFE | RITUAL_BLOODY

	required_cultists = 1
	ritual_radius = 1

/datum/ritual/curse_pain/cast(var/obj/effect/rune/ritual_rune, var/mob/living/user)
	. = ..()

	if(!.)
		return

	var/obj/item/cursed

	for(var/obj/item/curse in get_turf(ritual_rune))
		if(!(curse.type in requirments))
			cursed = curse
			break

	var/mob/living/carbon/human/cursing = null

	for(var/mob/living/carbon/human/try_to_curse in cursed.fingerprintsmob)
		if(iscultist(try_to_curse) || try_to_curse.stat == DEAD || !istype(try_to_curse))
			continue

		cursing = try_to_curse
		break

	if(!cursing)
		ritual_rune.visible_message(SPAN_WARNING("[ritual_rune] starts glowing red, but fails to activate without an item that victim touched."))
		performing = FALSE
		return

	while(cursing.stat != DEAD && check_cultists(ritual_rune))
		cursing.custom_pain("You feel horrible pain, like your whole body is burning!", 50 * check_cultists(ritual_rune))
		mass_incantation(ritual_rune, "Yu'gular faras des'dae!")
		sleep(20 * rand(1, 2.5))
	performing = FALSE

/datum/ritual/chosen
	name = "Blood Vision Ritual"
	desc = "Get names of three people, who are chosen by your god for conversion."

	requirments = list(/obj/effect/decal/cleanable/blood = 1)

	ritual_flags = NEEDS_KNIFE | NEEDS_BOOK | RITUAL_BLOODY

	required_cultists = 3
	ritual_radius = 1

/datum/ritual/chosen/cast(var/obj/effect/rune/ritual_rune, var/mob/living/user)
	. = ..()

	if(!.)
		return

	if(GLOB.cult.last_chosen_time > world.time)
		ritual_rune.visible_message(SPAN_WARNING("[ritual_rune] suddenly starts to glow, but just for a bit before darkening slowly... You can't get new conversion targets yet."))

	mass_incantation(ritual_rune, "Ha'ehaneas yu'wahajna!")

	GLOB.cult.last_chosen_time = world.time + 10 MINUTES

	var/list/avalible = list()

	for(var/mob/living/carbon/human/H in GLOB.player_list)
		if(!iscultist(H) && H.stat != DEAD && H.mind && !(H.species == SPECIES_IPC || H.species == SPECIES_DIONA) && !istype(H.mind.assigned_job, /datum/job/submap))
			avalible.Add(H)


	for(var/datum/mind/H in GLOB.cult.current_antagonists)
		if(H.current && !H.current.stat)
			to_chat(H.current, FONT_LARGE("<span class='cult'>Nar'Sie marked three people for conversion:</span>"))

	GLOB.cult.chosens.Cut()
	for(var/i = 1 to 3)
		var/mob/living/carbon/human/H = pick_n_take(avalible)
		GLOB.cult.chosens.Add(H)

		for(var/datum/mind/M in GLOB.cult.current_antagonists)
			if(M.current && !M.current.stat)
				to_chat(M.current, FONT_LARGE("<span class='cult'>[H.real_name], as [H.mind.assigned_role]</span>"))
	performing = FALSE

/datum/ritual/wall
	name = "Shield Ritual"
	desc = "This ritual will create an impassible shield above the rune."

	requirments = list(/obj/effect/decal/cleanable/blood = 1)

	required_cultists = 1

	ritual_flags = NEEDS_BOOK


/datum/ritual/wall/cast(var/obj/effect/rune/ritual_rune, var/mob/living/user)
	. = ..()

	if(!.)
		return

	var/obj/effect/cultwall/wall = locate() in get_turf(ritual_rune)
	if(wall)
		wall.health = wall.max_health
		performing = FALSE
		return

	wall = new /obj/effect/cultwall(get_turf(ritual_rune), "#ffffff", ritual_rune)

	mass_incantation(ritual_rune, "Khari'd! Aje'kaner ha'yeh!")
	performing = FALSE
