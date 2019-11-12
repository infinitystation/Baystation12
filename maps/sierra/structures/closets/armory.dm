/obj/structure/closet/secure_closet/guncabinet/sierra_armory
	name = "armory guncabinet"

/obj/structure/closet/secure_closet/guncabinet/sierra_armory/smg
	name = "submachine gun guncabinet"

/obj/structure/closet/secure_closet/guncabinet/sierra_armory/smg/WillContain()
	return list(/obj/item/weapon/gun/projectile/automatic/nt41/armory = 2,
				/obj/item/ammo_magazine/n10mm = 6)

/obj/structure/closet/secure_closet/guncabinet/sierra_armory/shotgun
	name = "shotgun guncabinet"

/obj/structure/closet/secure_closet/guncabinet/sierra_armory/shotgun/WillContain()
	return list(/obj/item/weapon/gun/projectile/shotgun/pump/combat/armory = 2,
				/obj/item/clothing/accessory/storage/bandolier/armory = 2)

/obj/structure/closet/secure_closet/guncabinet/sierra_armory/laser
	name = "laser guncabinet"

/obj/structure/closet/secure_closet/guncabinet/sierra_armory/laser/WillContain()
	return list(/obj/item/weapon/gun/energy/laser/secure = 4)

/obj/structure/closet/secure_closet/guncabinet/sierra_armory/stun
	name = "stun guncabinet"

/obj/structure/closet/secure_closet/guncabinet/sierra_armory/stun/WillContain()
	return list(/obj/item/weapon/gun/energy/stunrevolver/rifle = 2,
				/obj/item/weapon/gun/energy/taser/carbine = 2)

/obj/structure/closet/secure_closet/guncabinet/sierra_armory/ion
	name = "ion guncabinet"

/obj/structure/closet/secure_closet/guncabinet/sierra_armory/ion/WillContain()
	return list(/obj/item/weapon/gun/energy/ionrifle = 2,
	/obj/item/weapon/gun/energy/ionrifle/small = 1)

/obj/structure/closet/secure_closet/guncabinet/sierra_armory/egun
	name = "energy guncabinet"

/obj/structure/closet/secure_closet/guncabinet/sierra_armory/egun/WillContain()
	return list(/obj/item/weapon/gun/energy/gun/secure = 4)

/obj/structure/closet/secure_closet/guncabinet/sierra_armory/launcher
	name = "grenade launcher guncabinet"

/obj/structure/closet/secure_closet/guncabinet/sierra_armory/launcher/WillContain()
	return list(/obj/item/weapon/gun/launcher/grenade = 1,
				/obj/item/weapon/storage/box/smokeshells = 1,
				/obj/item/weapon/storage/box/flashshells = 2,
				/obj/item/weapon/storage/box/empshells = 1,
				/obj/item/weapon/storage/box/teargas = 1)

/obj/structure/closet/secure_closet/guncabinet/sierra_armory/militia
	name = "militia guncabinet"

/obj/structure/closet/secure_closet/guncabinet/sierra_armory/militia/WillContain()
	return list(/obj/item/weapon/gun/energy/gun/small/secure = 4,
				/obj/item/clothing/accessory/armband = 4)

/obj/structure/closet/secure_closet/guncabinet/sierra_emergency
	name = "emergency smartgun guncabinet"
	req_access = list(access_security) //even adjutant/guard can open

/obj/structure/closet/secure_closet/guncabinet/sierra_emergency/WillContain()
	return list(/obj/item/weapon/gun/energy/gun/small/secure = 3)