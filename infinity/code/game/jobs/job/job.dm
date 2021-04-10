/datum/job
	var/required_role = null //a role which necessery to join as the job. For an example, explorers cannot be without EL
	var/good_genome_prob = 10

/datum/job/proc/is_required_roles_filled()
	if(!required_role) return 1

	// Abstract submap jobs is not writing to SStrade.primary_job_datums
	if(istype(src, /datum/job/submap))
		for(var/mob/M in GLOB.player_list)
			if(M.client && M.mind && M.mind.assigned_job && (M.mind.assigned_job.title in required_role))
				return 1

	for(var/datum/job/J in SSjobs.primary_job_datums)
		if(J.title in required_role)
			if(J.current_positions || !J.total_positions)
				return 1
//			else
//				return

/datum/job/proc/setup_submap_account(var/mob/living/carbon/human/H)
	//MONEY AMOUNT GENERATION
	var/money_amount = 4 * rand(75, 100) * economic_power
	money_amount *= GLOB.using_map.salary_modifier
	money_amount *= 1 + 2 * H.get_skill_value(SKILL_FINANCE)/(SKILL_MAX - SKILL_MIN)
	money_amount = round(money_amount)

	//ACCOUNT CREATION STARTED
	var/datum/money_account/M = create_account("[H.real_name]'s account", H.real_name, money_amount, AWAY_MAP_MOB)
	if(H.mind)
		var/remembered_info = ""
		remembered_info += "<b>Номер Вашего аккаунта:</b> #[M.account_number]<br>"
		remembered_info += "<b>Пин-код:</b> [M.remote_access_pin]<br>"
		remembered_info += "<b>Сумма на счету:</b> [GLOB.using_map.local_currency_name_short][M.money]<br>"

		if(M.transaction_log.len)
			var/datum/transaction/T = M.transaction_log[1]
			remembered_info += "<b>Создан:</b> [T.time], [T.date] в [T.get_source_name()]<br>"
		H.StoreMemory(remembered_info, /decl/memory_options/system)
		H.mind.initial_account = M
	//ACCOUNT CREATION FINISHED