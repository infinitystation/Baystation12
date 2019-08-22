GLOBAL_DATUM_INIT(provocateurs, /datum/antagonist/provocateur, new)

/datum/antagonist/provocateur
	id = MODE_MISC_AGITATOR
	role_text = "Provocateur"
	role_text_plural = "Provocateurs"
	antaghud_indicator = "hud_traitor"
	flags = ANTAG_RANDOM_EXCEPTED
	welcome_text = "¬ы отвратительны, не так ли?"
	antag_text = "<hr>¬аша роль - <b>не</b> лицензи&#255; на убийства, но она дает вам разрешение на совершение \
	преступлений, создание непри&#255;тностей этими же преступлени&#255;ми и совершение иных действий, \
	недоступных обычному экипажу без весомой на то причин. ƒумайте об этом роли как о лицензии на \
	<b>интересное</b> вредительство. ѕродавайте наркотики, организуйте воровство или вымогательство \
	денег, будьте заводилой в драках - действуйте как <b>мини-антагонист!</b>"
	blacklisted_jobs = list()
	skill_setter = null
