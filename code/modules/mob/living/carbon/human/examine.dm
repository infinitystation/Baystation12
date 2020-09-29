/mob/living/carbon/human/examine(mob/user, distance/* INF ahead */, mirror = 0)
	. = TRUE
	var/skipgloves = 0
	var/skipsuitstorage = 0
	var/skipjumpsuit = 0
	var/skipshoes = 0
	var/skipmask = 0
	var/skipears = 0
	var/skipeyes = 0
	var/skipface = 0

	//exosuits and helmets obscure our view and stuff.
	if(wear_suit)
		skipgloves = wear_suit.flags_inv & HIDEGLOVES
		skipsuitstorage = wear_suit.flags_inv & HIDESUITSTORAGE
		skipjumpsuit = wear_suit.flags_inv & HIDEJUMPSUIT
		skipshoes = wear_suit.flags_inv & HIDESHOES

	if(head)
		skipmask = head.flags_inv & HIDEMASK
		skipeyes = head.flags_inv & HIDEEYES
		skipears = head.flags_inv & HIDEEARS
		skipface = head.flags_inv & HIDEFACE

	if(wear_mask)
		skipeyes |= wear_mask.flags_inv & HIDEEYES
		skipears |= wear_mask.flags_inv & HIDEEARS
		skipface |= wear_mask.flags_inv & HIDEFACE

	//no accuately spotting headsets from across the room.
	if(distance > 3)
		skipears = 1

	var/list/msg = list("<span class='info'>*---------*\nЭто ")

	var/datum/gender/T = gender_datums[get_gender()]
	if(skipjumpsuit && skipface) //big suits/masks/helmets make it hard to tell their gender
		T = gender_datums[PLURAL]

	else if(species && species.ambiguous_genders)
		var/can_detect_gender = FALSE
		if(isobserver(user)) // Ghosts are all knowing.
			can_detect_gender = TRUE
		if(issilicon(user)) // Borgs are too because science.
			can_detect_gender = TRUE
		else if(ishuman(user))
			var/mob/living/carbon/human/H = user
			if(H.species && istype(species, H.species))
				can_detect_gender = TRUE

		if(!can_detect_gender)
			T = gender_datums[PLURAL] // Species with ambiguous_genders will not show their true gender upon examine if the examiner is not also the same species.
	else
		if(icon)
			msg += "\icon[icon] " //fucking BYOND: this should stop dreamseeker crashing if we -somehow- examine somebody before their icon is generated

	if(!T)
		// Just in case someone VVs the gender to something strange. It'll runtime anyway when it hits usages, better to CRASH() now with a helpful message.
		CRASH("Gender datum was null; key was '[(skipjumpsuit && skipface) ? PLURAL : gender]'")

	msg += "<EM>[src.name]</EM>"

	var/is_synth = isSynthetic()
	if(!(skipjumpsuit && skipface))
		var/species_name = "\improper "
		if(is_synth && species.cyborg_noun)
			species_name += "[species.cyborg_noun] [species.get_bodytype(src)]"
		else
			species_name += "[species.name]"
		msg += ", <b><font color='[species.get_flesh_colour(src)]'>\a [species_name]</font></b>[(user.can_use_codex() && SScodex.get_codex_entry(get_codex_value())) ?  SPAN_NOTICE(" \[<a href='?src=\ref[SScodex];show_examined_info=\ref[src];show_to=\ref[user]'>?</a>\]") : ""]"

//[INF]
	switch(T.key)
		if(MALE)
			msg += ", мужчина."
		if(FEMALE)
			msg += ", женщина."
		else
			msg += ""
//[/INF]

	var/extra_species_text = species.get_additional_examine_text(src)
	if(extra_species_text)
		msg += "[extra_species_text]<br>"

	msg += "<br>"

	//uniform
	if(w_uniform && !skipjumpsuit)
