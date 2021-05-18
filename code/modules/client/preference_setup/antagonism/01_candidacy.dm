/datum/preferences
//inf	var/list/may_be_special_role
	var/list/be_special_role

/datum/category_item/player_setup_item/antagonism/candidacy
	name = "Candidacy"
	sort_order = 1

/datum/category_item/player_setup_item/antagonism/candidacy/load_character(datum/pref_record_reader/R)
	pref.be_special_role = R.read("be_special")
//inf	pref.may_be_special_role = R.read("may_be_special")

/datum/category_item/player_setup_item/antagonism/candidacy/save_character(datum/pref_record_writer/W)
	W.write("be_special", pref.be_special_role)
//inf	W.write("may_be_special", pref.may_be_special_role)

/datum/category_item/player_setup_item/antagonism/candidacy/sanitize_character()
	if(!istype(pref.be_special_role))
		pref.be_special_role = list()
/*[inf.exclude]
	if(!istype(pref.may_be_special_role))
		pref.may_be_special_role = list()
[/inf.exclude]*/
	var/special_roles = valid_special_roles()
	var/old_be_special_role = pref.be_special_role.Copy()
//inf.exclude	var/old_may_be_special_role = pref.may_be_special_role.Copy()
	for(var/role in old_be_special_role)
		if(!(role in special_roles))
			pref.be_special_role -= role
/*[inf.exclude]	for(var/role in old_may_be_special_role)
		if(!(role in special_roles))
			pref.may_be_special_role -= role
[/inf.exclude]*/
/datum/category_item/player_setup_item/antagonism/candidacy/content(var/mob/user)
	. = list()
	. += "<b>Легенда:</b><br>"
	. += "Антагонист - вы можете стать антагонистом или целью этого же типа антагонистов.<br>"
//	. += "Цель - вы можете стать целью этого типа антагонистов.<br>"
	. += "Нет - ни цель, ни антагонист этого типа.<br>"
	. += "<b>Приоритет специальных ролей:</b><br>"
	. += "<table>"
	var/list/all_antag_types = GLOB.all_antag_types_
	for(var/antag_type in all_antag_types)
		var/datum/antagonist/antag = all_antag_types[antag_type]
		. += "<tr><td>[antag.role_text]: </td><td>"
		if(jobban_isbanned(preference_mob(), antag.id) || (antag.id == MODE_MALFUNCTION && jobban_isbanned(preference_mob(), "ИИ")))
			. += "<span class='danger'>\[НЕДОСТУПНО\]</span><br>"
		else if(antag.id in pref.be_special_role)
			. += "<span class='linkOn'>Антагонист</span> <a href='?src=\ref[src];del_special=[antag.id]'>Нет</a></br>"
/*[inf.exclude]
		else if(antag.id in pref.may_be_special_role)
			. += "<a href='?src=\ref[src];add_special=[antag.id]'>Антагонист</a> <span class='linkOn'>Цель</span> <a href='?src=\ref[src];del_special=[antag.id]'>Нет</a></br>"
[/inf.exclude]*/
		else
			. += "<a href='?src=\ref[src];add_special=[antag.id]'>Антагонист</a> <span class='linkOn'>Нет</span></br>"

		. += "</td></tr>"
	. += "</table>"
	. += "<b>Приоритет ролей призрака:</b>"
	. += "<table>"
	var/list/ghost_traps = get_ghost_traps()
	for(var/ghost_trap_key in ghost_traps)
		var/datum/ghosttrap/ghost_trap = ghost_traps[ghost_trap_key]
		if(!ghost_trap.list_as_special_role)
			continue

		. += "<tr><td>[(ghost_trap.ghost_trap_role)]: </td><td>"
		if(banned_from_ghost_role(preference_mob(), ghost_trap))
			. += "<span class='danger'>\[БАН\]</span><br>"
		else if (!ghost_trap.assess_whitelist(user))
			var/datum/species/S = new ghost_trap.species_whitelist()
			. += "[SPAN_DANGER("\[WHITELIST RESTRICTED - [S]\]")]<br />"
		else if(ghost_trap.pref_check in pref.be_special_role)
			. += "<span class='linkOn'>Высокий</span> <a href='?src=\ref[src];del_special=[ghost_trap.pref_check]'>Никогда</a></br>"
