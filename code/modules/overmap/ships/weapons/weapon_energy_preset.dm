/obj/machinery/power/ship_weapon/maser/debug
	name = "coderbus cannon"
	projectile_type = /obj/item/projectile/ship_munition/energy
	use_power = 0
	idle_power_usage = 0
	shot_power = 20000
	max_stored_power = 1000000

/obj/machinery/power/ship_weapon/maser/destroyer
	name = "destroyer cannon"
	projectile_type = /obj/item/projectile/ship_munition/energy/destroyer
	idle_power_usage = 7000
	shot_power = 100000
	max_stored_power = 10000000
	max_draw_per_tick = 100000

/obj/machinery/power/ship_weapon/maser/dawn
	name = "'dawn of the world' cannon"
	projectile_type = /obj/item/projectile/ship_munition/energy/dawn
	use_power = 0
	idle_power_usage = 0
	stored_power = 10
	shot_power = 0
	max_stored_power = 10
	max_draw_per_tick = 1

/obj/machinery/power/ship_weapon/maser/old
	name = "MRSL-34 'Fighter"
	desc = " осмический Ћазер —редней ƒальности (Medium-Ranged Space Laser). ЌадЄжный и доказавший свою эффективность против пиратских судов и малых кораблей в пределах человеческой границы и за еЄ предеами, 'Fighter' является стандартной моделью боевых космических лазеров. »спользуется для пробития энергетических щитов и длительного обстрела вражеских судов. ћалоэффективен против толстой обшивки."
	projectile_type = /obj/item/projectile/ship_munition/energy
	shot_power = 100000
	max_stored_power = 1000000
	max_draw_per_tick = 10000