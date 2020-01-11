/obj/proc/trip_check(mob/user as mob)
	for(var/obj/structure/catwalk/C in get_turf(src))
		return (C.hatch_open) // means if hatch open - TRUE, otherwise FALSE
	if(!ishuman(user) || !has_gravity(src) || user.resting || user.can_overcome_gravity() || !MOVING_QUICKLY(user))
		return FALSE
	return TRUE

/obj/proc/trip_act(mob/living/carbon/M as mob)
	if(!M || !ishuman(M)) return
	M.apply_damage(5, BRUTE)
	M.slip(src, 6)
	M.visible_message(\
		"<span class='warning'>[M] trips over \the [src]!</span>",\
		"<span class='notice'>You trip over \the [src]!</span>")

/obj/Crossed(mob/living/carbon/M as mob)
	..()
	if(obj_flags & OBJ_FLAG_TRIPPABLE)
		if(prob(5) && trip_check(M))
			trip_act(M)

// Pipes
/obj/machinery/atmospherics/pipe
	obj_flags = OBJ_FLAG_TRIPPABLE

/obj/machinery/atmospherics/pipe/trip_check(mob/user as mob)
	var/turf/T = src.loc
	if(!T.is_plating())
		return FALSE
	if(initialize_directions & user.dir)
		return FALSE
	. = ..()

// Cables
/obj/structure/cable
	obj_flags = OBJ_FLAG_TRIPPABLE

/obj/structure/cable/trip_check(mob/user as mob)
	var/turf/T = src.loc
	if(!T.is_plating())
		return FALSE
	if((user.dir == d1 || user.dir == d2))
		return FALSE
	. = ..()

// Disposals
/obj/structure/disposalpipe
	obj_flags = OBJ_FLAG_TRIPPABLE

/obj/structure/disposalpipe/trip_check(mob/user as mob)
	var/turf/T = src.loc
	if(!T.is_plating())
		return FALSE
	if(dpdir & user.dir)
		return FALSE
	. = ..()