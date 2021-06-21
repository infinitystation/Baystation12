/obj/item/storage/briefcase/psi
	name = "\improper Foundation briefcase"
	desc = "A handsome black leather briefcase embossed with a stylized radio telescope."
	icon_state = "fbriefcase"
	item_state = "fbriefcase"
	var/targetckey
	var/silenced = FALSE
	var/used = TRUE
	var/freq
	var/code
	var/list/psi_ranks = list()
	trade_blacklisted = TRUE
	startswith = list(
		/obj/item/implantcase/explosive,
		/obj/item/implantcase/tracking,
		/obj/item/implanter/psi,
		/obj/item/implanter,
		/obj/item/implantpad,
		/obj/item/reagent_containers/pill/b_pvp = 2,
		/obj/item/paper/psi_briefcase
		)

/obj/item/storage/briefcase/psi/paramount
	psi_ranks = list(PSI_REDACTION = 5, PSI_COERCION = 5, PSI_PSYCHOKINESIS = 5, PSI_ENERGISTICS = 5)

// Ты не можешь посмотреть что внутри, не взяв его в руки.
/obj/item/storage/briefcase/psi/open(mob/user as mob)
	if(used)
		return ..(user)
	else
		if(isliving(user) && !user.contains(src) && user.put_in_hands(src))
			to_chat(user, SPAN_WARNING("Едва ты притрагиваешься к застежкам [src], как он внезапно прыгает к тебе в руки!"))
		else if(isobserver(user) || user.contains(src))
			return ..(user)
		else
			to_chat(user, SPAN_NOTICE("Тебе не удалось открыть [src]. Похоже тебе все таки придется использовать руки."))

/obj/item/storage/briefcase/psi/inherit_custom_item_data(var/datum/custom_item/citem)
	. = ..()
	slot_flags |= SLOT_POCKET
	if(citem.ckey)
		targetckey = citem.ckey
	if(citem.additional_data["psi_ranks"])
		psi_ranks = citem.additional_data["psi_ranks"]
	if(citem.additional_data["freq"])
		freq = citem.additional_data["freq"]
	if(citem.additional_data["code"])
		code = citem.additional_data["code"]

	for(var/obj/item/paper/psi_briefcase/P in contents)
		addtimer(CALLBACK(P, /obj/item/paper/psi_briefcase/proc/set_info, src), 0, TIMER_UNIQUE)
	used = FALSE
	silenced = TRUE

/obj/item/paper/psi_briefcase
	var/user = "\[ДАННЫЕ УДАЛЕНЫ\]"
	var/freqcode
	var/rank = "\[ДАННЫЕ УДАЛЕНЫ\]"
	var/schools = ""
	var/job = "\[ДАННЫЕ УДАЛЕНЫ\]"
	var/obj/item/storage/briefcase/psi/brief
	var/textform = @"[br][center]<img src = foundlogo.png>[/center][br][center][large][b]Разрешение на работу сотрудника Фонда Кучулейн[/b][/large][/center][br][hr][br][br][br][list][br][*][b]Полное имя сотрудника:[/b] %USER%[br][br][*][b]Псионический ранг:[/b] %RANK%[br][br][*][b]Псионические способности:[/b] %SCHOOL%[br][br][*][b]Способы котроля:[/b] Имплант отслеживания. Имплант пси-контроля. Взрывной имплант '[i][u]Для активации: частота %CODE%[/u][/i]' [br][small][b][u]Использовать только в случае крайней необходимости или с разрешения агентов Фонда[/u][/b][/small][br][br][/list][br][hr][br][list][br][br][*][b]Текущая должность:[/b] %JOB%[br][br][*][b]Разрешенное оборудование:[/b] Импланты: отслеживания, взрыва, пси-контроля. Оборудование для работы с имплантами. B-PVP.[br][br][*][b]Расширение разрешенных процедур:[/b] Развитие псионических способностей у перспективных кандидатов.[br][br][*][b]Дата составления:[/b] 2309.01.24[br][br][*][b]Срок действия:[/b] 2310.01.23[br][hr][br][br][br][/list][br][br][br][br][u]Место для печатей:[/u]"
	icon = 'icons/obj/card.dmi'
	icon_state = "warrantcard"

/obj/item/paper/psi_briefcase/show_content(mob/user, forceshow, editable)
	if(brief)
		set_info(brief)
	. = ..(user, forceshow, editable)

