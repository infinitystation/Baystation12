// Submap datum and archetype.
/decl/webhook/submap_loaded/liberia
	id = WEBHOOK_SUBMAP_LOADED_LIBERIA

/decl/submap_archetype/liberia
	descriptor = "merchant ship"
	map = "Liberia - merchant ship"
	blacklisted_species = null
	whitelisted_species = null
	crew_jobs = list(
		/datum/job/submap/merchant,
		/datum/job/submap/merchant_trainee
	)
	call_webhook = WEBHOOK_SUBMAP_LOADED_LIBERIA

/decl/submap_archetype/liberia/New()
	. = ..()
	GLOB.using_map.map_admin_faxes.Add("FTU Agency")
	for(var/obj/machinery/photocopier/faxmachine/fax in SSmachines.machinery)
		fax.admin_departments += "FTU Agency"

/datum/job/submap/merchant
	title = "Merchant"

	info = "Вы свободные торговцы, которых в поисках выгоды занесло в неизведанные дали. Путешествуйте, торгуйте, make profit! \
	\
	Посещать неизведанные обьекты крайне небезопасно. Вы торговцы, а не мусорщики, ваша смерть не принесет прибыли, не лезьте куда не надо."
	total_positions = 1
	spawn_positions = 1
	supervisors = "невидимой рукой рынка"
	selection_color = "#515151"
	ideal_character_age = 30
	minimal_player_age = 7
	create_record = 0
	outfit_type = /decl/hierarchy/outfit/job/liberia/merchant/leader
	whitelisted_species = null
	blacklisted_species = list(SPECIES_ALIEN, SPECIES_GOLEM, SPECIES_MANTID_GYNE, SPECIES_MANTID_ALATE, SPECIES_MONARCH_WORKER, SPECIES_MONARCH_QUEEN, SPECIES_XENO)
	allowed_branches = list(
		/datum/mil_branch/trader
	)
	allowed_ranks = list(
		/datum/mil_rank/civ/trader
	)
	latejoin_at_spawnpoints = 1

	access = list(
		access_merchant,
		access_merchant_leader
	)
	minimal_access = list()

	announced = FALSE
	min_skill = list(
		SKILL_FINANCE = SKILL_ADEPT,
		SKILL_PILOT	  = SKILL_BASIC
	)
	give_psionic_implant_on_join = FALSE
	skill_points = 24
	economic_power = 11

	account_allowed = TRUE

/datum/job/submap/merchant/equip(var/mob/living/carbon/human/H)
	to_chat(H, "Ваши связи помогли вам узнать о кодовых фразах, что помогут опознать местных... 'Особо заинтересованных' покупателей:")
	to_chat(H, "<b>Кодовые фразы</b>: <span class='danger'>[syndicate_code_phrase]</span>")
	to_chat(H, "<b>Ответы на фразы</b>: <span class='danger'>[syndicate_code_response]</span>")
	H.StoreMemory("<b>Кодовые Фразы</b>: [syndicate_code_phrase]", /decl/memory_options/system)
	H.StoreMemory("<b>Ответы на фразы</b>: [syndicate_code_response]", /decl/memory_options/system)
	setup_away_account(H)
	return ..()

/datum/job/submap/merchant_trainee/is_position_available()
	. = ..()
	if(. && requires_supervisor)
		for(var/mob/M in GLOB.player_list)
			if(!M.client || !M.mind || !M.mind.assigned_job || M.mind.assigned_job.title != requires_supervisor)
				continue
			var/datum/job/submap/merchant/merchant_job = M.mind.assigned_job
			if(istype(merchant_job) && merchant_job.owner == owner)
				return TRUE
		return FALSE

/datum/job/submap/merchant_trainee
	title = "Merchant Assistant"

	var/requires_supervisor = "Merchant"
	total_positions = 2
	spawn_positions = 2
	supervisors = "Торговцем"
	selection_color = "#515151"
	ideal_character_age = 20
	minimal_player_age = 0
	create_record = 0
	whitelisted_species = null
	blacklisted_species = list(SPECIES_ALIEN, SPECIES_GOLEM, SPECIES_MANTID_GYNE, SPECIES_MANTID_ALATE, SPECIES_MONARCH_WORKER, SPECIES_MONARCH_QUEEN, SPECIES_XENO)
	alt_titles = list(
		"Merchant Security" = /decl/hierarchy/outfit/job/liberia/merchant/security,
		"Merchant Engineer" = /decl/hierarchy/outfit/job/liberia/merchant/engineer,
		"Merchant Medical" = /decl/hierarchy/outfit/job/liberia/merchant/doctor
	)
	outfit_type = /decl/hierarchy/outfit/job/liberia/merchant
	allowed_branches = list(
		/datum/mil_branch/trader
	)
	allowed_ranks = list(
		/datum/mil_rank/civ/trader/trainee
	)
	latejoin_at_spawnpoints = 1
	access = list(
		access_merchant
	)
	announced = FALSE
	min_skill = list(
		SKILL_FINANCE = SKILL_BASIC
	)

	max_skill = list(
		SKILL_COMBAT  = SKILL_MAX,
	    SKILL_WEAPONS = SKILL_MAX
	)
	required_role = list(
		"Merchant"
	)

	give_psionic_implant_on_join = FALSE

	economic_power = 4
	skill_points = 24

	account_allowed = TRUE

