/*
 * Sierra Security
 */

/obj/structure/closet/secure_closet/security/sierra
	name = "security guard's locker"
//	req_access = list(access_brig) //Already in /security, for future (?)

/obj/structure/closet/secure_closet/security/sierra/WillContain()
	return list(
		/obj/item/clothing/suit/armor/pcarrier/medium,
		/obj/item/clothing/head/helmet,
		/obj/item/device/radio/headset/headset_sec,
		/obj/item/device/radio/headset/headset_sec/alt,
		/obj/item/clothing/head/soft/sec/corp,
		/obj/item/clothing/under/rank/security/corp,
		/obj/item/weapon/storage/belt/holster/security,
		/obj/item/device/flash,
		/obj/item/weapon/reagent_containers/spray/pepper,
		/obj/item/weapon/grenade/chem_grenade/teargas,
		/obj/item/weapon/melee/baton/loaded,
		/obj/item/clothing/glasses/sunglasses/sechud/toggle,
		/obj/item/taperoll/police,
		/obj/item/device/hailer,
		/obj/item/clothing/accessory/storage/black_vest,
		/obj/item/weapon/gun/projectile/military,
		/obj/item/ammo_magazine/c45mds,
		/obj/item/ammo_magazine/c45mds/rubber,
		/obj/item/device/megaphone,
		/obj/item/clothing/gloves/thick,
		/obj/item/clothing/accessory/storage/holster/thigh,
		/obj/item/device/holowarrant,
		/obj/item/device/flashlight/maglight,
		/obj/item/weapon/storage/firstaid/individual/military,
	)

/obj/structure/closet/secure_closet/hos/sierra
	name = "head of security's locker"

/obj/structure/closet/secure_closet/hos/sierra/WillContain()
	return list(
		/obj/item/clothing/suit/armor/pcarrier/medium,
		/obj/item/clothing/under/rank/head_of_security/jensen,
		/obj/item/clothing/under/rank/head_of_security/corp,
		/obj/item/clothing/suit/armor/hos/jensen,
		/obj/item/clothing/suit/armor/hos,
		/obj/item/clothing/head/beret/sec/corporate/hos,
		/obj/item/clothing/head/helmet,
		/obj/item/clothing/head/HoS/dermal,
		/obj/item/device/radio/headset/heads/cos,
		/obj/item/clothing/glasses/sunglasses/sechud/toggle,
		/obj/item/taperoll/police,
		/obj/item/weapon/handcuffs,
		/obj/item/weapon/storage/belt/holster/security,
		/obj/item/device/flash,
		/obj/item/device/megaphone,
		/obj/item/weapon/melee/baton/loaded,
		/obj/item/weapon/gun/energy/gun,
		/obj/item/clothing/accessory/storage/holster/thigh,
		/obj/item/weapon/melee/telebaton,
		/obj/item/weapon/reagent_containers/spray/pepper,
		/obj/item/clothing/accessory/storage/black_vest,
		/obj/item/device/hailer,
		/obj/item/device/holowarrant,
		/obj/item/clothing/gloves/thick,
		/obj/item/device/flashlight/maglight,
	)


/obj/structure/closet/secure_closet/secserg/secserg
	name = "security sergeant's locker"

/obj/structure/closet/secure_closet/secserg/WillContain()
	return list(
		/obj/item/clothing/suit/armor/pcarrier/medium,
		/obj/item/clothing/head/helmet,
		/obj/item/clothing/head/beret/sec/corporate/warden,
		/obj/item/clothing/under/rank/warden/corp,
		/obj/item/device/radio/headset/headset_sec,
		/obj/item/device/radio/headset/headset_sec/alt,
		/obj/item/clothing/glasses/sunglasses,
		/obj/item/taperoll/police,
		/obj/item/weapon/storage/belt/holster/security,
		/obj/item/weapon/reagent_containers/spray/pepper,
		/obj/item/weapon/melee/baton/loaded,
		/obj/item/weapon/gun/energy/gun,
		/obj/item/clothing/accessory/storage/holster/thigh,
		/obj/item/clothing/accessory/storage/black_vest,
		/obj/item/weapon/gun/energy/taser,
		/obj/item/weapon/handcuffs,
		/obj/item/device/hailer,
		/obj/item/device/flash,
		/obj/item/device/megaphone,
		/obj/item/weapon/hand_labeler,
		/obj/item/device/holowarrant,
		/obj/item/clothing/gloves/thick,
		/obj/item/device/flashlight/maglight,
	)

/obj/structure/closet/secure_closet/forensics
	name = "forensics technician's locker"
	req_access = list(access_forensics_lockers)
	icon_state = "sec1"
	icon_closed = "sec"
	icon_locked = "sec1"
	icon_opened = "secopen"
	icon_broken = "secbroken"
	icon_off = "secoff"

/obj/structure/closet/secure_closet/forensics/WillContain()
	return list(
		/obj/item/clothing/gloves/forensic,
		/obj/item/clothing/head/helmet,
		/obj/item/clothing/accessory/storage/holster/thigh,
		/obj/item/clothing/glasses/sunglasses/sechud/toggle,
		/obj/item/weapon/storage/belt/holster/security,
		/obj/item/device/radio/headset/headset_sec,
		/obj/item/device/radio/headset/headset_sec/alt,
		/obj/item/clothing/suit/armor/pcarrier/medium,
		/obj/item/weapon/gun/projectile/colt/detective,
		/obj/item/ammo_magazine/c45m/rubber,
		/obj/item/device/flash,
		/obj/item/weapon/melee/baton/loaded,
		/obj/item/weapon/reagent_containers/spray/pepper,
		/obj/item/taperoll/police,
		/obj/item/weapon/storage/box/evidence,
		/obj/item/weapon/storage/box/swabs,
		/obj/item/weapon/storage/box/gloves,
		/obj/item/device/taperecorder,
		/obj/item/device/tape/random = 3,
		/obj/item/device/uv_light,
		/obj/item/device/holowarrant,
		/obj/item/device/flashlight/maglight,
	)

/obj/structure/closet/secure_closet/colonial_marshal
	name = "colonial marshal's locker"
	req_access = list(access_forensics_lockers)
	icon_state = "sec1"
	icon_closed = "sec"
	icon_locked = "sec1"
	icon_opened = "secopen"
	icon_broken = "secbroken"
	icon_off = "secoff"

/obj/structure/closet/secure_closet/colonial_marshal/WillContain()
	return list(
		/obj/item/clothing/suit/armor/pcarrier/medium/sol,
		/obj/item/clothing/head/helmet,
		/obj/item/device/radio/headset/headset_sec,
		/obj/item/device/radio/headset/headset_sec/alt,
		/obj/item/clothing/head/soft/solgov,
		/obj/item/clothing/under/rank/security/navyblue,
		/obj/item/weapon/storage/belt/holster/security,
		/obj/item/device/flash,
		/obj/item/weapon/melee/baton/loaded,
		/obj/item/clothing/glasses/sunglasses/sechud/toggle,
		/obj/item/taperoll/police,
		/obj/item/clothing/accessory/storage/black_vest,
		/obj/item/weapon/gun/projectile/military,
		/obj/item/ammo_magazine/c45mds,
		/obj/item/ammo_magazine/c45mds/rubber,
		/obj/item/device/taperecorder,
		/obj/item/device/tape/random = 3,
		/obj/item/device/megaphone,
		/obj/item/clothing/gloves/thick,
		/obj/item/clothing/accessory/storage/holster/thigh,
		/obj/item/device/holowarrant,
		/obj/item/device/flashlight/maglight,
		/obj/item/weapon/storage/firstaid/individual/military,
	)