/obj/item/paper/psi_briefcase/on_update_icon()
	return

/obj/item/paper/psi_briefcase/New(var/obj/item/storage/briefcase/psi/case)
	. = ..()
	brief = case
	preStampPaper(/obj/item/stamp/boss)

/obj/item/paper/psi_briefcase/proc/set_info(var/obj/item/storage/briefcase/psi/case)
	if(!istype(case))
		return
	freqcode = "[format_frequency(case.freq)] код [case.code]"
	if(case.targetckey)
		var/mob/living/H = get_mob_by_key(case.targetckey)
		if(H)
			var/datum/psi_complexus/psionicus = H.psi
			switch(psionicus.rating)
				if(1)	rank = "1-Эпсилон"
				if(2)	rank = "2-Гамма"
				if(3)	rank = "3-Дельта"
				if(4)	rank = "4-Бета"
				if(5)	rank = "5-Альфа"
			for(var/psi in psionicus.ranks)
				var/psiru = "Тайн"
				var/psirank = "Неизвестный"
				switch(psi)
					if(PSI_REDACTION)		psiru = "Восстановления"
					if(PSI_COERCION)		psiru = "Принуждения"
					if(PSI_PSYCHOKINESIS)	psiru = "Психокинетики"
					if(PSI_ENERGISTICS)		psiru = "Энергий"
				switch(psionicus.ranks[psi])
					if(PSI_RANK_LATENT)			psirank = "Склонность"
					if(PSI_RANK_OPERANT)		psirank = "Оператор"
					if(PSI_RANK_MASTER)			psirank = "Мастер"
					if(PSI_RANK_GRANDMASTER)	psirank = "Грандмастер"
					if(PSI_RANK_PARAMOUNT)		psirank = "Внеуровневый"
				schools += "[psirank] школы [psiru]; "
			var/datum/job/myjob = H.mind.assigned_job
			H.mind.StoreMemory("Бум-имплант в моей голове от ребят из Кучулейна: [freqcode]")
			if(myjob)
				job = myjob.get_alt_title_for(H.client)
			user = H.name
	else
		for(var/psi in case.psi_ranks)
			var/psiru = "Тайн"
			switch(psi)
				if(PSI_REDACTION)		psiru = "Восстановления"
				if(PSI_COERCION)		psiru = "Принуждения"
				if(PSI_PSYCHOKINESIS)	psiru = "Психокинетики"
				if(PSI_ENERGISTICS)		psiru = "Энергий"
			schools += "Адепт школы [psiru]; "
	textform = replacetext(textform, "%JOB%", job)
	textform = replacetext(textform, "%CODE%", freqcode)
	textform = replacetext(textform, "%SCHOOL%", schools)
	textform = replacetext(textform, "%RANK%", rank)
	textform = replacetext(textform, "%USER%", user)
	set_content(textform, "Foundation License")
	brief = null

/obj/item/storage/briefcase/psi/New()
	if(freq)
		var/check = sanitize_frequency(freq, RADIO_LOW_FREQ, RADIO_HIGH_FREQ)
		if(freq != check)
			message_staff("Incorrect freq in psi briefcase [src.x] [src.y] [src.z]. Was [freq] setting to [check]")
			freq = check
	else
		freq = sanitize_frequency(rand(RADIO_LOW_FREQ, RADIO_HIGH_FREQ), RADIO_LOW_FREQ, RADIO_HIGH_FREQ)
	if(code)
		var/check = Clamp(code,1,100)
		if(code != check)
			message_staff("Incorrect code in psi briefcase [src.x] [src.y] [src.z]. Was [code] setting to [check]")
			code = check
	else
		code = rand(1, 100)
	. = ..()

/obj/item/storage/briefcase/psi/disrupts_psionics()
	return FALSE

/obj/item/storage/briefcase/psi/examine(var/mob/living/user, distance)
	. = ..()
	if(!used)
		if(user.psi)
			to_chat(user, SPAN_NOTICE("Мощное псионическое поле окутывает телескоп, изображенный на [src]."))
		else
			to_chat(user, SPAN_NOTICE("Чем больше ты вглядываешься в чемодан, тем больше он вглядывается в тебя. Глупо, да?"))
	else if(used && user.psi)
		to_chat(user, SPAN_NOTICE("[src] окутывает остаточная пси-энергия. Что бы там не было раньше, теперь это просто чемодан."))

