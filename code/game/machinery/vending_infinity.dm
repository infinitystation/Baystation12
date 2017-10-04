/obj/machinery/vending/clothing
	name = "ClothesMate" //renamed to make the slogan rhyme
	icon = 'icons/obj/infinity_vend.dmi'
	desc = "A vending machine for clothing."
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
					/obj/item/clothing/accessory/holster/thigh = 5,
					/obj/item/clothing/accessory/storage/black_vest = 5,
					/obj/item/clothing/shoes/jackboots = 5,
					/obj/item/clothing/shoes/jackboots/unathi = 3)
	premium = list(/obj/item/clothing/under/tactical = 1,
					/obj/item/clothing/under/rank/guard = 1,
					/obj/item/clothing/under/rank/security = 1,
					/obj/item/clothing/glasses/hud/security = 1)

/obj/machinery/vending/cola/small
	name = "Robust Softdrinks"
	desc = "A softdrink vendor provided by Robust Industries, LLC."
	density = 0
	icon = 'icons/obj/infinity_object.dmi'
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
	icon = 'icons/obj/infinity_object.dmi'
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
	icon = 'icons/obj/infinity_object.dmi'
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