/datum/map/bearcat
	name = "Bearcat"
	full_name = "FTV Bearcat"
	path = "bearcat_inf"

	station_name  = "FTV Bearcat"
	station_short = "Bearcat"

	dock_name     = "FTS Capitalist's Rest"
	boss_name     = "FTU Merchant Navy"
	boss_short    = "Merchant Admiral"
	company_name  = "Legit Cargo Ltd."
	company_short = "LC"
	overmap_event_areas = 11

	station_levels = list(1,2,3)
	contact_levels = list(1,2,3)
	player_levels = list(1,2,3)
	admin_levels = list(4)

	shuttle_docked_message = "Attention all hands: Jump preparation complete. The bluespace drive is now spooling up, secure all stations for departure. Time to jump: approximately %ETD%."
	shuttle_leaving_dock = "Attention all hands: Jump initiated, exiting bluespace in %ETA%."
	shuttle_called_message = "Attention all hands: Jump sequence initiated. Transit procedures are now in effect. Jump in %ETA%."
	shuttle_recall_message = "Attention all hands: Jump sequence aborted, return to normal operating conditions."

	evac_controller_type = /datum/evacuation_controller/lifepods
	evac_controller_type = /datum/evacuation_controller/starship
	lobby_icon = 'maps/bearcat_inf/bearcat_lobby.dmi'
	lobby_screens = list("spess","aesthetic")

	allowed_spawns = list("Cryogenic Storage")
	default_spawn = "Cryogenic Storage"
	use_overmap = 1
	num_exoplanets = 0
	away_site_budget = 2
	welcome_sound = 'sound/effects/cowboysting.ogg'

	map_admin_faxes = list("FTU Merchant Office")

	emergency_shuttle_leaving_dock = "Внимание всему экипажу: спасательные капсулы запущены, до удаления на безопасную дистанцию осталось %ETA%."

	emergency_shuttle_called_message = "Внимание всему экипажу: начата аварийная эвакуация судна. Спасательные капсулы будут готовы к отбытию через %ETA%."
	emergency_shuttle_called_sound = sound('sound/AI/torch/abandonship.ogg', volume = 45)

	emergency_shuttle_recall_message = "Внимание всему экипажу: аварийная эвакуация судна отменена. Возвращайтесь к работе."

	starting_money = 5000
	department_money = 0
	salary_modifier = 0.2

/datum/map/bearcat/map_info(victim)
	to_chat(victim, "Вы находитесь на борту <b>[station_name]</b>, независимого дочернего судна Вольного Торгового Союза на границе исследованного космоса.")
	to_chat(victim, "На насто&#255;щий момент, межзвездные корпорации и государства не включили в свою зону вли&#255;ни&#255; планеты и астероиды в данном секторе, так что, исследуйте и наживайтесь сколько влезет - добывайте минералы; истребл&#255;йте экзотическую флору и фауну; присваивайте себе всё, что плохо лежит. И постарайтесь, чтобы местные пираты (или что похуже) не наживилась на вас.")

/datum/map/bearcat/setup_map()
	..()
	SStrade.traders += new /datum/trader/xeno_shop
	SStrade.traders += new /datum/trader/medical
	SStrade.traders += new /datum/trader/mining