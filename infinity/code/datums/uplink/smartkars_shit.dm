//-------------------------------
//          UPLINK SHIT
//-------------------------------



/datum/uplink_item/item/armor/cheap_space
	name = "Cheap Space Suit"
	desc = "A cheap space kit, including space suit, gas mask and an oxygen tank."
	item_cost = 15
	antag_costs = list(MODE_MERCENARY = 10)
	path = /obj/item/weapon/storage/backpack/dufflebag/syndie_kit/space_cheap

/datum/uplink_item/item/tools/plastique
	item_cost = 6

/datum/uplink_item/item/tools/superplastique
	name = "X-4"
	desc = "Upgraded version of C-4 explosives. Can destroy even a reinforced wall."
	item_cost = 14
	path = /obj/item/weapon/plastique/super



//-------------------------------
//          UPLINK KITS
//-------------------------------



/*/datum/uplink_category/badassery/stalker
	name = "Stalker Kit"
	desc = "This kit contains a special space suit, chameleon kit, agent ID card, voice changer and a special electrified baton. Trick your victims and kidnapp them after."
	item_cost = DEFAULT_TELECRYSTAL_AMOUNT
	antag_roles = list(MODE_TRAITOR)
	path = /obj/item/weapon/storage/backpack/dufflebag/syndie_kit/stalker*/

/datum/uplink_item/item/tools/pcombo
	name = "Bag of C-4"
	desc = "Bag, full of C-4 explosives. Contains 6 powerful bombs. 6 TC discount."
	item_cost = 30
	path = /obj/item/weapon/storage/backpack/dufflebag/syndie_kit/plastique

/datum/uplink_item/item/tools/spcombo
	name = "Bag of X-4"
	desc = "Bag, containing 3 military X-4 explosives. Be careful with it. 8 TC discount."
	item_cost = 34
	path = /obj/item/weapon/storage/backpack/dufflebag/syndie_kit/plastique/super

/datum/uplink_item/item/tools/poisons
	name = "Poisons kit"
	desc = "A box, containing 7 vials of random and very deadly poisons."
	item_cost = 48
	path = /obj/item/weapon/storage/box/syndie_kit/poisons



//-------------------------------
//       UPLINK FOR NUKIES
//-------------------------------



/datum/uplink_item/item/badassery/bioterror
	name = "Bioterror Kit"
	desc = "Kit, filled with bioweaponery. It contains: Voidsuit, sprayer with poisons, bioterror grenade and military pistol. Don't forget to turn your internals on!"
	item_cost = DEFAULT_TELECRYSTAL_AMOUNT
	antag_roles = list(MODE_MERCENARY)
	path = /obj/item/weapon/storage/backpack/dufflebag/syndie_kit/bioterror

/datum/uplink_item/item/badassery/pyro
	name = "Pyro Kit"
	desc = "Kit, used for making FIRES! It contains: Special pyro voidsuit, flamethrower with 2 phoron tanks, 2 incendiary grenades and military pistol."
	item_cost = DEFAULT_TELECRYSTAL_AMOUNT
	antag_roles = list(MODE_MERCENARY)
	path = /obj/item/weapon/storage/backpack/dufflebag/syndie_kit/pyro

/datum/uplink_item/item/badassery/classic
	name = "Classic Kit"
	desc = "Old and faithful kit. It contains: Heavy armor, assault rifle, cryptographic sequencer and grenade."
	item_cost = DEFAULT_TELECRYSTAL_AMOUNT
	antag_roles = list(MODE_MERCENARY)
	path = /obj/item/weapon/storage/backpack/dufflebag/syndie_kit/classic

/datum/uplink_item/item/badassery/stealthy
	name = "Stealthy Kit"
	desc = "A special kit for stealthy operations. It contains: Chameleon kit, fake crew annoncement, freedom implant, cryptographic sequencer, military pistol and clerical kit."
	item_cost = DEFAULT_TELECRYSTAL_AMOUNT
	antag_roles = list(MODE_MERCENARY)
	path = /obj/item/weapon/storage/backpack/dufflebag/syndie_kit/stealthy

/datum/uplink_item/item/badassery/sniper
	name = "Sniper Kit"
	desc = "Fashionable briefcase for fashionable operatives. It contains: Cool-looking armor vest, disguised as a suit, thermal googles and sniper rifle with ammo."
	item_cost = DEFAULT_TELECRYSTAL_AMOUNT
	antag_roles = list(MODE_MERCENARY)
	path = /obj/item/weapon/storage/briefcase/syndie_kit/sniper

