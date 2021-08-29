/*
 * Sierra Engineering
 */

/obj/structure/closet/secure_closet/engineering_chief_sierra
	name = "chief engineer's locker"
	req_access = list(access_ce)
	closet_appearance = /decl/closet_appearance/secure_closet/engineering/ce

/obj/structure/closet/secure_closet/engineering_chief_sierra/WillContain()
	return list(
		/obj/item/clothing/accessory/storage/brown_vest,
		/obj/item/blueprints,
		/obj/item/clothing/head/welding,
		/obj/item/clothing/gloves/insulated,
		/obj/item/device/radio/headset/heads/ce,
		/obj/item/device/radio/headset/heads/ce/alt,
		/obj/item/storage/belt/utility/full,
		/obj/item/clothing/suit/storage/hazardvest,
		/obj/item/clothing/mask/gas/alt,
		/obj/item/device/multitool,
		/obj/item/device/flash,
		/obj/item/clothing/suit/armor/pcarrier/light,
		/obj/item/taperoll/engineering,
		/obj/item/device/megaphone,
		/obj/item/crowbar/brace_jack,
		/obj/item/device/remote_device/chief_engineer,
		/obj/item/clothing/glasses/meson,
		/obj/item/clothing/glasses/welding/superior,
		/obj/item/material/clipboard,
		/obj/item/device/flashlight/upgraded,
		/obj/item/storage/box/armband/engine,
		/obj/item/device/multitool/multimeter,
		/obj/item/storage/box/secret_project_disks,
		new /datum/atom_creator/weighted(list(/obj/item/storage/backpack/industrial, /obj/item/storage/backpack/satchel/eng)),
		new /datum/atom_creator/weighted(list(/obj/item/storage/backpack/dufflebag/eng, /obj/item/storage/backpack/messenger/engi)),
		/obj/item/device/radio
	)

/obj/structure/closet/secure_closet/engineering_senior
	name = "senior engineer's locker"
	req_access = list(access_seneng)
	closet_appearance = /decl/closet_appearance/secure_closet/engineering

/obj/structure/closet/secure_closet/engineering_senior/WillContain()
	return list(
		/obj/item/clothing/accessory/storage/brown_vest,
		/obj/item/device/radio/headset/headset_eng,
		/obj/item/device/radio/headset/headset_eng/alt,
		/obj/item/clothing/suit/storage/hazardvest,
		/obj/item/clothing/mask/gas/alt,
		/obj/item/storage/belt/utility/full,
		/obj/item/clothing/glasses/meson,
		/obj/item/taperoll/engineering,
		/obj/item/taperoll/atmos,
		/obj/item/clothing/glasses/welding/superior,
		/obj/item/device/flash,
		/obj/item/device/flashlight/upgraded,
		/obj/item/device/megaphone,
		/obj/item/clothing/gloves/insulated,
		new /datum/atom_creator/weighted(list(/obj/item/storage/backpack/industrial, /obj/item/storage/backpack/satchel/eng)),
		new /datum/atom_creator/weighted(list(/obj/item/storage/backpack/dufflebag/eng, /obj/item/storage/backpack/messenger/engi)),
		/obj/item/device/radio
	)

/obj/structure/closet/secure_closet/engineering_sierra
	name = "engineer's locker"
	req_access = list(access_engine_equip)
	closet_appearance = /decl/closet_appearance/secure_closet/engineering

/obj/structure/closet/secure_closet/engineering_sierra/WillContain()
	return list(
		/obj/item/clothing/accessory/storage/brown_vest,
		/obj/item/storage/belt/utility/full,
		/obj/item/device/radio/headset/headset_eng,
		/obj/item/device/radio/headset/headset_eng/alt,
		/obj/item/clothing/suit/storage/hazardvest,
		/obj/item/clothing/mask/gas/alt,
		/obj/item/clothing/glasses/meson,
		/obj/item/taperoll/engineering,
		/obj/item/device/flashlight/upgraded,
		/obj/item/taperoll/atmos,
		/obj/item/clothing/gloves/insulated,
		new /datum/atom_creator/weighted(list(/obj/item/storage/backpack/industrial, /obj/item/storage/backpack/satchel/eng)),
		new /datum/atom_creator/weighted(list(/obj/item/storage/backpack/dufflebag/eng, /obj/item/storage/backpack/messenger/engi)),
		/obj/item/device/radio
	)

/obj/structure/closet/secure_closet/engineering_sierra/junior
	name = " junior engineer's locker"
	req_access = list(access_engine)
	closet_appearance = /decl/closet_appearance/secure_closet/engineering

/obj/structure/closet/secure_closet/engineering_sierra/junior/WillContain()
	return list(
		/obj/item/clothing/accessory/storage/brown_vest,
		/obj/item/storage/belt/utility/full,
		/obj/item/device/radio/headset/headset_eng,
		/obj/item/device/radio/headset/headset_eng/alt,
		/obj/item/clothing/suit/storage/hazardvest,
		/obj/item/clothing/mask/gas/alt,
		/obj/item/clothing/glasses/meson,
		/obj/item/taperoll/engineering,
		/obj/item/device/flashlight/upgraded,
		/obj/item/taperoll/atmos,
		/obj/item/clothing/gloves/insulated,
		/obj/item/storage/backpack/satchel/eng,
		/obj/item/device/radio)

/obj/structure/closet/secure_closet/atmos_sierra
	name = "atmospherics equipment locker"
	req_access = list(access_atmospherics)
	closet_appearance = /decl/closet_appearance/secure_closet/engineering/atmos

/obj/structure/closet/secure_closet/atmos_sierra/WillContain()
	return list(
		/obj/item/clothing/suit/fire/firefighter,
		/obj/item/clothing/head/hardhat/red,
		/obj/item/device/flashlight/upgraded,
		/obj/item/rpd,
		/obj/item/clothing/accessory/storage/brown_vest,
		/obj/item/storage/belt/utility/full,
		/obj/item/extinguisher,
		/obj/item/device/radio/headset/headset_eng,
		/obj/item/device/radio/headset/headset_eng/alt,
		/obj/item/tank/emergency/oxygen/double,
		/obj/item/clothing/mask/gas/alt,
		/obj/item/taperoll/atmos,
		/obj/item/device/scanner/gas
	)
