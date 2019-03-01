#include "mining_areas.dm"

//MINING-1 // CLUSTER
/obj/effect/overmap/sector/mining_asteroid
	name = "large asteroid"
	desc = "A medium-sized asteroid with a big belt of small one. Old mining facility detected on one of sides, owner - NanoTrasen."
	icon_state = "sector"
	initial_restricted_waypoints = list(
		"Guppy" = list("nav_mining_8")
	)
	initial_generic_waypoints = list(
		"nav_mining_1",
		"nav_mining_2",
		"nav_mining_3",
		"nav_mining_4",
		"nav_mining_5",
		"nav_mining_6",
		"nav_mining_7",
		"nav_mining_9"
	)
	known = 1
	start_x = 4
	start_y = 5

/datum/map_template/ruin/away_site/mining_asteroid
	name = "Mining - Asteroid Base"
	id = "awaysite_mining_asteroid_base"
	description = "A medium-sized asteroid full of minerals. Old mining facility detected on one of sides, owner - NanoTrasen."
	prefix = "maps/away_inf/"
	suffixes = list("mining/mining-asteroid.dmm")
	cost = 1
	accessibility_weight = 10
	template_flags = TEMPLATE_FLAG_SPAWN_GUARANTEED

/obj/effect/shuttle_landmark/mining/nav1
	name = "Asteroid Navpoint #1"
	landmark_tag = "nav_mining_1"

/obj/effect/shuttle_landmark/mining/nav2
	name = "Asteroid Navpoint #2"
	landmark_tag = "nav_mining_2"

/obj/effect/shuttle_landmark/mining/nav4
	name = "Asteroid Navpoint #3"
	landmark_tag = "nav_mining_3"

/obj/effect/shuttle_landmark/mining/nav6
	name = "Asteroid Navpoint #4"
	landmark_tag = "nav_mining_4"

/obj/effect/shuttle_landmark/mining/nav5
	name = "Asteroid Landing zone #1"
	landmark_tag = "nav_mining_5"
	base_area = /area/mine/explored
	base_turf = /turf/simulated/floor/asteroid

/obj/effect/shuttle_landmark/mining/nav7
	name = "Asteroid Landing zone #2"
	landmark_tag = "nav_mining_6"
	base_area = /area/mine/explored
	base_turf = /turf/simulated/floor/asteroid

/obj/effect/shuttle_landmark/mining/nav8
	name = "Asteroid Mining Outpost Hangar"
	landmark_tag = "nav_mining_7"
	base_area = /area/outpost/mining/hangar
	base_turf = /turf/simulated/floor/plating

/obj/effect/shuttle_landmark/mining/nav9
	name = "Asteroid Mining Outpost"
	landmark_tag = "nav_mining_8"

/obj/effect/shuttle_landmark/mining/nav3
	name = "Mining Asteroid Center"
	landmark_tag = "nav_mining_antag"

/*
//MINING-2 // SIGNAL
/obj/effect/overmap/sector/away
	name = "faint signal from an asteroid"
	desc = "Faint signal detected, originating from the human-made structures on the site's surface."
	icon_state = "sector"
	initial_generic_waypoints = list(
		"nav_away_1",
		"nav_away_2",
		"nav_away_3",
		"nav_away_4",
		"nav_away_5",
		"nav_away_6",
		"nav_away_7"
	)
	known = 0

/datum/map_template/ruin/away_site/mining_signal
	name = "Mining - Planetoid"
	id = "awaysite_mining_signal"
	description = "A mineral-rich, formerly-volcanic site on a planetoid."
	suffixes = list("mining/mining-signal.dmm")
	cost = 1
	base_turf_for_zs = /turf/simulated/floor/asteroid

/obj/effect/shuttle_landmark/away
	base_area = /area/mine/explored

/obj/effect/shuttle_landmark/away/nav1
	name = "Away Landing zone #1"
	landmark_tag = "nav_away_1"

/obj/effect/shuttle_landmark/away/nav2
	name = "Away Landing zone #2"
	landmark_tag = "nav_away_2"

/obj/effect/shuttle_landmark/away/nav3
	name = "Away Landing zone #3"
	landmark_tag = "nav_away_3"

/obj/effect/shuttle_landmark/away/nav4
	name = "Away Landing zone #4"
	landmark_tag = "nav_away_4"

/obj/effect/shuttle_landmark/away/nav5
	name = "Away Landing zone #5"
	landmark_tag = "nav_away_5"

/obj/effect/shuttle_landmark/away/nav6
	name = "Away Landing zone #6"
	landmark_tag = "nav_away_6"

/obj/effect/shuttle_landmark/away/nav7
	name = "Away Landing zone #7"
	landmark_tag = "nav_away_7"
*/

/obj/item/weapon/paper/mining_base/eva
	info = "<i>��� ���������, ����?<br>���������, �������� :)</i>"

/obj/item/weapon/paper/mining_base/buttons
	info = "<i>� ������� ������� ������ ��� ������, �� ��� �����.<br> \
	������� ������ ������ ������� � ������� �� ��� ����������� �� ������� - ��� �� ����. ���� � ��� ���� �������� � ������� \
	� �� ������� �����-�� ������ - ��� <b>����</b> ��������.</i>"

/obj/item/weapon/paper/mining_base/note
	info = "<i>��� ����� �������� ����, �� ������� ��� ���������� ����������. � ������� ���� ����� ���������� ������� ������, \
	����, ����� - ���� ������� �����, ������ ��� �����?<br> \
	� ���� ��������� �����������, ��� ���� ��������� �������, �� ���������� ������� ���������, ������-��� ������ �� �������� \
	��������� ������. \
	����� �� ���������, ������������, ��� ����������� �� ������������ ����-�� ������� - ������, ��� �������� ���������� ������. \
	��� ������, �������.<br> \
	��������� ��������, ���� �����. ���� ��� ����������� �� ������, ��� ���� ������, ������-��� �� ��� ����� ���� ������� \
	7 ������, ����... ���� �� ����. �������, ��� ����� �������� ��� ���� ����? � ��������� ������ �� ��������, ��� ������� \
	���������. ������ ����� 6 � ��������, ��� ������ ���������, �� �� �� ��������� ��������, ����� ������ � ����� ����... \
	�� � ���������� ����� ����������� ��� - ��-�� ���� ���?<br> \
	���������� ������ �� ����� ������ �� ������� - �������, ��� ������.<br> \
	���, ��� �������� - ����������� ��, ��� �������� � ��� �����. ���-�� ����� �� �����. � �� ����� �����������.</i>"

/obj/item/weapon/paper/mining_base/shutters
	info = "<i>�� ���������� ����������� ������� ��� �������������. ������� �����������, ��� ���������� \"����������������\" \
	���������� ������� ������������� - ��� ������������� ����������� ��� � ���� ���������.<br> \
	���������� ���������������� ������ ���� - ��� ������ ����.<br> \
	��������� - � ������� ���������� ����� ���� ����������� ������, ������ ���������.</i>"
