/obj/structure/closet/secure_closet/guncabinet/sierra_armory
	name = "armory guncabinet"
	req_access = list()
	req_one_access = list(access_armory)

/obj/structure/closet/secure_closet/guncabinet/sierra_armory/smg
	name = "submachine gun guncabinet"

/obj/structure/closet/secure_closet/guncabinet/sierra_armory/smg/WillContain()
	return list(/obj/item/weapon/gun/projectile/automatic/wt550/lethal = 3,
				/obj/item/ammo_magazine/mc9mmt = 9)

/obj/structure/closet/secure_closet/guncabinet/sierra_armory/shotgun
	name = "shotgun guncabinet"

/obj/structure/closet/secure_closet/guncabinet/sierra_armory/shotgun/WillContain()
	return list(/obj/item/weapon/gun/projectile/shotgun/pump/combat = 2,
				/obj/item/clothing/accessory/storage/bandolier = 2)

/obj/structure/closet/secure_closet/guncabinet/sierra_armory/laser
	name = "laser guncabinet"

/obj/structure/closet/secure_closet/guncabinet/sierra_armory/laser/WillContain()
	return list(/obj/item/weapon/gun/energy/laser = 3)

/obj/structure/closet/secure_closet/guncabinet/sierra_armory/stun
	name = "stun guncabinet"

/obj/structure/closet/secure_closet/guncabinet/sierra_armory/stun/WillContain()
	return list(/obj/item/weapon/gun/energy/stunrevolver/rifle = 2)

/obj/structure/closet/secure_closet/guncabinet/sierra_armory/ion
	name = "ion guncabinet"

/obj/structure/closet/secure_closet/guncabinet/sierra_armory/ion/WillContain()
	return list(/obj/item/weapon/gun/energy/ionrifle = 2)

/obj/structure/closet/secure_closet/guncabinet/sierra_armory/egun
	name = "energy guncabinet"

/obj/structure/closet/secure_closet/guncabinet/sierra_armory/egun/WillContain()
	return list(/obj/item/weapon/gun/energy/gun/secure = 4)