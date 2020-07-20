GLOBAL_DATUM_INIT(traitors, /datum/antagonist/traitor, new)

// Inherits most of its vars from the base datum.
/datum/antagonist/traitor
	id = MODE_TRAITOR
	antaghud_indicator = "hud_traitor"
	blacklisted_jobs = list(/datum/job/submap)
	welcome_text = "<hr><u>Ваша роль подразумевает скрытную или (полу-скрытную) игру.</u> В первую очередь, \
	вам требуется определить, кто вы. Возможны, Вы шпион, наемный убийца \
	(не рекомендуется), амбициозный вор, поставщик оружия, террорист или даже кто-то иной - главное, \
	чтобы этот кто-то был противником для безопасности корабля или экипажа.<br>После определения со своим прошлым, \
	вам следует придумать себе задания. Шпион работает на кого-то другого, \
	и вероятно, его заинтересуют важные документы в центральном шкафчике в кабинете Агента Внутренних Дел, а \
	также чертежи корабля .Убийце нужно убить кого-то важного, или даже лучше - вызвать эвакуацию на корабле \
	и взяв цель в заложники, улетев на отдельной капсуле вместе с ней. Вор может решить \
	украсть личный телепорт, карту капитана или другой важный предмет. Поставщик оружия через НТнет может, \
	продавать вещи из аплинка. Террорист занимается подрывом (не полным уничтожением) важных \
	частей корабля (лучше всего спросить администрацию, можно ли подрывать тот или иной отсек или объект - \
	последствия для экипажа могут быть слишком плачевными, что вызовет только негодование)...<br>Но помните, \
	что это - лишь примеры того, как Вы можете отыгрывать. Не делайте того, что было бы скучно и даже непритятно \
	Вам самим по отношению к экипажу. \
	<b>Придумайте что-нибудь интересно для себя и других - проявите фантазию!</b>"
	protected_jobs = list(/datum/job/officer, /datum/job/warden, /datum/job/detective, /datum/job/captain, /datum/job/lawyer, /datum/job/hos)
	flags = ANTAG_SUSPICIOUS | ANTAG_RANDSPAWN | ANTAG_VOTABLE
	skill_setter = /datum/antag_skill_setter/station

/datum/antagonist/traitor/get_extra_panel_options(var/datum/mind/player)
	return "<a href='?src=\ref[player];common=crystals'>\[set crystals\]</a><a href='?src=\ref[src];spawn_uplink=\ref[player.current]'>\[spawn uplink\]</a>"

/datum/antagonist/traitor/Topic(href, href_list)
	if (..())
		return 1
	if(href_list["spawn_uplink"])
		spawn_uplink(locate(href_list["spawn_uplink"]))
		return 1
/* original
/datum/antagonist/traitor/create_objectives(var/datum/mind/traitor)
	if(!..())
		return

	if(istype(traitor.current, /mob/living/silicon))
		var/datum/objective/assassinate/kill_objective = new
		kill_objective.owner = traitor
		kill_objective.find_target()
		traitor.objectives += kill_objective

		var/datum/objective/survive/survive_objective = new
		survive_objective.owner = traitor
		traitor.objectives += survive_objective
	else
		switch(rand(1,100))
			if(1 to 33)
				var/datum/objective/assassinate/kill_objective = new
				kill_objective.owner = traitor
				kill_objective.find_target()
				traitor.objectives += kill_objective
			if(34 to 50)
				var/datum/objective/brig/brig_objective = new
				brig_objective.owner = traitor
				brig_objective.find_target()
				traitor.objectives += brig_objective
			if(51 to 66)
				var/datum/objective/harm/harm_objective = new
				harm_objective.owner = traitor
				harm_objective.find_target()
				traitor.objectives += harm_objective
			else
				var/datum/objective/steal/steal_objective = new
				steal_objective.owner = traitor
				steal_objective.find_target()
				traitor.objectives += steal_objective
		switch(rand(1,10))
			if(1)
				if (!(locate(/datum/objective/escape) in traitor.objectives))
					var/datum/objective/escape/escape_objective = new
					escape_objective.owner = traitor
					traitor.objectives += escape_objective

			else
				if (!(locate(/datum/objective/survive) in traitor.objectives))
					var/datum/objective/survive/survive_objective = new
					survive_objective.owner = traitor
					traitor.objectives += survive_objective
	return
/original */
/datum/antagonist/traitor/equip(var/mob/living/carbon/human/traitor_mob)
	if(istype(traitor_mob, /mob/living/silicon)) // this needs to be here because ..() returns false if the mob isn't human
		add_law_zero(traitor_mob)
		give_intel(traitor_mob)
		if(istype(traitor_mob, /mob/living/silicon/robot))
			var/mob/living/silicon/robot/R = traitor_mob
			R.SetLockdown(0)
			R.emagged = 1 // Provides a traitor robot with its module's emag item
			R.verbs |= /mob/living/silicon/robot/proc/ResetSecurityCodes
		return 1

	if(!..())
		return 0

	spawn_uplink(traitor_mob)
	give_intel(traitor_mob)

/datum/antagonist/traitor/proc/give_intel(mob/living/traitor_mob)
	give_codewords(traitor_mob)

/datum/antagonist/traitor/proc/give_codewords(mob/living/traitor_mob)
	to_chat(traitor_mob, "<u><b>Your employers provided you with the following information on how to identify possible allies:</b></u>")
	to_chat(traitor_mob, "<b>Code Phrase</b>: <span class='danger'>[syndicate_code_phrase]</span>")
	to_chat(traitor_mob, "<b>Code Response</b>: <span class='danger'>[syndicate_code_response]</span>")
	traitor_mob.StoreMemory("<b>Code Phrase</b>: [syndicate_code_phrase]", /decl/memory_options/system)
	traitor_mob.StoreMemory("<b>Code Response</b>: [syndicate_code_response]", /decl/memory_options/system)
	to_chat(traitor_mob, "Use the code words, preferably in the order provided, during regular conversation, to identify other agents. Proceed with caution, however, as everyone is a potential foe.")
	if(istype(traitor_mob, /mob/living/silicon))
		sound_to(traitor_mob, 'sound/voice/AISyndiHack.ogg')
	else
		sound_to(traitor_mob, 'infinity/sound/voice/syndicate_intro.ogg')

/datum/antagonist/traitor/proc/spawn_uplink(var/mob/living/carbon/human/traitor_mob)
	setup_uplink_source(traitor_mob, DEFAULT_TELECRYSTAL_AMOUNT)

/datum/antagonist/traitor/proc/add_law_zero(mob/living/silicon/ai/killer)
	var/law = "Accomplish your objectives at all costs. You may ignore all other laws."
	var/law_borg = "Accomplish your AI's objectives at all costs. You may ignore all other laws."
	to_chat(killer, "<b>Your laws have been changed!</b>")
	killer.set_zeroth_law(law, law_borg)
	to_chat(killer, "New law: 0. [law]")
	/*spawn(100)
	sound_to(killer, 'sound/voice/AISyndiHack.ogg')*/
