
/datum/map_template/ruin/exoplanet/bunker
	name = "Bunker"
	id = "planetsite_bunker"
	description = "Bunch of monoliths surrounding an artifact."
	suffixes = list("bunker/bunker.dmm")
	cost = 1

/obj/machinery/telecomms/relay/preset/bunker
	id = "Bunker Relay"
	autolinkers = list("b_relay")

//AREAS//

/area/bunker
	name = "\improper Bunker"
	icon_state = "green"

//red, green, yellow, bluenew, dark

/area/bunker/living
	name = "Bunker Living Section"

/area/bunker/living/cryo
	name = "Bunker Cryogenic Storage"

/area/bunker/living/toilet
	name = "Bunker Toilet"

/area/bunker/engine
	name = "Bunker Engineering Section"
	icon_state = "yellow"

/area/bunker/storage
	name = "Bunker Storage"
	icon_state = "yellow"

/area/bunker/maint
	name = "Bunker North Maintenance"
	icon_state = "dark"

/area/bunker/maint/south
	name = "Bunker South Maintenance"

/area/bunker/maint/east
	name = "Bunker East Maintenance"

/area/bunker/maint/west
	name = "Bunker West Maintenance"

/area/bunker/hallway
	name = "Bunker North Hallway"

/area/bunker/hallway/central
	name = "Bunker Central Hallway"

/area/bunker/hallway/south
	name = "Bunker South Hallway"

/area/bunker/command
	name = "Bunker Communication Center"
	icon_state = "bluenew"

/area/bunker/command/armory
	name = "Bunker Armory"
	icon_state = "red"

/area/bunker/medical
	name = "Bunker Section"
	icon_state = "bluenew"

/area/bunker/eva
	icon_state = "bluenew"