/obj/random/trap //let's start this file with some traps
	name = "random trap"
	desc = "This is a placeholder for a random trap."
	icon = 'icons/obj/items.dmi'
	icon_state = "beartrap1"
	spawn_nothing_percentage = 50

/obj/random/trap/spawn_choices()
	return list(/obj/item/weapon/beartrap/deployed = 1) //"random" :^)

/obj/random/gloves/poor
	name = "random poor gloves"
	icon_state = "work"

/obj/random/gloves/poor/spawn_choices()
	return list(/obj/item/clothing/gloves/insulated = 1,
				/obj/item/clothing/gloves/thick = 4,
				/obj/item/clothing/gloves/white = 2,
				/obj/item/clothing/gloves/rainbow = 1,
				/obj/item/clothing/gloves/duty = 4,
				/obj/item/clothing/gloves/insulated/cheap = 3)

/obj/random/shoes/poor
	name = "random poor footwear"
	icon_state = "wizard"

/obj/random/shoes/poor/spawn_choices()
	return list(/obj/item/clothing/shoes/workboots = 3,
				/obj/item/clothing/shoes/jackboots = 1,
				/obj/item/clothing/shoes/laceup = 2,
				/obj/item/clothing/shoes/black = 4,
				/obj/item/clothing/shoes/dutyboots = 1,
				/obj/item/clothing/shoes/sandal = 2,
				/obj/item/clothing/shoes/brown = 4,
				/obj/item/clothing/shoes/red = 4,
				/obj/item/clothing/shoes/blue = 4,
				/obj/item/clothing/shoes/leather = 4)

/obj/random/hat/poor
	name = "random poor headgear"
	icon_state = "flat_cap"

/obj/random/hat/poor/spawn_choices()
	return list(/obj/item/clothing/head/helmet = 1,
				/obj/item/clothing/head/helmet/space/emergency = 1,
				/obj/item/clothing/head/hardhat = 4,
				/obj/item/clothing/head/ushanka = 3,
				/obj/item/clothing/head/bandana = 4,
				/obj/item/clothing/head/bowlerhat = 1,
				/obj/item/clothing/head/cardborg = 2,
				/obj/item/clothing/head/bandana/orange = 3,
				/obj/item/clothing/head/soft/grey = 3,
				/obj/item/clothing/head/flatcap = 3,
				/obj/item/clothing/head/welding = 1)


/obj/random/trash/space //Mostly remains and cleanable decals. Stuff a janitor could clean up
	name = "random space trash"
	desc = "This is some random trash."
	icon = 'icons/effects/effects.dmi'
	icon_state = "greenglow"

/obj/random/trash/space/spawn_choices()
	return list(/obj/item/weapon/ore/iron = 1,
				/obj/item/weapon/ore/glass = 5,
				/obj/item/stack/rods = 2,
				/obj/effect/decal/cleanable/ash = 5,
				/obj/effect/decal/cleanable/dirt = 3,
				/obj/item/remains/robot = 2)

/obj/random/snowland //Trees, grass, etc for snowland
	name = "random snowland flora"
	desc = "This is a random flora."
	icon = 'icons/obj/flora/snowflora.dmi'
	icon_state = "snowgrass1bb"
//	spawn_nothing_percentage = 20

/obj/random/snowland/spawn_choices()
	return list(/obj/structure/flora/bush = 5,
				/obj/structure/flora/grass/brown = 3,
				/obj/structure/flora/grass/both = 4,
				/obj/structure/flora/grass/green = 3,
				/obj/structure/flora/tree/dead = 3,
				/obj/structure/flora/tree/pine = 2)

//
// ORIGINAL DEFINES
//

/obj/random/masks/spawn_choices()
	return list(/obj/item/clothing/mask/gas = 4,
				/obj/item/clothing/mask/gas/alt = 3,
				/obj/item/clothing/mask/gas/half = 5,
				/obj/item/clothing/mask/gas/swat = 1,
				/obj/item/clothing/mask/gas/syndicate = 1,
				/obj/item/clothing/mask/breath = 6,
				/obj/item/clothing/mask/breath/medical = 4,
				/obj/item/clothing/mask/balaclava = 3,
				/obj/item/clothing/mask/balaclava/tactical = 2,
				/obj/item/clothing/mask/surgical = 4)

/obj/random/shoes/spawn_choices()
	return list(/obj/item/clothing/shoes/workboots = 3,
				/obj/item/clothing/shoes/jackboots = 3,
				/obj/item/clothing/shoes/galoshes = 2,
				/obj/item/clothing/shoes/magboots = 1,
				/obj/item/clothing/shoes/laceup = 4,
				/obj/item/clothing/shoes/black = 4,
				/obj/item/clothing/shoes/dutyboots = 3,
				/obj/item/clothing/shoes/dress = 3,
				/obj/item/clothing/shoes/dress/white = 3,
				/obj/item/clothing/shoes/sandal = 3,
				/obj/item/clothing/shoes/brown = 4,
				/obj/item/clothing/shoes/red = 4,
				/obj/item/clothing/shoes/blue = 4,
				/obj/item/clothing/shoes/leather = 4)

