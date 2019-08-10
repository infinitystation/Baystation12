#define CALIBER_GREN				"35mm"

/obj/item/weapon/gun/projectile/shotgun/pump/badboy
	name = "BB-17"
	desc = "Pump-action grenade launcher aka Bad-Boy 17 is the weapon manufactured for law enforcement agencies GCC. 35mm - that sounds proud, blin!"
	icon = 'somestuff.dmi'
	icon_state = "badboy"
	item_state = "badboy"
	max_shells = 1
	w_class = ITEM_SIZE_HUGE
	force = 10
	scoped_accuracy = 15
	scope_zoom = 1.5
	obj_flags =  OBJ_FLAG_CONDUCTIBLE
	slot_flags = SLOT_BACK
	caliber = CALIBER_GREN
	origin_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 2)
	load_method = SINGLE_CASING
	ammo_type = /obj/item/ammo_casing/bb
	handle_casings = HOLD_CASINGS
	wielded_item_state = "gun_wielded"
	load_sound = 'sound/weapons/guns/interaction/shotgun_instert.ogg'

/obj/item/ammo_casing/bb
	name = "rubber slug"
	desc = "Large black rubber bullet. Perfect to shooting into groins."
	icon = 'somestuff.dmi'
	icon_state = "rubbergr"
	spent_icon = "spentgr"
	caliber = CALIBER_GREN
	projectile_type = /obj/item/projectile/bullet/shotgun/bb
	fall_sounds = list('sound/weapons/guns/shotgun_fall.ogg')

/obj/item/projectile/bullet/shotgun/bb
	damage = 10
	agony = 100
	stun = 10
	weaken = 10
	armor_penetration = 20

/obj/item/ammo_casing/bb/stunshell
	name = "stun shell"
	desc = "Large taser cartridge."
	icon_state = "stungr"
	spent_icon = "spentgr"
	projectile_type = /obj/item/projectile/energy/electrode/stunshot/bb
	leaves_residue = 0

/obj/item/projectile/energy/electrode/stunshot/bb
	nodamage = 0
	damage = 10
	agony = 100
	damage_type = BURN
	armor_penetration = 25

/obj/item/ammo_casing/bb/flash
	name = "flash shell"
	desc = "Large chemical shell used to signal distress or provide illumination."
	icon_state = "flashgr"
	spent_icon = "spentgr"
	projectile_type = /obj/item/projectile/energy/flash/flare/bb

/obj/item/projectile/energy/flash/flare/bb
	damage = 15
	damage_type = BURN
	agony = 30
	flash_range = 5
	brightness = 15

/obj/item/ammo_casing/bb/emp
	name = "haywire slug"
	desc = "Large hi-tec slug fitted with a single-use high-power ion pulse generator."
	icon_state = "empgr"
	spent_icon = "spentgr"
	projectile_type  = /obj/item/projectile/ion/bb

/obj/item/projectile/ion/bb
	damage = 15
	damage_type = BURN
	heavy_effect_range = 2
	light_effect_range = 4

/obj/item/ammo_casing/bb/pellet
	name = "shrapnel shell"
	desc = "Mince..."
	icon_state = "shrapgr"
	spent_icon = "spentgr"
	projectile_type = /obj/item/projectile/bullet/pellet/shotgun/bb

/obj/item/projectile/bullet/pellet/shotgun/bb
	damage = 15
	pellets = 15

/obj/item/ammo_casing/bb/osoka
	name = "fragmentary shell"
	desc = "Shrapnel grenade?"
	icon_state = "osokagr"
	spent_icon = "spentgr"
	projectile_type = /obj/item/projectile/bullet/osoka/bb

/obj/item/projectile/bullet/osoka/bb
	damage = 15
	on_hit(var/atom/target, var/blocked = 0)
		explosion(target, -1, 1, 4)

/obj/item/projectile/bullet/osoka/bb/on_hit(var/atom/target, var/blocked = 0, var/def_zone = null)
    fragmentate(get_turf(target), 60, 20)

/obj/item/ammo_casing/bb/lom
	name = "APFSDS-T"
	desc = "Lom, this is you? God, why..."
	icon_state = "lomgr"
	spent_icon = "spentgr"
	projectile_type = /obj/item/projectile/bullet/shotgun/bb/lom

/obj/item/projectile/bullet/shotgun/bb/lom
	damage = 25
	agony = 100
	penetrating = 15
	armor_penetration = 100

