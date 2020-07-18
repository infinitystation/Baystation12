/decl/cultural_info/culture/adherent
	name = CULTURE_ADHERENT
	description = "Часовые - это относительно свободное сообщество полуорганических машин-слуг - адхерантов, \
	созданных ныне вымершей цивилизацией. Они чтят память своих давно погибших создателей, уничтоженных Криком - \
	солнечной вспышкой, стершей большую часть записей о создателях и повредившей многие сенсорные и управляющие \
	системы, ошеломив и дезориентировав выживших адхерантов на сотни лет. Теперь, наладив контакт с человечеством, \
	Часовые неуверенно делают первые шаги к месту в широком галактическом сообществе."
	hidden_from_codex = TRUE
	language = LANGUAGE_ADHERENT
	secondary_langs = list(
		LANGUAGE_HUMAN_EURO,
		LANGUAGE_SPACER
	)

/decl/cultural_info/culture/adherent/get_random_name(var/gender)
	return "[uppertext("[pick(GLOB.full_alphabet)][pick(GLOB.full_alphabet)]-[pick(GLOB.full_alphabet)] [rand(1000,9999)]")]"

/decl/cultural_info/culture/adherent/sanitize_name(name)
	return sanitizeName(name, allow_numbers=TRUE)
