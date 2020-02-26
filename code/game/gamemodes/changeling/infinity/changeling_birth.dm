//Absorbs the victim's DNA making them uncloneable. Requires a strong grip on the victim.
//Doesn't cost anything as it's the most basic ability.
/mob/proc/changeling_absorb_dna()
	set category = "Changeling"
	set name = "Absorb DNA"

	var/datum/changeling/changeling = changeling_power(0,0,100)
	var/forced_absorbing = 0
	if(!changeling)	return

	var/obj/item/grab/G = src.get_active_hand()
	if(!istype(G))
		to_chat(src, SPAN_LING("Мы должны удерживать добычу, чтобы поглотить её."))
		return

	var/mob/living/carbon/human/T = G.affecting
	if(!istype(T))
		to_chat(src, SPAN_LING("ДНК [T] не совместима с нашим геномом."))
		return

	if(T.isSynthetic())
		to_chat(src, SPAN_LING("Мы не можемь извлекать ДНК из синтетиков!"))
		return

	if(T.species.species_flags & SPECIES_FLAG_NO_SCAN)
		to_chat(src, SPAN_LING("Мы не знаем, как усвоить ДНК этого существа!"))
		return

	if(islesserform(T))
		to_chat(src, SPAN_LING("ДНК этого существа не совместимо с нашей формой!"))
		return

	if(MUTATION_HUSK in T.mutations)
		to_chat(src, SPAN_LING("ДНК этого существа слишком повреждено!"))
		return

	if(!G.can_absorb())
		to_chat(src, SPAN_LING("Мы должны крепче держать добычу."))
		return

	if(T.stat == DEAD)
		to_chat(src, SPAN_LING("Этот труп бесполезен. Лучше поохотиться на другую жертву."))
		return

	if(changeling.isabsorbing)
		to_chat(src, SPAN_LING("Мы уже поглощаем!"))
		return

	var/obj/item/organ/external/affecting = T.get_organ(src.zone_sel.selecting)
	if(!affecting)
		to_chat(src, SPAN_WARNING("У [T] нет этой части тела!"))

	changeling.isabsorbing = 1
	if(T.paralysis)
		if(alert(src, "Жертва в сознании. Предложить ей не сопротивляться и провести поглощение бескровно?", "Выбор", "Да", "Нет") == "Нет")
			forced_absorbing = 1
		if(!forced_absorbing)
			if(alert(T, "Существо дало вам выбор. Вы хотите обратиться бескровно?", "Выбор", "Да", "Нет") == "Нет")
				to_chat(src, SPAN_WARNING("[T] отказывается от нашего щедрого предложения!"))
				changeling.isabsorbing = 0
				return
	else
		if(alert(src, "Жертва БЕЗ сознания. Подождать, пока не проснется? Если нет - мы поглотим её так.", "Выбор", "Да", "Нет") == "Да")
			changeling.isabsorbing = 0
			return
		else
			forced_absorbing = 1
	var/obj/item/organ/external/target_organ= pick(T.organs)
	for(var/stage = 1, stage<=3, stage++)
		switch(stage)
			if(1)
				playsound(get_turf(src), 'infinity/sound/effects/lingextends.ogg', 50, 1)
				if(forced_absorbing)
					src.visible_message(SPAN_WARNING("[src]'s skin begins to shift and squirm! Sharp claws have appeared at hands!"))
				else
					src.visible_message(SPAN_WARNING("[src]'s skin begins to shift and squirm! The tongue goes out and turns into gross proboscis!"))
				T.stuttering += 40 // horror effect
				if(!do_mob(src, T, 8 SECONDS))
					to_chat(src, SPAN_LING("Our absorption has been interrupted!"))
					changeling.isabsorbing = 0
					return
			if(2)
				if(forced_absorbing)
					while(T.getBruteLoss() <= 300 ) //mega damage
						if(!do_mob(src, T, 3.7 SECONDS))
							to_chat(src, SPAN_LING("Our absorption of [T] has been interrupted!"))
							changeling.isabsorbing = 0
							return
						target_organ= pick(T.organs)
						src.visible_message(SPAN_DANGER("[src] tears [T]'s [target_organ]!"))
						target_organ.take_external_damage(25, 0, DAM_SHARP, "claws")
						playsound(get_turf(src), 'sound/magic/demon_attack1.ogg', 15, 1)
