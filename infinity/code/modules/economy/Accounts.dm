GLOBAL_LIST_EMPTY(away_money_accounts)

/proc/create_away_account(var/account_name = "Default account name", var/owner_name, var/starting_funds = 0, var/account_type = ACCOUNT_TYPE_PERSONAL, var/obj/machinery/computer/account_database/source_db)

	//create a new account
	var/datum/money_account/M = new()
	M.account_name = account_name
	M.owner_name = (owner_name ? owner_name : account_name)
	M.account_type = account_type
	M.remote_access_pin = rand(1111, 111111)

	//create an entry in the account transaction log for when it was created
	//note that using the deposit proc on the account isn't really feasible because we need to change the transaction data before performing it
	var/datum/transaction/singular/T = new(M, (source_db ? source_db.machine_id : "NTGalaxyNet Terminal #[rand(111,1111)]"), starting_funds, "Account creation")
	if(!source_db)
		//set a random date, time and location some time over the past few decades
		T.date = "[num2text(rand(1,31))] [pick("January","February","March","April","May","June","July","August","September","October","November","December")], [GLOB.using_map.game_year-rand(8,18)]"
		T.time = "[rand(0,24)]:[rand(11,59)]"

		M.account_number = random_id("station_account_number", 111111, 999999)
	else
		M.account_number = next_account_number
		next_account_number += rand(1,25)

		//create a sealed package containing the account details
		var/obj/item/smallDelivery/P = new /obj/item/smallDelivery(source_db.loc)

		var/obj/item/paper/R = new /obj/item/paper(P)
		P.wrapped = R
		R.SetName("Account information: [M.account_name]")
		R.info = "<b>Account details (confidential)</b><br><hr><br>"
		R.info += "<i>Account holder:</i> [M.owner_name]<br>"
		R.info += "<i>Account number:</i> [M.account_number]<br>"
		R.info += "<i>Account pin:</i> [M.remote_access_pin]<br>"
		R.info += "<i>Starting balance:</i> [GLOB.using_map.local_currency_name_short][M.money]<br>"
		R.info += "<i>Date and time:</i> [stationtime2text()], [stationdate2text()]<br><br>"
		R.info += "<i>Creation terminal ID:</i> [source_db.machine_id]<br>"
		R.info += "<i>Authorised officer overseeing creation:</i> [source_db.held_card.registered_name]<br>"

		//stamp the paper
		var/image/stampoverlay = image('icons/obj/bureaucracy.dmi')
		stampoverlay.icon_state = "paper_stamp-boss"
		if(!R.stamped)
			R.stamped = new
		R.stamped += /obj/item/stamp
		R.overlays += stampoverlay
		R.stamps += "<HR><i>This paper has been stamped by the Accounts Database.</i>"

	//add the account
	T.perform()
	GLOB.away_money_accounts.Add(M)

	return M

/datum/job/proc/setup_away_account(var/mob/living/carbon/human/H)
	var/money_amount = 4 * rand(75, 100) * economic_power

	// Get an average economic power for our cultures.
	var/culture_mod =   0
	var/culture_count = 0
	for(var/token in H.cultural_info)
		var/decl/cultural_info/culture = H.get_cultural_value(token)
		if(culture && !isnull(culture.economic_power))
			culture_count++
			culture_mod += culture.economic_power
	if(culture_count)
		culture_mod /= culture_count
	money_amount *= culture_mod

	// Apply other mods.
	money_amount *= GLOB.using_map.salary_modifier
	money_amount *= 1 + 2 * H.get_skill_value(SKILL_FINANCE)/(SKILL_MAX - SKILL_MIN)
	money_amount = round(money_amount)
	//ACCOUNT CREATION STARTED
	var/datum/money_account/M = create_away_account("[H.real_name]'s account", H.real_name, money_amount)
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
