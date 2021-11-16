GLOBAL_DATUM_INIT(ert, /datum/antagonist/ert, new)

/datum/antagonist/ert
	id = MODE_ERT
	role_text = "Emergency Responder"
	role_text_plural = "Emergency Responders"
	antag_text = "Вы <b>анти</b>-антагонист! В рамках правил постарайтесь спасти судно и его команду от продолжающегося кризиса. \
				 Постарайтесь убедиться, что <i>другие игроки наслаждаются игрой</i>,а если вы запутались или растерялись, всегда пишите в adminhelp. \
				 Вы также должны связаться с администратором, прежде чем предпринимать какие-либо крайние меры. \
				 <b>Помните, что все правила, кроме тех, которые содержат явные исключения, применяются к ОЧР!</b>"
	welcome_text = "You shouldn't see this"
	leader_welcome_text = "You shouldn't see this"
	landmark_id = "Response Team"
	id_type = /obj/item/card/id/centcom/ERT

	flags = ANTAG_OVERRIDE_JOB | ANTAG_OVERRIDE_MOB | ANTAG_SET_APPEARANCE | ANTAG_HAS_LEADER | ANTAG_CHOOSE_NAME | ANTAG_RANDOM_EXCEPTED
	antaghud_indicator = "huddeathsquad" //INF, WAS hudloyalist - because haven't in sprites previous
	antag_indicator = "hud_loyal" //INF

	hard_cap = 5
	hard_cap_round = 7
	initial_spawn_req = 5
	initial_spawn_target = 7
	show_objectives_on_creation = 0 //we are not antagonists, we do not need the antagonist shpiel/objectives
	ambitious = 0 //INF

	base_to_load = /datum/map_template/ruin/antag_spawn/ert

	var/reason = ""

/datum/antagonist/ert/create_default(var/mob/source)
	var/mob/living/carbon/human/M = ..()
	if(istype(M)) M.age = rand(25,45)

/datum/antagonist/ert/Initialize()
	..()
	leader_welcome_text = SPAN_BOLD("Вы являетесь лидером Отряда Быстрого Реагирования. ") + "Как лидер, вы отвечаете только перед должностными лицами [GLOB.using_map.company_name]. Вы уполномочены переназначать главу отдела там, где это необходимо для достижения ваших целей. Тем не менее, рекомендуется, чтобы вы работали с первоначальными главами для достижения своих целей, если это возможно."
	welcome_text =        SPAN_BOLD("Вы член Отряда Быстрого Реагирования.") + "Как член Отряда Быстрого Реагирования Вы отвечаете только перед своим лидером и должностными лицами [GLOB.using_map.company_name]."

/datum/antagonist/ert/greet(var/datum/mind/player)
	if(!..())
		return
	to_chat(player.current, "Вы являетесь членом сил быстрого реагирования департамента Защиты Активов. Существует серьезная чрезвычайная ситуация на [GLOB.using_map.station_name] и вам поручено устранить эту проблему.")
	to_chat(player.current, "Сначала вы должны подготовиться и обсудить план со своей командой. Возможно, присоединится еще больше участников, так что не начинайте, пока вы все не будете готовы. Вы можете получить дальнейшие указания от вышестоящего начальника лично или в ближайшее время через голокомм.")

	if(reason)
		to_chat(player.current, SPAN_BOLD(FONT_LARGE("Вас вызвали на [GLOB.using_map.station_name] по следующим причинам: " + SPAN_NOTICE(reason))))

//Equip proc has been moved to the map specific folders.