/*[inf.exclude]
		else if(ghost_trap.pref_check in pref.may_be_special_role)
			. += "<a href='?src=\ref[src];add_special=[ghost_trap.pref_check]'>Высокий</a> <span class='linkOn'>Низкий</span> <a href='?src=\ref[src];del_special=[ghost_trap.pref_check]'>Никогда</a></br>"
[/inf.exclude]*/
		else
			. += "<a href='?src=\ref[src];add_special=[ghost_trap.pref_check]'>Высокий</a> <span class='linkOn'>Никогда</span></br>"

		. += "</td></tr>"
	. += "<tr><td>Выбрать все: </td><td><a href='?src=\ref[src];select_all=2'>Высокий</a> <a href='?src=\ref[src];select_all=0'>Никогда</a></td></tr>"
	. += "</table>"
	. = jointext(.,null)

/datum/category_item/player_setup_item/proc/banned_from_ghost_role(var/mob, var/datum/ghosttrap/ghost_trap)
	for(var/ban_type in ghost_trap.ban_checks)
		if(jobban_isbanned(mob, ban_type))
			return 1
	return 0

/datum/category_item/player_setup_item/antagonism/candidacy/OnTopic(var/href,var/list/href_list, var/mob/user)
	if(href_list["add_special"])
		if(!(href_list["add_special"] in valid_special_roles(FALSE)))
			return TOPIC_HANDLED
		pref.be_special_role |= href_list["add_special"]
//inf.exclude		pref.may_be_special_role -= href_list["add_special"]
		return TOPIC_REFRESH

	if(href_list["del_special"])
		if(!(href_list["del_special"] in valid_special_roles(FALSE)))
			return TOPIC_HANDLED
		pref.be_special_role -= href_list["del_special"]
//inf.exclude		pref.may_be_special_role -= href_list["del_special"]
		return TOPIC_REFRESH
/*[inf.exclude]
	if(href_list["add_maybe"])
		pref.be_special_role -= href_list["add_maybe"]
		pref.may_be_special_role |= href_list["add_maybe"]
		return TOPIC_REFRESH
[/inf.exclude]*/
	if(href_list["select_all"])
		var/selection = text2num(href_list["select_all"])
		var/list/roles = valid_special_roles(FALSE)

		for(var/id in roles)
			switch(selection)
				if(0)
					pref.be_special_role -= id
//inf.exclude					pref.may_be_special_role -= id
				if(1)
					pref.be_special_role -= id
//inf.exclude					pref.may_be_special_role |= id
				if(2)
					pref.be_special_role |= id
//inf.exclude					pref.may_be_special_role -= id
		return TOPIC_REFRESH

	return ..()

/datum/category_item/player_setup_item/antagonism/candidacy/proc/valid_special_roles(var/include_bans = TRUE)
	var/list/private_valid_special_roles = list()

	for(var/antag_type in GLOB.all_antag_types_)
		if(!include_bans)
			if(jobban_isbanned(preference_mob(), antag_type))
				continue
			if(((antag_type  == MODE_MALFUNCTION) && jobban_isbanned(preference_mob(), "AI")))
				continue
		private_valid_special_roles += antag_type

	var/list/ghost_traps = get_ghost_traps()
	for(var/ghost_trap_key in ghost_traps)
		var/datum/ghosttrap/ghost_trap = ghost_traps[ghost_trap_key]
		if(!ghost_trap.list_as_special_role)
			continue
		if(!include_bans)
			if(banned_from_ghost_role(preference_mob(), ghost_trap))
				continue
		private_valid_special_roles += ghost_trap.pref_check


	return private_valid_special_roles

/client/proc/wishes_to_be_role(var/role)
	if(!prefs)
		return FALSE
	if(role in prefs.be_special_role)
		return 2
/*[inf.exclude]
	if(role in prefs.may_be_special_role)
		return 1
[/inf.exclude]*/
	return FALSE	//Default to "never" if they don't opt-in.
