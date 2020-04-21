/obj/structure/closet/secure_closet/guncabinet/sierra_armory
	name = "armory guncabinet"
	req_access = list(access_armory)

/obj/structure/closet/secure_closet/guncabinet/sierra_armory/light/grenade_launcher
	name = "grenade launcher guncabinet"

/obj/structure/closet/secure_closet/guncabinet/sierra_armory/light/grenade_launcher/WillContain()
	return list(/obj/item/weapon/gun/launcher/grenade = 1,
				/obj/item/weapon/storage/box/smokeshells = 1,
				/obj/item/weapon/storage/box/flashshells = 2,
				/obj/item/weapon/storage/box/empshells = 1,
				/obj/item/weapon/storage/box/teargas = 2)

/obj/structure/closet/secure_closet/guncabinet/sierra_armory/light/stun
	name = "stun guncabinet"

/obj/structure/closet/secure_closet/guncabinet/sierra_armory/light/stun/WillContain()
	return list(/obj/item/weapon/gun/energy/stunrevolver/rifle = 2)

/obj/structure/closet/secure_closet/guncabinet/sierra_armory/light/taser
	name = "taser guncabinet"

/obj/structure/closet/secure_closet/guncabinet/sierra_armory/light/taser/WillContain()
	return list(/obj/item/weapon/gun/energy/taser = 2,
				/obj/item/weapon/gun/energy/taser/carbine = 2)

/obj/structure/closet/secure_closet/guncabinet/sierra_armory/light/sniper
	name = "sniper guncabinet"

/obj/structure/closet/secure_closet/guncabinet/sierra_armory/light/sniper/WillContain()
	return list(/obj/item/weapon/gun/launcher/syringe/sniper = 1,
				/obj/item/weapon/storage/box/soporifics = 1)

/obj/structure/closet/secure_closet/guncabinet/sierra_armory/light/ion
	name = "ion guncabinet"

/obj/structure/closet/secure_closet/guncabinet/sierra_armory/light/ion/WillContain()
	return list(/obj/item/weapon/gun/energy/ionrifle = 2,
	/obj/item/weapon/gun/energy/ionrifle/small = 1)

/obj/structure/closet/secure_closet/guncabinet/sierra_armory/light/militia
	name = "militia guncabinet"

/obj/structure/closet/secure_closet/guncabinet/sierra_armory/light/militia/WillContain()
	return list(/obj/item/weapon/gun/energy/gun/small/secure = 4,
				/obj/item/clothing/accessory/armband = 4)

/obj/structure/closet/secure_closet/guncabinet/sierra_armory/light/egun
	name = "energy guncabinet"

/obj/structure/closet/secure_closet/guncabinet/sierra_armory/light/egun/WillContain()
	return list(/obj/item/weapon/gun/energy/gun/secure = 7)




/obj/structure/closet/secure_closet/guncabinet/sierra_armory/heavy
	name = "heavy armory guncabinet"
	req_access = list(access_armory)

/obj/structure/closet/secure_closet/guncabinet/sierra_armory/heavy/mass_stun
	name = "heavy stun guncabinet"

/obj/structure/closet/secure_closet/guncabinet/sierra_armory/heavy/mass_stun/WillContain()
	return list(/obj/item/weapon/gun/energy/impulsegun = 1,
				/obj/item/weapon/gun/energy/plasmastun = 1)

/obj/structure/closet/secure_closet/guncabinet/sierra_armory/heavy/smg
	name = "submachine gun guncabinet"

/obj/structure/closet/secure_closet/guncabinet/sierra_armory/heavy/smg/WillContain()
	return list(/obj/item/weapon/gun/projectile/automatic/nt41/armory = 2,
				/obj/item/ammo_magazine/n10mm = 6)

/obj/structure/closet/secure_closet/guncabinet/sierra_armory/heavy/shotgun
	name = "shotgun guncabinet"

/obj/structure/closet/secure_closet/guncabinet/sierra_armory/heavy/shotgun/WillContain()
	return list(/obj/item/weapon/gun/projectile/shotgun/pump/combat/armory = 2,
				/obj/item/clothing/accessory/storage/bandolier/armory = 2)

/obj/structure/closet/secure_closet/guncabinet/sierra_armory/heavy/laser
	name = "laser guncabinet"

/obj/structure/closet/secure_closet/guncabinet/sierra_armory/heavy/laser/WillContain()
	return list(/obj/item/weapon/gun/energy/laser/secure = 4)

/obj/structure/closet/secure_closet/guncabinet/sierra_armory/egun
	name = "energy guncabinet"

/obj/structure/closet/secure_closet/guncabinet/sierra_armory/egun/WillContain()
	return list(/obj/item/weapon/gun/energy/gun/secure = 4)

/obj/structure/closet/secure_closet/guncabinet/sierra_emergency
	name = "emergency smartgun guncabinet"
	req_access = list(access_security) //even adjutant/guard can open

/obj/structure/closet/secure_closet/guncabinet/sierra_emergency/WillContain()
	return list(/obj/item/weapon/gun/energy/gun/small/secure = 3)



/obj/structure/closet/secure_closet/guncabinet/sierra_armory/light/armor
	name = "armor locker"
	req_access = list(access_armory)

/obj/structure/closet/secure_closet/guncabinet/sierra_armory/light/armor/pcarrier
	name = "platecarrier locker"

/obj/structure/closet/secure_closet/guncabinet/sierra_armory/light/armor/pcarrier/WillContain()
	return list(
		/obj/item/clothing/head/helmet/nt = 7,
		/obj/item/clothing/suit/armor/pcarrier/medium/nt = 7
	)

/obj/structure/closet/secure_closet/guncabinet/sierra_armory/heavy/armor/ballistic
	name = "ballistic armor locker"

/obj/structure/closet/secure_closet/guncabinet/sierra_armory/heavy/armor/ballistic/WillContain()
	return list(
		/obj/item/clothing/head/helmet/ballistic = 3,
		/obj/item/clothing/suit/armor/bulletproof = 3
	)

/obj/structure/closet/secure_closet/guncabinet/sierra_armory/heavy/armor/ablative
	name = "ablative armor locker"

/obj/structure/closet/secure_closet/guncabinet/sierra_armory/heavy/armor/ablative/WillContain()
	return list(
		/obj/item/clothing/head/helmet/ablative = 2,
		/obj/item/clothing/suit/armor/laserproof = 2
	)

/obj/structure/closet/secure_closet/guncabinet/sierra_armory/heavy/armor/riot
	name = "riot armor locker"

/obj/structure/closet/secure_closet/guncabinet/sierra_armory/heavy/armor/riot/WillContain()
	return list(
		/obj/item/clothing/head/helmet/riot = 3,
		/obj/item/clothing/suit/armor/riot = 3,
		/obj/item/weapon/shield/riot = 3
	)

/obj/structure/closet/secure_closet/guncabinet/sierra_armory/light/armor/accessories
	name = "armor accessories locker"

/obj/structure/closet/secure_closet/guncabinet/sierra_armory/light/armor/accessories/WillContain()
	return list(
		/obj/item/clothing/accessory/legguards = 3,
		/obj/item/clothing/accessory/armguards = 3,
		/obj/item/clothing/accessory/armorplate/medium = 3,
		/obj/item/clothing/accessory/armorplate/tactical = 3
	)

/obj/structure/closet/secure_closet/guncabinet/sierra_armory/heavy/armor/shields
	name = "bulletproof shields locker"

/obj/structure/closet/secure_closet/guncabinet/sierra_armory/heavy/armor/shields/WillContain()
	return list(
		/obj/item/weapon/shield/riot/metal = 2
	)