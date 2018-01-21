/obj/effect/landmark/overmap_target
	var/difficulty = 20 // Percentage chance of missing.

/obj/effect/landmark/overmap_target/Initialize()
	var/obj/effect/overmap/ship/linked = map_sectors["[z]"]
	if(istype(linked)) linked.targets |= src
	..()

/obj/effect/landmark/overmap_target/power_plant
	name = "fusion core"
	difficulty = 80

/obj/effect/landmark/overmap_target/bridge
	name = "bridge"
	difficulty = 80

/obj/effect/landmark/overmap_target/superstructure
	name = "center of mass"
	difficulty = 10

/obj/effect/landmark/overmap_target/port_thrusters
	name = "port thrusters"
	difficulty = 50

/obj/effect/landmark/overmap_target/starboard_thrusters
	name = "starboard thrusters"
	difficulty = 50

/obj/effect/landmark/overmap_target/port_weapons
	name = "port weapon battery"
	difficulty = 30

/obj/effect/landmark/overmap_target/starboard_weapons
	name = "starboard weapon battery"
	difficulty = 30

				/////////////
				//SEV Torch//
				/////////////


/obj/effect/landmark/overmap_target/torch
	name = "torch"
	difficulty = 5

/obj/effect/landmark/overmap_target/torch/first
	name = "bridge deck"

/obj/effect/landmark/overmap_target/torch/first/bridge
	name = "bridge"
	difficulty = 60

/obj/effect/landmark/overmap_target/torch/first/ai
	name = "AI core"
	difficulty = 70

/obj/effect/landmark/overmap_target/torch/first/hallway
	name = "top hallway"
	difficulty = 30

/obj/effect/landmark/overmap_target/torch/second
	name = "first deck"

/obj/effect/landmark/overmap_target/torch/second/medical
	name = "medical bay"
	difficulty = 30

/obj/effect/landmark/overmap_target/torch/second/rnd
	name = "research"
	difficulty = 30

/obj/effect/landmark/overmap_target/torch/second/vault
	name = "vault"
	difficulty = 30

/obj/effect/landmark/overmap_target/torch/second/hallway
	name = "middle hallway"
	difficulty = 30

/obj/effect/landmark/overmap_target/torch/second/portnacelle
	name = "first deck port nacelle"
	difficulty = 60

/obj/effect/landmark/overmap_target/torch/second/starbnacelle
	name = "first deck starboard nacelle"
	difficulty = 60

/obj/effect/landmark/overmap_target/torch/third
	name = "second deck"

obj/effect/landmark/overmap_target/torch/third/supermatter
	name = "supermatter reactor"
	difficulty = 80

obj/effect/landmark/overmap_target/torch/third/fussion
	name = "fussion reactor"
	difficulty = 80

/obj/effect/landmark/overmap_target/torch/fourth
	name = "third deck"

/obj/effect/landmark/overmap_target/torch/fourth/brig
	name = "brig"
	difficulty = 60

/obj/effect/landmark/overmap_target/torch/fourth/center
	name = "center mass"
	difficulty = 10

/obj/effect/landmark/overmap_target/torch/fourth/portnacelle
	name = "third deck port nacelle"
	difficulty = 60

/obj/effect/landmark/overmap_target/torch/fourth/starbnacelle
	name = "third deck starboard nacelle"
	difficulty = 60

/obj/effect/landmark/overmap_target/torch/fourth/canteen
	name = "canteen"
	difficulty = 50

/obj/effect/landmark/overmap_target/torch/fourth/upload
	name = "AI upload"
	difficulty = 70

/obj/effect/landmark/overmap_target/torch/fourth/missile
	name = "missile pod"
	difficulty = 60

/obj/effect/landmark/overmap_target/torch/fifth
	name = "fourth deck"

/obj/effect/landmark/overmap_target/torch/fifth/hangar
	name = "hangar"
	difficulty = 50

/obj/effect/landmark/overmap_target/torch/fifth/dockC
	name = "dock ports C"
	difficulty = 40

/obj/effect/landmark/overmap_target/torch/fifth/dockB
	name = "dock ports B"
	difficulty = 40

					/////////
					//Yacht//
					/////////

/obj/effect/landmark/overmap_target/yacht/bridge
	name = "bridge"
	difficulty = 60

/obj/effect/landmark/overmap_target/yacht/engine
	name = "engine"
	difficulty = 80

/obj/effect/landmark/overmap_target/yacht/superstructure
	name = "center of mass"
	difficulty = 10

/obj/effect/landmark/overmap_target/yacht/solars_right
	name = "solar arrays right"
	difficulty = 50

/obj/effect/landmark/overmap_target/yacht/solars_left
	name = "solar arrays left"
	difficulty = 50

/obj/effect/landmark/overmap_target/yacht/aft_starboard
	name = "aft starboard hull"
	difficulty = 40

/obj/effect/landmark/overmap_target/yacht/fore_starboard
	name = "fore starboard hull"
	difficulty = 30

/obj/effect/landmark/overmap_target/yacht/aft_port
	name = "aft port hull"
	difficulty = 30

/obj/effect/landmark/overmap_target/yacht/fore_port
	name = "fore port hull"
	difficulty = 30