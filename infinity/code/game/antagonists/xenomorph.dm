GLOBAL_DATUM_INIT(xenomorphs, /datum/antagonist/xenos, new)

/datum/antagonist/xenos
	id = MODE_XENOMORPH
	role_text = "Xenophage"
	role_text_plural = "Xenophages"
	flags = ANTAG_OVERRIDE_MOB | ANTAG_RANDSPAWN | ANTAG_OVERRIDE_JOB
	welcome_text = "<span class='changeling'><b>ВСТУПЛЕНИЕ</b>:<br>\
	Вы - 'неизвестна&#255; форма жизни', как думает Экипаж. Чтобы общатьс&#255; со своими <b>СЕСТРАМИ</b> \
	как через рацию, используйте префикс ',a' (с английской буквой).<br>\
	Про&#255;вите уважение к остальным игрокам и не используйте интернет-сленг и мемы.<br>\
	Вы не быстрее людей. Загон&#255;йте их в угол и на траву, чтобы обездвижить или убить.<br>\
	Избегайте групп - сородичь может погибнуть от 7~ попаданий лазером или 9 пуль, не счита&#255; личинок.<br>\
	Исполняйте приказы Королевы.<br>\
	<b>ЛИЧИНКАМ</b>:<br>\
	Дл&#255; всех личинок, кроме самой первой, дл&#255; роста требуетс&#255; пить кровь людей (или приматов).<br>\
	Ищите трупы (или сп&#255;щих) в отсеках через вентил&#255;цию или ждите в Улье р&#255;дом с Королевой, \
	пока кто-нибудь не притащит еду.<br>\
	После нажати&#255; на <i>Moult</i> вам будет выведен список доступных каст дл&#255; эволюции с описанием.<br>\
	<b>ВЗРОСЛЫМ</b>:<br>\
	Добывайте еду - живые люди и приматы подход&#255;т лучше всего.<br>\
	Защищайте Королеву и Улей.<br>\
	Не убивайте людей, р&#255;дом с которыми есть пометка о том, что они с вами. Вы узнаете их.<br>\
	Вы можете приказывать им.<br>\
	Вы регенирируете сами по себе, но очень медленно. Если лечь на траву, то процесс ускоритс&#255; в несколько раз.<br>\
	<b>НЕ ИСПОЛЬЗУЙТЕ ОБОРУДОВАНИЕ И ОРУЖИЕ ЛЮДЕЙ. ЭТО НАКАЗУЕМО АДМИНИСТРАЦИЕЙ</b>.<br>\
	<b>КОРОЛЕВЕ</b>:<br>\
	Из &#255;иц по&#255;вл&#255;ютс&#255; личинки - если на них, конечно, нажмет игрок в обсерве. Дл&#255; роста \
	им нужна кровь.<br>\
	Способность <i>Infest</i> сделает человека рабом вашего Уль&#255;. Спросите их согласие в LOOC перед обращением.<br>\
	<b>При&#255;тной игры!</b></span>"
	antaghud_indicator = "hudalien"
	antag_indicator = "hudalien"
	faction_role_text = "Xenophage Thrall"
	faction_descriptor = "Hive"
	faction_welcome = "<span class='changeling'>Ваша свобода воли была выброшена за борт сразу после того, как ваш разум стал частью Уль&#255;. \
	Теперь, вы подчин&#255;етесь Улью, и в особенности его Королеве, как послушный раб  подчин&#255;етс&#255; \
	своему хоз&#255;ину. \
	Исполн&#255;йте указани&#255; бесприкословно. Служите своему новому дому.</span>"
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
	if(config.aliens_allowed) ..()

/datum/antagonist/xenos/proc/get_vents()
	var/list/vents = list()
	for(var/obj/machinery/atmospherics/unary/vent_pump/temp_vent in SSmachines.machinery)
		if(!temp_vent.welded && temp_vent.network && (temp_vent.loc.z in GLOB.using_map.station_levels))
			if(temp_vent.network.normal_members.len > 50)
				vents += temp_vent
	return vents

/datum/antagonist/xenos/create_objectives(var/datum/mind/player)
	if(!..())
		return
	player.objectives += new /datum/objective/survive()

/datum/antagonist/xenos/place_mob(var/mob/living/player)
	player.forceMove(get_turf(pick(get_vents())))
