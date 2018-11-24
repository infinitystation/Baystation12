/***************************************
* Highly Visible and Dangerous Weapons *
***************************************/
/datum/uplink_item/item/visible_weapons
	category = /datum/uplink_category/visible_weapons

/datum/uplink_item/item/visible_weapons/dartgun
	name = "Dart Gun"
	item_cost = 20
	antag_costs = list(MODE_MERCENARY = 12)
	path = /obj/item/weapon/gun/projectile/dartgun

/datum/uplink_item/item/visible_weapons/crossbow
	name = "Energy Crossbow"
	item_cost = 24
	antag_costs = list(MODE_MERCENARY = 16)
	path = /obj/item/weapon/gun/energy/crossbow

/datum/uplink_item/item/visible_weapons/ion_pistol
	name = "Ion Pistol"
	item_cost = 45
	antag_costs = list(MODE_MERCENARY = 20)
	path = /obj/item/weapon/gun/energy/ionrifle/small

/datum/uplink_item/item/visible_weapons/energy_sword
	name = "Energy Sword"
	item_cost = 32
	antag_costs = list(MODE_MERCENARY = 15)
	path = /obj/item/weapon/melee/energy/sword

/datum/uplink_item/item/visible_weapons/g9mm
	name = "Silenced Holdout Pistol"
	desc = "9mm with silencer kit and ammunition."
	item_cost = 32
	antag_costs = list(MODE_MERCENARY = 12)
	path = /obj/item/weapon/storage/box/syndie_kit/g9mm

/datum/uplink_item/item/visible_weapons/riggedlaser
	name = "Exosuit (APLU) Rigged Laser"
	item_cost = 32
	antag_costs = list(MODE_MERCENARY = 10)
	path = /obj/item/mecha_parts/mecha_equipment/weapon/energy/riggedlaser

/datum/uplink_item/item/visible_weapons/energy_gun
	name = "Energy Gun"
	item_cost = 32
	antag_costs = list(MODE_MERCENARY = 12)
	path = /obj/item/weapon/gun/energy/gun

/datum/uplink_item/item/visible_weapons/detective_revolver
	name = "Holdout Revolver"
	item_cost = 38
	antag_costs = list(MODE_MERCENARY = 12)
	path = /obj/item/weapon/gun/projectile/revolver/detective

/datum/uplink_item/item/visible_weapons/revolver2
	name = "Revolver W4"
	item_cost = 48
	antag_costs = list(MODE_MERCENARY = 12)
	path = /obj/item/weapon/storage/backpack/satchel/syndie_kit/revolver2

/datum/uplink_item/item/visible_weapons/revolver
	name = "Revolver 'Colt'"
	item_cost = 56
	antag_costs = list(MODE_MERCENARY = 20)
	path = /obj/item/weapon/storage/backpack/satchel/syndie_kit/revolver

/datum/uplink_item/item/visible_weapons/deagle
	name = "Magnum Pistol"
	item_cost = 52
	antag_costs = list(MODE_MERCENARY = 30)
	path = /obj/item/weapon/gun/projectile/magnum_pistol

/datum/uplink_item/item/visible_weapons/revolver2
	name = "Revolver, .44"
	desc = ".44 magnum revolver, with ammunition."
	item_cost = 48
	path = /obj/item/weapon/storage/backpack/satchel/syndie_kit/revolver2

/datum/uplink_item/item/visible_weapons/machine_pistol
	name = "Machine Pistol"
	item_cost = 45
	antag_costs = list(MODE_MERCENARY = 10)
	path = /obj/item/weapon/gun/projectile/automatic/machine_pistol

/datum/uplink_item/item/visible_weapons/grenade_launcher
	name = "Grenade Launcher"
	item_cost = 60
	antag_roles = list(MODE_MERCENARY)
	path = /obj/item/weapon/gun/launcher/grenade/loaded

/datum/uplink_item/item/visible_weapons/submachinegun
	name = "Submachine Gun"
	item_cost = 52
	path = /obj/item/weapon/gun/projectile/automatic/c20r

