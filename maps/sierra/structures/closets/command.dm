/*
 * Sierra Command
 */

/obj/structure/closet/secure_closet/captains/sierra/WillContain()
	return list(
		/obj/item/clothing/suit/armor/pcarrier/medium,
		/obj/item/clothing/head/helmet,
		/obj/item/clothing/glasses/sunglasses,
		/obj/item/clothing/accessory/storage/holster/thigh,
		/obj/item/weapon/gun/energy/gun/secure,
		/obj/item/device/radio/headset/heads/sierra_captain,
		/obj/item/device/radio/headset/heads/sierra_captain/alt,
		/obj/item/weapon/storage/belt/general,
		/obj/item/weapon/melee/telebaton,
		/obj/item/device/flash,
		/obj/item/device/megaphone,
		/obj/item/clothing/head/caphat/formal,
		/obj/item/clothing/head/caphat/cap,
		/obj/item/clothing/suit/captunic,
		/obj/item/clothing/suit/captunic/capjacket,
		/obj/item/clothing/gloves/captain,
		/obj/item/clothing/under/rank/captain/whitefleet,
		/obj/item/clothing/under/rank/captain/bluefleet,
		/obj/item/clothing/under/rank/captain,
		/obj/item/clothing/under/dress/dress_cap,
		/obj/item/clothing/under/captainformal,
		/obj/item/device/remote_device/captain,
		/obj/item/ammo_magazine/c357,
		/obj/item/weapon/storage/box/PDAs,
		/obj/item/weapon/storage/box/ids,
		new /datum/atom_creator/weighted(list(/obj/item/weapon/storage/backpack/captain, /obj/item/weapon/storage/backpack/satchel/cap)),
		new /datum/atom_creator/weighted(list(/obj/item/weapon/storage/backpack/dufflebag/captain, /obj/item/weapon/storage/backpack/messenger/com))
	)

/obj/structure/closet/secure_closet/hop/sierra/WillContain()
	return list(
		/obj/item/clothing/glasses/sunglasses,
		/obj/item/clothing/suit/armor/pcarrier/medium,
		/obj/item/clothing/head/helmet,
		/obj/item/device/radio/headset/heads/hop,
		/obj/item/device/radio/headset/heads/hop/alt,
		/obj/item/clothing/accessory/storage/holster/thigh,
		/obj/item/weapon/gun/energy/gun/secure,
		/obj/item/weapon/melee/telebaton,
		/obj/item/device/remote_device/civillian,
		/obj/item/device/flash,
		/obj/item/device/megaphone,
		/obj/item/weapon/clipboard,
		/obj/item/weapon/storage/box/PDAs,
		/obj/item/weapon/storage/box/ids,
	)

/obj/structure/closet/secure_closet/adjutant
	name = "adjutant's locker"
	req_access = list(access_bridge)
	icon_state = "hopsecure1"
	icon_closed = "hopsecure"
	icon_locked = "hopsecure1"
	icon_opened = "hopsecureopen"
	icon_off = "hopsecureoff"

/obj/structure/closet/secure_closet/adjutant/WillContain()
	return list(
		/obj/item/device/radio,
		/obj/item/weapon/pen,
		/obj/item/clothing/suit/armor/pcarrier/medium,
		/obj/item/clothing/head/helmet,
		/obj/item/device/flash,
		/obj/item/device/megaphone,
		/obj/item/modular_computer/tablet/lease/preset/command,
		/obj/item/device/radio/headset/adjutant,
		/obj/item/device/radio/headset/adjutant/alt,
		new /datum/atom_creator/weighted(list(/obj/item/weapon/storage/backpack, /obj/item/weapon/storage/backpack/satchel/grey)),
		new /datum/atom_creator/weighted(list(/obj/item/weapon/storage/backpack/dufflebag, /obj/item/weapon/storage/backpack/messenger)),
		new /datum/atom_creator/weighted(list(/obj/item/device/flashlight, /obj/item/device/flashlight/flare, /obj/item/device/flashlight/flare/glowstick/random))
	)
