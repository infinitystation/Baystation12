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
	name = "'dawn of new world' cannon"
	projectile_type = /obj/item/projectile/ship_munition/energy/dawn
	use_power = 0
	idle_power_usage = 0
	stored_power = 10
	shot_power = 0
	max_stored_power = 10
	max_draw_per_tick = 1

/obj/machinery/power/ship_weapon/maser/pulse
	name = "MRSP-84 'Pulsar'"
	projectile_type = /obj/item/projectile/ship_munition/energy/dawn
	idle_power_usage = 7000
	shot_power = 10000
	max_stored_power = 100000
	max_draw_per_tick = 20000

/obj/machinery/power/ship_weapon/maser/cruiser
	name = "MRSP-225 'Quasar'"
	projectile_type = /obj/item/projectile/ship_munition/energy/cruiser
	idle_power_usage = 12000
	shot_power = 1000000
	max_stored_power = 1000000
	max_draw_per_tick = 15000

/obj/machinery/power/ship_weapon/maser/old
	name = "MRSL-34 'Fighter"
	desc = "����������� ����� ������� ��������� (Medium-Ranged Space Laser). ������� � ���������� ���� ������������� ������ ��������� ����� � ����� �������� � �������� ������������ ������� � �� � ��������, 'Fighter' �������� ����������� ������� ������ ����������� �������. ������������ ��� �������� �������������� ����� � ����������� �������� ��������� �����. �������������� ������ ������� �������."
	projectile_type = /obj/item/projectile/ship_munition/energy
	shot_power = 100000
	max_stored_power = 100000
	max_draw_per_tick = 10000