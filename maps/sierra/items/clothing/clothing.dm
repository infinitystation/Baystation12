//Try to keep this limited. I don't want unique solgov or NT items in here, it should only be things that require the torch map datums like access.

/obj/item/weapon/rig/hazard/guard
	name = "hazard hardsuit control module"

/obj/item/clothing/head/helmet/space/rig/hazard/guard
	camera = /obj/machinery/camera/network/research

/obj/item/weapon/rig/hazard/guard

	initial_modules = list(
		/obj/item/rig_module/maneuvering_jets,
		/obj/item/rig_module/ai_container,
		/obj/item/rig_module/mounted/taser
		)

/obj/item/clothing/under/rank/security2/adjutant //KOSTIL, NARISOVAT TODO:INFINITY
	name = "adjutant's uniform"
	desc = "It's made of a special fiber that gives special protection against strong language."
	armor = list(melee = 0, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 0, rad = 0)
	siemens_coefficient = 1
