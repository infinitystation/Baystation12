/obj/item/storage/backpack/dufflebag/syndie_kit/space_cheap
	startswith = list(
		/obj/item/clothing/head/helmet/space/syndicate,
		/obj/item/clothing/suit/space/syndicate,
		/obj/item/clothing/mask/gas/syndicate,
		/obj/item/tank/emergency/oxygen/double
		)

/obj/item/storage/backpack/dufflebag/syndie_kit
	max_w_class = ITEM_SIZE_HUGE

/obj/item/storage/backpack/dufflebag/syndie_kit/plastique
	startswith = list(
		/obj/item/plastique = 6
		)

/obj/item/storage/backpack/dufflebag/syndie_kit/plastique/super
	startswith = list(
		/obj/item/plastique/super = 3
		)

/obj/item/storage/box/syndie_kit/poisons
	startswith = list(
		/obj/item/reagent_containers/glass/beaker/vial/random/toxin/bioterror = 7
	)

/obj/item/storage/backpack/dufflebag/syndie_kit/bioterror
	startswith = list(
		/obj/item/clothing/suit/space/void/merc/prepared,
		/obj/item/clothing/mask/gas/syndicate,
		/obj/item/tank/emergency/oxygen/double,
		/obj/item/reagent_containers/spray/chemsprayer/bioterror,
		/obj/item/grenade/chem_grenade/bioterror,
		/obj/item/gun/projectile/pistol/military/alt
		)

/obj/item/storage/backpack/dufflebag/syndie_kit/pyro
	startswith = list(
		/obj/item/clothing/suit/space/void/merc/heavy/prepared,
		/obj/item/clothing/mask/gas/syndicate,
		/obj/item/tank/emergency/oxygen/double,
		/obj/item/flamethrower/full,
		/obj/item/tank/phoron/full,
		/obj/item/grenade/chem_grenade/fuelspray,
		/obj/item/tank/flammable,
		/obj/item/gun/projectile/pistol/military/alt
		)

/obj/item/storage/backpack/dufflebag/syndie_kit/classic
	startswith = list(
		/obj/item/clothing/suit/armor/pcarrier/merc,
		/obj/item/clothing/head/helmet/merc,
		/obj/item/gun/projectile/automatic/assault_rifle,
		/obj/item/grenade/frag/high_yield,
		/obj/item/card/emag
		)

/obj/item/storage/backpack/dufflebag/syndie_kit/stealthy
	startswith = list(
		/obj/item/clothing/under/chameleon,
		/obj/item/clothing/suit/chameleon,
		/obj/item/clothing/shoes/chameleon,
		/obj/item/clothing/head/chameleon,
		/obj/item/clothing/mask/chameleon,
		/obj/item/storage/box/syndie_kit/chameleon,
		/obj/item/gun/energy/chameleon,
		/obj/item/gun/projectile/pistol/military/alt,
		/obj/item/stamp/chameleon,
		/obj/item/pen/chameleon,
		/obj/item/storage/box/syndie_kit/imp_freedom,
		/obj/item/device/uplink_service/fake_crew_announcement,
		/obj/item/card/emag
		)

/obj/item/storage/backpack/dufflebag/syndie_kit/sniper
	startswith = list(
		/obj/item/clothing/under/det,
		/obj/item/clothing/suit/storage/leather_jacket/armored,
		/obj/item/gun/projectile/heavysniper,
		/obj/item/storage/box/ammo/sniperammo,
		/obj/item/clothing/glasses/thermal/syndi
		)

/obj/item/storage/backpack/dufflebag/syndie_kit/spaceass
	startswith = list(
		/obj/item/clothing/suit/space/void/merc/prepared,
		/obj/item/clothing/mask/gas/syndicate,
		/obj/item/tank/oxygen,
		/obj/item/gun/projectile/automatic/assault_rifle,
		/obj/item/plastique/super,
		/obj/item/card/emag
		)

