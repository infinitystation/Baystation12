/datum/preferences
	var/list/relations
	var/list/relations_info

/datum/category_item/player_setup_item/relations
	name = "Matchmaking"
	sort_order = 1

/datum/category_item/player_setup_item/relations/load_character(var/savefile/S)
	S["relations"]	>> pref.relations
	S["relations_info"]	>> pref.relations_info

/datum/category_item/player_setup_item/relations/save_character(var/savefile/S)
	S["relations"]	<< pref.relations
	S["relations_info"]	<< pref.relations_info

/datum/category_item/player_setup_item/relations/sanitize_character()
	if(!pref.relations)
		pref.relations = list()
	if(!pref.relations_info)
		pref.relations_info = list()

/datum/category_item/player_setup_item/relations/content(mob/user)
	.=list()
	. += "Персонажи с активированными механическими отношениями распределяются в случайном порядке после появления. Вы можете прекратить их, когда впервые открываете информационное окно, но после этого они становятся окончательными."
	. += "<hr>"
	. += "<br><b>Что они знают о вас? Это общая информация, которую будут знать все ваши персонажи, состоящие в механических отношениях с вами. </b><a href='?src=\ref[src];relation_info=["general"]'>Изменить</a>"
	. += "<br><i>[pref.relations_info["general"] ? pref.relations_info["general"] : "Nothing specific."]</i>"
	. += "<hr>"
	for(var/T in subtypesof(/datum/relation))
		var/datum/relation/R = T
		. += "<b>[initial(R.name)]</b>\t"
		if(initial(R.name) in pref.relations)
			. += "<span class='linkOn'>Включено</span>"
			. += "<a href='?src=\ref[src];relation=[initial(R.name)]'>Выключено</a>"
		else
			. += "<a href='?src=\ref[src];relation=[initial(R.name)]'>Включено</a>"
			. += "<span class='linkOn'>Выключено</span>"
		. += "<br><i>[initial(R.desc)]</i>"
		. += "<br><b>Что они знают о вас?</b><a href='?src=\ref[src];relation_info=[initial(R.name)]'>Редактировать</a>"
		. += "<br><i>[pref.relations_info[initial(R.name)] ? pref.relations_info[initial(R.name)] : "Ничего особенного."]</i>"
		. += "<hr>"
	. = jointext(.,null)

/datum/category_item/player_setup_item/relations/OnTopic(var/href,var/list/href_list, var/mob/user)
	if(href_list["relation"])
		var/R = href_list["relation"]
		pref.relations ^= R
		return TOPIC_REFRESH
	if(href_list["relation_info"])
		var/R = href_list["relation_info"]
		var/info = sanitize(input("Character info", "What would you like the other party for this connection to know about your character?",pref.relations_info[R]) as message|null)
		if(info)
			pref.relations_info[R] = info
		return TOPIC_REFRESH
	return ..()
