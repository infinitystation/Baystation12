/datum/antagonist/proc/add_antagonist(var/datum/mind/player, var/ignore_role, var/do_not_equip, var/move_to_spawn, var/do_not_announce, var/preserve_appearance)

	if(!add_antagonist_mind(player, ignore_role))
		return

	if(base_to_load)
		var/datum/map_template/base = new base_to_load()
		report_progress("Loading map template '[base]' for [role_text]...")
		base_to_load = null
		base.load_new_z()
		get_starting_locations()

	//do this again, just in case
	if(flags & ANTAG_OVERRIDE_JOB)
		player.assigned_job = null
		player.assigned_role = role_text
		player.role_alt_title = null
	player.special_role = role_text

	if(isghostmind(player))
		create_default(player.current)
	else
		create_antagonist(player, move_to_spawn, do_not_announce, preserve_appearance)
		if(istype(skill_setter))
			skill_setter.initialize_skills(player.current.skillset)
		if(!do_not_equip)
			equip(player.current)

	if(player.current)
		player.current.faction = faction
	return 1

/datum/antagonist/proc/add_antagonist_mind(var/datum/mind/player, var/ignore_role, var/nonstandard_role_type, var/nonstandard_role_msg)
	if(!istype(player))
		return 0
	if(!player.current)
		return 0
	if(player in current_antagonists)
		return 0
	if(!can_become_antag(player, ignore_role))
		return 0
	current_antagonists |= player

	if(faction_verb)
		player.current.verbs |= faction_verb

	if(config.objectives_disabled == CONFIG_OBJECTIVE_VERB)
		player.current.verbs += /mob/proc/add_objectives

	if(player.current.client)
		player.current.client.verbs += /client/proc/aooc

	spawn(1 SECOND) //Added a delay so that this should pop up at the bottom and not the top of the text flood the new antag gets.
/*[ORIGINAL]
		to_chat(player.current, "<span class='notice'>Once you decide on a goal to pursue, you can optionally display it to \
			everyone at the end of the shift with the <b>Set Ambition</b> verb, located in the IC tab.  You can change this at any time, \
			and it otherwise has no bearing on your round.</span>")
[/ORIGINAL]*/
//[INF]
	if(ambitious)
/* INF
		to_chat(player.current, SPAN_NOTICE("Вы можете самостоятельно назначить себе особые цели, которые будут видны \
		всем игрокам после завершения раунда. Если ваши основные цели вызывают у вас отторжение и вы хотели бы \
		выполнить что-то <u>более интересное</u>, то вы можете использовать <b>Set Ambition</b> для выставления \
		себе желаемых целей (они могут отличаться от стандартных - проявите фантазию).<br>\
		Старайтесь действовать после получаса игры - до этого планируйте и делайте вид, что вы - обычный член персонала. \
		Не заставляйте экипаж скучать 2 часа, чтобы вы в последние 10 минут попыталсь бесславно выполнить механо-задания."))
*/
		to_chat(player.current, SPAN_NOTICE("Вы должны самостоятельно придумать себе цели, которые будете \
		преследовать как антагонист. Они должны содержать в себе что-то, что вредит и представляет угрозу экипажу \
		(примеры или конкретные задания, возможно, были описаны выше). Не забывайте также о том, что вашему \
		персонажу желательно пережить все события, а не умереть \"геройской смертью\". \
		Используйте для этого <b>Set Ambition</b> (во вкладке IC), чтобы после завершения раунда другие игроки видели, \
		к чему вы стремились."))

		player.current.verbs += /mob/living/proc/set_ambition

	// Handle only adding a mind and not bothering with gear etc.
	if(nonstandard_role_type)
		faction_members |= player
		to_chat(player.current, "<span class='danger'><font size=3>You are \a [nonstandard_role_type]!</font></span>")
		player.special_role = nonstandard_role_type
		if(nonstandard_role_msg)
			to_chat(player.current, "<span class='notice'>[nonstandard_role_msg]</span>")
		update_icons_added(player)
	return 1

/datum/antagonist/proc/remove_antagonist(var/datum/mind/player, var/show_message, var/implanted)
	if(!istype(player))
		return 0
	if(player.current && faction_verb)
		player.current.verbs -= faction_verb
	if(faction && player.current.faction == faction)
		player.current.faction = MOB_FACTION_NEUTRAL
	if(player in current_antagonists)
		to_chat(player.current, "<span class='danger'><font size = 3>You are no longer a [role_text]!</font></span>")
		current_antagonists -= player
		faction_members -= player
		player.special_role = null
		update_icons_removed(player)

		if(player.current)
			BITSET(player.current.hud_updateflag, SPECIALROLE_HUD)
			player.current.reset_skillset() //Reset their skills to be job-appropriate.

		if(!is_special_character(player))
			if(player.current)
				player.current.verbs -= /mob/living/proc/set_ambition
				if(player.current.client)
					player.current.client.verbs -= /client/proc/aooc
			qdel(SSgoals.ambitions[player])
		return 1
	return 0
