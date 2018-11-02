/*
 * Sierra Exploration
 */


/obj/structure/closet/secure_closet/el
	name = "exploration leader's locker"
	req_access = list(access_el)
	icon = 'icons/obj/closets_inf.dmi'
	icon_state = "pathsecure1"
	icon_closed = "pathsecure"
	icon_locked = "pathsecure1"
	icon_opened = "pathsecureopen"
	icon_off = "pathsecureoff"

/obj/structure/closet/secure_closet/el/WillContain()
	return list(
		/obj/item/device/radio,
		/obj/item/device/tape/random,
		/obj/item/device/gps,
		/obj/item/weapon/pinpointer/radio,
		/obj/item/device/radio/beacon,
		/obj/item/taperoll/research,
		/obj/item/weapon/material/hatchet/machete/deluxe,
		/obj/item/weapon/storage/belt/holster/machete,
		/obj/item/device/spaceflare,
		/obj/item/clothing/accessory/storage/webbing_large,
		/obj/item/device/taperecorder,
		/obj/item/device/analyzer,
		/obj/item/device/flash,
		/obj/item/device/radio/headset/exploration_leader,
		/obj/item/device/radio/headset/exploration_leader/alt,
		/obj/item/weapon/storage/box/encryptionkey/exploration,
		/obj/item/device/binoculars,
		/obj/item/clothing/under/rank/field,
		/obj/item/clothing/under/rank/field/tan,
		/obj/item/clothing/under/rank/field/navy,
		/obj/item/clothing/under/rank/field/green,
		new /datum/atom_creator/weighted(list(/obj/item/weapon/storage/backpack, /obj/item/weapon/storage/backpack/satchel/grey)),
		new /datum/atom_creator/weighted(list(/obj/item/weapon/storage/backpack/dufflebag, /obj/item/weapon/storage/backpack/messenger)),
		new /datum/atom_creator/weighted(list(/obj/item/device/flashlight/upgraded, /obj/item/device/flashlight/flare, /obj/item/device/flashlight/flare/glowstick/random))
	)

/obj/structure/closet/secure_closet/explorer
	name = "explorer's locker"
	req_access = list(access_explorer)
	icon = 'icons/obj/closets_inf.dmi'
	icon_state = "exp1"
	icon_closed = "exp"
	icon_locked = "exp1"
	icon_opened = "expopen"
	icon_off = "expoff"

/obj/structure/closet/secure_closet/explorer/WillContain()
	return list(
		/obj/item/device/radio,
		/obj/item/device/gps,
		/obj/item/taperoll/research,
		/obj/item/weapon/storage/belt/holster/machete,
		/obj/item/device/spaceflare,
		/obj/item/clothing/accessory/storage/webbing_large,
		/obj/item/device/analyzer,
		/obj/item/device/radio/headset/exploration,
		/obj/item/device/radio/headset/exploration/alt,
		/obj/item/device/binoculars,
		new /datum/atom_creator/weighted(list(/obj/item/weapon/storage/backpack, /obj/item/weapon/storage/backpack/satchel/grey)),
		new /datum/atom_creator/weighted(list(/obj/item/weapon/storage/backpack/dufflebag, /obj/item/weapon/storage/backpack/messenger)),
		new /datum/atom_creator/weighted(list(/obj/item/device/flashlight, /obj/item/device/flashlight/flare, /obj/item/device/flashlight/flare/glowstick/random))
	)

/obj/structure/closet/secure_closet/explorer/pilot
	name = "expeditionary pilot's locker"
	req_access = list(access_explorer, access_expedition_shuttle_helm)