/obj/item/weapon/storage/box/bb
	name = "box of rubber shots"
	desc = "A box containing 8 rubber shells for BB-17 grenade launcher."
	icon = 'somestuff.dmi'
	icon_state = "rubsb"
	startswith = list(/obj/item/ammo_casing/bb = 10)

/obj/item/weapon/storage/box/bb/stun
	name = "box of stun shots"
	desc = "A box containing 8 stun shells for BB-17 grenade launcher."
	icon_state = "stusb"
	startswith = list(/obj/item/ammo_casing/bb/stunshell = 10)

/obj/item/weapon/storage/box/bb/flash
	name = "box of flash shots"
	desc = "A box containing 8 flash shells for BB-17 grenade launcher."
	icon_state = "flasb"
	startswith = list(/obj/item/ammo_casing/bb/flash = 10)

/obj/item/weapon/storage/box/bb/emp
	name = "box of emp shots"
	desc = "A box containing 8 emp shells for BB-17 grenade launcher."
	icon_state = "empsb"
	startswith = list(/obj/item/ammo_casing/bb/emp = 10)

/obj/item/weapon/storage/box/bb/pellet
	name = "box of pellet shots"
	desc = "A box containing 8 mincecreating shells for BB-17 grenade launcher."
	icon_state = "shrsb"
	startswith = list(/obj/item/ammo_casing/bb/pellet = 10)

/obj/item/weapon/storage/box/bb/osoka
	name = "box of frag shots"
	desc = "A box containing 8 fragmentary explosive shells for BB-17 grenade launcher."
	icon_state = "ososb"
	startswith = list(/obj/item/ammo_casing/bb/osoka = 10)

/obj/item/weapon/storage/box/bb/lom
	name = "box of AP shots"
	desc = "A box containing 8 APFSDS-T shells for BB-17 grenade launcher."
	icon_state = "lomsb"
	startswith = list(/obj/item/ammo_casing/bb/lom = 10)

/obj/item/clothing/accessory/storage/bandolier/grenader
	name = "grenade bandolier"
	desc = "A lightweight synthethic bandolier with straps for holding grenades."
	icon_state = "bandolier"
	slots = 10
	max_w_class = ITEM_SIZE_NORMAL

/obj/item/clothing/accessory/storage/bandolier/Initialize()
	. = ..()
	hold.can_hold = list(
		/obj/item/ammo_casing/bb,
		/obj/item/weapon/grenade,
		/obj/item/weapon/material/knife,
		/obj/item/weapon/material/star,
		/obj/item/weapon/plastique,
		/obj/item/weapon/storage/pill_bottle
	)

/obj/structure/closet/crate/secure/weapon/bb17/WillContain()
	return list(
		/obj/item/weapon/gun/projectile/shotgun/pump/badboy,
		/obj/item/clothing/accessory/storage/bandolier/grenader,
		/obj/item/weapon/storage/box/bb,
		/obj/item/weapon/storage/box/bb/stun,
		/obj/item/weapon/storage/box/bb/flash,
		/obj/item/weapon/storage/box/bb/emp,
		/obj/item/weapon/storage/box/bb/pellet,
		/obj/item/weapon/storage/box/bb/osoka,
		/obj/item/weapon/storage/box/bb/lom
	)

/obj/item/weapon/gun/launcher/grenade/kolony
	name = "grenade launcher"
	desc = "A bulky pump-action grenade launcher. Holds up to 6 grenades in a revolving magazine."
	icon_state = "riotgun"
	item_state = "riotgun"
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 3)
	w_class = ITEM_SIZE_HUGE
	force = 10
	scoped_accuracy = 15
	scope_zoom = 1.5
	throw_distance = 15

/obj/item/weapon/storage/box/lightinggrena
	name = "box of illumination grenades"
	desc = "A box containing 5 illumination grenades."
	icon_state = "flashbang"
	startswith = list(/obj/item/weapon/grenade/light = 5)


