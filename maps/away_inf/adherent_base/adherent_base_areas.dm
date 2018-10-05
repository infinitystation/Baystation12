/area/adherent_base
	icon_state = "mining"
	always_unpowered = 1
	alwaysgravity = 1

	fire = 0
	atmos = 0
	atmosalm = 0
	poweralm = 0
	party = 0

	lightswitch = 0
	sound_env = UNDERWATER

/area/adherent_base/surface
	name = "ocean surface"
	icon_state = "explored"
	ambience = list('sound/ambience/shore.ogg')

/area/adherent_base/underwater
	name = "underwater"
	icon_state = "unexplored"

/area/adherent_base/base
	name = "adherent base"
	always_unpowered = 0
	sound_env = STANDARD_STATION

/area/adherent_base/deep
	name = "deep underwater"
