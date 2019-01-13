/obj/machinery/vending/clothing
	name = "ClothesMate" //renamed to make the slogan rhyme
	icon = 'icons/obj/infinity_vend.dmi'
	desc = "A clothing vending machine"
	icon_state = "clothes"
	product_slogans = "Dress for success!;Prepare to look swagalicious!;Look at all this free swag!;Why leave style up to fate? Use the ClothesMate!"
	vend_delay = 15
	vend_reply = "Thank you for using the ClothesMate!"
	products = list(/obj/item/clothing/under/pj/red = 1, /obj/item/clothing/under/pj/blue = 1, /obj/item/clothing/under/johnny,
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
	icon = 'icons/obj/infinity_vend.dmi'
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
					/obj/item/weapon/storage/backpack/dufflebag/sec = 2,
					/obj/item/weapon/storage/backpack/satchel_sec = 3,
					/obj/item/weapon/storage/backpack/security = 3,
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
	density = 0
	icon = 'icons/obj/infinity_vend.dmi'
	icon_state = "Cola_Machine_small"
	icon_vend = "Cola_Machine_small-vend"
	products = list(/obj/item/weapon/reagent_containers/food/drinks/cans/cola = 5,/obj/item/weapon/reagent_containers/food/drinks/cans/space_mountain_wind = 5,
					/obj/item/weapon/reagent_containers/food/drinks/cans/dr_gibb = 5,/obj/item/weapon/reagent_containers/food/drinks/cans/starkist = 5,
					/obj/item/weapon/reagent_containers/food/drinks/cans/waterbottle = 5,/obj/item/weapon/reagent_containers/food/drinks/cans/space_up = 5,
					/obj/item/weapon/reagent_containers/food/drinks/cans/iced_tea = 5, /obj/item/weapon/reagent_containers/food/drinks/cans/grape_juice = 5)
	contraband = list(/obj/item/weapon/reagent_containers/food/drinks/cans/thirteenloko = 5, /obj/item/weapon/reagent_containers/food/snacks/liquidfood = 5)
	prices = list(/obj/item/weapon/reagent_containers/food/drinks/cans/cola = 1,/obj/item/weapon/reagent_containers/food/drinks/cans/space_mountain_wind = 1,
					/obj/item/weapon/reagent_containers/food/drinks/cans/dr_gibb = 1,/obj/item/weapon/reagent_containers/food/drinks/cans/starkist = 1,
					/obj/item/weapon/reagent_containers/food/drinks/cans/waterbottle = 2,/obj/item/weapon/reagent_containers/food/drinks/cans/space_up = 1,
					/obj/item/weapon/reagent_containers/food/drinks/cans/iced_tea = 1,/obj/item/weapon/reagent_containers/food/drinks/cans/grape_juice = 1)

/obj/machinery/vending/coffee/small
	name = "Hot Drinks machine"
	desc = "A vending machine which dispenses hot drinks."
	density = 0
	icon = 'icons/obj/infinity_vend.dmi'
	icon_state = "Covfefe_Machine_small"
	icon_vend = "Covfefe_Machine_small-vend"
	products = list(/obj/item/weapon/reagent_containers/food/drinks/coffee = 5,/obj/item/weapon/reagent_containers/food/drinks/tea = 5,/obj/item/weapon/reagent_containers/food/drinks/h_chocolate = 5)
	contraband = list(/obj/item/weapon/reagent_containers/food/drinks/ice = 5)
	prices = list(/obj/item/weapon/reagent_containers/food/drinks/coffee = 3, /obj/item/weapon/reagent_containers/food/drinks/tea = 3, /obj/item/weapon/reagent_containers/food/drinks/h_chocolate = 3)

/obj/machinery/vending/cigarette/small
	name = "Cigarette machine"
	desc = "A specialized vending machine designed to contribute to your slow and uncomfortable death."
	vend_delay = 21
	density = 0
	icon = 'icons/obj/infinity_vend.dmi'
	icon_state = "Cigs_Machine_small"
	icon_vend = "Cigs_Machine_small-vend"
	products = list(/obj/item/weapon/storage/fancy/cigarettes = 2,
					/obj/item/weapon/storage/fancy/cigarettes/luckystars = 2,
					/obj/item/weapon/storage/fancy/cigarettes/jerichos = 2,
					/obj/item/weapon/storage/fancy/cigarettes/menthols = 2,
					/obj/item/weapon/storage/fancy/cigarettes/carcinomas = 2,
					/obj/item/weapon/storage/fancy/cigarettes/professionals = 2,
					/obj/item/weapon/storage/box/matches = 10,
					/obj/item/weapon/flame/lighter/random = 4,
					/obj/item/clothing/mask/smokable/ecig/util = 1,
					///obj/item/clothing/mask/smokable/ecig/deluxe = 2,
					/obj/item/clothing/mask/smokable/ecig/simple = 1,
					/obj/item/weapon/reagent_containers/ecig_cartridge/med_nicotine = 5,
					/obj/item/weapon/reagent_containers/ecig_cartridge/high_nicotine = 5,
					/obj/item/weapon/reagent_containers/ecig_cartridge/orange = 5,
					/obj/item/weapon/reagent_containers/ecig_cartridge/mint = 5,
					/obj/item/weapon/reagent_containers/ecig_cartridge/watermelon = 5,
					/obj/item/weapon/reagent_containers/ecig_cartridge/grape = 5)
	contraband = list(/obj/item/weapon/flame/lighter/zippo = 2)
	premium = list(/obj/item/weapon/storage/fancy/cigar = 5,/obj/item/weapon/storage/fancy/cigarettes/killthroat = 5)

// From Old-World-Blues
/obj/machinery/vending/thundervend
	name = "Violence-o-Mate"
	desc = "That's a guns and ammo vendor."
	icon = 'icons/obj/infinity_vend.dmi'
	density = 0
	ads_list = list(
		"ULTRAVIOLENCE!",
		"Do you like to hurt other people, mate?",
		"You're not a nice person!",
		"Get a goddamn gun and take them out!",
		"Why did you come back here?"
	)
	icon_state = "thundervendor"
	products = list(
		/obj/item/weapon/reagent_containers/hypospray/autoinjector/combatpain = 60,
		/obj/item/weapon/material/hatchet/tacknife = 30,
		/obj/item/weapon/grenade/chem_grenade/metalfoam = 20,
		/obj/item/weapon/grenade/chem_grenade/cleaner = 30,
		/obj/item/weapon/grenade/flashbang = 20,
		/obj/item/weapon/grenade/empgrenade = 15,
		/obj/item/weapon/gun/energy/xray = 10,
		/obj/item/weapon/gun/projectile/automatic/sts35 = 10,
		/obj/item/ammo_magazine/c556 = 30,
		/obj/item/weapon/gun/energy/ionrifle = 3,
		/obj/item/weapon/gun/energy/sniperrifle = 1,
		/obj/item/weapon/gun/projectile/heavysniper = 1,
		/obj/item/ammo_casing/a145 = 2,
	)
	vend_delay = 10
	density = 1

/obj/machinery/vending/parts
	name = "Denitz-Spares Vendor"
	desc = "All what you need to build a new microwave or teleporter."
	icon_state = "robotics"
	icon_deny = "robotics-deny"
	req_access = list(access_engine)
	products = list(/obj/item/weapon/airlock_electronics = 4,/obj/item/weapon/airlock_electronics/secure = 2,
					/obj/item/weapon/module/power_control = 4,
					/obj/item/weapon/airalarm_electronics = 4, /obj/item/weapon/firealarm_electronics = 4,
					/obj/item/weapon/cell = 4, /obj/item/weapon/light/tube = 10, /obj/item/weapon/light/bulb = 10, /obj/item/weapon/light/tube/large = 4,
					/obj/item/weapon/stock_parts/scanning_module = 5,/obj/item/weapon/stock_parts/micro_laser = 5,
					/obj/item/weapon/stock_parts/matter_bin = 5,/obj/item/weapon/stock_parts/manipulator = 5,
					/obj/item/weapon/stock_parts/console_screen = 5,/obj/item/weapon/stock_parts/capacitor = 5)
	contraband = list(/obj/item/device/flash = 2, /obj/item/weapon/airlock_brace = 2)
	premium = list(/obj/item/weapon/partyalarm_electronics = 1, /obj/item/weapon/cell/high = 2)

/obj/machinery/vending/parts/research
	name = "Wolfor-Spares Vendor"
	req_access = list(access_research)
	products = list(/obj/item/weapon/cell = 5,
					/obj/item/weapon/stock_parts/capacitor = 8,/obj/item/weapon/stock_parts/scanning_module = 8,
					/obj/item/weapon/stock_parts/micro_laser = 8,/obj/item/weapon/stock_parts/matter_bin = 8,
					/obj/item/weapon/stock_parts/manipulator = 8,/obj/item/weapon/stock_parts/console_screen = 8)
	contraband = list(/obj/item/device/flash = 2,/obj/item/weapon/airlock_brace = 2,/obj/item/weapon/crowbar/brace_jack = 1)
	premium = list(/obj/item/weapon/partyalarm_electronics = 1)