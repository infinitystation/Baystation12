/*
 * sierra Command
 */


/obj/structure/closet/secure_closet/captain_sierra
	name = "captain's locker"
	req_access = list(access_captain)
	icon_state = "capsecure1"
	icon_closed = "capsecure"
	icon_locked = "capsecure1"
	icon_opened = "capsecureopen"
	icon_off = "capsecureoff"

/obj/structure/closet/secure_closet/captain_sierra/WillContain()
	return list(
		/obj/item/clothing/suit/armor/pcarrier/medium,
		/obj/item/clothing/head/helmet,
		/obj/item/device/radio/headset/heads/sierra_captain,
		/obj/item/clothing/glasses/sunglasses,
		/obj/item/weapon/gun/energy/gun/secure,
		/obj/item/device/radio/headset/heads/sierra_captain/alt,
		/obj/item/clothing/accessory/storage/holster/thigh,
		/obj/item/weapon/melee/telebaton,
		/obj/item/device/flash,
		/obj/item/device/megaphone,
		/obj/item/weapon/storage/box/ids,
		/obj/item/weapon/clipboard,
		/obj/item/device/holowarrant,
		/obj/item/weapon/folder/blue,
		/obj/item/clothing/suit/captunic,
		/obj/item/clothing/suit/captunic/capjacket,
		/obj/item/clothing/head/caphat/cap,
		/obj/item/clothing/under/rank/captain,
		/obj/item/clothing/under/dress/dress_cap,
		/obj/item/clothing/head/caphat/formal,
		/obj/item/clothing/under/captainformal,
		/obj/item/clothing/gloves/captain,
		new /datum/atom_creator/weighted(list(/obj/item/weapon/storage/backpack/captain, /obj/item/weapon/storage/backpack/satchel_cap)),
		new /datum/atom_creator/weighted(list(/obj/item/weapon/storage/backpack/dufflebag/captain, /obj/item/weapon/storage/backpack/messenger/com))
	)


/obj/structure/closet/secure_closet/hop_sierra
	name = "head of personnel's locker"
	req_access = list(access_hop)
	icon_state = "twosolsecure1"
	icon_closed = "twosolsecure"
	icon_locked = "twosolsecure1"
	icon_opened = "twosolsecureopen"
	icon_off = "twosolsecureoff"

/obj/structure/closet/secure_closet/hop_sierra/WillContain()
	return list(
		/obj/item/clothing/glasses/sunglasses,
		/obj/item/clothing/suit/armor/pcarrier/medium,
		/obj/item/clothing/head/helmet,
		/obj/item/device/radio/headset/heads/hop,
		/obj/item/clothing/accessory/storage/holster/thigh,
		/obj/item/weapon/gun/energy/gun/secure,
		/obj/item/weapon/melee/telebaton,
		/obj/item/device/flash,
		/obj/item/device/megaphone,
		/obj/item/weapon/storage/box/headset,
		/obj/item/device/radio/headset/heads/hop/alt,
		/obj/item/weapon/storage/box/radiokeys,
		/obj/item/weapon/storage/box/large/ids,
		/obj/item/weapon/storage/box/PDAs,
		/obj/item/weapon/clipboard,
		/obj/item/device/holowarrant,
		/obj/item/weapon/folder/blue,
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
		/obj/item/device/tape/random,
		/obj/item/clothing/suit/armor/pcarrier/medium,
		/obj/item/clothing/head/helmet,
		/obj/item/device/taperecorder,
		/obj/item/device/flash,
		/obj/item/device/megaphone,
		/obj/item/weapon/clipboard,
		/obj/item/weapon/folder/blue,
		/obj/item/modular_computer/tablet/lease/preset/command,
		/obj/item/device/radio/headset/adjutant,
		/obj/item/device/radio/headset/adjutant/alt,
		new /datum/atom_creator/weighted(list(/obj/item/weapon/storage/backpack, /obj/item/weapon/storage/backpack/satchel/grey)),
		new /datum/atom_creator/weighted(list(/obj/item/weapon/storage/backpack/dufflebag, /obj/item/weapon/storage/backpack/messenger)),
		new /datum/atom_creator/weighted(list(/obj/item/device/flashlight, /obj/item/device/flashlight/flare, /obj/item/device/flashlight/flare/glowstick/random))
	)
