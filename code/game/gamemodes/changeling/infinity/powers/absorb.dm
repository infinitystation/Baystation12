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

	if(T.stat == DEAD && world.time - T.timeofdeath > 5 MINUTES)
		to_chat(src, SPAN_LING("Этот труп мертв больше 5 минут и не содержит усваиваемого генома. Лучше поохотиться на другую жертву."))
		return

	if(changeling.isabsorbing)
		to_chat(src, SPAN_LING("Мы уже поглощаем!"))
		return

	var/obj/item/organ/external/affecting = T.get_organ(src.zone_sel.selecting)
	if(!affecting)
		to_chat(src, SPAN_WARNING("У [T] нет этой части тела!"))

	changeling.isabsorbing = 1
	if(T.mind && T.client)
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
	var/forced_gibbed = 0
//fluff
//todo	var/cocoon_type = rand(1,3)
	for(var/stage = 1, stage<=3, stage++)
		switch(stage)
			if(1)
				playsound(get_turf(src), 'infinity/sound/effects/lingextends.ogg', 50, 1, -3.5)
				if(forced_absorbing)
					src.visible_message(SPAN_WARNING("[src]'s skin begins to shift and squirm! Sharp claws have appeared at hands, while the tongue goes out and turns into gross proboscis!"))
				else
					src.visible_message(SPAN_WARNING("[src]'s skin begins to shift and squirm! The tongue goes out and turns into gross proboscis!"))
				T.stuttering += 40 // horror effect
				if(!do_mob(src, T, 8 SECONDS))
					src.visible_message(SPAN_WARNING("[src]'s proboscis flashed back in mouth, as claws turned into fingers!"))
					to_chat(src, SPAN_LING("Поглощение было прервано!"))
					changeling.isabsorbing = 0
					return
			if(2)
				if(forced_absorbing)
					while(T.getBruteLoss() <= 300 ) //mega damage
						if(!do_mob(src, T, 3.7 SECONDS)) //46 seconds, usually
							src.visible_message(SPAN_WARNING("[src]'s proboscis flashed back in mouth, as claws turned into fingers!"))
							to_chat(src, SPAN_LING("Поглощение было прервано!"))
							changeling.isabsorbing = 0
							return
						target_organ= pick(T.organs)
						src.visible_message(SPAN_DANGER("[src] tears [T]'s [target_organ]!"))
						target_organ.take_external_damage(25, 0, DAM_SHARP, "claws")
						playsound(get_turf(src), 'sound/magic/demon_attack1.ogg', 25, 1, -3.5)
						if(T.getBruteLoss() >= 200 && !forced_gibbed)
							gibs(T.loc, T.dna, /obj/effect/gibspawner/changeling, T.species.flesh_color, T.species.blood_color)
							forced_gibbed = 1
				if(forced_absorbing)
					src.visible_message(SPAN_DANGER("[src] violently stabs \the [T] with its proboscis!"))
				else
					src.visible_message(SPAN_WARNING("[src] gently stabs \the [T] with its proboscis!"))
				T.stun_effect_act(0, 15, affecting, "large organic needle")
				playsound(get_turf(src), 'infinity/sound/effects/lingstabs.ogg', 50, 1, -3.5)
				spawn(2.5 SECONDS)
					playsound(get_turf(src), 'infinity/sound/effects/lingabsorbs.ogg', 40, 1, -3.5)
					to_chat(src, SPAN_LING("We start to absorb the sweetness DNA from [T]..."))
					T.visible_message(SPAN_NOTICE("\the [T] quickly turns pale..."), SPAN_NOTICE("\the [src] sucks the life from me..."))
					T.eye_blurry += 20
				while(T.vessel.total_volume >= 50) //will su... absorb 93% of victim's fluids
					if(!do_mob(src, T, 3.7 SECONDS))
						src.visible_message(SPAN_WARNING("[src]'s proboscis flashed back in mouth!"))
						to_chat(src, SPAN_LING("Поглощение было прервано!"))
						changeling.isabsorbing = 0
						return
					if(forced_absorbing)
						T.vessel.remove_any(rand(90, 150)) //10~ seconds, because forced absorbing already takes 47 seconds at first step
					else
						T.vessel.remove_any(rand(40, 60)) //27 seconds with human
					T.stun_effect_act(0, 15, affecting, "large organic needle")
					to_chat(src, SPAN_LING("[T] still has [round(T.vessel.total_volume)] fluids."))
					if(prob(20) || forced_absorbing)
						to_chat(T, pick(SPAN_NOTICE("Someone must help me... Please..."), SPAN_NOTICE("It's so merciless..."), SPAN_NOTICE("I already just wanna die!...")))
						to_chat(src, pick(SPAN_LING("We would do this all day..."), SPAN_LING("[T]'s DNA tastes sweat..."), SPAN_LING("We feel ourselve much more better...")))
						playsound(get_turf(src), 'infinity/sound/effects/lingabsorbs.ogg', 10, 1, -3.5)
						src.visible_message(SPAN_WARNING("\the [src]'s proboscis loudly sucks something from \the [T]'s [affecting.name]!"))
			if(3)
				var/message = "[src] begins to form some sort of cocoon around [T]!"