/datum/job/submap/merchant_trainee/equip(var/mob/living/carbon/human/H)
	setup_away_account(H)
	outfit_type =  H.mind.role_alt_title!="Merchant Assistant" ? alt_titles[H.mind.role_alt_title] : outfit_type
	. = ..()

// Spawn points.
/obj/effect/submap_landmark/spawnpoint/liberia
	name = "Merchant"

/obj/effect/submap_landmark/spawnpoint/liberia/trainee
	name = "Merchant Assistant"

/obj/effect/submap_landmark/spawnpoint/liberia/security
 	name = "Merchant Security"

/obj/effect/submap_landmark/spawnpoint/liberia/engineer
 	name = "Merchant Engineer"

/obj/effect/submap_landmark/spawnpoint/liberia/doctor
 	name = "Merchant Medical"

/decl/hierarchy/outfit/job/liberia/merchant
	name = OUTFIT_JOB_NAME("Merchant Assistant")
	uniform = /obj/item/clothing/under/suit_jacket/tan
	shoes = /obj/item/clothing/shoes/brown
//	pda_type = /obj/item/modular_computer/pda
	id_types = list(/obj/item/card/id/liberia/merchant)

/decl/hierarchy/outfit/job/liberia/merchant/security
	name = OUTFIT_JOB_NAME("Merchant Security")
	uniform = /obj/item/clothing/under/syndicate/tacticool
	suit = /obj/item/clothing/suit/armor/pcarrier/light
	shoes = /obj/item/clothing/shoes/jackboots
	id_pda_assignment = "Merchant Security"

/decl/hierarchy/outfit/job/liberia/merchant/engineer
	name = OUTFIT_JOB_NAME("Merchant Engineer")
	uniform = /obj/item/clothing/under/civilian
	shoes = /obj/item/clothing/shoes/jackboots
	id_pda_assignment = "Merchant Engineer"

/decl/hierarchy/outfit/job/liberia/merchant/doctor
	name = OUTFIT_JOB_NAME("Merchant Medical")
	uniform = /obj/item/clothing/under/color/white
	suit = /obj/item/clothing/suit/storage/toggle/labcoat
	shoes = /obj/item/clothing/shoes/dress
	id_pda_assignment = "Merchant Medical"

/decl/hierarchy/outfit/job/liberia/merchant/leader
	name = OUTFIT_JOB_NAME("Merchant Leader - liberia")
	uniform = /obj/item/clothing/under/suit_jacket/charcoal
	shoes = /obj/item/clothing/shoes/laceup
	id_types = list(/obj/item/card/id/liberia/merchant/leader)

/obj/item/card/id/liberia/merchant
	desc = "An identification card issued to Merchants."
	job_access_type = /datum/job/submap/merchant_trainee
	color = COLOR_OFF_WHITE
	detail_color = COLOR_BEIGE

/obj/item/card/id/liberia/merchant/leader
	desc = "An identification card issued to Merchant Leaders, indicating their right to sell and buy goods."
	job_access_type = /datum/job/submap/merchant

/obj/item/paper/liberia/merchant
	name = "novice help"
	info = "<tt><center><b>Помощь новичку</b></center><hr><h3>Вступление</h3>Торговцы бывают разными. В основном, самым важным критерием стоит то, насколько хорошо развито красноречие. В случае с вашим небольшим судном, маловероятно, что вам удастся кому-то угрожать - необходимо искать общий язык.<h3>Вежливые торговцы</h3>Как бы вы не презирали экипаж, запомните - ведите себя по-взрослому, в меру серьезно, без излишней фамильярности, но дружелюбно. Не идите на конфликт со Службой Безопасности и тем более командованием, если не хотите провести неопределенный срок в ожидании нового судна в зоне действия сенсоров.<h3>Наценка</h3>Практически все товары, что находятся на вашей базе достались вам путём купли-продажи. Цена, выдававемая самим сканером, является ценой на рынке в среднем. Никто не будет сильно злиться из-за того, что вы накинете 20, 40 или даже 100 процентов к изначальной цене (особенно, если у покупателя нет сканера) - прикидывайте, насколько экипажу нужна та или иная вещь и сколько они готовы отдать за неё.<h3>Закон</h3>Никто не имеет права обыскивать ваше судно. Никто не имеет права заходить на судно без вашего разрешения. Никто не имеет права задерживать вас за то, что вы подлетели к шлюзу - другое дело, если вы соверште незаконную стыковку (в лучшем случае, вас попросят отстыковаться).<h3>Проникновение</h3> Чужой экипаж не имеет права проникать на ваш корабль без вашего разрешения. Вы не имеете права проникать на корабль без разрешения экипажа - помните, что если вы торгуете с крупным судном, то на нём, скорее всего, есть вооруженная охрана, которая может расстрелять вас за взлом внешнего шлюза.</tt>"

/datum/mil_branch/trader
	name = "Trader"
	name_short = "FTU"
	email_domain = "freemail.net"
	allow_custom_email = TRUE

	rank_types = list(
		/datum/mil_rank/civ/trader,
		/datum/mil_rank/civ/trader/trainee
	)

	spawn_rank_types = list(
		/datum/mil_rank/civ/trader,
		/datum/mil_rank/civ/trader/trainee
	)


/datum/mil_rank/civ/trader
	name = "Merchant"
	name_short = null

/datum/mil_rank/civ/trader/trainee
	name = "Merchant Trainee"
