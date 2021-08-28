/obj/machinery/vending
	var/restockable = 1

/obj/machinery/vending/clothing
	name = "ClothesMate" //renamed to make the slogan rhyme
	icon = 'infinity/icons/obj/vending.dmi'
	desc = "A clothing vending machine"
	icon_state = "clothes"
	product_slogans = "Dress for success!;Prepare to look swagalicious!;Look at all this free swag!;Why leave style up to fate? Use the ClothesMate!"
	vend_delay = 15
	vend_reply = "Thank you for using the ClothesMate!"
	products = list(/obj/item/clothing/under/pj/red = 1, /obj/item/clothing/under/pj/blue = 1,
					/obj/item/clothing/under/scratch = 1, /obj/item/clothing/under/sl_suit = 1, /obj/item/clothing/under/waiter = 1,
					/obj/item/clothing/under/rank/mailman = 1, /obj/item/clothing/under/gentlesuit = 1, /obj/item/clothing/under/psysuit = 1,
					/obj/item/clothing/under/dress/dress_fire = 1, /obj/item/clothing/under/dress/dress_orange = 1, /obj/item/clothing/under/suit_jacket/charcoal = 1,
					/obj/item/clothing/under/cheongsam = 1, /obj/item/clothing/mask/gas/plaguedoctor = 1, /obj/item/clothing/suit/bio_suit/plaguedoctorsuit = 1
					)

/obj/machinery/vending/clothing/tact
	name = "ClothesTact"
	products = list(/obj/item/clothing/mask/gas = 3, /obj/item/clothing/mask/gas/half = 3, /obj/item/clothing/mask/gas/syndicate = 3, /obj/item/clothing/mask/gas/alt = 3,
					/obj/item/clothing/under/casual_pants/baggy/camo = 3, /obj/item/clothing/under/syndicate/combat = 3, /obj/item/clothing/under/tactical = 3,
					/obj/item/clothing/mask/balaclava = 3, /obj/item/clothing/mask/balaclava/tactical = 3,
					/obj/item/clothing/accessory/armband/engine = 3, /obj/item/clothing/accessory/armband/med = 3, /obj/item/clothing/accessory/armband = 3)
/*
/obj/machinery/vending/security_clothes
	name = "Security clothes"
	desc = "All our clothes - it is your clothes!"
	icon = 'infinity/icons/obj/vending.dmi'
	icon_state = "sec"
	icon_deny = "sec-deny"
	vend_delay = 15
	req_access = list(access_security)
	products = list(/obj/item/clothing/head/soft/sec = 5,
					/obj/item/clothing/head/soft/sec/corp = 5,
					/obj/item/clothing/head/beret/sec/corporate/officer = 5,
					/obj/item/clothing/head/beret/sec/navy/officer = 5,
					/obj/item/clothing/under/rank/security = 5,
					/obj/item/clothing/under/rank/security2 = 5,
					/obj/item/clothing/under/rank/security/corp =  5,
					/obj/item/storage/backpack/dufflebag/sec = 2,
					/obj/item/storage/backpack/satchel_sec = 3,
					/obj/item/storage/backpack/security = 3,
					/obj/item/clothing/accessory/armband = 7,
					/obj/item/clothing/accessory/badge/holo = 5,
					/obj/item/clothing/accessory/badge/holo/cord = 5,
					/obj/item/clothing/accessory/storage/holster/thigh = 5,
					/obj/item/clothing/accessory/storage/black_vest = 5,
					/obj/item/clothing/shoes/jackboots = 5,
					/obj/item/clothing/shoes/jackboots/unathi = 3)
	premium = list(/obj/item/clothing/under/tactical = 1,
					/obj/item/clothing/under/rank/guard = 1,
					/obj/item/clothing/under/rank/security = 1,
					/obj/item/clothing/glasses/hud/security = 1)
*/
/obj/machinery/vending/cola/small
	name = "Robust Softdrinks"
	desc = "A softdrink vendor provided by Robust Industries, LLC."
	density = FALSE
	icon = 'infinity/icons/obj/vending.dmi'
	icon_state = "Cola_Machine_small"
	icon_vend = "Cola_Machine_small-vend"
	products = list(/obj/item/reagent_containers/food/drinks/cans/cola = 5,/obj/item/reagent_containers/food/drinks/cans/space_mountain_wind = 5,
					/obj/item/reagent_containers/food/drinks/cans/dr_gibb = 5,
					/obj/item/reagent_containers/food/drinks/cans/waterbottle = 5,/obj/item/reagent_containers/food/drinks/cans/space_up = 5,
					/obj/item/reagent_containers/food/drinks/cans/iced_tea = 5, /obj/item/reagent_containers/food/drinks/cans/grape_juice = 5)
	contraband = list(/obj/item/reagent_containers/food/drinks/cans/thirteenloko = 5, /obj/item/reagent_containers/food/snacks/liquidfood = 5)
	prices = list(/obj/item/reagent_containers/food/drinks/cans/cola = 1,/obj/item/reagent_containers/food/drinks/cans/space_mountain_wind = 1,
					/obj/item/reagent_containers/food/drinks/cans/dr_gibb = 1,
					/obj/item/reagent_containers/food/drinks/cans/waterbottle = 2,/obj/item/reagent_containers/food/drinks/cans/space_up = 1,
					/obj/item/reagent_containers/food/drinks/cans/iced_tea = 1,/obj/item/reagent_containers/food/drinks/cans/grape_juice = 1)

