/obj/effect/landmark/random_gen/asteroid_poor/Initialize()
	. = ..()

	if (!config.generate_map)
		return

	var/min_x = 1
	var/min_y = 1
	var/max_x = world.maxx
	var/max_y = world.maxy

	if (generation_width)
		min_x = max(src.x, min_x)
		max_x = min(src.x + generation_width, max_x)
	if (generation_height)
		min_y = max(src.y, min_y)
		max_y = min(src.y + generation_height, max_y)

	new /datum/random_map/automata/cave_system(seed, min_x, min_y, src.z, max_x, max_y)
	new /datum/random_map/noise/ore/poor(seed, min_x, min_y, src.z, max_x, max_y)

	GLOB.using_map.refresh_mining_turfs(src.z)

/obj/effect/landmark/explosion //landmarks for explosions at game start
	name = "explosion landmarker"
	delete_me = 1

/obj/effect/landmark/explosion/light/New()
	explosion(src.loc, -1, -1, 2, 3)
	..()

/obj/effect/landmark/explosion/medium/New()
	explosion(src.loc, 1, 2, 4, 6)
	..()

/obj/effect/landmark/explosion/heavy/New()
	explosion(src.loc, 2, 4, 7, 10)
	..()