/obj/item/storage/briefcase/psi/equipped(var/mob/living/carbon/human/user, var/slot)
	if(!used && psi_ranks.len && istype(user))
		if(!(slot == slot_l_hand || slot == slot_r_hand || slot == slot_l_store || slot == slot_r_store))
			return ..(user, slot)
		if(!silenced)
			if(user.psi)
				to_chat(user, SPAN_NOTICE("Линза телескопа сканирует твою ауру..."))
			else
				to_chat(user, SPAN_NOTICE("Ты чуствуешь оценивающий взгляд со стороны линзы..."))
		if(targetckey && (ckey(targetckey) != user.ckey))
			if(!silenced)
				if(user.psi)
					to_chat(user, SPAN_NOTICE("Видимо это предназначено не для тебя."))
				else
					to_chat(user, SPAN_NOTICE("Похоже ты разочаровываешь даже камень!"))
		else
			if(!silenced)	user.visible_message(SPAN_WARNING("Камень из узора на [src] взрывается и его осколки впиваются в тело [user]!"), user.psi ? SPAN_WARNING("Увидев твою ауру, устройство пробудилось, сейчас что то будет...") : SPAN_WARNING("Камень ярко вспыхивает! Ты ему по нраву!"))
			used = TRUE
			var/obj/item/implant/psi_control/imp = new
			imp.psi_mode = PSI_IMPLANT_LOG
			imp.implanted(user)
			imp.forceMove(user)
			imp.imp_in = user
			imp.implanted = TRUE
			var/obj/item/implant/tracking/trackImp = new
			trackImp.id = rand(1, 100)
			trackImp.implanted(user)
			trackImp.forceMove(user)
			trackImp.imp_in = user
			trackImp.implanted = TRUE
			var/obj/item/implant/explosive/boomImp = new
			boomImp.elevel = "Localized Limb"
			boomImp.forceMove(user)
			boomImp.imp_in = user
			boomImp.implanted = TRUE
			boomImp.set_frequency(freq)
			boomImp.code = code
			boomImp.warning_message = "Несанкционированый доступ к голове <b>[user]</b>! Псионик скомпроментирован!"
			var/obj/item/organ/external/affected = user.get_organ(BP_HEAD)
			if(affected)
				affected.implants += imp
				imp.part = affected
				affected.implants += trackImp
				trackImp.part = affected
				affected.implants += boomImp
				boomImp.part = affected
			for(var/psi in psi_ranks)
				user.set_psi_rank(psi, psi_ranks[psi], defer_update = TRUE)
			user.psi.update(TRUE)
//			if(!silenced)	// Пафос вреден для кода. Лахеш, пора исправлять ~bear1ake
//				user.visible_message(SPAN_OCCULT("[user] вспыхивает ярким светом, и слегка приподнимается в воздух!"), SPAN_OCCULT("Ты чувствуешь как в тебе просыпаются новые силы!"))
//				var/turf/T = get_turf(user)
//				var/obj/effect/party_light/psi_briefcase/L = new /obj/effect/party_light/psi_briefcase(T)
//				var/datum/psi_complexus/psi = user.psi
//				var/image/aura = create_aura_image(L)
//				aura.pixel_x = -32
//				L.aura = aura
//				for(var/mob/player in GLOB.player_list)
//					player.client.images += aura
//				var/matrix/M = matrix()
//				M.Scale(3,3)
//				L.psi_owner = user
//				GLOB.moved_event.register(user, L, /obj/effect/party_light/psi_briefcase/proc/moving)
//				addtimer(CALLBACK(L, /obj/effect/party_light/psi_briefcase/proc/end), 3 SECONDS, TIMER_UNIQUE)
//				animate(aura, alpha = 100, transform = M, color = psi.aura_color, time = 30)
//				M = matrix()
//				M.Scale(4,4)
//				sleep(10)
//				animate(aura, transform = M, time = 15)
//				M = matrix()
//				M.Scale(5,5)
//				sleep(10)
//				animate(aura, alpha = 0, transform = M, time = 5)
	if(slot_flags & SLOT_POCKET)
		slot_flags &= ~SLOT_POCKET
	..(user, slot)

/obj/effect/party_light/psi_briefcase
	var/mob/living/psi_owner
	var/image/aura

