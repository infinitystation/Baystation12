/datum/gear/pet_cube
	display_name = "PetCube X"
	description = "Just add a water!"
	path = /obj/item/weapon/reagent_containers/food/snacks/monkeycube
	required_donate_level = 5

/datum/gear/pet_cube/New()
	. = ..()
	var/cubes = list(
		"Lizard PetCube" = /obj/item/weapon/reagent_containers/food/snacks/monkeycube/lizard,
		"Mouse PetCube" = /obj/item/weapon/reagent_containers/food/snacks/monkeycube/mouse,
		"Corgi PetCube" = /obj/item/weapon/reagent_containers/food/snacks/monkeycube/corgi,
		"Cat PetCube" = /obj/item/weapon/reagent_containers/food/snacks/monkeycube/cat,
	)
	gear_tweaks += new /datum/gear_tweak/path(cubes)
