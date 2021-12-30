/obj/structure/alien/resin
	name = "resin"
	desc = "Looks like some kind of slimy growth."
	icon_state = "resin"

	density = TRUE
	opacity = TRUE
	anchored = TRUE
	health = 200

/obj/structure/alien/resin/Initialize()
	for(var/obj/structure/alien/resin/resin in range(1, src))
		resin.update_icon()
	. = ..()

/obj/structure/alien/resin/Destroy()
	for(var/obj/structure/alien/resin/resin in range(1, src))
		resin.update_icon()
	. = ..()

/obj/structure/alien/resin/on_update_icon()
	. = ..()
	var/list/cardinal_neighbors = list()

	for(var/check_dir in GLOB.cardinal)
		var/turf/simulated/T = get_step(get_turf(src), check_dir)
		if(istype(T))
			cardinal_neighbors |= T

	var/rot = 0

	for(var/obj/structure/alien/resin/resin in range(1, src))
		if(istype(resin))
			if(resin.loc in cardinal_neighbors)
				var/cur_rot = 0.5
				for(var/neighbor in cardinal_neighbors)
					cur_rot = cur_rot * 2
					if(resin.loc == neighbor)
						break
				rot += cur_rot

	icon_state = "[initial(icon_state)][rot]"

/obj/structure/alien/resin/wall
	name = "resin wall"
	desc = "Purple slime solidified into a wall."
	icon_state = "wall"

/obj/structure/alien/resin/membrane
	name = "resin membrane"
	desc = "Purple slime just thin enough to let light pass through."
	icon_state = "membrane"
	opacity = 0
	health = 120

/obj/structure/alien/resin/New()
	..()
	var/turf/T = get_turf(src)
	T.thermal_conductivity = WALL_HEAT_TRANSFER_COEFFICIENT

/obj/structure/alien/resin/Destroy()
	var/turf/T = get_turf(src)
	T.thermal_conductivity = initial(T.thermal_conductivity)
	..()

/obj/structure/alien/resin/attack_hand(var/mob/user)
	user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
	if (MUTATION_HULK in user.mutations)
		visible_message("<span class='danger'>\The [user] destroys \the [name]!</span>")
		health = 0
	else
		// Aliens can get straight through these.
		if(istype(user,/mob/living/carbon))
			var/mob/living/carbon/M = user
			if(locate(/obj/item/organ/internal/xeno/hivenode) in M.internal_organs)
				visible_message("<span class='alium'>\The [user] strokes \the [name] and it melts away!</span>")
				health = 0
				healthcheck()
				return
		visible_message("<span class='danger'>\The [user] claws at \the [src]!</span>")
		// Todo check attack datums.
		health -= rand(2,6)
	healthcheck()
	return
