/obj/structure/alien/weeds/node
	name = "alien weed node"
	icon_state = "weednode"
	health = 45

/obj/structure/alien/weeds/node/SetRandomIcon_State()
	node = src

/obj/structure/alien/weeds
	name = "alien weeds"
	icon_state = "weeds-1"
	desc = "Some kind of strange, pulsating weeds."
	health = 45

	layer = PLANT_LAYER
	plane = DEFAULT_PLANE

	var/obj/structure/alien/weeds/node/node
	var/max_distance = 3
	var/distance = 0

/obj/structure/alien/weeds/proc/SetRandomIcon_State()
	icon_state = "weeds-[rand(1,3)]"

/obj/structure/alien/weeds/Initialize()
	. = ..()

	max_distance = rand(2,4)
	SetRandomIcon_State()

	for(var/obj/structure/alien/weeds/weeds in range(1, src))
		weeds.update_icon()

	if(node)
		addtimer(CALLBACK(src, .proc/spread), rand(1,3) SECONDS)

/obj/structure/alien/weeds/proc/spread()

	if(distance > max_distance)
		if(node)
			addtimer(CALLBACK(src, .proc/spread), rand(5,10) SECONDS)
		return

	for(var/direction in GLOB.cardinal)
		var/turf/turf_to_check = get_step(src,direction)
		if(istype(turf_to_check, /turf/simulated/floor) && (!locate(/obj/structure/alien/weeds) in turf_to_check) && (!locate(/obj/structure/wall_frame) in turf_to_check))
			var/obj/structure/alien/weeds/weeds = new(turf_to_check)
			weeds.distance = distance + 1
			weeds.node = node
			addtimer(CALLBACK(weeds, .proc/spread), rand(5,10) SECONDS)

	if(node)
		addtimer(CALLBACK(src, .proc/spread), rand(5,10) SECONDS)

/obj/structure/alien/weeds/Destroy()

	for(var/obj/structure/alien/weeds/weeds in range(1, src))
		weeds.update_icon()
	. = ..()

/obj/structure/alien/weeds/Crossed(var/mob/living/carbon/human/M)
	. = ..()
	if(istype(M))
		var/mob/living/carbon/human/H = M
		if(isxenomorph(H))
			return

		if(prob(5))
			H.apply_effect(1, WEAKEN, 0)
			H.apply_effect(1, STUN, 0)
			to_chat(H, SPAN_DANGER("Alien weeds grabs and pushes you onto them!"))


/obj/structure/alien/weeds/on_update_icon()
	. = ..()

	overlays.Cut()

	for(var/direction in GLOB.cardinal)
		var/turf/turf_to_check = get_step(src,direction)
		if(!locate(/obj/structure/alien/weeds) in turf_to_check)
			var/image/weeds_side
			switch(direction)
				if(NORTH)
					weeds_side = image(icon, "weeds_side_s")
					weeds_side.pixel_y += world.icon_size
				if(SOUTH)
					weeds_side = image(icon, "weeds_side_n")
					weeds_side.pixel_y -= world.icon_size
				if(EAST)
					weeds_side = image(icon, "weeds_side_w")
					weeds_side.pixel_x += world.icon_size
				if(WEST)
					weeds_side = image(icon, "weeds_side_e")
					weeds_side.pixel_x -= world.icon_size
			overlays += weeds_side
