/obj
	var/trip_chance = 5

/obj/Crossed(mob/living/carbon/human/H as mob)
	. = ..()
	if(trip_chance && prob(trip_chance) && trip_check(H))
		H.trip_act(src)

/obj/proc/trip_check(mob/user as mob)
	if(!ishuman(user) || !has_gravity(src) || user.resting || user.can_overcome_gravity() || !MOVING_QUICKLY(user))
		return FALSE
	for(var/obj/structure/catwalk/C in get_turf(src))
		return (C.hatch_open) // means if hatch open - TRUE, otherwise FALSE
	return TRUE

/mob/living/carbon/human/proc/trip_act(var/obj/O)
	apply_damage(5, BRUTE)
	slip(src, 6)
	visible_message(\
		SPAN_WARNING("[src] trips over \the [O]!"),\
		SPAN_NOTICE("You trip over \the [O]!"))

// Pipes
/obj/machinery/atmospherics/pipe/trip_check(mob/user as mob)
	var/turf/T = src.loc
	if(!T.is_plating())
		return FALSE
	if(initialize_directions & user.dir)
		return FALSE
	. = ..()

// Cables
/obj/structure/cable/trip_check(mob/user as mob)
	var/turf/T = src.loc
	if(!T.is_plating())
		return FALSE
	if((user.dir == d1 || user.dir == d2))
		return FALSE
	. = ..()

// Disposals
/obj/structure/disposalpipe/trip_check(mob/user as mob)
	var/turf/T = src.loc
	if(!T.is_plating())
		return FALSE
	if(dpdir & user.dir)
		return FALSE
	. = ..()