/datum/uplink_item/item/badassery/spaceass
	name = "Space Assault Kit"
	desc = "Buy this kit if you want to raid the ship from the space. It contains: Voidsuit, X-4 explosive, assault rifle and cryptographic sequencer."
	item_cost = DEFAULT_TELECRYSTAL_AMOUNT
	antag_roles = list(MODE_MERCENARY)
	path = /obj/item/weapon/storage/backpack/dufflebag/syndie_kit/spaceass

/datum/uplink_item/item/badassery/saboteur
	name = "Saboteur Kit"
	desc = "You want to sabotage ship systems? This kit is specially for you. It contains: Heavy armor, military pistol, flashdark, chameleon projector, cryptographic sequencer and some C-4 explosives."
	item_cost = DEFAULT_TELECRYSTAL_AMOUNT
	antag_roles = list(MODE_MERCENARY)
	path = /obj/item/weapon/storage/backpack/dufflebag/syndie_kit/saboteur

/datum/uplink_item/item/badassery/medic
	name = "Field Medic Kit"
	desc = "This kit can provide almost everything for combat medic. It contains: Heavy armor, military pistol, combat medkit, combat defibrilator and surgery kit."
	item_cost = DEFAULT_TELECRYSTAL_AMOUNT
	antag_roles = list(MODE_MERCENARY)
	path = /obj/item/weapon/storage/backpack/dufflebag/syndie_kit/medic



//-------------------------------
//		  NEW SYNDIE ITEMS
//-------------------------------



/obj/item/weapon/plastique/super
	name = "X-4 explosives"
	desc = "Military version of plastique explosions. Like C-4, but better."
	gender = PLURAL
	icon = 'icons/obj/assemblies.dmi'
	icon_state = "plastic-explosive0"
	item_state = "plasticx"
	item_flags = ITEM_FLAG_NO_BLUDGEON
	w_class = ITEM_SIZE_SMALL
	origin_tech = list(TECH_ESOTERIC = 4)
	explosion_strengh = 1

/*/obj/item/weapon/melee/baton/syndie
	name = "electrified baton"
	desc = "An electrified baton, which can shock people. Inconspicuous weapon, often used by stealth agents."
	icon_state = "stunbaton"
	item_state = "baton"
	slot_flags = SLOT_BELT
	force = 15
	sharp = 0
	edge = 0
	throwforce = 7
	w_class = ITEM_SIZE_SMALL
	origin_tech = list(TECH_COMBAT = 3, TECH_ESOTERIC = 3)
	attack_verb = list("beaten")
	base_parry_chance = 30
	stunforce = 15
	agonyforce = 50
	hitcost = 16



/obj/item/clothing/head/helmet/space/syndicate/stalker
	name = "crimson space helmet"
	desc = "A crimson helmet sporting clean lines and durable plating. This one looks spooky."
	armor = list(
		melee = ARMOR_MELEE_RESISTANT,
		bullet = ARMOR_BALLISTIC_PISTOL,
		laser = ARMOR_LASER_HANDGUNS,
		energy = ARMOR_ENERGY_MINOR,
		bomb = ARMOR_BOMB_MINOR,
		bio = ARMOR_BIO_SMALL,
		rad = ARMOR_RAD_MINOR
		)
	siemens_coefficient = 0.3

/obj/item/clothing/suit/space/syndicate/stalker
	name = "crimson space suit"
	icon_state = "syndicate"
	desc = "A crimson spacesuit sporting clean lines and durable plating. Robust, reliable, and slightly suspicious."
	armor = list(
		melee = ARMOR_MELEE_RESISTANT,
		bullet = ARMOR_BALLISTIC_PISTOL,
		laser = ARMOR_LASER_HANDGUNS,
		energy = ARMOR_ENERGY_MINOR,
		bomb = ARMOR_BOMB_MINOR,
		bio = ARMOR_BIO_SMALL,
		rad = ARMOR_RAD_MINOR
		)
	siemens_coefficient = 0.3 */

/obj/item/weapon/reagent_containers/glass/beaker/vial/random/toxin/bioterror
	random_reagent_list = list(
		list(/datum/reagent/mindbreaker = 10, /datum/reagent/space_drugs = 20) = 3,
		list(/datum/reagent/toxin/carpotoxin = 15)                             = 2,
		list(/datum/reagent/toxin/methyl_bromide = 15)                         = 2,
		list(/datum/reagent/toxin/amatoxin = 15)                               = 2,
		list(/datum/reagent/toxin/phoron = 15)                                 = 2,
		list(/datum/reagent/toxin/cyanide = 15)                                = 2,
		list(/datum/reagent/toxin/potassium_chlorophoride = 15)                = 2,
		list(/datum/reagent/acid/polyacid = 15)                                = 2,
		list(/datum/reagent/radium = 15)                                       = 2,
		list(/datum/reagent/toxin/zombiepowder = 10)                           = 1)

