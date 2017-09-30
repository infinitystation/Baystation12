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