//ORIG		msg += "[T.He] [T.is] wearing [w_uniform.get_examine_line()].\n"
//[INF]
		switch(T.key)
			if(MALE, PLURAL)
				msg += "Одет в [w_uniform.get_examine_line()].\n"
			if(FEMALE)
				msg += "Одета в [w_uniform.get_examine_line()].\n"
			else
				msg += "Одето в [w_uniform.get_examine_line()].\n"
//[/INF]
	//head
	if(head)
		msg += "Носит [head.get_examine_line()] на голове.\n"

	//suit/armour
	if(wear_suit)
		msg += "Носит [wear_suit.get_examine_line()].\n"
		//suit/armour storage
		if(s_store && !skipsuitstorage)
			msg += "На нём закреплен [s_store.get_examine_line()].\n"

	//back
	if(back)
		msg += "Носит [back.get_examine_line()] на спине.\n"

	//left hand
	if(l_hand)
		msg += "Держит [l_hand.get_examine_line()] в левой руке.\n"

	//right hand
	if(r_hand)
		msg += "Держит [r_hand.get_examine_line()] в правой руке.\n"

	//gloves
	if(gloves && !skipgloves)
		msg += "Носит [gloves.get_examine_line()] на руках.\n"
	else if(blood_DNA)
		msg += "<span class='warning'>Руки перепачканы в [(hand_blood_color != SYNTH_BLOOD_COLOUR) ? "крови" : "масле"]!</span>\n"

	//belt
	if(belt)
		msg += "Носит [belt.get_examine_line()] на поясе.\n"

	//shoes
	if(shoes && !skipshoes)
//ORIG		msg += "[T.He] [T.is] wearing [shoes.get_examine_line()] on [T.his] feet.\n"
//[INF]
		switch(T.key)
			if(MALE, PLURAL)
				msg += "Обут в [shoes.get_examine_line()].\n"
			if(FEMALE)
				msg += "Обута в [shoes.get_examine_line()].\n"
			else
				msg += "Обуто в [shoes.get_examine_line()].\n"
//[/INF]
	else if(feet_blood_DNA)
		msg += "<span class='warning'>Ноги перепачканы в [(feet_blood_color != SYNTH_BLOOD_COLOUR) ? "крови" : "масле"]!</span>\n"

	//mask
	if(wear_mask && !skipmask)
//ORIG		msg += "[T.He] [T.has] [wear_mask.get_examine_line()] on [T.his] face.\n"
//[INF]
		if(istype(wear_mask, /obj/item/clothing/mask/smokable))
			var/obj/item/clothing/mask/smokable/C = wear_mask
			if(C.lit)
				msg += "Курит [wear_mask.get_examine_line()].\n"
			else
				msg += "Держит [wear_mask.get_examine_line()] в зубах.\n"
		else if(istype(wear_mask, /obj/item/clothing/mask/chewable/candy/lolli))
			msg += "Сосёт [wear_mask.get_examine_line()].\n"
		else if(istype(wear_mask, /obj/item/clothing/mask/chewable))
			msg += "Жует [wear_mask.get_examine_line()].\n"
		else
			msg += "Носит [wear_mask.get_examine_line()] на лице.\n"
//[/INF]
	//eyes
	if(glasses && !skipeyes)
		msg += "Носит [glasses.get_examine_line()], прикрывающие глаза.\n"

	//left ear
	if(l_ear && !skipears)
		msg += "Носит [l_ear.get_examine_line()] за левым ухом.\n"

	//right ear
	if(r_ear && !skipears)
		msg += "Носит [r_ear.get_examine_line()] за правым ухом.\n"

	//ID
	if(wear_id)
		msg += "Носит [wear_id.get_examine_line()] на груди.\n"

	//handcuffed?
	if(handcuffed)
		if(istype(handcuffed, /obj/item/weapon/handcuffs/cable))
			msg += "<span class='warning'>Руки \icon[handcuffed] связаны!</span>\n"
		else
			msg += "<span class='warning'>Руки \icon[handcuffed] закованы в наручники!</span>\n"

	//buckled
	if(buckled)
