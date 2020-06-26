/datum/antagonist/proc/create_global_objectives(var/override=0)
	if(config.objectives_disabled != CONFIG_OBJECTIVE_ALL && !override)
		return 0
	if(global_objectives && global_objectives.len)
		return 0
	return 1

/datum/antagonist/proc/create_objectives(var/datum/mind/player, var/override=0)
	if(player.objectives.len && !override)
		return 0
	if(config.objectives_disabled != CONFIG_OBJECTIVE_ALL && !override)
		return 0
	if(create_global_objectives(override) || global_objectives.len)
		player.objectives |= global_objectives
	return 1

/datum/antagonist/proc/get_special_objective_text()
	return ""

/mob/proc/add_objectives()
	set name = "Get Objectives"
	set desc = "Recieve optional objectives."
	set category = "OOC"

	if(!src.mind.changeling) //INF, todo: make it flexable
		src.verbs -= /mob/proc/add_objectives

	if(!src.mind)
		return

	var/all_antag_types = GLOB.all_antag_types_
	for(var/tag in all_antag_types) //we do all of them in case an admin adds an antagonist via the PP. Those do not show up in gamemode.
		var/datum/antagonist/antagonist = all_antag_types[tag]
		if(antagonist && antagonist.is_antagonist(src.mind))
			antagonist.create_objectives(src.mind,1)

	if(!src.mind.changeling) //INF, todo: make it flexable
		to_chat(src, FONT_LARGE(
		"<b>Эти задачи носят рекомендательный характер. Если они не устраивают Вас - не выполняйте их, \
		но придумайте что-то своё.</b>"))
	show_objectives(src.mind)

/mob/living/proc/set_ambition()
	set name = "Set Ambition"
	set category = "IC"
	set src = usr

	if(!mind)
		return
	if(!is_special_character(mind))
		to_chat(src, "<span class='warning'>While you may perhaps have goals, this verb's meant to only be visible \
		to antagonists.  Please make a bug report!</span>")
		return

	var/datum/goal/ambition/goal = SSgoals.ambitions[mind]
/*[ORIGINAL]
	var/new_goal = sanitize(input(src, "Write a short sentence of what your character hopes to accomplish \
	today as an antagonist.  Remember that this is purely optional.  It will be shown at the end of the \
	round for everybody else.", "Antagonist Goal", (goal ? html_decode(goal.description) : "")) as null|message)
	if(!isnull(new_goal))
		if(!goal)
			goal = new /datum/goal/ambition(mind)
		goal.description = new_goal
		to_chat(src, "<span class='notice'>You've set your goal to be <b>'[goal.description]'</b>. You can check your goals with the <b>Show Goals</b> verb.</span>")
	else
		to_chat(src, "<span class='notice'>You leave your ambitions behind.</span>")
		if(goal)
			qdel(goal)
	log_and_message_admins("has set their ambitions to now be: [new_goal].")
[ORIGINAL]*/
//[INF]
	var/new_goal = sanitize(input(src, "Напишите, чего Вы хотите достичь в этом раунде как антагонист - \
	свои цели. Они будут видны всем игрокам после конца раунда. Помните, что Вы не можете \
	переписать их - только дополнить новыми строками.", "Antagonist Goal") as null|message)
	if(!isnull(new_goal))
		if(!goal)
			goal = new /datum/goal/ambition(mind)
		goal.description += "<br>[roundduration2text()]: [new_goal]"
		to_chat(src, SPAN_NOTICE("Теперь, Ваша амбиция выглядит так: <b>[goal.description]</b><br>. \
		Вы можете просмотреть её через кнопку <b>Notes</b>. Если Вы хотите изменить всю амбицию, \
		то обратитесь к администратору."))
		log_and_message_admins("обновил свою амбицию: [new_goal].")
//[/INF]

//some antagonist datums are not actually antagonists, so we might want to avoid
//sending them the antagonist meet'n'greet messages.
//E.G. ERT
/datum/antagonist/proc/show_objectives_at_creation(var/datum/mind/player)
	if(src.show_objectives_on_creation)
		show_objectives(player)
