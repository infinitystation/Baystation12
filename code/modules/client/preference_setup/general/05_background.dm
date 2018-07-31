/datum/preferences
	var/med_record = ""
	var/sec_record = ""
	var/gen_record = ""
	var/economic_status = "Average"
	var/memory = ""

	//Some faction information.
	var/home_system = "Unset"           //System of birth.
	var/citizenship = "None"            //Current home system.
	var/faction = "None"                //Antag faction/general associated faction.
	var/religion = "None"               //Religious association.

/datum/category_item/player_setup_item/general/background
	name = "Background"
	sort_order = 5

/datum/category_item/player_setup_item/general/background/load_character(var/savefile/S)
	from_file(S["med_record"],pref.med_record)
	from_file(S["sec_record"],pref.sec_record)
	from_file(S["gen_record"],pref.gen_record)
	from_file(S["home_system"],pref.home_system)
	from_file(S["citizenship"],pref.citizenship)
	from_file(S["faction"],pref.faction)
	from_file(S["religion"],pref.religion)
	from_file(S["economic_status"],pref.economic_status)
	from_file(S["memory"],pref.memory)

/datum/category_item/player_setup_item/general/background/save_character(var/savefile/S)
	to_file(S["med_record"],pref.med_record)
	to_file(S["sec_record"],pref.sec_record)
	to_file(S["gen_record"],pref.gen_record)
	to_file(S["home_system"],pref.home_system)
	to_file(S["citizenship"],pref.citizenship)
	to_file(S["faction"],pref.faction)
	to_file(S["religion"],pref.religion)
	to_file(S["economic_status"],pref.economic_status)
	to_file(S["memory"],pref.memory)

/datum/category_item/player_setup_item/general/background/sanitize_character()
	if(!pref.home_system) pref.home_system = "Unset"
	if(!pref.citizenship) pref.citizenship = "None"
	if(!pref.faction)     pref.faction =     "None"
	if(!pref.religion)    pref.religion =    "None"

	pref.economic_status = sanitize_inlist(pref.economic_status, ECONOMIC_CLASS, initial(pref.economic_status))

/datum/category_item/player_setup_item/general/background/content(var/mob/user)
	. += "<b>Background Information</b><br>"
	. += "Economic Status: <a href='?src=\ref[src];nt_relation=1'>[pref.economic_status]</a><br/>"
	. += "Home System: <a href='?src=\ref[src];home_system=1'>[pref.home_system]</a><br/>"
	. += "Citizenship: <a href='?src=\ref[src];citizenship=1'>[pref.citizenship]</a><br/>"
	. += "Faction: <a href='?src=\ref[src];faction=1'>[pref.faction]</a><br/>"
	. += "Religion: <a href='?src=\ref[src];religion=1'>[pref.religion]</a><br/>"

	. += "<br/><b>Records</b>:<br/>"
	if(jobban_isbanned(user, "Records"))
		. += "<span class='danger'>You are banned from using character records.</span><br>"
	else
		. += "Medical Records:<br>"
		. += "<a href='?src=\ref[src];set_medical_records=1'>[TextPreview(pref.med_record,40)]</a><br><br>"
		. += "Employment Records:<br>"
		. += "<a href='?src=\ref[src];set_general_records=1'>[TextPreview(pref.gen_record,40)]</a><br><br>"
		. += "Security Records:<br>"
		. += "<a href='?src=\ref[src];set_security_records=1'>[TextPreview(pref.sec_record,40)]</a><br>"
		. += "Memory:<br>"
		. += "<a href='?src=\ref[src];set_memory=1'>[TextPreview(pref.memory,40)]</a><br>"