/obj/item/storage/backpack/dufflebag/syndie_kit/saboteur
	startswith = list(
		/obj/item/clothing/suit/armor/pcarrier/merc,
		/obj/item/clothing/head/helmet/merc,
		/obj/item/device/flashlight/flashdark,
		/obj/item/device/chameleon,
		/obj/item/gun/projectile/pistol/military/alt,
		/obj/item/plastique = 2,
		/obj/item/card/emag
		)

/obj/item/storage/backpack/dufflebag/syndie_kit/medic
	startswith = list(
		/obj/item/clothing/suit/armor/pcarrier/merc,
		/obj/item/clothing/head/helmet/merc,
		/obj/item/storage/firstaid/combat,
		/obj/item/storage/firstaid/surgery,
		/obj/item/defibrillator/compact/combat/loaded,
		/obj/item/gun/projectile/pistol/military/alt,
		)

/obj/item/storage/backpack/dufflebag/syndie_kit/heavy
	startswith = list(
		/obj/item/clothing/suit/space/void/merc/heavy/prepared,
		/obj/item/gun/projectile/automatic/l6_saw,
		/obj/item/ammo_magazine/box/machinegun = 3,
		/obj/item/grenade/frag/high_yield,
		/obj/item/shield/energy
		)

/obj/item/storage/backpack/dufflebag/syndie_kit/mag_shotgun
	startswith = list(
		/obj/item/gun/projectile/shotgun/magazine,
		/obj/item/ammo_magazine/c12m/shock,
		/obj/item/ammo_magazine/c12m = 2,
		/obj/item/ammo_magazine/c12m/buckshot = 2
		)

/obj/item/storage/box/syndie_kit/imp_adr
	startswith = list(/obj/item/implanter/adrenal)

/obj/item/storage/box/syndie_kit/imp_emp
	startswith = list(/obj/item/implanter/emp)

/obj/item/storage/box/syndie_kit/fake_death
	startswith = list(/obj/item/implanter/fake_death)

/obj/item/storage/backpack/dufflebag/syndie_kit/space/heavy
	startswith = list(
		/obj/item/clothing/suit/space/void/merc/heavy/prepared,
		/obj/item/clothing/mask/gas/syndicate,
		/obj/item/tank/emergency/oxygen/double,
		)

/obj/item/storage/box/syndie_kit/chambox
	name = "chameleon box"
	desc = "A small box with holoprojector, designed to carry your goods stealthy."

/obj/item/storage/box/syndie_kit/chambox/afterattack(obj/item/target, mob/user , proximity)
	if(!proximity)
		return
	if(!target)
		return
	if(target.w_class <= w_class)
		name = target.name
		desc = target.desc
		icon = target.icon
		color = target.color
		icon_state = target.icon_state
		playsound(get_turf(src), 'sound/weapons/flash.ogg', 100, 1, -6)
		update_icon()
	else
		to_chat(user, "\The [target] is too big for \the [src] hologramm")

/obj/item/storage/box/syndie_kit/chambox/attack_self(mob/user)
	to_chat(user, "You can't fold [src] flat!")

/obj/item/storage/box/syndie_kit/jaunter
	startswith = list(/obj/item/device/syndietele,
					  /obj/item/device/syndiejaunter)

/obj/item/storage/backpack/dufflebag/syndie_kit/l6_saw
	startswith = list(
		/obj/item/gun/projectile/automatic/l6_saw,
		/obj/item/ammo_magazine/box/machinegun = 3
		)

/obj/item/storage/box/syndie_kit/gluon
	name = "box of gluon grenades"
	desc = "A box containing 5 gluon grenades."
	startswith = list(/obj/item/grenade/chem_grenade/gluon = 5)

/obj/item/storage/backpack/satchel/syndie_kit/constrictor_harness
	startswith = list(
		/obj/item/clothing/suit/constrictor_harness,
		/obj/item/tank/emergency/oxygen,
		/obj/item/clothing/mask/gas/half
	)
