	///////////////
	//GUNCABINETS//
	///////////////

/obj/structure/closet/secure_closet/guncabinet/patrol
	name = "storm group cabinet"
	req_access = list(access_troopsarm)

/obj/structure/closet/secure_closet/guncabinet/patrol/energy/WillContain()
	return list(
		/obj/item/clothing/accessory/storage/holster/thigh = 6,
		/obj/item/weapon/gun/energy/gun = 6
	)

/obj/structure/closet/secure_closet/guncabinet/patrol/assault/WillContain()
	return list(
		/obj/item/ammo_magazine/a762/extended = 12,
		/obj/item/weapon/gun/projectile/automatic/z9 = 3
	)

/obj/structure/closet/secure_closet/guncabinet/patrol/carabine/WillContain()
	return list(
		/obj/item/ammo_magazine/c12755 = 3,
		/obj/item/weapon/gun/projectile/automatic/amrcarabine = 1
	)

/obj/structure/closet/secure_closet/guncabinet/patrol/shotgun/WillContain()
	return list(
		/obj/item/clothing/accessory/storage/bandolier/patrol = 2,
		/obj/item/weapon/gun/projectile/shotgun/pump/combat/lethal = 2
	)

	///////////
	//CLOSETS//
	///////////

/obj/structure/closet/secure_closet/patrol
	name = "trooper locker"
	req_access = list(access_barracks)
	icon_state = "sec1"
	icon_closed = "sec"
	icon_locked = "sec1"
	icon_opened = "secopen"
	icon_off = "secoff"

/obj/structure/closet/secure_closet/patrol/WillContain()
	return list(
		/obj/item/weapon/storage/belt/security/patrol,
		/obj/item/weapon/melee/baton/loaded,
		/obj/item/clothing/glasses/sunglasses/sechud/goggles,
		/obj/item/clothing/accessory/storage/black_vest,
		/obj/item/clothing/suit/armor/pcarrier/troops/heavy,
		/obj/item/clothing/gloves/thick/combat/marine,
		/obj/item/device/flashlight/maglight
	)

/obj/structure/closet/secure_closet/patrol
	name = "squad engineer locker"

/obj/structure/closet/secure_closet/patrol/marine_eng/WillContain()
	return list(
		/obj/item/weapon/storage/belt/utility/full_buy,
		/obj/item/clothing/glasses/sunglasses/sechud/goggles,
		/obj/item/clothing/suit/armor/pcarrier/troops/heavy,
		/obj/item/clothing/head/helmet/marine,
		/obj/item/clothing/accessory/storage/black_vest,
		/obj/item/clothing/gloves/insulated/combat,
		/obj/item/device/flashlight/maglight,
		/obj/item/weapon/storage/firstaid/individual/military/troops
	)

/obj/structure/closet/secure_closet/patrol
	name = "squad medic locker"

/obj/structure/closet/secure_closet/patrol/marine_med/WillContain()
	return list(
		/obj/item/weapon/defibrillator/compact/combat/loaded,
		/obj/item/clothing/glasses/hud/health/visor,
		/obj/item/clothing/suit/armor/pcarrier/troops/heavy,
		/obj/item/clothing/head/helmet/marine,
		/obj/item/clothing/accessory/storage/black_vest,
		/obj/item/clothing/gloves/insulated/combat,
		/obj/item/device/flashlight/maglight,
		/obj/item/weapon/storage/backpack/ert/medical/marine
	)

/obj/structure/closet/secure_closet/patrol/marine_lead
	name = "squad leader locker"
	req_access = list(access_troopsarm)

/obj/structure/closet/secure_closet/patrol/marine_lead/WillContain()
	return list(
		/obj/item/weapon/storage/belt/security/patrol,
		/obj/item/weapon/melee/baton/loaded,
		/obj/item/clothing/suit/armor/pcarrier/troops/heavy,
		/obj/item/clothing/glasses/sunglasses/sechud/goggles,
		/obj/item/clothing/accessory/storage/black_vest,
		/obj/item/clothing/gloves/thick/combat/marine,
		/obj/item/device/flashlight/maglight,
		/obj/item/weapon/storage/firstaid/individual/military/troops,
		/obj/item/device/megaphone
	)

	////////
	//MISC//
	////////

/obj/machinery/door/airlock/autoname/command
	req_access = list(access_heads)

/obj/machinery/door/airlock/autoname/engineering
	req_access = list(access_engine)

/obj/machinery/door/airlock/autoname/marine
	req_access = list(access_security)




/obj/machinery/suit_storage_unit/patrol_marine
	name = "Marine Voidsuit Storage Unit"
	suit_type = /obj/item/clothing/suit/space/void/military/prepared/patrol
	tank_type = /obj/item/weapon/tank/emergency/oxygen/double
	mask_type = /obj/item/clothing/mask/gas/half
	req_access = list(302)
	islocked = 1