/obj/machinery/vending/coffee/small
	name = "Hot Drinks machine"
	desc = "A vending machine which dispenses hot drinks."
	density = FALSE
	icon = 'infinity/icons/obj/vending.dmi'
	icon_state = "Covfefe_Machine_small"
	icon_vend = "Covfefe_Machine_small-vend"
	products = list(/obj/item/reagent_containers/food/drinks/coffee = 5,/obj/item/reagent_containers/food/drinks/tea = 5,/obj/item/reagent_containers/food/drinks/h_chocolate = 5)
	contraband = list(/obj/item/reagent_containers/food/drinks/ice = 5)
	prices = list(/obj/item/reagent_containers/food/drinks/coffee = 3, /obj/item/reagent_containers/food/drinks/tea = 3, /obj/item/reagent_containers/food/drinks/h_chocolate = 3)

/obj/machinery/vending/cigarette/small
	name = "Cigarette machine"
	desc = "A specialized vending machine designed to contribute to your slow and uncomfortable death."
	vend_delay = 21
	density = FALSE
	icon = 'infinity/icons/obj/vending.dmi'
	icon_state = "Cigs_Machine_small"
	icon_vend = "Cigs_Machine_small-vend"
	products = list(/obj/item/storage/fancy/cigarettes = 2,
					/obj/item/storage/fancy/cigarettes/luckystars = 2,
					/obj/item/storage/fancy/cigarettes/jerichos = 2,
					/obj/item/storage/fancy/cigarettes/menthols = 2,
					/obj/item/storage/fancy/cigarettes/carcinomas = 2,
					/obj/item/storage/fancy/cigarettes/professionals = 2,
					/obj/item/storage/box/matches = 10,
					/obj/item/flame/lighter/random = 4,
					/obj/item/clothing/mask/smokable/ecig/util = 1,
					///obj/item/clothing/mask/smokable/ecig/deluxe = 2,
					/obj/item/clothing/mask/smokable/ecig/simple = 1,
					/obj/item/reagent_containers/ecig_cartridge/med_nicotine = 5,
					/obj/item/reagent_containers/ecig_cartridge/high_nicotine = 5,
					/obj/item/reagent_containers/ecig_cartridge/orange = 5,
					/obj/item/reagent_containers/ecig_cartridge/mint = 5,
					/obj/item/reagent_containers/ecig_cartridge/watermelon = 5,
					/obj/item/reagent_containers/ecig_cartridge/grape = 5)
	contraband = list(/obj/item/flame/lighter/zippo = 2)
	premium = list(/obj/item/storage/fancy/cigar = 5,/obj/item/storage/fancy/cigarettes/killthroat = 5)

