/datum/job/assistant
	title = "Crewman"
	total_positions = 12
	spawn_positions = 12
	department = "Civilian"
	department_flag = CIV
	supervisors = "Главой Персонала"
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

/datum/job/merchant
	title = "Merchant"
	department = "Civilian"
	department_flag = CIV

	total_positions = 1
	spawn_positions = 1
	supervisors = "невидимой рукой рынка"
	selection_color = "#515151"
	ideal_character_age = 30
	minimal_player_age = 7
	create_record = 0
	outfit_type = /decl/hierarchy/outfit/job/sierra/merchant/leader
	allowed_branches = list(/datum/mil_branch/civilian)
	allowed_ranks = list(/datum/mil_rank/civ/civ)
	latejoin_at_spawnpoints = 1

	access = list(access_merchant, access_merchant_leader)
	minimal_access = list()

	announced = FALSE
	min_skill = list(	SKILL_FINANCE = SKILL_ADEPT,
						SKILL_PILOT	  = SKILL_BASIC)
	give_psionic_implant_on_join = FALSE
	skill_points = 24
	required_role = list("MegaMerchant") //temporary toogling off merchants while they won't become away map

/datum/job/merchant/equip(var/mob/living/carbon/human/H)
	to_chat(H, "Ваши связи помогли вам узнать о словах, что помогут опознать местных... Особо заинтересованных покупателей:")
	to_chat(H, "<b>Кодовые фразы</b>: <span class='danger'>[syndicate_code_phrase]</span>")
	to_chat(H, "<b>Ответы на фразы</b>: <span class='danger'>[syndicate_code_response]</span>")
	H.StoreMemory("<b>Кодовые Фразы</b>: [syndicate_code_phrase]", /decl/memory_options/system)
	H.StoreMemory("<b>Ответы на фразы</b>: [syndicate_code_response]", /decl/memory_options/system)
	return ..()

/datum/job/merchant_trainee
	title = "Merchant Assistant"
	department = "Civilian"
	department_flag = CIV

	total_positions = 2
	spawn_positions = 2
	supervisors = "Торговцем"
	selection_color = "#515151"
	ideal_character_age = 20
	minimal_player_age = 0
	create_record = 0
	alt_titles = list(
		"Merchant Security" = /decl/hierarchy/outfit/job/sierra/merchant/security)
	outfit_type = /decl/hierarchy/outfit/job/sierra/merchant
	allowed_branches = list(/datum/mil_branch/civilian)
	allowed_ranks = list(/datum/mil_rank/civ/civ)
	latejoin_at_spawnpoints = 1
	access = list(access_merchant)
	announced = FALSE
	min_skill = list(   SKILL_FINANCE = SKILL_BASIC)

	max_skill = list(   SKILL_COMBAT  = SKILL_MAX,
	                    SKILL_WEAPONS = SKILL_MAX)
	required_role = list("Merchant")
	give_psionic_implant_on_join = FALSE

	skill_points = 24
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