/obj/item/weapon/grenade/chem_grenade/incendiary/working
	name = "incendiary grenade"
	desc = "Used for clearing rooms of living things."
	path = 1
	stage = 2

	New()
		..()
		var/obj/item/weapon/reagent_containers/glass/beaker/large/B1 = new(src)
		var/obj/item/weapon/reagent_containers/glass/beaker/large/B2 = new(src)

		B1.reagents.add_reagent(/datum/reagent/aluminium, 40)
		B1.reagents.add_reagent(/datum/reagent/fuel,70)
		B1.reagents.add_reagent(/datum/reagent/water, 10)
		B2.reagents.add_reagent(/datum/reagent/toxin/phoron, 40)
		B2.reagents.add_reagent(/datum/reagent/acid, 40)
		B2.reagents.add_reagent(/datum/reagent/potassium, 10)

		detonator = new/obj/item/device/assembly_holder/timer_igniter(src)

		beakers += B1
		beakers += B2
		icon_state = initial(icon_state) +"_locked"

/obj/item/weapon/storage/box/napalm
	name = "box of incendiary grenades"
	desc = "A box containing 5 incendiary grenades."
	icon_state = "flashbang"
	startswith = list(/obj/item/weapon/grenade/chem_grenade/incendiary/working = 5)

/obj/item/weapon/grenade/chem_grenade/bombaster
	name = "hight explosive grenade"
	desc = "Potassium and water. Use with caution."
	stage = 2
	path = 1

	New()
		..()
		var/obj/item/weapon/reagent_containers/glass/beaker/large/B1 = new(src)
		var/obj/item/weapon/reagent_containers/glass/beaker/large/B2 = new(src)

		B1.reagents.add_reagent(/datum/reagent/potassium, 70)
		B2.reagents.add_reagent(/datum/reagent/water, 70)

		detonator = new/obj/item/device/assembly_holder/timer_igniter(src)

		beakers += B1
		beakers += B2
		icon_state = initial(icon_state) +"_locked"

/obj/item/weapon/storage/box/hiex
	name = "box of hight explosive grenades"
	desc = "A box containing 5 hight explosive grenades."
	icon_state = "flashbang"
	startswith = list(/obj/item/weapon/grenade/chem_grenade/bombaster = 5)

/obj/structure/closet/crate/secure/weapon/grenik/WillContain()
	return list(
		/obj/item/weapon/gun/launcher/grenade/kolony,
		/obj/item/clothing/accessory/storage/bandolier/grenader,
		/obj/item/weapon/storage/box/anti_photons,
		/obj/item/weapon/storage/box/flashbangs = 2,
		/obj/item/weapon/storage/box/teargas = 2,
		/obj/item/weapon/storage/box/emps,
		/obj/item/weapon/storage/box/fragshells = 2,
		/obj/item/weapon/storage/box/smokes = 2,
		/obj/item/weapon/storage/box/lightinggrena = 2,
		/obj/item/weapon/storage/box/napalm = 2,
		/obj/item/weapon/storage/box/hiex = 2
	)

/obj/structure/reagent_dispensers/watertank/nasos
	name = "Subsurface pump"
	desc = "A heavy industrial blue-space pump that gets water for you from the great depths of the planet."
	icon = 'somestuff.dmi'
	icon_state = "nasos"
	amount_per_transfer_from_this = 60
	possible_transfer_amounts = "60;120;240;600"
	initial_capacity = INFINITY
	anchored = 1

/turf/simulated/floor/reinforced/florglazio
	name = "heavy glass floor"
	desc = "Wow! More than a dozen centimeters of bulletproof glass, reinforced lead pipes under it. It looks strong, but it's scary to step on."
	icon = 'somestuff.dmi'
	icon_state = "florglass"
	initial_flooring = /decl/flooring/reinforced

/obj/item/weapon/rig/eva/reactor
	name = "reactor maintenance hardsuit control module"
	suit_type = "EVA hardsuit"
	desc = "A extremly heavy rig for repairs and maintenance right in the core of a working nuclear reactor."
	icon_state = "eva_rig"
	armor = list(melee = 60, bullet = 60, laser = 60,energy = 80, bomb = 85, bio = 100, rad = 100)
	online_slowdown = 6
	offline_slowdown = 12
	vision_restriction = TINT_HEAVY
	offline_vision_restriction = TINT_BLIND

	chest_type = /obj/item/clothing/suit/space/rig/eva/reactor
	helm_type = /obj/item/clothing/head/helmet/space/rig/eva/reactor
	boot_type = /obj/item/clothing/shoes/magboots/rig/eva/reactor
	glove_type = /obj/item/clothing/gloves/rig/eva/reactor

	allowed = list(/obj/item/device/flashlight,/obj/item/weapon/tank,/obj/item/device/suit_cooling_unit,/obj/item/weapon/storage/toolbox,/obj/item/weapon/storage/briefcase/inflatable,/obj/item/weapon/inflatable_dispenser,/obj/item/device/t_scanner,/obj/item/weapon/rcd)

	sprite_sheets = list(
		SPECIES_UNATHI = 'icons/mob/species/unathi/generated/onmob_rig_back_unathi.dmi'
		)

