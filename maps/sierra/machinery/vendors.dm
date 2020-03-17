/obj/machinery/vending/robotics/sierra
	products = list(/obj/item/weapon/reagent_containers/food/drinks/bottle/oiljug = 5, /obj/item/device/robotanalyzer = 2,
					/obj/item/stack/cable_coil = 4,/obj/item/device/flash/synthetic = 4,/obj/item/weapon/cell = 4,/obj/item/device/scanner/health = 2)

/obj/machinery/vending/medical/sierra
	req_access = list(access_medical)

/obj/machinery/vending/security
	products = list(/obj/item/weapon/handcuffs = 8,/obj/item/weapon/grenade/flashbang = 8,/obj/item/weapon/grenade/chem_grenade/teargas = 4,/obj/item/device/flash = 5,
					/obj/item/bodybag = 4,/obj/item/weapon/storage/box/evidence = 6, /obj/item/clothing/accessory/badge/holo/NT = 4, /obj/item/clothing/accessory/badge/holo/NT/cord = 4)
//	contraband = list(/obj/item/clothing/glasses/sunglasses = 2,/obj/item/weapon/storage/box/donut = 2)

/obj/machinery/vending/shittysnack
	name = "BestFood Inc."
	desc = "A very popular snack machine, belonging to the BestFood Inc. It provides very cheap and low-quality snacks and you usually can find some of this vendors in ghetto districts or prisons."
	product_slogans = "Our snacks are the best!;Try our new rotten tofu!;We are the best you can afford!;The lowest quality soy are now here!"
	product_ads = "The best and the worst!;The lowest raited food now here!;Mmm! So disguisting!;At leats better than NanoTrasen!;Have a slack!"
	icon_state = "hotfood"
	icon_vend = "hotfood-vend"
	icon_deny = "hotfood-deny"
	vend_delay = 25
	diona_spawn_chance = 1.2
	base_type = /obj/machinery/vending/snack
	products   = list(/obj/item/weapon/reagent_containers/food/snacks/rottentofu = 20, /obj/item/weapon/reagent_containers/food/snacks/ponkdocket = 8, /obj/item/weapon/reagent_containers/food/snacks/boiledegg = 5, /obj/item/weapon/reagent_containers/food/snacks/boiledrice = 5, /obj/item/weapon/reagent_containers/food/snacks/chips = 5)
	prices     = list(/obj/item/weapon/reagent_containers/food/snacks/rottentofu = 0, /obj/item/weapon/reagent_containers/food/snacks/ponkdocket = 1, /obj/item/weapon/reagent_containers/food/snacks/boiledegg = 8, /obj/item/weapon/reagent_containers/food/snacks/boiledrice = 18, /obj/item/weapon/reagent_containers/food/snacks/chips = 32)
	restockable = 0 //inf