/obj/item/weapon/grenade/chem_grenade/bioterror
	name = "bioterror grenade"
	desc = "Used for clearing rooms of living things."
	path = 1
	stage = 2

	New()
		..()
		var/obj/item/weapon/reagent_containers/glass/beaker/large/B1 = new(src)
		var/obj/item/weapon/reagent_containers/glass/beaker/large/B2 = new(src)

		B1.reagents.add_reagent(/datum/reagent/phosphorus, 13)
		B1.reagents.add_reagent(/datum/reagent/sugar, 7)
		B2.reagents.add_reagent(/datum/reagent/sugar, 7)
		B2.reagents.add_reagent(/datum/reagent/potassium, 13)
		B1.reagents.add_reagent(/datum/reagent/space_drugs,20)
		B2.reagents.add_reagent(/datum/reagent/toxin/carpotoxin, 20)
		B1.reagents.add_reagent(/datum/reagent/mindbreaker, 20)
		B2.reagents.add_reagent(/datum/reagent/toxin/amatoxin, 20)
		B1.reagents.add_reagent(/datum/reagent/toxin/phoron, 20)
		B2.reagents.add_reagent(/datum/reagent/toxin/cyanide, 20)
		B1.reagents.add_reagent(/datum/reagent/toxin/potassium_chlorophoride, 20)
		B2.reagents.add_reagent(/datum/reagent/acid/polyacid, 20)
		B1.reagents.add_reagent(/datum/reagent/radium, 20)
		B2.reagents.add_reagent(/datum/reagent/capsaicin/condensed, 20)

		detonator = new/obj/item/device/assembly_holder/timer_igniter(src)

		beakers += B1
		beakers += B2
		icon_state = initial(icon_state) +"_locked"

/obj/item/clothing/suit/space/void/merc/pyro
	name = "blood-red pyro voidsuit helmet"
	desc = "An advanced helmet designed for work in special operations. Property of Gorlex Marauders. This one has a fire symbol on it."
	max_heat_protection_temperature = FIRESUIT_MAX_HEAT_PROTECTION_TEMPERATURE + 120

/obj/item/clothing/head/helmet/space/void/merc/pyro
	name = "blood-red pyro voidsuit"
	desc = "An advanced suit that protects against injuries during special operations. Property of Gorlex Marauders. This one has a fire symbol on it."
	max_heat_protection_temperature = FIRESUIT_MAX_HEAT_PROTECTION_TEMPERATURE + 120

/obj/item/clothing/suit/space/void/merc/pyro/prepared
	helmet = /obj/item/clothing/head/helmet/space/void/merc/pyro
	boots = /obj/item/clothing/shoes/magboots

/obj/item/clothing/suit/storage/leather_jacket/fake
	armor = list(
		melee = ARMOR_MELEE_MAJOR,
		bullet = ARMOR_BALLISTIC_RESISTANT,
		laser = ARMOR_LASER_HANDGUNS,
		energy = ARMOR_ENERGY_SMALL,
		bomb = ARMOR_BOMB_PADDED,
	)



//-------------------------------
//		   NEW SYNDIE KITS
//-------------------------------



/obj/item/weapon/storage/backpack/dufflebag/syndie_kit/space_cheap
	startswith = list(
		/obj/item/clothing/head/helmet/space/syndicate,
		/obj/item/clothing/suit/space/syndicate,
		/obj/item/clothing/mask/gas/syndicate,
		/obj/item/weapon/tank/emergency/oxygen/double
		)

/obj/item/weapon/storage/backpack/dufflebag/syndie_kit/plastique
	startswith = list(
		/obj/item/weapon/plastique = 6
		)

/obj/item/weapon/storage/backpack/dufflebag/syndie_kit/plastique/super
	startswith = list(
		/obj/item/weapon/plastique/super = 3
		)

