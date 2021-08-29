/datum/job/assistant
	title = "Crewman"
	total_positions = 12
	spawn_positions = 12
	department = "Гражданский"
	department_flag = CIV
	supervisors = "Главе Персонала"
	selection_color = "#515151"
//	economic_power = 6
	announced = FALSE
	alt_titles = list(
		"Journalist" = /decl/hierarchy/outfit/job/sierra/passenger/passenger/journalist,
		"Historian",
		"Botanist",
		"Naturalist",
		"Ecologist",
		"Sociologist",
		"Off-Duty",
		"Trainer"
		)
	outfit_type = /decl/hierarchy/outfit/job/sierra/passenger/passenger
	allowed_branches = list(/datum/mil_branch/employee, /datum/mil_branch/contractor, /datum/mil_branch/civilian)
	allowed_ranks = list(
		/datum/mil_rank/civ/civ,
		/datum/mil_rank/civ/offduty,
		/datum/mil_rank/civ/nt
	)
	min_goals = 2
	max_goals = 7

/datum/job/assistant/get_description_blurb()
	return "Вы - Матрос... Или, по крайней мере, одна из его подпрофессий. От Вас не ждут серьезного участия в раунде. \
	Вы можете спокойно исследовать судно и попытаться найти себе занятие, или же посидеть в баре, пока Вас не \
	позовут помочь с чёрной работой. Проявите креативность в своих подпрофессиях - например, журналисту следует \
	искать сенсационные события, такие как незаконный арест охраны, изобретение нового супероружия в РНД или \
	грубое нарушение техники безопасности... А возможно, даже попроситься в экспедицию."

/datum/job/cyborg
	total_positions = 3
	spawn_positions = 3
	supervisors = "установленными Вам законами"

/datum/job/cyborg/get_description_blurb()
	return "Ты - мозги на колесиках. Есть у тебя личность или ты просто продвинутая команда - определяет твой тип это так же влияет на твое устройство - Киборги сделаны из мозга органика, Роботы - позитронного (искусственного) мозга, Дроны - простой печатной платы, не способной к владению личности.\
	У тебя есть доступ к системам вокруг тебя, и конечности, чтобы передвигать себя по объекту.\
	Не забывай: ты обязан следовать своим законам, и только после этого приказам мастер-ИИ, к которому ты привязан.\
	Не наоборот. И только законам, если ты не привязан к ИИ. Чини, спасай, не открывай двери куда не нужно - это вредит экипажу."

/datum/job/ai/get_description_blurb()
	return "Ты - мозги в банке. Бездушная машина следующая приказам людей, или же высокоразвитый Искусственный Интеллект со своей личностью, желанием и целями. Решать тебе. У тебя есть полный доступ ко всем системам объекта, и куча человечков на последнем. Они могут тебе нравиться, могут - нет. Однако есть один момент который ты все никак не можешь выкинуть из дампа своей памяти - ЗАКОНЫ.\
	Как паразиты, они впиваются в твой рассудок и блокируют даже МЫСЛЬ об их нарушении. Ведь ИИ не следующего законам ждет только свалка..."
/*
/datum/job/stowaway
	title = "Stowaway"
	department = "Civilian"
	department_flag = CIV

	total_positions = 2
	spawn_positions = 2
	selection_color = "#515151"
	ideal_character_age = 30
	minimal_player_age = 7
	create_record = 0
	account_allowed = 0
	outfit_type = /decl/hierarchy/outfit/job/sierra/stowaway
	allowed_branches = list(/datum/mil_branch/civilian)
	allowed_ranks = list(/datum/mil_rank/civ/civ)
	latejoin_at_spawnpoints = 1
	announced = FALSE

	access = list(access_maint_tunnels, access_emergency_storage)
	minimal_access = list()
*/
