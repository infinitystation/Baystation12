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

	var/health = 100	//do not forget to set health for your vehicle!
	var/maxhealth = 100
	var/move_delay = 1	//set this to limit the speed of the vehicle

/obj/vehicle_infinity/proc/healthcheck()
	return