#define WEBHOOK_SUBMAP_LOADED_LIBERIA "webhook_submap_liberia"

#include "liberia_areas.dm"
#include "liberia_jobs.dm"
#include "liberia_shuttles.dm"
#include "liberia_machinery.dm"

// Map template data.
/datum/map_template/ruin/away_site/liberia //Основной файл
	name = "Liberia" //Имя
	id = "awaysite_liberia" //ID
	description = "A Merchant ship." //Описание
	prefix = "maps/away_inf/" //Префикс
	suffixes = list("liberia/liberia.dmm") //Суффикс
	cost = 0.5 //Шанса появления
	template_flags = TEMPLATE_FLAG_SPAWN_GUARANTEED
	spawn_weight = 50 //HABITABLE SHIPS SPAWN
	//Инициализация шаттлов
	shuttles_to_initialise = list(
		/datum/shuttle/autodock/overmap/mule
	)

	area_usage_test_exempted_root_areas = list(/area/liberia)

// Overmap objects.
/obj/effect/overmap/visitable/ship/liberia //Объект в Системе
	name = "Liberia" //Название
	desc = "Sensors detect a merchant ship." //Данные с сенсоров
	color = "#8a6642" //Цвет
	vessel_mass = 3000
	fore_dir = WEST
	max_speed = 1/(1 SECOND)
	known = 1
	initial_restricted_waypoints = list(
		"Mule" = list("nav_mule_start")
	)

/obj/effect/submap_landmark/joinable_submap/liberia
	name = "Liberia"
	archetype = /decl/submap_archetype/liberia

/obj/machinery/power/smes/buildable/preset/liberia
	_input_maxed = TRUE
	_output_maxed = TRUE
	_input_on = TRUE
	_output_on = TRUE
	_fully_charged = TRUE

#undef WEBHOOK_SUBMAP_LOADED_LIBERIA