//ORIG		msg += "<span class='warning'>[T.He] [T.is] \icon[buckled] buckled to [buckled]!</span>\n"
//[INF]
		if(buckled.buckle_lying)
			msg += "Лежит на \icon[buckled] [buckled].\n"
		else
			msg += "Сидит на \icon[buckled] [buckled].\n"
//[/INF]
	//Jitters
	if(is_jittery)
		if(jitteriness >= 300)
			msg += "<span class='warning'><B>Бьется в конвульсиях!</B></span>\n"
		else if(jitteriness >= 200)
			msg += "<span class='warning'>Сильно дергается.</span>\n"
		else if(jitteriness >= 100)
			msg += "<span class='warning'>Слегка поддрагивает.</span>\n"

	//Disfigured face
	if(!skipface) //Disfigurement only matters for the head currently.
		var/obj/item/organ/external/head/E = get_organ(BP_HEAD)
		if(E && (E.status & ORGAN_DISFIGURED)) //Check to see if we even have a head and if the head's disfigured.
			if(E.species) //Check to make sure we have a species
				msg += E.species.disfigure_msg(src)
			else //Just in case they lack a species for whatever reason.
				msg += "<span class='warning'>Лицо обезображено до неузнаваемости!</span>\n"

	//splints
	for(var/organ in list(BP_L_LEG, BP_R_LEG, BP_L_ARM, BP_R_ARM))
		var/obj/item/organ/external/o = get_organ(organ)
		if(o && o.splinted && o.splinted.loc == o)
			msg += "<span class='warning'>[o.name] удерживается \icon[o.splinted] шиной!</span>\n"

	if(mSmallsize in mutations)
		msg += "Стал очень маленьким!\n"

	if (src.stat)
		msg += "<span class='warning'>Не обращает внимания на происходящее... И кажется, без сознания.</span>\n"
		if((stat == DEAD || /*INF*/status_flags & FAKEDEATH ||/*/INF*/ is_asystole() || src.losebreath) && distance <= 3)
			msg += "<span class='warning'>Не дышит!</span>\n"
		if(ishuman(user) && !user.incapacitated() && Adjacent(user))
			spawn(0)
				user.visible_message("<b>[user]</b> проверяет пульс \the [src].", "Вы проверяете пульс \the [src]'s.")
				if(do_after(user, 15, src))
					if(pulse() == PULSE_NONE)
						to_chat(user, "<span class='deadsay'>У \the [src] нет пульса.</span>")
					else
						to_chat(user, "<span class='deadsay'>У \the [src] есть пульс!</span>")

	if(fire_stacks)
		msg += "В чём-то горючем.\n"
	if(on_fire)
		msg += "<span class='danger'>ГОРИТ!</span>\n"

	var/ssd_msg = species.get_ssd(src)
	if(ssd_msg && (!should_have_organ(BP_BRAIN) || has_brain()) && stat != DEAD \
	&& !(status_flags & FAKEDEATH)) //INF
		if(!key)
			msg += "<span class='deadsay'>[ssd_msg] и не похоже, что скоро очнётся.</span>\n"
		else if(!client)
			msg += "<span class='deadsay'>[ssd_msg].</span>\n"

	var/obj/item/organ/external/head/H = organs_by_name[BP_HEAD]
	if(istype(H) && H.forehead_graffiti && H.graffiti_style)
		if(user != src || mirror) //INF
			msg += "<span class='notice'>На лбу написано \"[H.forehead_graffiti]\"!</span>\n"

	if(became_younger)
		msg += "Выглядит куда моложе, чем Вы помните.\n"
	if(became_older)
		msg += "Выглядит куда старее, чем Вы помните.\n"

	var/list/wound_flavor_text = list()
	var/applying_pressure = ""
	var/list/shown_objects = list()
	var/list/hidden_bleeders = list()

	for(var/organ_tag in species.has_limbs)

		var/list/organ_data = species.has_limbs[organ_tag]
		var/organ_descriptor = organ_data["descriptor"]
		var/obj/item/organ/external/E = organs_by_name[organ_tag]

		if(!E)
			wound_flavor_text[organ_descriptor] = "<b>[organ_descriptor] отсутсвует.</b>\n"
			continue

		wound_flavor_text[E.name] = ""

		if(E.applied_pressure == src)
			applying_pressure = "<span class='info'>Придавливает рукой свою [E.name].</span><br>"

		var/obj/item/clothing/hidden
		var/list/clothing_items = list(head, wear_mask, wear_suit, w_uniform, gloves, shoes)
		for(var/obj/item/clothing/C in clothing_items)
			if(istype(C) && (C.body_parts_covered & E.body_part))
				hidden = C
				break

		if(hidden && user != src)
			if(E.status & ORGAN_BLEEDING && !(hidden.item_flags & ITEM_FLAG_THICKMATERIAL)) //not through a spacesuit
				if(!hidden_bleeders[hidden])
					hidden_bleeders[hidden] = list()
				hidden_bleeders[hidden] += E.name
		else
			if(E.is_stump())
				wound_flavor_text[E.name] += "<b>Там, где должен быть [organ_descriptor], лишь обрубок...</b>\n"
				if(LAZYLEN(E.wounds) && E.parent)
					wound_flavor_text[E.name] += "На [E.parent.name] видно [E.get_wounds_desc()].<br>"
			else
				if(!is_synth && BP_IS_ROBOTIC(E) && (E.parent && !BP_IS_ROBOTIC(E.parent) && !BP_IS_ASSISTED(E.parent)))
					wound_flavor_text[E.name] = "На [E.name].\n"
				var/wounddesc = E.get_wounds_desc()
				if(wounddesc != "nothing")
					wound_flavor_text[E.name] += "[wounddesc].<br>"
		if(!hidden || distance <=1)
			if(E.dislocated > 0)
				wound_flavor_text[E.name] += "[E.joint] вывихнута!<br>"
			if(((E.status & ORGAN_BROKEN) && E.brute_dam > E.min_broken_damage) || (E.status & ORGAN_MUTATED))
				wound_flavor_text[E.name] += "[E.name] опухла и сильно помята!<br>"

		for(var/datum/wound/wound in E.wounds)
			var/list/embedlist = wound.embedded_objects
			if(LAZYLEN(embedlist))
				shown_objects += embedlist
				var/parsedembed[0]
				for(var/obj/embedded in embedlist)
					if(!parsedembed.len || (!parsedembed.Find(embedded.name) && !parsedembed.Find("несколько [embedded.name]")))
						parsedembed.Add(embedded.name)
					else if(!parsedembed.Find("несколько [embedded.name]"))
						parsedembed.Remove(embedded.name)
						parsedembed.Add("несколько "+embedded.name)
				wound_flavor_text["[E.name]"] += "Из [wound.desc] на [E.name] торчит [english_list(parsedembed, and_text = " and \a ", comma_text = ", \a ")]!<br>"
	for(var/hidden in hidden_bleeders)
		wound_flavor_text[hidden] = "Из-под [hidden] сочится кровь  у [english_list(hidden_bleeders[hidden])]!<br>"

	msg += "<span class='warning'>"
	for(var/limb in wound_flavor_text)
		msg += wound_flavor_text[limb]
	msg += "</span>"

	for(var/obj/implant in get_visible_implants(0))
		if(implant in shown_objects)
			continue
		msg += "<span class='danger'>Из [src] торчит \a [implant.name]!</span>\n"
	if(digitalcamo)
		msg += "Крайне неестественно двигается! Тело изгибается так, как будто вот-вот переломается...\n"

	if(hasHUD(user, HUD_SECURITY))
		var/perpname = "wot"
		var/criminal = "None"

		var/obj/item/weapon/card/id/id = GetIdCard()
		if(istype(id))
			perpname = id.registered_name
		else
			perpname = src.name

		if(perpname)
			var/datum/computer_file/report/crew_record/R = get_crewmember_record(perpname)
			if(R)
				criminal = R.get_criminalStatus()

			msg += "<span class = 'deptradio'>Статус преступника:</span> <a href='?src=\ref[src];criminal=1'>\[[criminal]\]</a>\n"
			msg += "<span class = 'deptradio'>Охранные записи:</span> <a href='?src=\ref[src];secrecord=`'>\[Просмотреть\]</a>\n"

	if(hasHUD(user, HUD_MEDICAL))
		var/perpname = "wot"
		var/medical = "None"

		var/obj/item/weapon/card/id/id = GetIdCard()
		if(istype(id))
			perpname = id.registered_name
		else
			perpname = src.name

		var/datum/computer_file/report/crew_record/R = get_crewmember_record(perpname)
		if(R)
			medical = R.get_status()

		msg += "<span class = 'deptradio'>Физический статус:</span> <a href='?src=\ref[src];medical=1'>\[[medical]\]</a>\n"
		msg += "<span class = 'deptradio'>Медицинские записи:</span> <a href='?src=\ref[src];medrecord=`'>\[Просмтреть\]</a>\n"


	if(print_flavor_text()) msg += "[print_flavor_text()]\n"

	if(isghost(user) && (public_record || med_record || sec_record || gen_record))
		msg += "<span class = 'deptradio'>База данных:</span> <a href='?src=\ref[src];check_records=1'>\[Просмотреть\]</a>\n"

	if(ooc_notes && !skipface)
		msg += "<span class = 'deptradio'>OOC Заметки:</span> <a href='?src=\ref[src];ooc_notes=1'>\[Просмотреть\]</a>\n"

	if(mind && user.mind && name == real_name)
		var/list/relations = matchmaker.get_relationships_between(user.mind, mind, TRUE)
		if(length(relations))
			msg += "<br><span class='notice'>Вы знакомы. <a href='byond://?src=\ref[src];show_relations=1'>Больше...</a></span><br>"

	msg += "*---------*</span><br>"
	msg += applying_pressure

	if (pose)
		if( findtext(pose,".",length(pose)) == 0 && findtext(pose,"!",length(pose)) == 0 && findtext(pose,"?",length(pose)) == 0 )
			pose = addtext(pose,".") //Makes sure all emotes end with a period.
