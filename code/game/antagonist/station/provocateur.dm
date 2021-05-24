GLOBAL_DATUM_INIT(provocateurs, /datum/antagonist/provocateur, new)

/datum/antagonist/provocateur
	id = MODE_MISC_AGITATOR
// INF	role_text = "Deuteragonist"
// INF	role_text_plural = "Deuteragonists"
	role_text = "Provocateur"
	role_text_plural = "Provocateurs"
	antaghud_indicator = "hud_renegade" //INF, WAS hud_traitor
	flags = ANTAG_RANDOM_EXCEPTED
	welcome_text = "Вы отвратительны, не так ли?"
	antag_text = "<hr>Ваша роль - <b>не</b> лицензия на убийства, но она дает вам разрешение на совершение \
	преступлений, создание неприятностей этими же преступлениями и совершение иных действий, \
	недоступных обычному экипажу без весомой на то причин. Думайте об этом роли как о лицензии на \
	<b>интересное</b> вредительство. Продавайте наркотики, организуйте воровство или вымогательство \
	денег, будьте заводилой в драках - действуйте как <b>мини-антагонист!</b>"
	blacklisted_jobs = list()
	skill_setter = null
	min_player_age = 0

	var/antag_text_updated

/datum/antagonist/provocateur/get_antag_text(mob/recipient)
	if (!antag_text_updated)
		antag_text = replacetext(antag_text, "%WORLD_NAME%", station_name())
		antag_text_updated = TRUE
	return antag_text
