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

	evac_controller_type = /datum/evacuation_controller/lifepods
	lobby_icon = 'maps/bearcat_inf/bearcat_lobby.dmi'
	lobby_screens = list("spess","aesthetic")

	allowed_spawns = list("Cryogenic Storage")
	default_spawn = "Cryogenic Storage"
	use_overmap = 1
	num_exoplanets = 0
	away_site_budget = 2
	welcome_sound = 'sound/effects/cowboysting.ogg'

	map_admin_faxes = list("FTU Merchant Office")

	emergency_shuttle_leaving_dock = "�������� ����� �������: ������������ ������� ��������, �� �������� �� ���������� ��������� �������� %ETA%."

	emergency_shuttle_called_message = "�������� ����� �������: ������ ��������� ��������� �����. ������������ ������� ����� ������ � ������� ����� %ETA%."
	emergency_shuttle_called_sound = sound('sound/AI/torch/abandonship.ogg', volume = 45)

	emergency_shuttle_recall_message = "�������� ����� �������: ��������� ��������� ����� ��������. ������������� � ������."

	starting_money = 5000
	department_money = 0
	salary_modifier = 0.2

/datum/map/bearcat/map_info(victim)
	to_chat(victim, "�� ���������� �� ����� <b>[station_name]</b>, ������������ ��������� ����� �������� ��������� ����� �� ������� �������������� �������.")
	to_chat(victim, "�� �����&#255;��� ������, ����������� ���������� � ����������� �� �������� � ���� ���� ���&#255;��&#255; ������� � ��������� � ������ �������, ��� ���, ���������� � ����������� ������� ������ - ��������� ��������; �������&#255;��� ������������ ����� � �����; ������������ ���� ��, ��� ����� �����. � ������������, ����� ������� ������ (��� ��� ������) �� ���������� �� ���.")

/datum/map/bearcat/setup_map()
	..()
	SStrade.traders += new /datum/trader/xeno_shop
	SStrade.traders += new /datum/trader/medical
	SStrade.traders += new /datum/trader/mining