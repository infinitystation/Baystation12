/*
 * Sierra Service
 */

/obj/structure/closet/chefcloset_sierra
	name = "chef's closet"
	desc = "It's a storage unit for foodservice equipment."
	icon_state = "black"
	icon_closed = "black"

/obj/structure/closet/chefcloset_sierra/WillContain()
	return list(
		/obj/item/clothing/head/soft/mime,
		/obj/item/device/radio/headset/headset_service,
		/obj/item/weapon/storage/box/mousetraps = 2,
		/obj/item/clothing/under/rank/chef,
		/obj/item/clothing/gloves/latex,
		/obj/item/weapon/reagent_containers/spray/cleaner,
		/obj/item/clothing/head/chefhat,
		/obj/item/clothing/suit/chef/classic
	)

/obj/structure/closet/secure_closet/hydroponics_sierra //done so that it has no access reqs
	name = "hydroponics locker"
	req_access = list()
	icon_state = "hydrosecure1"
	icon_closed = "hydrosecure"
	icon_locked = "hydrosecure1"
	icon_opened = "hydrosecureopen"
	icon_off = "hydrosecureoff"

/obj/structure/closet/secure_closet/hydroponics_sierra/WillContain()
	return list(
		/obj/item/clothing/head/soft/green,
		/obj/item/weapon/storage/plants,
		/obj/item/device/analyzer/plant_analyzer,
		/obj/item/weapon/material/minihoe,
		/obj/item/clothing/gloves/thick/botany,
		/obj/item/weapon/material/hatchet,
		/obj/item/weapon/wirecutters/clippers,
		/obj/item/weapon/reagent_containers/spray/plantbgone,
		new /datum/atom_creator/weighted(list(/obj/item/clothing/suit/apron, /obj/item/clothing/suit/apron/overalls)),
		new /datum/atom_creator/weighted(list(/obj/item/weapon/storage/backpack/hydroponics, /obj/item/weapon/storage/backpack/satchel/hyd)),
		new /datum/atom_creator/simple(/obj/item/weapon/storage/backpack/messenger/hyd, 50)
	)

/obj/structure/closet/jcloset/sierra/WillContain()
	return list(
		/obj/item/clothing/head/beret/purple,
		/obj/item/clothing/head/soft/purple,
		/obj/item/clothing/under/rank/janitor,
		/obj/item/clothing/head/soft/darkred,
		/obj/item/clothing/under/rank/janitor/white,
		/obj/item/device/radio/headset/headset_service,
		/obj/item/clothing/suit/storage/janjacket,
		/obj/item/clothing/gloves/thick,
		/obj/item/device/flashlight/upgraded,
		/obj/item/weapon/caution = 4,
		/obj/item/device/lightreplacer,
		/obj/item/weapon/storage/bag/trash,
		/obj/item/clothing/shoes/dutyboots,
		/obj/item/weapon/grenade/chem_grenade/cleaner = 2,
		/obj/item/weapon/reagent_containers/spray/cleaner,
		/obj/item/clothing/shoes/galoshes,
		/obj/item/weapon/storage/box/detergent,
		/obj/item/holosign_creator,
		/obj/item/clothing/glasses/hud/janitor,
		/obj/item/weapon/soap/nanotrasen
	)

/obj/structure/closet/secure_closet/bar_sierra
	name = "bar locker"
	desc = "It's a storage unit for bar equipment."
	req_access = list(access_bar)

/obj/structure/closet/secure_closet/bar_sierra/WillContain()
	return list(
		/obj/item/clothing/head/soft/black,
		/obj/item/device/radio/headset/headset_service,
		/obj/item/weapon/reagent_containers/food/drinks/shaker,
		/obj/item/glass_jar,
		/obj/item/weapon/book/manual/barman_recipes,
		/obj/item/weapon/storage/box/flashshells,
		/obj/item/clothing/under/rank/bartender,
		/obj/item/clothing/gloves/thick,
		/obj/item/clothing/gloves/white,
		/obj/item/weapon/storage/box/lights/bulbs/bar,
		/obj/item/clothing/shoes/laceup,
		/obj/item/weapon/storage/pill_bottle/dylovene,
		/obj/item/weapon/reagent_containers/spray/cleaner,
		/obj/item/weapon/reagent_containers/glass/rag,
		/obj/item/sticky_pad/random,
		/obj/item/weapon/paper/bar_permit,
		/obj/item/weapon/gun/projectile/shotgun/doublebarrel/empty
	)