//[INF]
		switch(gender)
			if(MALE)  msg += "Он [pose]\n"
			if(FEMALE)msg += "Она [pose]\n"
			else      msg += "Оно [pose]\n"

	if(user.mind.changeling)
		if(user == src)
			msg += SPAN_LING("Высшая форма жизни.\n")
		else if(isSynthetic())
			msg += SPAN_LING("Мы не можем извлекать геном из синтетиков!\n")
		else if(MUTATION_HUSK in mutations)
			msg += SPAN_LING("Геном этого существа слишком поврежден!\n")
		else if(species.species_flags & SPECIES_FLAG_NO_SCAN)
			msg += SPAN_LING("Мы не знаем, как усвоить геном этого существа!\n")
		else if(stat == DEAD && world.time - timeofdeath > 5 MINUTES)
			msg += SPAN_LING("Этот труп мертв больше 5 минут и не содержит усваиваемого генома.\n")
		else if(islesserform(src))
			msg += SPAN_LING("Это существо не даст нам новых геномов, но может помочь нам восстановиться после стазиса...\n")
		else if(good_DNA || player_is_antag(mind))
			msg += SPAN_LING("<i>Геном этого существо может быть полезным для нас...</i>\n")
		else
			msg += SPAN_LING("Геном этого существа <b>бесполезен</b> - мы ничего не получим.\n")
