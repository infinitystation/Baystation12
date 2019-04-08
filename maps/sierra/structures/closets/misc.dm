/*
 * Sierra Misc
 */

/decl/closet_appearance/secure_closet/sierra/crew
	color = COLOR_BABY_BLUE
	extra_decals = list(
		"stripe_vertical_mid_full" =  COLOR_OFF_WHITE
	)

/decl/closet_appearance/secure_closet/sierra/corporate
	color = COLOR_BOTTLE_GREEN
	extra_decals = list(
		"stripe_vertical_mid_full" = COLOR_OFF_WHITE
	)

/decl/closet_appearance/secure_closet/torch/corporate/iaa
	extra_decals = list(
		"stripe_vertical_left_full" =  COLOR_OFF_WHITE,
		"stripe_vertical_right_full" = COLOR_OFF_WHITE,
		"command" = COLOR_OFF_WHITE
	)

/obj/structure/closet/secure_closet/iaa
	name = "\improper Internal Affairs Agent's locker"
	req_access = list(access_iaa)
	closet_appearance = /decl/closet_appearance/secure_closet/torch/corporate/iaa

/obj/structure/closet/secure_closet/iaa/WillContain()
	return list(
		/obj/item/device/flash,
		/obj/item/weapon/hand_labeler,
		/obj/item/device/camera,
		/obj/item/device/camera_film = 2,
		/obj/item/weapon/material/clipboard,
		/obj/item/device/taperecorder,
		/obj/item/device/tape/random = 3,
		/obj/item/weapon/storage/secure/briefcase,
		/obj/item/clothing/shoes/laceup,
		/obj/item/clothing/under/rank/internalaffairs,
		/obj/item/clothing/suit/storage/toggle/suit/black,
		/obj/item/clothing/glasses/sunglasses/big,
		/obj/item/device/radio/headset/heads,
		new /datum/atom_creator/weighted(list(/obj/item/weapon/storage/backpack, /obj/item/weapon/storage/backpack/satchel)),
		new /datum/atom_creator/simple(/obj/item/weapon/storage/backpack/messenger, 50),
		/obj/item/weapon/storage/fakebook
	)

//equipment closets that everyone on the crew or in research can access, for storing things securely

/obj/structure/closet/secure_closet/crew
	name = "crew equipment locker"
	closet_appearance = /decl/closet_appearance/secure_closet/sierra/crew

/obj/structure/closet/secure_closet/crew/WillContain()
	return list(
		/obj/item/device/radio,
		/obj/item/weapon/crowbar,
		/obj/item/device/flashlight,
		/obj/item/weapon/storage/box
	)

/obj/structure/closet/secure_closet/crew/research
	name = "research equipment locker"
	closet_appearance = /decl/closet_appearance/secure_closet/sierra/corporate

