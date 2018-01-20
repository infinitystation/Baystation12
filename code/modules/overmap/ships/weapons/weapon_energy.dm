/obj/machinery/power/ship_weapon/maser
	name = "MRSL-42 'Chaser"
	desc = " осмический Ћазер —редней ƒальности (Medium-Ranged Space Laser) 'Chaser' является одним из передовых лазерных корабельных орудий в своЄм классе. »спользуется для пробития энергетических щитов и длительного обстрела вражеских судов. ћалоэффективен против бронированных стен."
	projectile_type = /obj/item/projectile/ship_munition/energy
	use_power = 1
	idle_power_usage = 3000

	// Todo: cells and capacitors
	var/stored_power = 0
	var/shot_power = 60000
	var/max_stored_power = 100000
	var/max_draw_per_tick = 10000

/obj/machinery/power/ship_weapon/maser/Initialize()
	..()
	connect_to_network()

/obj/machinery/power/ship_weapon/maser/update_icon()
	..()
	if(powered())
		set_light(2,10, "#3333FF")
	else
		set_light(0)

/obj/machinery/power/ship_weapon/maser/Process()
	..()
	if(powered())
		var/draw_amount = min(max_draw_per_tick, max_stored_power-stored_power)
		if(surplus() < draw_amount)
			draw_amount = surplus()
		stored_power += draw_power(draw_amount)
	update_icon()

/obj/machinery/power/ship_weapon/maser/can_fire()
	return powered() && stored_power >= shot_power

/obj/machinery/power/ship_weapon/maser/handle_post_fire()
	. = ..()
	if(.)
		stored_power = max(0, stored_power - shot_power)
		if(prob(30))
			var/datum/effect/effect/system/spark_spread/s = new /datum/effect/effect/system/spark_spread
			s.set_up(2, 1, loc)
			s.start()

/obj/machinery/power/ship_weapon/maser/get_status()
	var/list/data = ..()
	data["status"] += " \[CHARGE: [stored_power]/[shot_power]\]"
	return data