// From Old-World-Blues
/obj/machinery/vending/thundervend
	name = "Violence-o-Mate"
	desc = "That's a guns and ammo vendor."
	icon = 'infinity/icons/obj/vending.dmi'
	density = FALSE
	ads_list = list(
		"ULTRAVIOLENCE!",
		"Do you like to hurt other people, mate?",
		"You're not a nice person!",
		"Get a goddamn gun and take them out!",
		"Why did you come back here?"
	)
	icon_state = "thundervendor"
	products = list(
		/obj/item/reagent_containers/hypospray/autoinjector/combatpain = 60,
		/obj/item/material/knife/combat = 30,
		/obj/item/grenade/chem_grenade/metalfoam = 20,
		/obj/item/grenade/chem_grenade/cleaner = 30,
		/obj/item/grenade/flashbang = 20,
		/obj/item/grenade/empgrenade = 15,
		/obj/item/gun/energy/xray = 10,
		/obj/item/gun/projectile/automatic/assault_rifle = 10,
		/obj/item/ammo_magazine/rifle = 30,
		/obj/item/gun/energy/ionrifle = 3,
		/obj/item/gun/energy/sniperrifle = 1,
		/obj/item/gun/projectile/heavysniper = 1,
		/obj/item/ammo_casing/shell = 2,
	)
	vend_delay = 10

/obj/machinery/vending/parts
	name = "Denitz-Spares Vendor"
	desc = "All what you need to build a new microwave or teleporter."
	icon_state = "robotics"
	icon_deny = "robotics-deny"
	req_access = list(access_engine)
	products = list(/obj/item/airlock_electronics = 4,/obj/item/airlock_electronics/secure = 2,
					/obj/item/module/power_control = 4,
					/obj/item/airalarm_electronics = 4, /obj/item/firealarm_electronics = 4,
					/obj/item/cell/standard = 4, /obj/item/light/tube = 10, /obj/item/light/bulb = 10, /obj/item/light/tube/large = 4,
					/obj/item/stock_parts/scanning_module = 5,/obj/item/stock_parts/micro_laser = 5,
					/obj/item/stock_parts/matter_bin = 5,/obj/item/stock_parts/manipulator = 5,
					/obj/item/stock_parts/console_screen = 5,/obj/item/stock_parts/capacitor = 5)
	contraband = list(/obj/item/device/flash = 2, /obj/item/airlock_brace = 2)
	premium = list(/obj/item/cell/high = 2)

/obj/machinery/vending/parts/research
	name = "Wolfor-Spares Vendor"
	req_access = list(access_research)
	products = list(/obj/item/cell/standard = 5,
					/obj/item/stock_parts/capacitor = 8,/obj/item/stock_parts/scanning_module = 8,
					/obj/item/stock_parts/micro_laser = 8,/obj/item/stock_parts/matter_bin = 8,
					/obj/item/stock_parts/manipulator = 8,/obj/item/stock_parts/console_screen = 8)
	contraband = list(/obj/item/device/flash = 2,/obj/item/airlock_brace = 2,/obj/item/crowbar/brace_jack = 1)

/obj/machinery/vending/parts/public
	name = "Wolfor-Spares Vendor"
	req_access = list()
	products = list(/obj/item/cell/standard = 4,
					/obj/item/stock_parts/capacitor = 4,/obj/item/stock_parts/scanning_module = 4,
					/obj/item/stock_parts/micro_laser = 4,/obj/item/stock_parts/matter_bin = 4,
					/obj/item/stock_parts/manipulator = 4,/obj/item/stock_parts/console_screen = 4)
	contraband = list(/obj/item/device/flash = 2, /obj/item/crowbar/brace_jack = 1)


/obj/machinery/vending/armoryvend
	density = FALSE
	vend_delay = 10
	icon = 'infinity/icons/obj/vending.dmi'
	icon_state = "thundervendor"
	req_access = list(access_security)

/obj/machinery/vending/armoryvend/kinetic
	name = "WardenTech Kinetic"
	desc = "A weapon vendor. It stores kinetic weapons."
	products = list(/obj/item/gun/projectile/automatic/nt41 = 2,
					/obj/item/ammo_magazine/n10mm = 6,
					/obj/item/gun/projectile/shotgun/pump/combat = 2,
					/obj/item/clothing/accessory/storage/bandolier/armory = 2,
					/obj/item/gun/launcher/grenade = 1,
					/obj/item/storage/box/teargas = 1,
					/obj/item/storage/box/flashbangs = 1)