/obj/item/clothing/head/helmet/space/rig/eva/reactor
	light_overlay = "helmet_light_dual"
	camera = /obj/machinery/camera/network/engineering
	species_restricted = list(SPECIES_HUMAN,SPECIES_SKRELL,SPECIES_UNATHI,SPECIES_TAJARA,SPECIES_IPC)
	slowdown_general = 0.2
	sprite_sheets = list(
		SPECIES_TAJARA = 'icons/mob/species/tajaran/helmet.dmi',
		SPECIES_SKRELL = 'icons/mob/species/skrell/onmob_head_skrell.dmi',
		SPECIES_UNATHI = 'icons/mob/species/unathi/onmob_head_helmet_unathi.dmi'
		)

/obj/item/clothing/suit/space/rig/eva/reactor
	species_restricted = list(SPECIES_HUMAN,SPECIES_SKRELL,SPECIES_UNATHI,SPECIES_TAJARA,SPECIES_IPC)
	slowdown_general = 0.5
	sprite_sheets = list(
		SPECIES_UNATHI = 'icons/mob/species/unathi/generated/onmob_suit_unathi.dmi',
		SPECIES_TAJARA = 'icons/mob/species/tajaran/suit.dmi'
		)

/obj/item/clothing/shoes/magboots/rig/eva/reactor
	species_restricted = list(SPECIES_HUMAN,SPECIES_SKRELL,SPECIES_UNATHI,SPECIES_TAJARA,SPECIES_IPC)
	slowdown_general = 0.25
	sprite_sheets = list(
		SPECIES_UNATHI = 'icons/mob/species/unathi/generated/onmob_feet_unathi.dmi'
		)

/obj/item/clothing/gloves/rig/eva/reactor
	species_restricted = list(SPECIES_HUMAN,SPECIES_SKRELL,SPECIES_UNATHI,SPECIES_TAJARA,SPECIES_IPC)
	siemens_coefficient = 0
	slowdown_general = 0.3
	sprite_sheets = list(
		SPECIES_UNATHI = 'icons/mob/species/unathi/generated/onmob_hands_unathi.dmi'
		)

/obj/item/weapon/rig/eva/reactor/equipped

	initial_modules = list(
		/obj/item/rig_module/mounted/plasmacutter,
		/obj/item/rig_module/device/rcd,
		/obj/item/rig_module/vision/meson,
		/obj/item/rig_module/cooling_unit
		)

/obj/structure/reagent_dispensers/fueltank/stationary
	name = "fuel cistern"
	desc = "A very large tank filled with fuel. Strategic reserve, frightening its explosive."
	icon = '64.dmi'
	icon_state = "fueltankmax"
	amount_per_transfer_from_this = 60
	possible_transfer_amounts = "60;120;240;600"
	initial_capacity = 100000
	anchored = 1

/obj/item/weapon/gun/projectile/automatic/amrcarabine/balans
	name = "LDC-542M carabine"
	desc = "The sielent and deadly and manufactured by Aussec Armory, bullpup carabine LDC-542M is a common weapon for a long ranged combat units in Private Military Companies."
	force = 10
	caliber = CALIBER_RIFLE_MILITARY
	magazine_type = /obj/item/ammo_magazine/mil_rifle/empty
	allowed_magazines = /obj/item/ammo_magazine/mil_rifle
	ammo_type = /obj/item/ammo_casing/rifle/military
	scope_zoom = 2
	wielded_item_state = "z8carbine-wielded"

/obj/item/weapon/storage/box/cinkpulek
	name = "box of ammo"
	desc = "A box containing ammo for LDC-542M carabine."
	icon_state = "ammo"
	startswith = list(/obj/item/ammo_casing/rifle/military = 60)

/obj/structure/closet/crate/secure/weapon/snaipak/WillContain()
	return list(
		/obj/item/weapon/gun/projectile/automatic/amrcarabine/balans,
		/obj/item/ammo_magazine/mil_rifle/empty = 3,							//жалко того кто будет их набивать лол
		/obj/item/weapon/storage/box/cinkpulek = 2
	)