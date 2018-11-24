/*
 * Sierra Engineering
 */

/obj/structure/closet/secure_closet/engineering_chief_sierra
	name = "chief engineer's locker"
	req_access = list(access_ce)
	icon_state = "securece1"
	icon_closed = "securece"
	icon_locked = "securece1"
	icon_opened = "secureceopen"
	icon_off = "secureceoff"

/obj/structure/closet/secure_closet/engineering_chief_sierra/WillContain()
	return list(
		/obj/item/clothing/accessory/storage/brown_vest,
		/obj/item/blueprints,
		/obj/item/clothing/head/hardhat/white,
		/obj/item/clothing/head/welding,
		/obj/item/clothing/gloves/insulated,
		/obj/item/device/radio/headset/heads/ce,
		/obj/item/device/radio/headset/heads/ce/alt,
		/obj/item/weapon/storage/belt/utility/full,
		/obj/item/clothing/suit/storage/hazardvest,
		/obj/item/clothing/mask/gas/alt,
		/obj/item/device/multitool,
		/obj/item/device/flash,
		/obj/item/taperoll/engineering,
		/obj/item/device/megaphone,
		/obj/item/weapon/crowbar/brace_jack,
		/obj/item/device/remote_device/chief_engineer,
		/obj/item/clothing/glasses/meson,
		/obj/item/clothing/glasses/welding/superior,
		/obj/item/clothing/suit/armor/pcarrier/medium,
		/obj/item/clothing/head/helmet,
		/obj/item/weapon/clipboard,
		/obj/item/device/flashlight/upgraded,
		/obj/item/weapon/storage/box/armband/engine,
		/obj/item/device/multitool/multimeter,
		/obj/item/weapon/storage/box/secret_project_disks,
		new /datum/atom_creator/weighted(list(/obj/item/weapon/storage/backpack/industrial, /obj/item/weapon/storage/backpack/satchel/eng)),
		new /datum/atom_creator/weighted(list(/obj/item/weapon/storage/backpack/dufflebag/eng, /obj/item/weapon/storage/backpack/messenger/engi))
	)

/obj/structure/closet/secure_closet/engineering_senior
	name = "senior engineer's locker"
	req_access = list(access_seneng)
	icon_state = "secureseneng1"
	icon_closed = "secureseneng"
	icon_locked = "secureseneng1"
	icon_opened = "securesenengopen"
	icon_off = "securesenengoff"

/obj/structure/closet/secure_closet/engineering_senior/WillContain()
	return list(
		/obj/item/clothing/under/hazard,
		/obj/item/clothing/accessory/storage/brown_vest,
		/obj/item/device/radio/headset/headset_eng,
		/obj/item/device/radio/headset/headset_eng/alt,
		/obj/item/clothing/suit/storage/hazardvest,
		/obj/item/clothing/mask/gas/alt,
		/obj/item/weapon/storage/belt/utility/full,
		/obj/item/clothing/glasses/meson,
		/obj/item/taperoll/engineering,
		/obj/item/taperoll/atmos,
		/obj/item/clothing/glasses/welding/superior,
		/obj/item/device/flash,
		/obj/item/device/flashlight/upgraded,
		/obj/item/device/megaphone,
		/obj/item/clothing/gloves/insulated,
		new /datum/atom_creator/weighted(list(/obj/item/weapon/storage/backpack/industrial, /obj/item/weapon/storage/backpack/satchel/eng)),
		new /datum/atom_creator/weighted(list(/obj/item/weapon/storage/backpack/dufflebag/eng, /obj/item/weapon/storage/backpack/messenger/engi))
	)

/obj/structure/closet/secure_closet/engineering_sierra
	name = "engineer's locker"
	req_access = list(access_engine_equip)
	icon_state = "secureeng1"
	icon_closed = "secureeng"
	icon_locked = "secureeng1"
	icon_opened = "secureengopen"
	icon_off = "secureengoff"

/obj/structure/closet/secure_closet/engineering_sierra/WillContain()
	return list(
		/obj/item/clothing/under/hazard,
		/obj/item/clothing/accessory/storage/brown_vest,
		/obj/item/weapon/storage/belt/utility/full,
		/obj/item/device/radio/headset/headset_eng,
		/obj/item/device/radio/headset/headset_eng/alt,
		/obj/item/clothing/suit/storage/hazardvest,
		/obj/item/clothing/mask/gas/alt,
		/obj/item/clothing/glasses/meson,
		/obj/item/taperoll/engineering,
		/obj/item/device/flashlight/upgraded,
		/obj/item/taperoll/atmos,
		/obj/item/clothing/gloves/insulated,
		new /datum/atom_creator/weighted(list(/obj/item/weapon/storage/backpack/industrial, /obj/item/weapon/storage/backpack/satchel/eng)),
		new /datum/atom_creator/weighted(list(/obj/item/weapon/storage/backpack/dufflebag/eng, /obj/item/weapon/storage/backpack/messenger/engi))
	)

/obj/structure/closet/secure_closet/atmos_sierra
	name = "atmospherics equipment locker"
	req_access = list(access_atmospherics)
	icon_state = "secureatm1"
	icon_closed = "secureatm"
	icon_locked = "secureatm1"
	icon_opened = "secureatmopen"
	icon_off = "secureatmoff"

/obj/structure/closet/secure_closet/atmos_sierra/WillContain()
	return list(
		/obj/item/clothing/under/hazard,
		/obj/item/clothing/suit/fire/firefighter,
		/obj/item/clothing/head/hardhat/red,
		/obj/item/device/flashlight/upgraded,
		/obj/item/weapon/rpd,
		/obj/item/clothing/accessory/storage/brown_vest,
		/obj/item/weapon/storage/belt/utility/full,
		/obj/item/weapon/extinguisher,
		/obj/item/device/radio/headset/headset_eng,
		/obj/item/device/radio/headset/headset_eng/alt,
		/obj/item/weapon/tank/emergency/oxygen/double,
		/obj/item/clothing/mask/gas/alt,
		/obj/item/taperoll/atmos,
		/obj/item/device/analyzer
	)
