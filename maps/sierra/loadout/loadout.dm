/datum/gear/pet_cube
	display_name = "PetCube X"
	description = "Just add a water!"
	path = /obj/item/weapon/reagent_containers/food/snacks/monkeycube
	required_donate_level = 4
	cost = 0 // Управлением решено убрать обычную цену с донатерских вещей ~bear1ake

/datum/gear/pet_cube/New()
	. = ..()
	var/cubes = list(
		"Cat PetCube" = /obj/item/weapon/reagent_containers/food/snacks/monkeycube/cat,
		"Corgi PetCube" = /obj/item/weapon/reagent_containers/food/snacks/monkeycube/corgi,
		"Lizard PetCube" = /obj/item/weapon/reagent_containers/food/snacks/monkeycube/lizard,
		"Mouse PetCube" = /obj/item/weapon/reagent_containers/food/snacks/monkeycube/mouse,
	)
	gear_tweaks += new /datum/gear_tweak/path(cubes)

/datum/gear/pet_holder
	display_name = "exotic pet"
	description = "Not common pet"
	path = /obj/item/weapon/holder/crab/prepared
	required_donate_level = 5
	price = 20 // Не входит в стандартный набор, так что пусть стоит кое-чего
	cost = 0

/datum/gear/pet_holder/New()
	. = ..()
	var/pets = list(
		"Crab" = /obj/item/weapon/holder/crab/prepared,
		"Crow" = /obj/item/weapon/holder/crow/prepared,
		"Fox" = /obj/item/weapon/holder/fox/prepared,
		"Rabbit" = /obj/item/weapon/holder/rabbit/prepared,
		"Snake" = /obj/item/weapon/holder/snake/prepared/safe,
	)
	gear_tweaks += new /datum/gear_tweak/path(pets)

/datum/gear/tactical/light_pcarrier
	display_name = "light armored plate carrier"
	description = "With additional light armor plate"
	path = /obj/item/clothing/suit/armor/pcarrier/light
	required_donate_level = 2
	price = 50 // Хоть и слабая, но всё же защита. Она должна быть достаточно дорогой
	cost = 0

/datum/gear/pmp_w_tape
	display_name = "music player"
	description = "With custom tape"
	path = /obj/item/music_player/radio/custom_tape
	required_donate_level = 3
	cost = 0

/datum/gear/pmp_w_tape/New()
	. = ..()
	var/players = list(
		"Radio" = /obj/item/music_player/radio/custom_tape,
		"Cassett" = /obj/item/music_player/csplayer/custom_tape,
		"Dusty" = /obj/item/music_player/dusty/custom_tape,
	)
	gear_tweaks += new /datum/gear_tweak/path(players)

/datum/gear/boombox_w_tape
	display_name = "boombox"
	description = "With custom tape"
	path = /obj/item/music_player/boombox/custom_tape
	required_donate_level = 5
	price = 25 // Не входит в стандартный набор и является так-то убийственной штукой
	cost = 0