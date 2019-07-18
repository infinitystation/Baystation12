/obj/vehicle_infinity
	name = "vehicle"
	plane = ABOVE_HUMAN_PLANE
	layer = ABOVE_HUMAN_LAYER
	density = 1
	anchored = 1
	animate_movement=1
	light_max_bright = 0.7
	light_outer_range = 3

	can_buckle = 1
	buckle_movable = 1
	buckle_lying = 0

	var/attack_log = null
	var/on = 0
	var/health = 100	//do not forget to set health for your vehicle!
	var/maxhealth = 100
	var/fire_dam_coeff = 1.0
	var/brute_dam_coeff = 1.0
	var/open = 0	//Maint panel
	var/locked = 1
	var/stat = 0
	var/emagged = 0
	var/powered = 0		//set if vehicle is powered and should use fuel when moving
	var/move_delay = 1	//set this to limit the speed of the vehicle

	var/obj/item/weapon/cell/cell
	var/charge_use = 200 //W

	var/load_item_visible = 1	//set if the loaded item should be overlayed on the vehicle sprite
	var/load_offset_x = 0		//pixel_x offset for item overlay
	var/load_offset_y = 0		//pixel_y offset for item overlay

/obj/vehicle_infinity/proc/explode()
	src.visible_message("<span class='danger'>\The [src] blows apart!</span>")
	var/turf/Tsec = get_turf(src)

	new /obj/item/stack/material/rods(Tsec)
	new /obj/item/stack/material/rods(Tsec)
	new /obj/item/stack/cable_coil/cut(Tsec)

	if(cell)
		cell.forceMove(Tsec)
		cell.update_icon()
		cell = null

	new /obj/effect/gibspawner/robot(Tsec)
	new /obj/effect/decal/cleanable/blood/oil(src.loc)

	qdel(src)

/obj/vehicle_infinity/proc/healthcheck()
	if(health <= 0)
		explode()