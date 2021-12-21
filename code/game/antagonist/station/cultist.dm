#define CULTINESS_PER_CULTIST 40
#define CULTINESS_PER_SACRIFICE 40
#define CULTINESS_PER_TURF 1

#define CULT_RUNES_1 200
#define CULT_RUNES_2 400
#define CULT_RUNES_3 1000

#define CULT_GHOSTS_1 400
#define CULT_GHOSTS_2 800
#define CULT_GHOSTS_3 1200

#define CULT_MAX_CULTINESS 1200 // When this value is reached, the game stops checking for updates so we don't recheck every time a tile is converted in endgame

GLOBAL_DATUM_INIT(cult, /datum/antagonist/cultist, new)

/proc/iscultist(var/mob/player)
	if(!GLOB.cult || !player.mind)
		return 0
	if(player.mind in GLOB.cult.current_antagonists)
		return 1

/datum/antagonist/cultist
	id = MODE_CULTIST
	role_text = "Cultist"
	role_text_plural = "Cultists"
	restricted_jobs = list(/datum/job/lawyer, /datum/job/captain, /datum/job/hos)
	protected_jobs = list(/datum/job/officer, /datum/job/warden, /datum/job/detective)
	blacklisted_jobs = list(/datum/job/ai, /datum/job/cyborg, /datum/job/chaplain, /datum/job/psychiatrist, /datum/job/submap)
	feedback_tag = "cult_objective"
	antag_indicator = "hudcultist"
	welcome_text = "У вас в распоряжении есть книга, которая поможет вам основать культ. Используйте его предусмотрительно и помните - есть и другие."
	victory_text = "Культ победил! Он преуспел в служении своим темным хозяевам!"
	loss_text = "Персоналу удалось остановить культ!"
	victory_feedback_tag = "Победа - Культ победил!"
	loss_feedback_tag = "Поражение - Сотрудники остановили распространение культа!"
	flags = ANTAG_SUSPICIOUS | ANTAG_RANDSPAWN | ANTAG_VOTABLE
	hard_cap = 5
	hard_cap_round = 6
	initial_spawn_req = 4
	initial_spawn_target = 6
	antaghud_indicator = "hudcultist"
	skill_setter = /datum/antag_skill_setter/station

	var/allow_narsie = 1
	var/powerless = 0
	var/datum/mind/sacrifice_target
	var/list/obj/effect/rune/teleport/teleport_runes = list()
	var/list/rune_strokes = list()
	var/list/sacrificed = list()
	var/cult_rating = 0
	var/list/cult_rating_bounds = list(CULT_RUNES_1, CULT_RUNES_2, CULT_RUNES_3, CULT_GHOSTS_1, CULT_GHOSTS_2, CULT_GHOSTS_3)
	var/max_cult_rating = 0
	var/conversion_blurb = "Вы мельком видите мир Нар-Си, обитель крови. Теперь вы видите насколько хрупок мир, вы понимаете, что он должен быть открыт познанию того, Который Ожидает. Помогайте своим новым товарищам в их темных делах. Их цели - ваши, а ваши - их. Прежде всего Вы служете Темному. Возродите Его."

	faction = "cult"
	ambitious = 0 //INF
/datum/antagonist/cultist/create_objectives(var/datum/mind/cultist)
	if(!..())
		return
/datum/antagonist/cultist/create_global_objectives()

	if(!..())
		return

	global_objectives = list()
	if(prob(50))
		global_objectives |= new /datum/objective/cult/survive
	else
		global_objectives |= new /datum/objective/cult/eldergod

	var/datum/objective/cult/sacrifice/sacrifice = new()
	sacrifice.find_target()
	sacrifice_target = sacrifice.target
	global_objectives |= sacrifice

/datum/antagonist/cultist/equip(var/mob/living/carbon/human/player)

	if(!..())
		return 0

	var/obj/item/book/tome/T = new(get_turf(player))
	var/list/slots = list (
		"backpack" = slot_in_backpack,
		"left pocket" = slot_l_store,
		"right pocket" = slot_r_store,
		"left hand" = slot_l_hand,
		"right hand" = slot_r_hand,
	)
	for(var/slot in slots)
		player.equip_to_slot(T, slot)
		if(T.loc == player)
			break
	var/obj/item/storage/S = locate() in player.contents
	if(istype(S))
		T.forceMove(S)

/datum/antagonist/cultist/remove_antagonist(var/datum/mind/player, var/show_message, var/implanted)
	if(!..())
		return 0
	to_chat(player.current, "<span class='danger'>Необычный белый свет вспыхивает в твоем сознании, он очищает порчу Темного и воспоминания о том, когда ты был его слугой.</span>")
	player.ClearMemories(type)
	if(show_message)
		player.current.visible_message("<span class='notice'>[player.current] похоже обратился(-ась) в прежнюю веру!</span>")
	remove_cult_magic(player.current)
	remove_cultiness(CULTINESS_PER_CULTIST)