/obj/random/gloves/spawn_choices()
	return list(/obj/item/clothing/gloves/insulated = 2,
				/obj/item/clothing/gloves/thick = 3,
				/obj/item/clothing/gloves/thick/modified = 1,
				/obj/item/clothing/gloves/thick/botany = 5,
				/obj/item/clothing/gloves/duty = 3,
				/obj/item/clothing/gloves/latex = 4,
				/obj/item/clothing/gloves/latex/modified = 1,
				/obj/item/clothing/gloves/white = 5,
				/obj/item/clothing/gloves/rainbow = 1,
				/obj/item/clothing/gloves/insulated/cheap = 7)

/obj/random/glasses/spawn_choices()
	return list(/obj/item/clothing/glasses/eyepatch = 2,
				/obj/item/clothing/glasses/gglasses = 4,
				/obj/item/clothing/glasses/regular = 3,
				/obj/item/clothing/glasses/sunglasses = 5,
				/obj/item/clothing/glasses/sunglasses/big = 2,
				/obj/item/clothing/glasses/sunglasses/blindfold = 1,
				/obj/item/clothing/glasses/sunglasses/sechud = 1,
				/obj/item/clothing/glasses/hud/health = 2,
				/obj/item/clothing/glasses/hud/janitor = 1,
				/obj/item/clothing/glasses/material = 1,
				/obj/item/clothing/glasses/meson = 2,
				/obj/item/clothing/glasses/science = 1,
				/obj/item/clothing/glasses/welding = 1,
				/obj/item/clothing/glasses/threedglasses = 1,
				/obj/item/clothing/glasses/monocle = 1)

/obj/random/hat/spawn_choices()
	return list(/obj/item/clothing/head/helmet = 2,
				/obj/item/clothing/head/helmet/space/emergency = 1,
				/obj/item/clothing/head/bio_hood/general = 1,
				/obj/item/clothing/head/hardhat = 4,
				/obj/item/clothing/head/hardhat/orange = 4,
				/obj/item/clothing/head/hardhat/red = 4,
				/obj/item/clothing/head/hardhat/dblue = 4,
				/obj/item/clothing/head/ushanka = 3,
				/obj/item/clothing/head/welding = 2,
				/obj/item/clothing/head/bandana = 2,
				/obj/item/clothing/head/boaterhat = 1,
				/obj/item/clothing/head/bowler = 2,
				/obj/item/clothing/head/bowlerhat = 1,
				/obj/item/clothing/head/cardborg = 2,
				/obj/item/clothing/head/chefhat = 1,
				/obj/item/clothing/head/cowboy_hat = 1,
				/obj/item/clothing/head/fedora = 2,
				/obj/item/clothing/head/festive = 1,
				/obj/item/clothing/head/flatcap = 2,
				/obj/item/clothing/head/mailman = 1,
				/obj/item/clothing/head/welding = 1,)

/obj/random/suit/spawn_choices()
	return list(/obj/item/clothing/suit/storage/hazardvest = 4,
				/obj/item/clothing/suit/storage/toggle/labcoat = 4,
				/obj/item/clothing/suit/space/emergency = 1,
				/obj/item/clothing/suit/armor/pcarrier/light = 2,
				/obj/item/clothing/suit/storage/toggle/bomber = 3,
				/obj/item/clothing/suit/chef/classic = 3,
				/obj/item/clothing/suit/surgicalapron = 2,
				/obj/item/clothing/suit/apron/overalls = 3,
				/obj/item/clothing/suit/bio_suit/general = 1,
				/obj/item/clothing/suit/storage/toggle/hoodie/black = 3,
				/obj/item/clothing/suit/storage/toggle/brown_jacket = 3,
				/obj/item/clothing/suit/storage/leather_jacket = 3,
				/obj/item/clothing/suit/apron = 4)

/obj/random/clothing/spawn_choices()
	return list(/obj/item/clothing/under/syndicate/tacticool = 2,
				/obj/item/clothing/under/syndicate/combat = 1,
				/obj/item/clothing/under/hazard = 4,
				/obj/item/clothing/under/sterile = 4,
				/obj/item/clothing/under/casual_pants/camo = 2,
				/obj/item/clothing/under/frontier = 2,
				/obj/item/clothing/under/harness = 2,
				/obj/item/clothing/under/rank/medical/paramedic = 2,
				/obj/item/clothing/under/overalls = 2,
				/obj/item/clothing/ears/earmuffs = 2,
				/obj/item/clothing/under/tactical = 1,
				/obj/item/clothing/under/waiter = 1,
				)

/obj/random/hardsuit/spawn_choices()
	return list(/obj/item/weapon/rig/industrial,
				/obj/item/weapon/rig/eva,
				/obj/item/weapon/rig/light/hacker,
				/obj/item/weapon/rig/light/stealth,
				/obj/item/weapon/rig/light,
				/obj/item/weapon/rig/unathi)