/datum/category_item/player_setup_item/general/background/OnTopic(var/href,var/list/href_list, var/mob/user)
	if(href_list["nt_relation"])
		var/new_class = input(user, "Choose your relation to [GLOB.using_map.company_name]. Note that this represents what others can find out about your character by researching your background, not what your character actually thinks.", CHARACTER_PREFERENCE_INPUT_TITLE, pref.economic_status)  as null|anything in ECONOMIC_CLASS
		if(new_class && CanUseTopic(user))
			pref.economic_status = new_class
			return TOPIC_REFRESH

	else if(href_list["home_system"])
		var/choice = input(user, "Please choose a home system.", CHARACTER_PREFERENCE_INPUT_TITLE, pref.home_system) as null|anything in GLOB.using_map.home_system_choices + list("Unset","Other")
		if(!choice || !CanUseTopic(user))
			return TOPIC_NOACTION
		if(choice == "Other")
			var/raw_choice = input(user, "Please enter a home system.", CHARACTER_PREFERENCE_INPUT_TITLE)  as text|null
			raw_choice = sanitize(raw_choice, MAX_NAME_LEN * 2)
			raw_choice = sanitize_a2u(raw_choice)
			if(raw_choice && CanUseTopic(user))
				pref.home_system = raw_choice
		else
			pref.home_system = choice
		return TOPIC_REFRESH

	else if(href_list["citizenship"])
		var/choice = input(user, "Please choose your current citizenship.", CHARACTER_PREFERENCE_INPUT_TITLE, pref.citizenship) as null|anything in GLOB.using_map.citizenship_choices + list("None","Other")
		if(!choice || !CanUseTopic(user))
			return TOPIC_NOACTION
		if(choice == "Other")
			var/raw_choice = input(user, "Please enter your current citizenship.", CHARACTER_PREFERENCE_INPUT_TITLE) as text|null
			raw_choice = sanitize(raw_choice, MAX_NAME_LEN * 2)
			raw_choice = sanitize_a2u(raw_choice)
			if(raw_choice && CanUseTopic(user))
				pref.citizenship = raw_choice
		else
			pref.citizenship = choice
		return TOPIC_REFRESH

	else if(href_list["faction"])
		var/choice = input(user, "Please choose a faction to work for.", CHARACTER_PREFERENCE_INPUT_TITLE, pref.faction) as null|anything in GLOB.using_map.faction_choices + list("None","Other")
		if(!choice || !CanUseTopic(user))
			return TOPIC_NOACTION
		if(choice == "Other")
			var/raw_choice = input(user, "Please enter a faction.", CHARACTER_PREFERENCE_INPUT_TITLE)  as text|null
			raw_choice = sanitize(raw_choice, MAX_NAME_LEN * 2)
			raw_choice = sanitize_a2u(raw_choice)
			if(raw_choice)
				pref.faction = raw_choice
		else
			pref.faction = choice
		return TOPIC_REFRESH

	else if(href_list["religion"])
		var/choice = input(user, "Please choose a religion.", CHARACTER_PREFERENCE_INPUT_TITLE, pref.religion) as null|anything in GLOB.using_map.religion_choices + list("None","Other")
		if(!choice || !CanUseTopic(user))
			return TOPIC_NOACTION
		if(choice == "Other")
			var/raw_choice = input(user, "Please enter a religon.", CHARACTER_PREFERENCE_INPUT_TITLE)  as text|null
			raw_choice = sanitize(raw_choice, MAX_NAME_LEN * 2)
			raw_choice = sanitize_a2u(raw_choice)
			if(raw_choice)
				pref.religion = raw_choice
		else
			pref.religion = choice
		return TOPIC_REFRESH

	else if(href_list["set_medical_records"])
		var/new_medical = input(user,"Enter medical information here.",CHARACTER_PREFERENCE_INPUT_TITLE, html_decode(pref.med_record)) as message|null
		new_medical = sanitize(new_medical, MAX_PAPER_MESSAGE_LEN, extra = 0)
		new_medical = sanitize_a2u(new_medical)
		if(!isnull(new_medical) && !jobban_isbanned(user, "Records") && CanUseTopic(user))
			pref.med_record = new_medical
		return TOPIC_REFRESH

	else if(href_list["set_general_records"])
		var/new_general = input(user,"Enter employment information here.",CHARACTER_PREFERENCE_INPUT_TITLE, html_decode(pref.gen_record)) as message|null
		new_general = sanitize(new_general, MAX_PAPER_MESSAGE_LEN, extra = 0)
		new_general = sanitize_a2u(new_general)
		if(!isnull(new_general) && !jobban_isbanned(user, "Records") && CanUseTopic(user))
			pref.gen_record = new_general
		return TOPIC_REFRESH

	else if(href_list["set_security_records"])
		var/sec_medical = input(user,"Enter security information here.",CHARACTER_PREFERENCE_INPUT_TITLE, html_decode(pref.sec_record)) as message|null
		sec_medical = sanitize(sec_medical, MAX_PAPER_MESSAGE_LEN, extra = 0)
		sec_medical = sanitize_a2u(sec_medical)
		if(!isnull(sec_medical) && !jobban_isbanned(user, "Records") && CanUseTopic(user))
			pref.sec_record = sec_medical
		return TOPIC_REFRESH

	else if(href_list["set_memory"])
		var/memes = input(user,"Enter memorized information here.",CHARACTER_PREFERENCE_INPUT_TITLE, html_decode(pref.memory)) as message|null
		memes = sanitize(memes, MAX_PAPER_MESSAGE_LEN, extra = 0)
		memes = sanitize_a2u(memes)
		if(!isnull(memes) && CanUseTopic(user))
			pref.memory = memes
		return TOPIC_REFRESH

	return ..()