/obj/effect/party_light/psi_briefcase/proc/end()
	overlays.Cut()
	destroy_aura_image(aura)
	for(var/mob/player in GLOB.player_list)
		player.client.images -= aura
	psi_owner.visible_message(SPAN_OCCULT("[psi_owner] плавно опускается вниз, а яркий свет пропадает так же внезапно, как и появился. Что это было?"), SPAN_OCCULT("Вместе с новыми силами пришли и новые ограничения. Ты чуствуешь, что неправомерное использование силы непременно будет наказано. Летально."))
	GLOB.moved_event.unregister(psi_owner, src, /obj/effect/party_light/psi_briefcase/proc/moving)
	qdel(src)

/obj/effect/party_light/psi_briefcase/proc/moving(var/mob/who)
	var/turf/T = get_turf(who)
	forceMove(T)

// M A X I M U M C H E E S E | Oh shit i'm sorry ~Nyacroz

GLOBAL_LIST_INIT(dose_messages, list(
	"Твое имя оглашено. Твое время пришло.",
	"Ты таешь. Твои руки сделаны из воска...",
	"Все происходит одновременно. Все перемешалось.",
	"Конец. Все кончено. Ты закончен. С тобой покончено.",
	"Ты не забудешь. Не забудь. Не забудь.",
	"Свет просачивается по краям твоего зрения...",
	"Что-то скользит и дергается у тебя за пазухой...",
	"Твой кишечник скрутило. Оно ждет внутри.",
	"Твои внутренности полыхают. Ты весь заряжен потенциалом.",
	"Твое сердце трепещит. Оно окрылено и сковано в твоей груди.",
	"Там есть что то ценное, за твоими глазами.",
	"Все заканчивается. Все начинается.",
	"Ничего не заканчивается. Ничего не начинается.",
	"Просыпайся. Молю, просыпайся.",
	"Остановись! Ты вредишь им!",
	"Твое время еще не пришло. Пожалуйста возвращайся.",
	"Мы скучаем по тебе. Где же ты?",
	"Возвращайся оттуда. Пожалуйста."
))

GLOBAL_LIST_INIT(overdose_messages, list(
	"СИГНАЛ СИГНАЛ СИГНАЛ СИГНАЛ СИГНАЛ",
	"ОНО ПЛАЧЕТ ОНО ПЛАЧЕТ ОНО ЖДЕТ ОНО ПЛАЧЕТ",
	"НЕ ТВОЕ НЕ ТВОЕ НЕ ТВОЕ НЕ ТВОЕ НЕ ТВОЕ",
	"ЭТО НЕ ДЛЯ ТЕБЯ",
	"ОНО БЕЖИТ ОНО БЕЖИТ ОНО БЕЖИТ ОНО БЕЖИТ",
	"КРОВЬ КРОВЬ КРОВЬ КРОВЬ КРОВЬ КРОВЬ",
	"СВЕТ ТЬМА ЗВЕЗДА В ЦЕПЯХ"
))

/datum/reagent/b_pvp
	name = "B-PVP"
	taste_description = "жидкий звездный свет"
	description = "Strange Foundation drug."
	reagent_state = LIQUID
	color = "#ccccff"
	metabolism = REM
	overdose = 25

/datum/reagent/b_pvp/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	M.add_client_color(/datum/client_color/thirdeye)
	M.add_chemical_effect(CE_THIRDEYE, 1)
	M.add_chemical_effect(CE_MIND, -2)
	M.hallucination(50, 50)
	M.make_jittery(3)
	M.make_dizzy(3)
	if(prob(0.1) && ishuman(M))
		var/mob/living/carbon/human/H = M
		H.seizure()
		H.adjustBrainLoss(rand(8, 12))
	if(prob(5))
		to_chat(M, SPAN_WARNING("<font size = [rand(1,3)]>[pick(GLOB.dose_messages)]</font>"))

/datum/reagent/b_pvp/on_leaving_metabolism(var/mob/parent, var/metabolism_class)
	parent.remove_client_color(/datum/client_color/thirdeye)

/datum/reagent/b_pvp/overdose(var/mob/living/carbon/M, var/alien)
	..()
	M.adjustBrainLoss(rand(1, 2))
	if(ishuman(M) && prob(10))
		var/mob/living/carbon/human/H = M
		H.seizure()
	if(prob(10))
		to_chat(M, SPAN_DANGER("<font size = [rand(2,4)]>[pick(GLOB.overdose_messages)]</font>"))
	if(M.psi)
		M.psi.check_latency_trigger(80, "a B-PVP overdose", TRUE)

