/decl/hierarchy/supply_pack/security
	name = "Security"
	access = access_security

/decl/hierarchy/supply_pack/security/nanoarmor
	name = "Armor - NanoTrasen"
	contains = list(/obj/item/clothing/suit/armor/pcarrier/medium/nt = 2,
					/obj/item/clothing/head/helmet/nt/guard =2)
	cost = 20
	containertype = /obj/structure/closet/crate/secure
	containername = "NanoTrasen armor crate"
	access = access_security

/decl/hierarchy/supply_pack/security/lightnanoarmor
	name = "Armor - NanoTrasen light"
	contains = list(/obj/item/clothing/suit/armor/pcarrier/light/nt = 2,
					/obj/item/clothing/head/helmet/nt/guard =2)
	cost = 15
	containertype = /obj/structure/closet/crate/secure
	containername = "NanoTrasen light armor crate"
	access = access_security

/decl/hierarchy/supply_pack/security/armory
	containertype = /obj/structure/closet/crate/secure/weapon
	access = access_armory
	security_level = SUPPLY_SECURITY_ELEVATED

/decl/hierarchy/supply_pack/security/armory/pistol
	name = "Weapons - Ballistic sidearms"
	contains = list(/obj/item/weapon/gun/projectile/pistol/military = 4)
	cost = 40
	containername = "ballistic sidearms crate"

/decl/hierarchy/supply_pack/security/armory/laser
	name = "Weapons - Laser carbines"
	contains = list(/obj/item/weapon/gun/energy/laser/secure = 4)
	cost = 60
	containername = "laser carbines crate"

/decl/hierarchy/supply_pack/security/laser/shady
	name = "Weapons - Laser carbines (For disposal)"
	contains = list(/obj/item/weapon/gun/energy/laser = 4)
	cost = 80
	contraband = 1
	security_level = null

/decl/hierarchy/supply_pack/security/armory/advancedlaser
	name = "Weapons - Advanced Laser Weapons"
	contains = list(/obj/item/weapon/gun/energy/xray = 2,
					/obj/item/weapon/gun/energy/xray/pistol = 2,
					/obj/item/weapon/shield/energy = 2)
	cost = 100
	containername = "Advanced Laser Weapons crate"
	security_level = SUPPLY_SECURITY_HIGH

/decl/hierarchy/supply_pack/security/armory/sniperlaser
	name = "Weapons - Energy marksman"
	contains = list(/obj/item/weapon/gun/energy/sniperrifle = 2)
	cost = 70
	containername = "\improper Energy marksman crate"
	security_level = SUPPLY_SECURITY_HIGH

/decl/hierarchy/supply_pack/security/armory/spistol
	name = "Weapons - Ballistic small-bore sidearm"
	contains = list(/obj/item/weapon/gun/projectile/spistol = 3)
	cost = 45
	containername = "\improper Ballistic small-bore sidearm crate"
	security_level = SUPPLY_SECURITY_HIGH

/decl/hierarchy/supply_pack/security/armory/pdw
	name = "Weapons - Ballistic PDWs"
	contains = list(/obj/item/weapon/gun/projectile/automatic/sec_smg = 2)
	cost = 40
	containername = "\improper Ballistic PDW crate"
	security_level = SUPPLY_SECURITY_HIGH

/decl/hierarchy/supply_pack/security/armory/bullpup
	name = "Weapons - Ballistic rifles"
	contains = list(/obj/item/weapon/gun/projectile/automatic/bullpup_rifle = 2)
	cost = 90 //Because 5.56 is OP as fuck right now.
	containername = "\improper Bullpup automatic rifle crate"
	security_level = SUPPLY_SECURITY_HIGH

/decl/hierarchy/supply_pack/security/armory/pistolammo
	name = "Ammunition - pistol magazines"
	contains = list(/obj/item/ammo_magazine/pistol = 4)
	cost = 30
	containername = "pistol ammunition crate"

/decl/hierarchy/supply_pack/security/armory/pistolammorubber
	name = "Ammunition - .45 rubber"
	contains = list(/obj/item/ammo_magazine/pistol/double/rubber = 4)
	cost = 20
	containername = "\improper .45 rubber ammunition crate"

/decl/hierarchy/supply_pack/security/armory/pistolammopractice
	name = "Ammunition - .45 practice"
	contains = list(/obj/item/ammo_magazine/pistol/double/practice = 8)
	cost = 20
	containername = "\improper .45 practice ammunition crate"

/decl/hierarchy/supply_pack/security/holster
	name = "Misc - Holster crate"
	contains = list(/obj/item/clothing/accessory/storage/holster/hip = 4)
	cost = 20
	containertype = /obj/structure/closet/crate/secure
	containername = "\improper Holster crate"

/decl/hierarchy/supply_pack/security/securityextragear
	name = "Misc - Security equipment"
	contains = list(/obj/item/weapon/storage/belt/holster/security = 2,
					/obj/item/device/radio/headset/headset_sec = 2,
					/obj/item/clothing/glasses/sunglasses/sechud/goggles = 2,
					/obj/item/taperoll/police = 2,
					/obj/item/device/hailer = 2,
					/obj/item/clothing/gloves/thick = 2,
					/obj/item/device/holowarrant = 2,
					/obj/item/device/flashlight/maglight = 2)
	cost = 60
	containertype = /obj/structure/closet/crate/secure
	containername = "\improper Security equipment crate"

/decl/hierarchy/supply_pack/security/hosextragear
	name = "Misc - Head of Security equipment"
	contains = list(/obj/item/device/radio/headset/heads/hos,
					/obj/item/clothing/glasses/sunglasses/sechud/goggles,
					/obj/item/taperoll/police,
					/obj/item/weapon/storage/belt/holster/security,
					/obj/item/device/hailer,
					/obj/item/device/holowarrant,
					/obj/item/clothing/gloves/thick,
					/obj/item/device/flashlight/maglight,)
	cost = 40
	containertype = /obj/structure/closet/crate/secure
	containername = "\improper Head of Security equipment crate"
	access = access_hos

/decl/hierarchy/supply_pack/security/practicelasers
	name = "Misc - Practice Laser Carbines"
	contains = list(/obj/item/weapon/gun/energy/laser/practice = 4)
	cost = 20
	containertype = /obj/structure/closet/crate/secure
	containername = "\improper Practice laser carbine crate"

/decl/hierarchy/supply_pack/security/armory/barriers
	name = "Portable Barriers (2)"
	contains = list(/obj/item/weapon/barrier = 2)
	cost = 30
	containertype = /obj/structure/closet/crate/secure/weapon
	containername = "\improper portable barriers crate"
	access = access_heads
	security_level = SUPPLY_SECURITY_ELEVATED

/*
 * OVERRIDES
 * =========
 */

/decl/hierarchy/supply_pack/security/pistolammorubber
	name = "Ammunition - pistol rubber"
	contains = list(/obj/item/ammo_magazine/pistol/double/rubber = 4)
	cost = 20
	containertype = /obj/structure/closet/crate/secure/weapon
	containername = "pistol rubber ammunition crate"
	access = access_security

/decl/hierarchy/supply_pack/security/pistolammo
	name = "Ammunition - pistol magazines"
	contains = list(/obj/item/ammo_magazine/pistol = 4)
	cost = 30
	containertype = /obj/structure/closet/crate/secure/weapon
	containername = "pistol ammunition crate"
	access = access_security
	security_level = SUPPLY_SECURITY_ELEVATED
