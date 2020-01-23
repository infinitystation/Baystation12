/datum/event/psi_wave/announce()
command_announcement.Announce("В секторе зафиксирована вспышка аномальной энергии. Инженерному составу рекомендовано активировать щиты. Всему персоналу рекомендуется пройти в экранированные отсеки. По информации полученной от фонда Кучулейн это может привести к спонтанному повышению пси-активности членов персонала. Они рекомендуют не пускать ситуацию на самотек. Мы рекомендуем не нарушать в процессе взятия ситуации под контроль регуляии и ОПРС. Надеемся наше сообщение дойдет до вас вовремя.", new_sound = GLOB.using_map.radiation_detected_sound, zlevels = affecting_z)

/datum/event/psi_wave/start()
	var/count = 0
	for(var/mob/living/carbon/human/H in shuffle(GLOB.living_mob_list_))
		if(H.client && H.stat != DEAD)
			count++
			H.set_psi_rank(PSI_REDACTION, pick(1, 1, 1, 2, 2, 2, 2, 3, 3), defer_update = TRUE)
			H.set_psi_rank(PSI_COERCION, pick(1, 1, 1, 2, 2, 2, 2, 3, 3), defer_update = TRUE)
			H.set_psi_rank(PSI_PSYCHOKINESIS, pick(1, 1, 1, 2, 2, 2, 2, 3, 3), defer_update = TRUE)
			H.set_psi_rank(PSI_ENERGISTICS, pick(1, 1, 1, 2, 2, 2, 2, 3, 3), defer_update = TRUE)
			H.psi.update(TRUE)
			if(count >= pick(3,4,5,6))
				break