/datum/uplink_item/item/visible_weapons/assaultrifle
	name = "Assault Rifle"
	item_cost = 60
	antag_costs = list(MODE_MERCENARY = 30)
	path = /obj/item/weapon/gun/projectile/automatic/sts35

/datum/uplink_item/item/visible_weapons/advanced_energy_gun
	name = "Advanced Energy Gun"
	item_cost = 60
	antag_costs = list(MODE_MERCENARY = 40)
	path = /obj/item/weapon/gun/energy/gun/nuclear

/datum/uplink_item/item/visible_weapons/sniper
	name = "Sniper Carabine"
	item_cost = 35
	antag_roles = list(MODE_MERCENARY)
	path = /obj/item/weapon/gun/projectile/automatic/amrcarabine

/datum/uplink_item/item/visible_weapons/heavysniper
	name = "Anti-materiel Rifle"
	item_cost = 68
	antag_costs = list(MODE_MERCENARY = 45)
	path = /obj/item/weapon/storage/secure/briefcase/heavysniper

/datum/uplink_item/item/visible_weapons/sawnoff
	name = "Sawnoff Shotgun"
	item_cost = 45
	antag_costs = list(MODE_MERCENARY = 27)
	path = /obj/item/weapon/gun/projectile/shotgun/doublebarrel/sawn

/datum/uplink_item/item/visible_weapons/combat_shotgun
	name = "Combat Shotgun"
	item_cost = 52
	antag_costs = list(MODE_MERCENARY = 33)
	path = /obj/item/weapon/gun/projectile/shotgun/pump/combat

/datum/uplink_item/item/visible_weapons/automatic_shotgun
	name = "Automatic Shotgun"
	item_cost = 45
	antag_roles = list(MODE_MERCENARY)
	path = /obj/item/weapon/gun/projectile/shotgun/magazine

/datum/uplink_item/item/visible_weapons/beretta
	name = "9mm Pistol"
	item_cost = 40
	path = /obj/item/weapon/gun/projectile/beretta

/datum/uplink_item/item/visible_weapons/detective_revolver
	name = "Holdout Revolver"
	item_cost = 38
	path = /obj/item/weapon/gun/projectile/revolver/detective

/datum/uplink_item/item/visible_weapons/pulserifle
	name = "Pulse Rifle"
	item_cost = 68
	antag_costs = list(MODE_MERCENARY = 26)
	path = /obj/item/weapon/gun/energy/pulse_rifle

/datum/uplink_item/item/visible_weapons/pulseproj
	name = "Pulse projector"
	item_cost = 48
	path = /obj/item/weapon/gun/energy/plasmastun

/datum/uplink_item/item/visible_weapons/flechetterifle
	name = "Flechette Rifle"
	item_cost = 60
	path = /obj/item/weapon/gun/magnetic/railgun/flechette

/datum/uplink_item/item/visible_weapons/railgun // Like a semi-auto AMR
	name = "Railgun"
	item_cost = DEFAULT_TELECRYSTAL_AMOUNT
	antag_costs = list(MODE_MERCENARY = DEFAULT_TELECRYSTAL_AMOUNT - (DEFAULT_TELECRYSTAL_AMOUNT - (DEFAULT_TELECRYSTAL_AMOUNT % 6)) / 6)
	path = /obj/item/weapon/gun/magnetic/railgun

/datum/uplink_item/item/visible_weapons/railguntcc // Only slightly better than the normal railgun; but cooler looking
	name = "Advanced Railgun"
	item_cost = DEFAULT_TELECRYSTAL_AMOUNT + (DEFAULT_TELECRYSTAL_AMOUNT - (DEFAULT_TELECRYSTAL_AMOUNT % 6)) / 6// Only available to traitors if they share TCs.
	antag_costs = list(MODE_MERCENARY = DEFAULT_TELECRYSTAL_AMOUNT) // This, on the other hand, is to encourage usage specifically by mercs with high budgets.
	path = /obj/item/weapon/gun/magnetic/railgun/tcc

/datum/uplink_item/item/visible_weapons/grenade_launcher
	name = "Grenade Launcher"
	item_cost = 60
	antag_costs = list(MODE_MERCENARY = 18)
	path = /obj/item/weapon/gun/launcher/grenade/loaded
