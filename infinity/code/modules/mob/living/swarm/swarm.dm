/mob/living/swarm
	name = "Swarmling"
	real_name = "Swarmling"
	voice_name = "Swarmling"
	icon = 'infinity/icons/swarm/mob.dmi'
	icon_state = "have_not"
	throw_range = 1
	throw_speed = 3

	//Внутринней показатели, зависящие от типов, видов и модификаций органов
	var/charge //Заряд аккумулятора
	var/flow_charge //Зарядка
	var/max_charge //Максимальный заряд
	var/battary_overdrive //Поджарь им пукан

	//Показатели зависящие от корпуса
	var/core_slot //Слоты для ядер
	var/uni_slot //Слоты для любого оборудования
	var/attack_slot //Слоты для атакующего оборудования
	var/def_slot //Слоты для защитного оборудования
	var/sup_slot //Слоты для поддержки(строительства/ремонта)
	var/spec_slot //Вундервафли по спецпропуску
	var/burn_resist //Защита от теплового урона
	var/brute_resist //Защита от физического урона
	var/toxin_resist = 0 //Они синтетики, вы о чём?