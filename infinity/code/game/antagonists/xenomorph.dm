GLOBAL_DATUM_INIT(xenomorphs, /datum/antagonist/xenos, new)

/datum/antagonist/xenos
	id = MODE_XENOMORPH
	role_text = "Xenophage"
	role_text_plural = "Xenophages"
	flags = ANTAG_OVERRIDE_MOB | ANTAG_RANDSPAWN | ANTAG_OVERRIDE_JOB
	mob_path = /mob/living/carbon/alien/larva
	welcome_text = "<span class='changeling'><b>ВСТУПЛЕНИЕ</b>:<br>\
	Вы - 'неизвестная форма жизни', как думает Экипаж. Чтобы общаться со своими <b>СЕСТРАМИ</b> \
	как через рацию, используйте префикс ',a' (с английской буквой).<br>\
	Проявите уважение к остальным игрокам и не используйте интернет-сленг и мемы.<br>\
	Вы не быстрее людей. Загоняйте их в угол и на траву, чтобы обездвижить или убить.<br>\
	Избегайте групп - сородичь может погибнуть от 7~ попаданий лазером или 9 пуль, не считая личинок.<br>\
	Исполняйте приказы Королевы.<br>\
	<b>ЛИЧИНКАМ</b>:<br>\
	Для всех личинок, кроме самой первой, для роста требуется пить кровь людей (или приматов).<br>\
	Ищите трупы (или спящих) в отсеках через вентиляцию или ждите в Улье рядом с Королевой, \
	пока кто-нибудь не притащит еду.<br>\
	После нажатия на <i>Moult</i> вам будет выведен список доступных каст для эволюции с описанием.<br>\
	<b>ВЗРОСЛЫМ</b>:<br>\
	Добывайте еду - живые люди и приматы подходят лучше всего.<br>\
	Защищайте Королеву и Улей.<br>\
	Не убивайте людей, рядом с которыми есть пометка о том, что они с вами. Вы узнаете их.<br>\
	Вы можете приказывать им.<br>\
	Вы регенирируете сами по себе, но очень медленно. Если лечь на траву, то процесс ускорится в несколько раз.<br>\
	<b>НЕ ИСПОЛЬЗУЙТЕ ОБОРУДОВАНИЕ И ОРУЖИЕ ЛЮДЕЙ. ЭТО НАКАЗУЕМО АДМИНИСТРАЦИЕЙ</b>.<br>\
	<b>КОРОЛЕВЕ</b>:<br>\
	Из яиц появляются личинки - если на них, конечно, нажмет игрок в обсерве. Для роста \
	им нужна кровь.<br>\
	Способность <i>Infest</i> сделает человека рабом вашего Улья. Спросите их согласие в LOOC перед обращением.<br>\
	<b>Приятной игры!</b></span>"
	antaghud_indicator = "hudalien"
	antag_indicator = "hudalien"
	faction_role_text = "Xenophage Thrall"
	faction_descriptor = "Hive"
	faction_welcome = "<span class='changeling'>Ваша свобода воли была выброшена за борт сразу после того, как ваш разум стал частью Улья. \
	Теперь, вы подчиняетесь Улью, и в особенности его Королеве, как послушный раб  подчиняется \
	своему хозяину. \
	Исполняйте указания бесприкословно. Служите своему новому дому.</span>"
	faction = "xenophage"
	faction_indicator = "hudalien"
	skill_setter = /datum/antag_skill_setter/alien

	hard_cap = 5
	hard_cap_round = 8
	initial_spawn_req = 4
	initial_spawn_target = 6

	spawn_announcement_title = "Lifesign Alert"
	spawn_announcement_delay = 5000

/datum/antagonist/xenos/Initialize()
//	spawn_announcement = replacetext(GLOB.using_map.unidentified_lifesigns_message, "%STATION_NAME%", station_name())
	spawn_announcement = GLOB.using_map.level_x_biohazard_announcement(9)
	..()

/datum/antagonist/xenos/attempt_random_spawn()
	..()

/*
/datum/antagonist/xenos/create_objectives(var/datum/mind/player)
	if(!..())
		return
	player.objectives += new /datum/objective/survive()
*/

/datum/antagonist/xenos/create_global_objectives()
	if(!..())
		return
	global_objectives |= new /datum/objective/survive
	return 1