/*/obj/item/weapon/storage/backpack/dufflebag/syndie_kit/stalker
	startswith = list(
		/obj/item/clothing/head/helmet/space/syndicate/stalker,
		/obj/item/clothing/suit/space/syndicate/stalker,
		/obj/item/clothing/mask/gas/syndicate,
		/obj/item/weapon/tank/emergency/oxygen/double,
		/obj/item/weapon/melee/baton/syndie,
		/obj/item/weapon/card/id/syndicate,
		/obj/item/weapon/storage/backpack/chameleon/sydie_kit,
		/obj/item/clothing/mask/chameleon/voice,
		/obj/item/weapon/tape_roll
		)*/

/obj/item/weapon/storage/box/syndie_kit/poisons
	startswith = list(
		/obj/item/weapon/reagent_containers/glass/beaker/vial/random/toxin/bioterror = 7
	)

/obj/item/weapon/storage/backpack/dufflebag/syndie_kit/bioterror
	startswith = list(
		/obj/item/clothing/suit/space/void/merc/prepared,
		/obj/item/clothing/mask/gas/syndicate,
		/obj/item/weapon/tank/emergency/oxygen/double,
		/obj/item/weapon/storage/box/syndie_kit/poisons,
		/obj/item/weapon/reagent_containers/spray/chemsprayer,
		/obj/item/weapon/grenade/chem_grenade/bioterror,
		/obj/item/weapon/gun/projectile/pistol/military/alt
		)

/obj/item/weapon/storage/backpack/dufflebag/syndie_kit/pyro
	startswith = list(
		/obj/item/clothing/suit/space/void/merc/pyro/prepared,
		/obj/item/clothing/mask/gas/syndicate,
		/obj/item/weapon/tank/emergency/oxygen/double,
		/obj/item/weapon/flamethrower/full,
		/obj/item/weapon/tank/phoron = 2,
		/obj/item/weapon/grenade/chem_grenade/incendiary = 2,
		/obj/item/weapon/gun/projectile/pistol/military/alt
		)

/obj/item/weapon/storage/backpack/dufflebag/syndie_kit/classic
	startswith = list(
		/obj/item/clothing/suit/armor/pcarrier/merc,
		/obj/item/clothing/head/helmet/merc,
		/obj/item/weapon/gun/projectile/automatic/assault_rifle,
		/obj/item/weapon/grenade/frag/high_yield,
		/obj/item/weapon/card/emag
		)

/obj/item/weapon/storage/backpack/dufflebag/syndie_kit/stealthy
	startswith = list(
		/datum/uplink_item/item/stealth_items/chameleon_kit,
		/obj/item/weapon/gun/projectile/pistol/military/alt,
		/obj/item/weapon/storage/backpack/satchel/syndie_kit/clerical,
		/obj/item/weapon/storage/box/syndie_kit/imp_freedom,
		/obj/item/device/uplink_service/fake_crew_announcement,
		/obj/item/weapon/card/emag
		)

/obj/item/weapon/storage/briefcase/syndie_kit/sniper
	startswith = list(
		/obj/item/clothing/under/lawyer/infil,
		/obj/item/clothing/suit/storage/leather_jacket/fake,
		/obj/item/weapon/gun/projectile/heavysniper,
		/obj/item/weapon/storage/box/ammo/sniperammo,
		/obj/item/clothing/glasses/thermal/syndi
		)

/obj/item/weapon/storage/backpack/dufflebag/syndie_kit/spaceass
	startswith = list(
		/obj/item/clothing/suit/space/void/merc/prepared,
		/obj/item/clothing/mask/gas/syndicate,
		/obj/item/weapon/tank/oxygen,
		/obj/item/weapon/gun/projectile/automatic/assault_rifle,
		/obj/item/weapon/plastique/super,
		/obj/item/weapon/card/emag
		)

/obj/item/weapon/storage/backpack/dufflebag/syndie_kit/saboteur
	startswith = list(
		/obj/item/clothing/suit/armor/pcarrier/merc,
		/obj/item/clothing/head/helmet/merc,
		/obj/item/device/flashlight/flashdark,
		/obj/item/device/chameleon,
		/obj/item/weapon/gun/projectile/pistol/military/alt,
		/obj/item/weapon/plastique = 2,
		/obj/item/weapon/card/emag
		)

/obj/item/weapon/storage/backpack/dufflebag/syndie_kit/medic
	startswith = list(
		/obj/item/clothing/suit/armor/pcarrier/merc,
		/obj/item/clothing/head/helmet/merc,
		/obj/item/weapon/storage/firstaid/combat,
		/obj/item/weapon/storage/firstaid/surgery,
		/obj/item/weapon/defibrillator/compact/combat/loaded,
		/obj/item/weapon/gun/projectile/pistol/military/alt,
		)