/*todo
				if(forced_absorbing)
					switch(cocoon_type)
						if(3 to INFINITY) message = "[src] begins to form some sort of cocoon around [T]!"
						if(2) message = "[src] rises above [T] and transforms its arm into a giant tube! The substance from the end of tube leaks on [T]!"
						else
				else
					switch(cocoon_type)
						if(1) message = "[src] begins to form some sort of cocoon around [T]!"
						if(2)
						if(3)*/
				visible_message(SPAN_WARNING(message))
				playsound(get_turf(src), 'infinity/sound/magic/demon_consume.ogg', 40, 1, -3.5)
				if(!do_mob(src, T, 12 SECONDS))
					src.visible_message(SPAN_WARNING("[src]'s stops formin the cocoon!"))
					to_chat(src, SPAN_LING("Создание кокона было прервано!"))
					changeling.isabsorbing = 0
					return

		SSstatistics.add_field_details("changeling_powers","A[stage]")
	if(forced_absorbing)
		visible_message(SPAN_WARNING("[src] retracts claws and violently removes proboscis from \the [T]!"))
		to_chat(src, SPAN_LING("Мы поглотили лишь часть генома, что был у [T] из-за того, что повредили сосуд."))
/*todo
		var/message
		switch(cocoon_type)
			if(3 to INFINITY) message = "[src] begins to form some sort of cocoon around [T]!"
			if(2) message = "Субстанция из руки [src] покрывает ваше тело, шею, голову! Вы ничего не видите... Оно сжимает вас, не позволяя двигаться."
			else
		to_chat(src, SPAN_DANGER(message))*/
	else
		visible_message(SPAN_NOTICE("[src] softly removes its proboscis from \the [T]."))
		to_chat(src, SPAN_LING("Мы поглотили весь геном, что был у [T] благодаря отсутствию сопротивления! Хорошая работа."))
		playsound(get_turf(src), 'infinity/sound/effects/lingabsorbs.ogg', 70, 1, -3.5)

	if(forced_absorbing)
		changeling.chem_storage += 10
		changeling.geneticpoints += 3
	else
		changeling.chem_storage += 20
		changeling.geneticpoints += 7
	changeling.chem_charges = changeling.chem_storage

	//Steal all of their languages!
	for(var/language in T.languages)
		if(!(language in changeling.absorbed_languages))
			changeling.absorbed_languages += language

	changeling_update_languages(changeling.absorbed_languages)

	var/datum/absorbed_dna/newDNA = new(T.real_name, T.dna, T.species.name, T.languages)
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

					switch(Tp.state)
						if(0)
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
		to_chat(T.client, SPAN_DANGER("Мы были поглощены сородичем. Это конец..."))
		return
//	T.death(0)

	var/obj/structure/changeling_cocoon/coc = new /obj/structure/changeling_cocoon(T.loc)
	for(G in contents) //G - it's grab. Mentioned before
		qdel(G)
	T.forceMove(coc)
	coc.victim = T
	coc.background()
	if(jobban_isbanned(T, MODE_CHANGELING))
		to_chat(T.client, SPAN_WARNING("Вы были поглощены генокрадом, однако, он оставил кокон, \
		в котором Ваш персонаж станет одним из Них. Однако, у вас бан на роль генокрада - \
		к сожалению, вы покидаете тело."))
		T.ghostize(0) //cannot reenter in corpse
	else
		to_chat(T.client, SPAN_DANGER("Вы были поглощены генокрадом, однако, он оставил кокон, \
		в котором Ваш персонаж станет одним из Них. Если вы выйдите или станете призраком, то \
		другие призраки смогут вселиться в ваше старое тело."))
	spawn(6 SECONDS)
		for(var/mob/observer/ghost/O in GLOB.ghost_mob_list)
			to_chat(O, FONT_LARGE(SPAN_LING(
			"Появился кокон генокрада! Нажмите на него, чтобы стать одним из них. ([ghost_follow_link(coc, O)])")))
	return 1