//						for(var/datum/reagent/R in T.vessel)
//							if(R.name != "Blood")
//								T.vessel.trans_to_mob(src)
				else
					src.visible_message(SPAN_DANGER("[src] stabs \the [T] with the proboscis!"), SPAN_NOTICE("We stab \the [T] with the proboscis."))
					playsound(get_turf(src), 'infinity/sound/effects/lingstabs.ogg', 50, 1)
					spawn(2.5 SECONDS)
						playsound(get_turf(src), 'infinity/sound/effects/lingabsorbs.ogg', 40, 1)
						to_chat(src, SPAN_LING("We start to absorb the sweetness DNA from [T]..."))
						T.visible_message(SPAN_NOTICE("\the [T] quickly turns pale..."), SPAN_NOTICE("\the [src] sucks the life from me..."))
						T.eye_blurry += 20
					while(T.vessel.total_volume >= 50) //will su... absorb 93% of victim's fluids
						if(!do_mob(src, T, 3.7 SECONDS))
							to_chat(src, SPAN_LING("Our absorption of [T] has been interrupted!"))
							changeling.isabsorbing = 0
							return
						T.vessel.remove_any(rand(40, 60))
						T.stun_effect_act(0, 15, affecting, "large organic needle")
						to_chat(src, SPAN_LING("[T] still has [round(T.vessel.total_volume)] fluids."))
						if(prob(20))
							to_chat(T, pick(SPAN_NOTICE("Someone must help me... Please..."), SPAN_NOTICE("It's so merciless..."), SPAN_NOTICE("I already just wanna die!...")))
							to_chat(src, pick(SPAN_LING("We would do this all day..."), SPAN_LING("[T]'s DNA tastes sweat..."), SPAN_LING("We feel ourselve much more better...")))
							playsound(get_turf(src), 'infinity/sound/effects/lingabsorbs.ogg', 25, 1)
							src.visible_message(SPAN_WARNING("\the [src]'s proboscis loudly sucks something from \the [T]'s [affecting.name]!"))
			if(3)
				src.visible_message(SPAN_WARNING("[src] begins to form some sort of cocoon around [T]!"))
				playsound(get_turf(src), 'infinity/sound/magic/demon_consume.ogg', 40, 1)
				if(!do_mob(src, T, 12 SECONDS))
					to_chat(src, SPAN_LING("Our cocoon formation has been interrupted!"))
					changeling.isabsorbing = 0
					return

		SSstatistics.add_field_details("changeling_powers","A[stage]")
	if(forced_absorbing)
		visible_message(SPAN_WARNING("[src] retracts claws from \the [T]!"), SPAN_LING("We have absorbed the all useful genome from [T]!"))
	else
		visible_message(SPAN_WARNING("[src] removes its proboscis from \the [T]!"), SPAN_LING("We have absorbed the all fluids with DNA from [T]!"))
//	playsound(get_turf(src), 'infinity/sound/effects/lingabsorbs.ogg', 70, 1)

	if(forced_absorbing)
		changeling.chem_storage += 10
		changeling.geneticpoints += 4
	else
		changeling.chem_storage += 20
		changeling.geneticpoints += 7
	changeling.chem_charges = changeling.chem_storage

	//Steal all of their languages!
	for(var/language in T.languages)
		if(!(language in changeling.absorbed_languages))
			changeling.absorbed_languages += language

	changeling_update_languages(changeling.absorbed_languages)

	var/datum/absorbed_dna/newDNA = new(T.real_name, T.dna, T.species.name, T.languages, T.flavor_texts)
	absorbDNA(newDNA)
	if(T?.mind)
		T.mind.CopyMemories(mind)

	if(T.mind?.changeling)
		if(T.mind.changeling.absorbed_dna)
			for(var/datum/absorbed_dna/dna_data in T.mind.changeling.absorbed_dna)	//steal all their loot
				if(changeling.GetDNA(dna_data.name))
					continue
				absorbDNA(dna_data)
				changeling.absorbedcount++
			T.mind.changeling.absorbed_dna.len = 1

		if(T.mind.changeling.purchasedpowers)
			for(var/datum/power/changeling/Tp in T.mind.changeling.purchasedpowers)
				if(Tp in changeling.purchasedpowers)
					continue
				else
					changeling.purchasedpowers += Tp

					if(!Tp.isVerb)
						call(Tp.verbpath)()
					else
						src.make_changeling()

		changeling.chem_charges += T.mind.changeling.chem_charges
		changeling.geneticpoints += T.mind.changeling.geneticpoints
		T.mind.changeling.chem_charges = 0
		T.mind.changeling.geneticpoints = 0
		T.mind.changeling.absorbedcount = 0

	changeling.absorbedcount++
	changeling.isabsorbing = 0

	var/obj/item/organ/internal/heart/heart = T.internal_organs_by_name[BP_HEART]
	for(heart in T.organs)
		heart.pulse = 0
	if(T.mind?.changeling)
		T.Drain() //effective execution.
		T.death(0)
		to_chat(T.client, SPAN_DANGER("Вы были поглощены сородичем. Это конец..."))
		return
	T.death(0)

	var/obj/structure/changeling_cocoon/coc = new /obj/structure/changeling_cocoon(T.loc)
	for(G in contents) //G - it's grab. Mentioned before
		qdel(G)
	T.forceMove(coc)
	coc.victim = T
	to_chat(T.client, SPAN_DANGER("Вы были поглощены генокрадом, однако, он оставил кокон, \
	в котором Ваш персонаж станет одним из Них. Не покидайте игру и не выходте из тела, чтобы призраки не забрали его."))
	spawn(6 SECONDS)
		for(var/mob/observer/ghost/O in GLOB.ghost_mob_list)
			to_chat(O, FONT_LARGE(SPAN_LING(
			"Появился кокон генокрада! Нажмите на него, чтобы стать одним из них. ([ghost_follow_link(coc, O)])")))
	return 1

