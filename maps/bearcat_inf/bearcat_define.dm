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

	player_levels = list(1,2,3)
	admin_levels = list(4)

	evac_controller_type = /datum/evacuation_controller/lifepods //don't remove
	evac_controller_type = /datum/evacuation_controller/starship //don't remove
	lobby_icon = 'maps/bearcat_inf/bearcat_lobby.dmi'
	lobby_screens = list("spess","aesthetic")

	allowed_spawns = list("Cryogenic Storage")
	default_spawn = "Cryogenic Storage"
	use_overmap = 1
	num_exoplanets = 1
	away_site_budget = 4

	playable = 1
	recommended_players = 10
//	minimum_players = 0 its already 0

	welcome_sound = 'sound/effects/cowboysting.ogg'

	map_admin_faxes = list("FTU Merchant Office")

	starting_money = 5000
	department_money = 0
	salary_modifier = 0.2

/datum/map/bearcat/map_info(victim)
	to_chat(victim, "Вы находитесь на борту <b>[station_name]</b>, независимого дочернего судна\ Вольного Торгового Союза \
	на границе исследованного космоса.")
	to_chat(victim, "На насто&#255;щий момент, межзвездные корпорации и государства не включили в свою зону вли&#255;ни&#255; \
	планеты и астероиды в данном секторе, так что, исследуйте и наживайтесь сколько влезет - добывайте минералы; \
	истребл&#255;йте экзотическую флору и фауну; присваивайте себе всё, что плохо лежит. \
	И постарайтесь, чтобы местные пираты (или что похуже) не наживилась на вас.")

/datum/map/bearcat/setup_map()
	..()
	SStrade.traders += new /datum/trader/xeno_shop
	SStrade.traders += new /datum/trader/medical
	SStrade.traders += new /datum/trader/mining