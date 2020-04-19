/mob/living/carbon/alien/larva/Stat()
	. = ..()
	if(. && statpanel("Status"))
		stat("Growth", "[round(amount_grown)]/[max_grown]")

/mob/living/carbon/alien/larva/verb/evolve()

	set name = "Moult"
	set desc = "Moult your skin and become an adult."
	set category = "Abilities"

	if(stat != CONSCIOUS)
		return

	if(!adult_form)
		verbs -= /mob/living/carbon/alien/larva/verb/evolve
		return

	if(handcuffed)
		to_chat(src, SPAN_ALIEN("Вы не можете эволюционировать, пока скованы оковами."))
		return

	if(amount_grown < max_grown)
		to_chat(src, SPAN_ALIEN("Вы недостаточно выросли для этого."))
		return

	// confirm_evolution() handles choices and other specific requirements.
	var/new_species = confirm_evolution()
	if(!new_species || !adult_form )
		return

	var/mob/living/carbon/human/adult = new adult_form(get_turf(src))
	adult.set_species(new_species)

	transfer_languages(src, adult)

	if(mind)
		mind.transfer_to(adult)
		if (can_namepick_as_adult)
			var/newname = sanitize(input(adult, "You have become an adult. Choose a name for yourself.", "Adult Name") as null|text, MAX_NAME_LEN)

			if(!newname)
				adult.fully_replace_character_name("[src.adult_name] ([instance_num])")
			else
				adult.fully_replace_character_name(newname)
	else
		adult.key = src.key

	for (var/obj/item/W in src.contents)
		src.drop_from_inventory(W)

	for(var/datum/language/L in languages)
		adult.add_language(L.name)
	qdel(src)

/mob/living/carbon/alien/larva/proc/update_progression(var/drinked_blood)
	if(amount_grown < max_grown)
		if(drinked_blood)
			amount_grown++
		else
			if(prob(30))
				amount_grown++
	return

/mob/living/carbon/alien/larva/proc/confirm_evolution()

	to_chat(src, SPAN_ALIEN("Вы растёте и становитесь ближе к тому, чтобы стать такой же прекрасной, как и ваши сестры!"))
	to_chat(src, SPAN_ALIEN("Пришло время выбрать свою касту. Этот процесс зависит только от вас. Королева не может повлиять на то, как вы будете эволюционировать."))
	to_chat(src, SPAN_ALIEN("<B>Охотники (Hunters)</B> - самые сильные и быстрые. Они могут охотиться на одиноких жертв вдали от травы и улья. Только они бегают с такой же скоростью, с которой бегает еда. Могут стать еще быстрее за счет сбрасывания значительной части защитного панциря и превратится в Воина(Warrior)."))
	to_chat(src, SPAN_ALIEN("<B>Стражи (Sentinels)</B> - те, кто способен плавить укрепления кислотой и бороться с на расстоянии. Они крепче, но медленнее охотников. Могут вырастить себе орган для метания кислотой и стать Плевуном(Spitter)."))
	to_chat(src, SPAN_ALIEN("<B>Дроны (Drones)</B> - рабочая сила улья. Строители стен и те, кто готов садить траву, не учавствуя в активных боях. После они могут вырасти в Лорда Улья(Hivelord). Только лорды улья могут эволюционировать в Королеву(Queen)."))
	to_chat(src, SPAN_ALIEN("Если вы - последняя (или первая) личинка, то станьте дроном, а затем Королевой."))
	var/alien_caste = alert(src, "Please choose which alien caste you shall belong to.",,"Hunter","Sentinel","Drone")
	return alien_caste ? "Xenophage [alien_caste]" : null