/obj/structure/changeling_cocoon
	name = "cocoon"
	desc = "Something wrapped in silky spider web."
	icon = 'icons/effects/effects.dmi'
	icon_state = "cocoon_large1"
	var/mob/living/victim = null
	var/birth_time = 60*2 //seconds
	var/progress = 0 //in seconds
	var/last_sound_time
	var/health
	var/max_health = 100

/obj/structure/changeling_cocoon/Initialize()
	. = ..()
	last_sound_time = world.time
	health = max_health
	START_PROCESSING(SSobj, src)

/obj/structure/changeling_cocoon/Process()
	if(!victim?.client)
		return
	if(health < max_health)
		if(prob(4))
			src.visible_message(SPAN_WARNING("\icon[src] [src] slowly restores damaged sections with new weeb..."))
		health++
	progress++
	if(progress >= birth_time)
		birth()
	if(progress % 10 == 0) //every 10 seconds
		announce()
	if(world.time >= last_sound_time + 20 SECONDS)
		last_sound_time = world.time
		playsound(get_turf(src), 'infinity/sound/effects/lingextends.ogg', 15, 1)
		src.visible_message(pick(
			SPAN_WARNING("\icon[src] [src] pulses and faintly moves..."),
			SPAN_WARNING("\icon[src] [src]... breaths?"),
			SPAN_WARNING("\icon[src] [src] exchanges faint breath."),
			SPAN_WARNING("\icon[src] [src] has something under weeb - it moves around the victim...")))

/obj/structure/changeling_cocoon/Destroy()
	if(victim)
		victim.dropInto(loc)
		victim = null
		visible_message(SPAN_DANGER("[victim] dropped from [src]!"))
	STOP_PROCESSING(SSobj, src)
	. = ..()

/obj/structure/changeling_cocoon/attackby(obj/item/I, mob/user)
	user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
	if(istype(I, /obj/item/device/scanner))
		var/obj/item/device/scanner/scanner = I
		scanner.scan(victim)
		return
	if(user.a_intent == I_HURT)
		user.do_attack_animation(src)
		var/damage = I.force
		if(I.damtype == BURN)
			damage *= 2
		playsound(get_turf(src), I.hitsound, 15, 1)
		take_damage(damage)
		user.visible_message(SPAN_WARNING("[user] [pick(I.attack_verb)]s [src]!"), SPAN_WARNING("You [pick(I.attack_verb)] [src]!"))
	else
		user.visible_message(SPAN_WARNING("[user] pokes [src] with [I]."), SPAN_WARNING("You poke [src] with [I]."))

/obj/structure/changeling_cocoon/attack_generic(var/mob/user, var/damage, var/attack_verb)
	user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
	user.visible_message(SPAN_DANGER("\The [user] [attack_verb] \the [src]!"))
	attack_animation(user)
	take_damage(damage)