/obj/machinery/vending/armoryvend/energy
	name = "WardenTech Energy"
	desc = "A weapon vendor. It stores energy weapons."
	products = list(/obj/item/gun/energy/stunrevolver/rifle = 2,
					/obj/item/gun/energy/taser/carbine = 2,
					/obj/item/gun/energy/ionrifle = 2)

/obj/machinery/vending/armoryvend/laser
	name = "WardenTech Laser"
	desc = "A weapon vendor. It stores laser weapons."
	products = list(/obj/item/gun/energy/laser/secure = 4,
					/obj/item/gun/energy/gun/secure = 4)

/obj/machinery/vending/paimod
	name = "IntelligenceTech"
	desc = "A pai modification vendor. Inside of showcase you see many of circuits, devices and etc."
	icon = 'infinity/icons/obj/vending.dmi'
	density = TRUE
	icon_state = "pai"
	products = list(/obj/item/paimod/special/advanced_holo	=	3,
					/obj/item/paimod/holoskins/paiwoman		=	3,
					/obj/item/paimod/memory/standart			=	5,
					/obj/item/paimod/memory/advanced			=	3,
					/obj/item/paimod/memory/lambda			=	1
					)
	prices = list(/obj/item/paimod/special/advanced_holo		=	150,
					/obj/item/paimod/holoskins/paiwoman		=	50,
					/obj/item/paimod/memory/standart			=	20,
					/obj/item/paimod/memory/advanced			=	60,
					/obj/item/paimod/memory/lambda			=	120,
					/obj/item/paimod/special/hack_camo		=	150,
					/obj/item/paimod/hack_speed/standart		=	120,
					/obj/item/paimod/hack_speed/advanced		=	200
					)
	contraband = list(/obj/item/paimod/special/hack_camo		=	2,
					/obj/item/paimod/hack_speed/standart		=	2,
					/obj/item/paimod/hack_speed/advanced		=	1)

/obj/machinery/vending/costumes
	name = "costumes dispenser"
	desc = "All the costumes an actor could need. Probably."
	icon_state = "theater"
	icon_vend = "theater-vend"
	icon_deny = "theater-deny"
	products = list(/obj/item/clothing/head/bandana = 2,
					/obj/item/clothing/head/beaverhat = 2,
					/obj/item/clothing/head/bowler = 2,
					/obj/item/clothing/head/bowlerhat = 2,
					/obj/item/clothing/head/fedora = 2,
					/obj/item/clothing/head/festive = 4,
					/obj/item/clothing/head/flatcap = 2,
					/obj/item/clothing/head/gentle_cap = 2,
					/obj/item/clothing/head/that = 2,
					/obj/item/clothing/under/assistantformal = 2,
					/obj/item/clothing/under/blackjumpskirt = 2,
					/obj/item/clothing/under/civilian = 2,
					/obj/item/clothing/under/civilian/black = 2,
					/obj/item/clothing/under/gentlesuit = 2,
					/obj/item/clothing/under/schoolgirl = 2,
					/obj/item/clothing/under/scratch = 2,
					/obj/item/clothing/under/sl_suit = 2,
					/obj/item/clothing/under/waiter = 2,
					/obj/item/clothing/under/rank/vice = 2,
					/obj/item/clothing/under/blazer = 2,
					/obj/item/clothing/under/mime = 1,
					/obj/item/clothing/under/sexymime = 1,
					/obj/item/clothing/under/harness = 1,
					/obj/item/clothing/under/stripper/mankini = 1)

	contraband = list()

/obj/machinery/vending/engivend
	products = list(
		/obj/item/device/flashlight = 3,
		/obj/item/device/multitool = 3,
		/obj/item/device/multitool/multimeter = 3,
		/obj/item/device/geiger = 3,
		/obj/item/device/scanner/gas = 3,
		/obj/item/device/t_scanner = 3,
		/obj/item/device/cable_painter = 2,
		/obj/item/rpd = 2,
		/obj/item/clamp = 4,
		/obj/item/tape_roll = 6,
		/obj/item/device/paint_sprayer = 2,
		/obj/item/grenade/chem_grenade/metalfoam = 5
	)
	contraband = list(/obj/item/cell/potato = 5)
	premium = list(
		/obj/item/combitool = 1,
		/obj/item/wrench/power = 1,
		/obj/item/wirecutters/power = 1
	)
