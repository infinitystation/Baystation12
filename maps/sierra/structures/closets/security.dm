/*
 * Sierra Security
 */

/decl/closet_appearance/secure_closet/sierra/security
	extra_decals = list(
		"stripe_vertical_mid_full" = COLOR_NT_RED,
		"security" = COLOR_NT_RED
	)

/decl/closet_appearance/secure_closet/sierra/security/forensics
	extra_decals = list(
		"stripe_vertical_mid_full" = COLOR_NT_RED,
		"forensics" = COLOR_NT_RED
	)

/decl/closet_appearance/secure_closet/sierra/security/warden
	extra_decals = list(
		"stripe_vertical_left_full" = COLOR_NT_RED,
		"stripe_vertical_right_full" = COLOR_NT_RED,
		"security" = COLOR_NT_RED
	)

/decl/closet_appearance/secure_closet/sierra/security/hos
	extra_decals = list(
		"stripe_vertical_left_full" = COLOR_NT_RED,
		"stripe_vertical_mid_full" = COLOR_GOLD,
		"stripe_vertical_right_full" = COLOR_NT_RED,
		"security" = COLOR_GOLD
	)

/obj/structure/closet/secure_closet/hos/sierra
	name = "head of security's locker"
	req_access = list(access_hos)
	closet_appearance = /decl/closet_appearance/secure_closet/sierra/security/hos

/obj/structure/closet/secure_closet/hos/sierra/WillContain()
	return list(
		/obj/item/clothing/suit/armor/pcarrier/medium/nt,
		/obj/item/clothing/under/rank/head_of_security/jensen,
		/obj/item/clothing/under/rank/head_of_security/corp/alt,
		/obj/item/clothing/under/rank/head_of_security/navyblue,
		/obj/item/clothing/under/rank/head_of_security/navyblue/alt,
		/obj/item/clothing/suit/storage/hoscoat,
		/obj/item/clothing/suit/armor/hos,
		/obj/item/clothing/head/beret/sec/corporate/hos,
		/obj/item/clothing/head/helmet/nt,
		/obj/item/clothing/head/HoS/dermal,
		/obj/item/clothing/head/HoS,
		/obj/item/device/radio/headset/heads/hos,
		/obj/item/device/radio/headset/heads/hos/alt,
		/obj/item/clothing/glasses/sunglasses/sechud/toggle,
		/obj/item/taperoll/police,
		/obj/item/weapon/handcuffs,
		/obj/item/weapon/storage/belt/holster/security,
		/obj/item/device/flash,
		/obj/item/device/megaphone,
		/obj/item/weapon/melee/baton/loaded,
		/obj/item/weapon/gun/energy/gun/secure,
		/obj/item/weapon/melee/telebaton,
		/obj/item/weapon/reagent_containers/spray/pepper,
		/obj/item/clothing/accessory/storage/black_vest,
		/obj/item/device/remote_device/head_of_security,
		/obj/item/device/hailer,
		/obj/item/device/holowarrant,
		/obj/item/clothing/gloves/thick,
		/obj/item/device/flashlight/maglight,
		/obj/item/weapon/crowbar/prybar,
		/obj/item/device/radio/off,
		/obj/item/clothing/mask/gas/half,
	)

/obj/structure/closet/secure_closet/warden/sierra
	name = "warden's locker"
	req_access = list(access_armory)
	closet_appearance = /decl/closet_appearance/secure_closet/sierra/security/warden

/obj/structure/closet/secure_closet/warden/sierra/WillContain()
	return list(
		/obj/item/clothing/suit/armor/pcarrier/medium/nt,
		/obj/item/clothing/head/helmet/nt,
		/obj/item/clothing/head/beret/sec/corporate/warden,
		/obj/item/clothing/under/rank/warden/corp/alt,
		/obj/item/clothing/under/rank/warden/navyblue,
		/obj/item/clothing/under/rank/warden/navyblue/alt,
		/obj/item/device/radio/headset/headset_sec,
		/obj/item/device/radio/headset/headset_sec/alt,
		/obj/item/clothing/glasses/sunglasses/sechud/toggle,
		/obj/item/taperoll/police,
		/obj/item/weapon/storage/belt/holster/security,
		/obj/item/weapon/reagent_containers/spray/pepper,
		/obj/item/weapon/melee/baton/loaded,
		/obj/item/weapon/gun/energy/gun/secure,
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
		/obj/item/weapon/crowbar/prybar,
		/obj/item/device/radio/off,
		/obj/item/clothing/mask/gas/half,
	)

/obj/structure/closet/secure_closet/forensics
	name = "forensics technician's locker"
	req_access = list(access_forensics_lockers)
	closet_appearance = /decl/closet_appearance/secure_closet/sierra/security/forensics

/obj/structure/closet/secure_closet/forensics/WillContain()
	return list(
		/obj/item/clothing/gloves/forensic,
		/obj/item/clothing/head/helmet/nt,
		/obj/item/clothing/glasses/sunglasses/sechud/toggle,
		/obj/item/weapon/storage/belt/holster/security,
		/obj/item/device/radio/headset/headset_sec,
		/obj/item/device/radio/headset/headset_sec/alt,
		/obj/item/clothing/suit/armor/pcarrier/medium/nt,
		/obj/item/weapon/gun/energy/gun/small/secure,
		/obj/item/device/flash,
		/obj/item/weapon/melee/baton/loaded,
		/obj/item/weapon/reagent_containers/spray/pepper,
		/obj/item/taperoll/police,
		/obj/item/weapon/storage/box/evidence,
		/obj/item/weapon/storage/box/swabs,
		/obj/item/weapon/storage/box/gloves,
		/obj/item/device/taperecorder,
		/obj/item/device/tape/random = 3,
		/obj/item/device/holowarrant,
		/obj/item/device/flashlight/maglight,
		/obj/item/weapon/crowbar/prybar,
		/obj/item/device/radio/off,
		/obj/item/clothing/mask/gas/half,
	)

/obj/structure/closet/secure_closet/security/sierra
	name = "security guard's locker"
	req_access = list(access_guard)
	closet_appearance = /decl/closet_appearance/secure_closet/sierra/security

/obj/structure/closet/secure_closet/security/sierra/WillContain()
	return list(
		/obj/item/clothing/suit/armor/pcarrier/medium/nt,
		/obj/item/clothing/head/helmet/nt,
		/obj/item/device/radio/headset/headset_sec,
		/obj/item/device/radio/headset/headset_sec/alt,
		/obj/item/clothing/head/beret/sec/corporate/officer,
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
		/obj/item/weapon/gun/energy/gun/small/secure,
		/obj/item/device/megaphone,
		/obj/item/clothing/gloves/thick,
		/obj/item/device/holowarrant,
		/obj/item/device/flashlight/maglight,
		/obj/item/weapon/crowbar/prybar,
		/obj/item/device/radio/off,
		/obj/item/clothing/mask/gas/half,
	)
