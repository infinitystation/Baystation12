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
	description = "A medium-sized asteroid full of minerals. Old mining facility detected at one of sides, owner - NanoTrasen."
	prefix = "maps/away_inf/"
	suffixes = list("mining/mining-asteroid.dmm")
	cost = 1
	accessibility_weight = 10
	generate_mining_by_z = 1
	template_flags = TEMPLATE_FLAG_SPAWN_GUARANTEED
	apc_test_exempt_areas = list(
//		/area/outpost/abandoned = NO_SCRUBBER,
		/area/mine/explored = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/mine/unexplored = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/outpost/mining/solar = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/outpost/mining/maints = NO_SCRUBBER|NO_VENT,
		/area/outpost/mining/atmos = NO_SCRUBBER|NO_VENT,
		/area/outpost/mining/relay = NO_SCRUBBER,
	)
	area_usage_test_exempted_root_areas = list(/area/mine)
//	area_usage_test_exempted_areas = list(/area/djstation)
	area_coherency_test_exempt_areas =  list(/area/mine/explored, /area/mine/unexplored)

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

/obj/machinery/telecomms/relay/preset/mining_away
	id = "Outpost Mining Relay"
	autolinkers = list("m_relay_a")
	usage_offise = 5 KILOWATTS
	outage_probability = 100
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
	info = "<i>ГДЕ СКАФАНДРЫ, СУКА?<br>Распилено, привыкай :)</i>"

/obj/item/weapon/paper/mining_base/buttons
	info = "<i>Я вытащил внешние кнопки для шлюзов, ну это нахуй.<br> \
	Вставил ебаные кнопки обратно и добавил на них ограничение по доступу - это не дело. Если у вас яйца размером с горошек \
	и вы боитесь каких-то слухов - это <b>ваши</b> проблемы.</i>"

/obj/item/weapon/paper/mining_base/note
	info = "<i>Это самая стремная база, на которой мне доводилось находиться. Я впервые вижу такое \
	количество ебаного мусора, пыли, мышей - хоть капканы ставь, откуда они здесь?<br> \
	У меня создается впечатление, что базу построили недавно, но специально мусором наговнили, \
	потому-что плитка не выглядит настолько всрато. \
	Когда мы прилетели, обнаружилось, что практически всё оборудование куда-то пропало - решили, \
	что спиздили предыдущие группы. Как обычно, впрочем.<br> \
	Астероиды странный, даже очень. Либо его практически не копали, что явно пиздеж, потому-что до нас \
	здесь было минимум 7 бригад, либо... Даже не знаю. Сказать, что здесь аномалия или типо того? \
	В последнем выходе мы заметили, что тоннели пропадают. Прошло часов 6 и возможно, это просто \
	обрушение, но мы не настолько долбоебы, чтобы копать в такую ширь... Да и гравитации здесь \
	практически нет - из-за чего это?<br> Начальство ничего по этому поводу не говорит - копайте, \
	как копали.<br> Тем, кто прилетит - записывайте всё, где выкопали и что нашли. Что-то здесь не \
	чисто. И ни слова руководству.<br><br>\
	4-09-2307: Обнаружили неизвестную постройку на юго-востоке, вызывали доверенного офицера.\
	Спустя 20-25 минут, постройка просто исчезла. Тоннели, что к ней вели были заполнены карпами \
	и стремными роботами. На координатах ничего нет.<br><br>\
	26-09-2307: Обнаружили неизвестную форму жизни - не карпа или робота. Оно преследовало одного из \
	наших около часа, не позволяя ему идти в сторону базы. Шахтер не может описать, что это было \
	- видел только что-то чёрное и очень быстрое. Держалось вне света. Смотрело из темноты. \
	Помнит красные глаза и как оно пыталось ему что-то сказать.<br><br>\
	7-10-2307: Произошло обрушение центральной части пещер - телекоммуникации накрылись. Мы \
	отправили факс к нашему основному судну. Около часа сидели на базе и слушали, как что-то скребет \
	стены со внешней стороны. С учетом того, что по негласному правилу никто не раскапывает камни \
	вокруг базы - возможно, это были карпы, только вот почему-то скреблись у техов.<br><br>\
	18-10-2307: Изначально хотел сжечь эту бумажку, но передумал после смены. 4 шахтера все как один \
	твердят о том, что вокруг астероида летал неизвестный корабль такой же неизвестной конструкции. \
	Мы в такой жопе космоса, что я отказываюсь верить в то, что это что-то от скреллов или таяр. \
	Обшивка была фиолетовой, множество синих огней. Спустя около получаса с \"первого контакта\", \
	по словам одного из парней оно выстрелило чем-то в сторону юго-восточной части астероида и \
	вскоре улетело. Обследовали место попадания болванки - обнаружили несколько зелёных кристаллов. \
	Поспешили доставить на корабль.<br><br></i>"

/obj/item/weapon/paper/mining_base/shutters
	info = "<i>Не поднимайте космические створки без необходимости. Бригады докладывают, что происходят \"самопроизвольные\" \
	разрушения внешних иллюминаторов - без вмешательства космических тел и тому подобного.<br> \
	Обновляйте противметоритную защиту чаще - это просто пыль.<br> \
	Обновлено - в секторе обнаружены малые стаи космических карпов, будьте осторожны.</i>"

/obj/item/weapon/paper/mining_base/relay_base
	info = "<tt><center><b><large>NT Automated Mining Outpost Psy-721</large></b></center><center>Центр Связи</center><hr>Инженерной командой одного из судов была возведена установка для удалённой связи с ближайшими судами.<br>В случае поломки коммуникационного реле, должен быть использован факс для удалённой связи с судном и вызовом инженера.<hr><i><small>NT Support Division</small></i></tt><i><br><br>Я не эксперт, но блять - ДЕЙСТВИТЕЛЬНО ЛИ нужно было размещать постройку на другом конце астероида? Чтобы я в случае пропажи связи наложил в 3-4 раза больше кирпичей, пока в полной тишине шёл туда?<br>+++</i>"

/obj/item/weapon/paper/mining_base/relay_remote
	info = "<i>Молодец - ты прошел до другого конца астероида, чтобы найти это место. Congratulations!<br> \
	Если твою пятую точку сюда принесло чувство страха, что тебя здесь забудут - читай дальше :^)<br> \
	Итак, у тебя есть 2 стула.<br> \
	Первый - если реле работает, то у тебя всё путём и ты слышишь парней со своего корыта. \
	Если оно от НТ или у вашего техника по компам хватает наглости подключаться к чужим сетям, конечно же.<br>\
	Если что-то пошло не так и реле не работает - у тебя всё ещё должен быть факс. Его доступ должен распознавать \
	шахтёров.<br>\
	Если что сломалось - зовите техника, он поводит мультитулом и всё пройдет. \
	А может и пора съебывать, если ваше реле не работает.<br><br>\
	...Ну ахуеть теперь.<br></i>"
