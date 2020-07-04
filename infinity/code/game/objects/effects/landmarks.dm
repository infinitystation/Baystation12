/obj/effect/landmark/explosion //landmarks for explosions at game start
	name = "explosion landmarker"
	delete_me = 0

/obj/effect/landmark/explosion/Initialize()
	START_PROCESSING(SSobj, src)
	. = ..()

/obj/effect/landmark/explosion/Destroy()
	STOP_PROCESSING(SSobj, src)
	. = ..()

/obj/effect/landmark/explosion/light/Process()
	if(GAME_STATE == RUNLEVEL_GAME)
		explosion(src.loc, -1, -1, 2, 3, 0)
		qdel(src)

/obj/effect/landmark/explosion/medium/Process()
	if(GAME_STATE == RUNLEVEL_GAME)
		explosion(src.loc, 1, 2, 4, 6, 0)
		qdel(src)

/obj/effect/landmark/explosion/heavy/Process()
	if(GAME_STATE == RUNLEVEL_GAME)
		explosion(src.loc, 2, 4, 7, 10, 0)
		qdel(src)