//[/INF]
/*[ORIG]
		if(gender == MALE)
			msg += "Он [pose]\n"
		else if(gender == FEMALE)
			msg += "Она [pose]\n"
		else
			msg += "Оно [pose]\n"
[/ORIG]*/
	var/show_descs = show_descriptors_to(user, T)
	if(show_descs)
		msg += "<span class='notice'>[jointext(show_descs, "<br>")]</span>"
	to_chat(user, jointext(msg, null))

//Helper procedure. Called by /mob/living/carbon/human/examine() and /mob/living/carbon/human/Topic() to determine HUD access to security and medical records.
/proc/hasHUD(mob/M as mob, hudtype)
	if(istype(M, /mob/living/carbon/human))
		var/mob/living/carbon/human/H = M
		var/obj/item/clothing/glasses/G = H.glasses
		return istype(G) && ((G.hud_type & hudtype) || (G.hud && (G.hud.hud_type & hudtype)))
	else if(istype(M, /mob/living/silicon/robot))
		var/mob/living/silicon/robot/R = M
		for(var/obj/item/borg/sight/sight in list(R.module_state_1, R.module_state_2, R.module_state_3))
			if(istype(sight) && (sight.hud_type & hudtype))
				return TRUE
	return FALSE

/mob/living/carbon/human/verb/pose()
	set name = "Set Pose"
	set desc = "Sets a description which will be shown when someone examines you."
	set category = "IC"

	pose =  sanitize(input(usr, "This is [src]. [get_visible_gender() == MALE ? "He" : get_visible_gender() == FEMALE ? "She" : "They"]...", "Pose", null)  as text)