/datum/antagonist/cultist/can_become_antag(var/datum/mind/player, var/ignore_role)
	if(..())
		if(player.current)
			if(ishuman(player.current))
				var/mob/living/carbon/human/H = player.current
				if(H.isSynthetic())
					return 0
				if(H.species.species_flags & SPECIES_FLAG_NO_SCAN)
					return 0
				return 1
			else if(isnewplayer(player.current))
				if(player.current.client && player.current.client.prefs)
					var/datum/species/S = all_species[player.current.client.prefs.species]
					if(S && (S.species_flags & SPECIES_FLAG_NO_SCAN))
						return 0
					if(player.current.client.prefs.organ_data[BP_CHEST] == "cyborg") // Full synthetic.
						return 0
					return 1
 	return 0

/datum/antagonist/cultist/add_antagonist(var/datum/mind/player, var/ignore_role, var/do_not_equip, var/move_to_spawn, var/do_not_announce, var/preserve_appearance)
	. = ..()
	if(.)
		to_chat(player, "<span class='cult'>[conversion_blurb]</span>")
		if(player.current && !istype(player.current, /mob/living/simple_animal/construct))
			player.current.add_language(LANGUAGE_CULT)

/datum/antagonist/cultist/remove_antagonist(var/datum/mind/player, var/show_message, var/implanted)
	. = ..()
	if(. && player.current && !istype(player.current, /mob/living/simple_animal/construct))
		player.current.remove_language(LANGUAGE_CULT)

/datum/antagonist/cultist/update_antag_mob(var/datum/mind/player)
	. = ..()
	add_cultiness(CULTINESS_PER_CULTIST)
	add_cult_magic(player.current)

/datum/antagonist/cultist/proc/add_cultiness(var/amount)
	cult_rating += amount
	var/old_rating = max_cult_rating
	max_cult_rating = max(max_cult_rating, cult_rating)
	if(old_rating >= CULT_MAX_CULTINESS)
		return
	var/list/to_update = list()
	for(var/i in cult_rating_bounds)
		if((old_rating < i) && (max_cult_rating >= i))
			to_update += i

	if(to_update.len)
		update_cult_magic(to_update)

/datum/antagonist/cultist/proc/update_cult_magic(var/list/to_update)
	if(CULT_RUNES_1 in to_update)
		for(var/datum/mind/H in GLOB.cult.current_antagonists)
			if(H.current)
				to_chat(H.current, "<span class='cult'>Завеса между этим миром и потусторонним становится все тоньше, и твоя сила растет.</span>")
				add_cult_magic(H.current)
	if(CULT_RUNES_2 in to_update)
		for(var/datum/mind/H in GLOB.cult.current_antagonists)
			if(H.current)
				to_chat(H.current, "<span class='cult'>Вы чувствуете, что полотно реальности рвется.</span>")
				add_cult_magic(H.current)
	if(CULT_RUNES_3 in to_update)
		for(var/datum/mind/H in GLOB.cult.current_antagonists)
			if(H.current)
				to_chat(H.current, "<span class='cult'>Конец света близок. Завеса мира тонка, как никогда.</span>")
				add_cult_magic(H.current)

	if((CULT_GHOSTS_1 in to_update) || (CULT_GHOSTS_2 in to_update) || (CULT_GHOSTS_3 in to_update))
		for(var/mob/observer/ghost/D in SSmobs.mob_list)
			add_ghost_magic(D)

/datum/antagonist/cultist/proc/offer_uncult(var/mob/M)
	if(!iscultist(M) || !M.mind)
		return

	to_chat(M, "<span class='cult'>Вы хотите покинуть культ Нар`си? <a href='?src=\ref[src];confirmleave=1'>ACCEPT</a></span>")

/datum/antagonist/cultist/Topic(href, href_list)
	if(href_list["confirmleave"])
		GLOB.cult.remove_antagonist(usr.mind, 1)

/datum/antagonist/cultist/proc/remove_cultiness(var/amount)
	cult_rating = max(0, cult_rating - amount)

/datum/antagonist/cultist/proc/add_cult_magic(var/mob/M)
	M.verbs += Tier1Runes

	if(max_cult_rating >= CULT_RUNES_1)
		M.verbs += Tier2Runes

		if(max_cult_rating >= CULT_RUNES_2)
			M.verbs += Tier3Runes

			if(max_cult_rating >= CULT_RUNES_3)
				M.verbs += Tier4Runes

/datum/antagonist/cultist/proc/remove_cult_magic(var/mob/M)
	M.verbs -= Tier1Runes
	M.verbs -= Tier2Runes
	M.verbs -= Tier3Runes
	M.verbs -= Tier4Runes