/obj/structure/closet/secure_closet/explorer/pilot/WillContain()
	return list(
		/obj/item/device/radio,
		/obj/item/device/gps,
		/obj/item/weapon/storage/belt/utility/full,
		/obj/item/device/spaceflare,
		/obj/item/clothing/accessory/storage/holster/machete,
		/obj/item/clothing/accessory/storage/webbing_large,
		/obj/item/device/analyzer,
		/obj/item/device/radio/headset/headset_pilot/alt,
		/obj/item/device/binoculars,
		/obj/item/clothing/gloves/thick,
		/obj/item/clothing/suit/storage/toggle/track,
		/obj/item/clothing/head/helmet/nt/pilot,
		new /datum/atom_creator/weighted(list(/obj/item/weapon/storage/backpack, /obj/item/weapon/storage/backpack/satchel/grey)),
		new /datum/atom_creator/weighted(list(/obj/item/weapon/storage/backpack/dufflebag, /obj/item/weapon/storage/backpack/messenger)),
		new /datum/atom_creator/weighted(list(/obj/item/device/flashlight, /obj/item/device/flashlight/flare, /obj/item/device/flashlight/flare/glowstick/random))
	)

/obj/structure/closet/secure_closet/explorer/medic
	name = "field medic's locker"
	req_access = list(access_explorer, access_medical)

/obj/structure/closet/secure_closet/explorer/medic/WillContain()
	return list(
		/obj/item/device/radio,
		/obj/item/device/gps,
		/obj/item/weapon/storage/belt/medical/emt,
		/obj/item/device/spaceflare,
		/obj/item/clothing/accessory/storage/holster/machete,
		/obj/item/clothing/accessory/storage/webbing_large,
		/obj/item/device/analyzer,
		/obj/item/device/healthanalyzer,
		/obj/item/weapon/storage/firstaid/adv,
		/obj/item/device/radio/headset/exploration,
		/obj/item/device/radio/headset/exploration/alt,
		/obj/item/device/binoculars,
		/obj/item/clothing/gloves/thick,
		new /datum/atom_creator/weighted(list(/obj/item/weapon/storage/backpack, /obj/item/weapon/storage/backpack/satchel/grey)),
		new /datum/atom_creator/weighted(list(/obj/item/weapon/storage/backpack/dufflebag, /obj/item/weapon/storage/backpack/messenger)),
		new /datum/atom_creator/weighted(list(/obj/item/device/flashlight, /obj/item/device/flashlight/flare, /obj/item/device/flashlight/flare/glowstick/random))
	)

/obj/structure/closet/secure_closet/explorer/engineer
	name = "field engineer's locker"
	req_access = list(access_explorer, access_engine)

/obj/structure/closet/secure_closet/explorer/engineer/WillContain()
	return list(
		/obj/item/device/radio,
		/obj/item/device/gps,
		/obj/item/weapon/storage/belt/utility/full,
		/obj/item/device/multitool,
		/obj/item/device/spaceflare,
		/obj/item/clothing/accessory/storage/holster/machete,
		/obj/item/clothing/accessory/storage/webbing_large,
		/obj/item/device/analyzer,
		/obj/item/device/robotanalyzer,
		/obj/item/device/flashlight/upgraded,
		/obj/item/weapon/combitool,
		/obj/item/device/radio/headset/exploration,
		/obj/item/device/radio/headset/exploration/alt,
		/obj/item/device/binoculars,
		/obj/item/clothing/gloves/thick,
		new /datum/atom_creator/weighted(list(/obj/item/weapon/storage/backpack, /obj/item/weapon/storage/backpack/satchel/grey)),
		new /datum/atom_creator/weighted(list(/obj/item/weapon/storage/backpack/dufflebag, /obj/item/weapon/storage/backpack/messenger)),
		new /datum/atom_creator/weighted(list(/obj/item/device/flashlight, /obj/item/device/flashlight/flare, /obj/item/device/flashlight/flare/glowstick/random))
	)

/obj/structure/closet/wardrobe/exploration
	name = "exploration wardrobe"
	desc = "It's a storage unit for standard-issue attire."
	icon = 'icons/obj/closets_inf.dmi'
	icon_state = "wexp"
	icon_closed = "wexp"
	icon_opened = "wexpopen"

/obj/structure/closet/wardrobe/exploration/WillContain()
	return list(
		/obj/item/clothing/under/rank/field = 6,
		/obj/item/clothing/under/rank/field/tan = 6,
		/obj/item/clothing/under/rank/field/navy = 6,
		/obj/item/clothing/under/rank/field/green = 6
	)
