GLOBAL_DATUM_INIT(foundation_agents, /datum/antagonist/foundation, new)

/datum/antagonist/foundation
	id = MODE_FOUNDATION
	role_text = "Foundation Agent"
	antag_indicator = "hudfoundation"
	role_text_plural = "Foundation Agents"
	welcome_text = "<span class='info'>Вы являетесь оперативным агентом Фонда Cuchulain, \
	тот, кто специализируется на устранении психических угроз. У вас есть свободный доступ куда вы \
	пожелаете, пистолет, заряженный патронами из антипсихотического нулевого стекла, и четкая задача. Обычно, \
	никто не воспринимает ваших работодателей всерьез - до такого дня, как сегодня.</span>"
	antag_text = "Вы <b>анти</b> антагонист! В рамках правил \
		постарайтесь спасти судно и его команду от продолжающегося кризиса. \
		Постарайтесь убедиться, что <i>другие игроки наслаждаются игрой</i>! Если вы запутались или растерялись, всегда пишите в adminhelp, \
		и прежде чем предпринимать крайние меры, пожалуйста, постарайтесь также связаться с администрацией! \
		Продумайте свои действия и сделайте ролевую игру захватывающей! <b>Пожалуйста помните, что \
		все правила, кроме тех, которые содержат явные исключения, применяются к Агентам Фонда.</b>"

	flags = ANTAG_OVERRIDE_JOB | ANTAG_OVERRIDE_MOB | ANTAG_CLEAR_EQUIPMENT | ANTAG_CHOOSE_NAME | ANTAG_SET_APPEARANCE
	antaghud_indicator = "hudfoundation"
	landmark_id = "Response Team"
	hard_cap = 3
	hard_cap_round = 3
	initial_spawn_req = 1
	initial_spawn_target = 2
	min_player_age = 14
	faction = "foundation"
	id_type = /obj/item/card/id/foundation

/datum/antagonist/foundation/equip(var/mob/living/carbon/human/player)

	if(!..())
		return 0

	player.set_psi_rank(PSI_REDACTION,     3, defer_update = TRUE)
	player.set_psi_rank(PSI_COERCION,      3, defer_update = TRUE)
	player.set_psi_rank(PSI_PSYCHOKINESIS, 3, defer_update = TRUE)
	player.set_psi_rank(PSI_ENERGISTICS,   3, defer_update = TRUE)
	player.psi.update(TRUE)

	var/decl/hierarchy/outfit/foundation = outfit_by_type(/decl/hierarchy/outfit/foundation)
	foundation.equip(player)

	create_id("Foundation Agent", player)
