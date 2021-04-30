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

/datum/gear/bikehorn
	display_name = "bike horn"
	description = "for real aesthetes"
	path = /obj/item/weapon/bikehorn
	required_donate_level = 1

/datum/gear/bikehorn/rubberducky
	display_name = "rubber duck"
	description = "QUACK"
	path = /obj/item/weapon/bikehorn/rubberducky
	required_donate_level = 1

/datum/gear/premium_alcohol
	display_name = "expensive alcohol"
	description = "sometimes it turns out that the bar is closed, but you want a drink."
	path = /obj/item/weapon/reagent_containers/food/drinks/bottle/premiumvodka
	required_donate_level = 1

/datum/gear/premium_alcohol/New()
	. = ..()
	var/list/premium_alcohol_list = list(
		"Vodka" = /obj/item/weapon/reagent_containers/food/drinks/bottle/premiumvodka,
		"VIne" = /obj/item/weapon/reagent_containers/food/drinks/bottle/premiumwine,
		"Whiskey" = /obj/item/weapon/reagent_containers/food/drinks/bottle/specialwhiskey,
		"Nothing" = /obj/item/weapon/reagent_containers/food/drinks/bottle/bottleofnothing,
		"Vermouth" = /obj/item/weapon/reagent_containers/food/drinks/bottle/vermouth,
	)
	gear_tweaks += new /datum/gear_tweak/path(premium_alcohol_list)

/datum/gear/pizzabox
	display_name = "pizza box"
	description = "pizza time"
	path = /obj/item/pizzabox/margherita
	required_donate_level = 1

/datum/gear/pizzabox/New()
	. = ..()
	var/list/pizza_box_list = list(
		"Margherita" = /obj/item/pizzabox/margherita ,
		"Mushroom" = /obj/item/pizzabox/mushroom,
		"Meat" = /obj/item/pizzabox/meat,
		"Vegetable" = /obj/item/pizzabox/vegetable,
	)
	gear_tweaks += new /datum/gear_tweak/path(pizza_box_list)

/datum/gear/musical_instruments
	display_name = "musical instruments"
	description = "let's DOOT"
	path = /obj/item/device/synthesized_instrument/synthesizer
	required_donate_level = 1

/datum/gear/musical_instruments/New()
	. = ..()
	var/list/musical_instruments_list = list(
		"Synthesizer" = /obj/item/device/synthesized_instrument/synthesizer,
		"Polyguitar" = /obj/item/device/synthesized_instrument/guitar/multi,
		"Guitar" = /obj/item/device/synthesized_instrument/guitar,
		"Trumpet" = /obj/item/device/synthesized_instrument/trumpet,
	)
	gear_tweaks += new /datum/gear_tweak/path(musical_instruments_list)

/datum/gear/costume_bags
	display_name = "Costume bags"
	description = "time for some fashion"
	path = /obj/item/weapon/clothingbag/costume/chaplain
	required_donate_level = 1

/datum/gear/costume_bags/New()
	. = ..()
	var/list/costume_bags_list = list(
		"Clown" = /obj/item/weapon/clothingbag/costume/clown,
		"Witch" = /obj/item/weapon/clothingbag/costume/witch,
		"Chaplain" = /obj/item/weapon/clothingbag/costume/chaplain,
	)
	gear_tweaks += new /datum/gear_tweak/path(costume_bags_list)