/mob/living/carbon/human/verb/set_flavor()
	set name = "Set Flavour Text"
	set desc = "Sets an extended description of your character's features."
	set category = "IC"

	var/list/HTML = list()
	HTML += "<meta charset=\"UTF-8\"><body>"
	HTML += "<tt><center>"
	HTML += "<b>Update Flavour Text</b> <hr />"
	HTML += "<br></center>"
	HTML += "<a href='byond://?src=\ref[src];flavor_change=general'>General:</a> "
	HTML += TextPreview(flavor_texts["general"])
	HTML += "<br>"
	HTML += "<a href='byond://?src=\ref[src];flavor_change=head'>Head:</a> "
	HTML += TextPreview(flavor_texts["head"])
	HTML += "<br>"
	HTML += "<a href='byond://?src=\ref[src];flavor_change=face'>Face:</a> "
	HTML += TextPreview(flavor_texts["face"])
	HTML += "<br>"
	HTML += "<a href='byond://?src=\ref[src];flavor_change=eyes'>Eyes:</a> "
	HTML += TextPreview(flavor_texts["eyes"])
	HTML += "<br>"
	HTML += "<a href='byond://?src=\ref[src];flavor_change=torso'>Body:</a> "
	HTML += TextPreview(flavor_texts["torso"])
	HTML += "<br>"
	HTML += "<a href='byond://?src=\ref[src];flavor_change=arms'>Arms:</a> "
	HTML += TextPreview(flavor_texts["arms"])
	HTML += "<br>"
	HTML += "<a href='byond://?src=\ref[src];flavor_change=hands'>Hands:</a> "
	HTML += TextPreview(flavor_texts["hands"])
	HTML += "<br>"
	HTML += "<a href='byond://?src=\ref[src];flavor_change=legs'>Legs:</a> "
	HTML += TextPreview(flavor_texts["legs"])
	HTML += "<br>"
	HTML += "<a href='byond://?src=\ref[src];flavor_change=feet'>Feet:</a> "
	HTML += TextPreview(flavor_texts["feet"])
	HTML += "<br>"
	HTML += "<hr />"
	HTML +="<a href='?src=\ref[src];flavor_change=done'>\[Done\]</a>"
	HTML += "<tt>"
	show_browser(src, jointext(HTML,null), "window=flavor_changes;size=430x300")