/obj/item/reagent_containers/pill/b_pvp
	name = "B-PVP pill"
	desc = "The surface of this pill crawls against your skin."
	icon_state = "pill2"

/obj/item/reagent_containers/pill/b_pvp/Initialize()
	. = ..()
	reagents.add_reagent(/datum/reagent/b_pvp, 26)
	color = reagents.get_color()

// Aue loh
/obj/item/clothing/head/helmet/facecover/restricting
	name = "restricting helmet"
	desc = "A helmet made of polymer metal. It's completely opaque. This will stop the stare."
	icon = CUSTOM_ITEM_OBJ
	item_icons = list(
		slot_head_str = CUSTOM_ITEM_MOB
	)
	icon_state = "nicroz_helmet"
	item_state = "nicroz_helmet"
	item_flags = ITEM_FLAG_AIRTIGHT|ITEM_FLAG_FLEXIBLEMATERIAL|ITEM_FLAG_THICKMATERIAL
	trade_blacklisted = TRUE
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE
	body_parts_covered = FACE|EYES

/obj/item/clothing/head/helmet/facecover/restricting/equipped(var/mob/user, var/slot)
	..()
	if(slot == slot_head)
		canremove = FALSE
		START_PROCESSING(SSobj, src)

/obj/item/clothing/head/helmet/facecover/restricting/Process()
	if(!istype(loc, /mob/living/carbon/human))
		return

	var/mob/living/carbon/human/H = loc

	if(!H.psi)
		return

	if(H.psi.suppressed)
		tint = TINT_BLIND
		H.remove_client_color(/datum/client_color/thirdeye)
		return

	tint = 0
	H.add_client_color(/datum/client_color/thirdeye)

	if(prob(5))
		to_chat(H, SPAN_WARNING("<font size = [rand(1,3)]>[pick(GLOB.dose_messages)]</font>"))
	else if(prob(1))
		to_chat(H, SPAN_DANGER("<font size = [rand(2,4)]>[pick(GLOB.overdose_messages)]</font>"))

/decl/surgery_step/restricting
	name = "Remove restricting helmet"
	allowed_tools = list(
		/obj/item/weldingtool = 80,
		/obj/item/circular_saw = 60,
		/obj/item/psychic_power/psiblade/master/grand/paramount = 100,
		/obj/item/psychic_power/psiblade = 75,
		/obj/item/gun/energy/plasmacutter = 30
	)
	can_infect = 0
	blood_level = 0
	min_duration = 120
	max_duration = 180
	surgery_candidate_flags = 0

/decl/surgery_step/restricting/assess_bodypart(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	return TRUE

/decl/surgery_step/restricting/get_skill_reqs(mob/living/user, mob/living/carbon/human/target, obj/item/tool)
	return list(SKILL_EVA = SKILL_BASIC)

/decl/surgery_step/restricting/can_use(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	if(!istype(target))
		return FALSE
	if(isWelder(tool))
		var/obj/item/weldingtool/welder = tool
		if(!welder.isOn() || !welder.remove_fuel(1,user))
			return FALSE
	return (target_zone == BP_HEAD) && istype(target.head, /obj/item/clothing/head/helmet/facecover/restricting) && !(target.head.canremove)

/decl/surgery_step/restricting/begin_step(mob/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	user.visible_message("[user] starts cutting through [target.head] with \the [tool]." , \
	"You start cutting through [target.head] with \the [tool].")
	..()

/decl/surgery_step/restricting/end_step(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool)

	var/obj/item/clothing/head/helmet/facecover/restricting = target.head
	if(!istype(restricting))
		return
	restricting.canremove = 1
	user.visible_message("<span class='notice'>[user] has cut through [target]'s [restricting] with \the [tool].</span>", \
		"<span class='notice'>You have cut through of [target]'s [restricting] with \the [tool].</span>")

/decl/surgery_step/restricting/fail_step(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	user.visible_message("<span class='danger'>[user]'s [tool] can't quite seem to get through the metal...</span>", \
	"<span class='danger'>Your [tool] can't quite seem to get through the metal. It's weakening, though - try again.</span>")
