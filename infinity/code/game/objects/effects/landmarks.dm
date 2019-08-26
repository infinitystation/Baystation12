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