/obj/structure/changeling_cocoon/attack_hand(var/mob/M)
	if(M.a_intent == I_HURT)
		if(M in contents)
			M.setClickCooldown(DEFAULT_ATTACK_COOLDOWN * 2) //double cooldown
			M.visible_message(SPAN_DANGER("Something rips [src] from inside!"), SPAN_WARNING("We bite and tear [src]!"))
			playsound(get_turf(src), 'sound/weapons/bite.ogg', 20, 1)
			take_damage(20) //todo: update with species attack state, bite one (or not?)
		else
			M.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
			M.do_attack_animation(src)
			M.visible_message(SPAN_WARNING("[M] kicks [src]!"), SPAN_WARNING("You kick [src]!"))
			playsound(get_turf(src), pick(('sound/weapons/genhit1.ogg'), ('sound/weapons/genhit2.ogg'), pick('sound/weapons/genhit3.ogg')), 50, 1)
			take_damage(3) //todo: update with species attack states
	else
		M.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
		if(M in contents)
			to_chat(M, "You touch [src]. It feels slimy and warm - you can see everything around it.")
		else
			M.visible_message(SPAN_WARNING("[M] touches [src]..."), "You touch [src]. It feels slimy and warm - you can barely see a body under thick layer of weeb.")

/obj/structure/changeling_cocoon/bullet_act(var/obj/item/projectile/Proj)
	if(!(Proj.damage_type == BRUTE || Proj.damage_type == BURN))
		return
	switch(Proj.damage_type)
		if(BRUTE) visible_message(SPAN_WARNING("[src] tears appart!"))
		if(BURN) visible_message(SPAN_WARNING("[src] melts!"))
	take_damage(Proj.damage)
	..()

/obj/structure/changeling_cocoon/ex_act(severity)
	switch(severity)
		if(1)
			qdel(src)
		if(2)
			health -= 90
		if(3)
			health -= 40

/* someone - work on it later, please
/obj/structure/changeling_cocoon/fire_act(datum/gas_mixture/air, exposed_temperature, exposed_volume)
	return
*/

/obj/structure/changeling_cocoon/take_damage(var/amount)
	health -= amount
	if(health < 0)
		visible_message(SPAN_WARNING("\icon[src] [src] breaks appart and a goo flows from it!"))
		new /obj/effect/decal/cleanable/filth(src)
		qdel(src)

/obj/structure/changeling_cocoon/examine(mob/user)
	. = ..()
	spawn(1 SECOND)
		if(Adjacent(user) && victim)
			to_chat(user, SPAN_DANGER("[src] has faint pulse!"))

/obj/structure/changeling_cocoon/attack_ghost(var/mob/observer/ghost/user)
	if(convert(user))
		spawn(1 SECOND)
			if(user) qdel(user) // Remove the keyless ghost if it exists.

/obj/structure/changeling_cocoon/proc/announce()
	if(!victim?.client)
		return
	var/time = birth_time - progress
	if(time > 0)
		to_chat(victim, SPAN_LING("До вылупления осталось [time] секунд."))

/*
Revive in next proc causes runtimes like
Runtime in unsorted.dm, line 1116: GC: -- [0x20006bc] | /obj/item/organ/external/foot was unable to be GC'd --
x7
I don't know how to fix it, tried two days, sorry.
*/

/obj/structure/changeling_cocoon/proc/birth()
	if(!victim.client)
		return
	victim.revive()
	spawn(7 SECONDS)
	GLOB.changelings.add_antagonist(victim.mind, 1)
	to_chat(victim, SPAN_LING(FONT_LARGE("Отныне, <b><i>Мы едины!</b></i> Нужно разорвать наш кокон, чтобы выбраться!")))
	STOP_PROCESSING(SSobj, src)

/obj/structure/changeling_cocoon/proc/convert(mob/user)
	if(!victim)
		to_chat(user, SPAN_WARNING("Превращение уже завершилось."))
		return
	if(jobban_isbanned(user, MODE_CHANGELING))
		to_chat(user, SPAN_WARNING("У вас имеется бан на роль генокрадов. Вы не можете играть за них."))
		return
	if(src.victim.client)
		to_chat(user, SPAN_WARNING("Кто-то уже занял это тело до Вас."))
		return
	var/confirm = alert(user, "Вы хотите стать новым генокрадом?", "Новый генокрад", "Нет", "Да")
	if(!user || !src || confirm != "Да")
		return
	victim.ckey = user.ckey
	to_chat(victim, SPAN_DANGER("Не покидайте тело и игру, чтобы процесс превращения продолжался и другие игроки не заняли его."))
	return 1
