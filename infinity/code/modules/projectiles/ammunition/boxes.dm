/obj/item/ammo_magazine/c50/rubber
	name = "speed loader (.50, rubber)"
	ammo_type = /obj/item/ammo_casing/a50/rubber

/obj/item/ammo_magazine/mc9mm/rubber
	name = "magazine (9mm, rubber)"

/obj/item/ammo_magazine/mil_rifle/extended
	name = "extended magazine (7.62mm)"
	origin_tech = list(TECH_COMBAT = 3)
	matter = list(MATERIAL_STEEL = 2400)
	max_ammo = 21

/obj/item/ammo_magazine/c22m
	name = "magazine (.22LR)"
	icon = 'infinity/icons/obj/ammo.dmi'
	icon_state = "letal22"
	mag_type = MAGAZINE
	ammo_type = /obj/item/ammo_casing/a22lr
	matter = list(MATERIAL_STEEL = 525)
	caliber = CALIBER_PISTOL_TINY
	max_ammo = 15

/obj/item/ammo_magazine/a22lr
	name = "speed loader (.22LR)"
	desc = "A speed loader for revolvers."
	icon_state = "38"
	caliber = CALIBER_PISTOL_TINY
	ammo_type = /obj/item/ammo_casing/a22lr
	max_ammo = 10
	multiple_sprites = 1

/obj/item/ammo_magazine/c22m/rubber
	name = "magazine (.22LR, rubber)"
	icon = 'infinity/icons/obj/ammo.dmi'
	icon_state = "ruber22"
	mag_type = MAGAZINE
	ammo_type = /obj/item/ammo_casing/a22lr/rubber
	matter = list(MATERIAL_STEEL = 525)
	caliber = "22"
	max_ammo = 15

/obj/item/ammo_magazine/c12m
	name = "slug drum"
	icon = 'infinity/icons/obj/ammo.dmi'
	icon_state = "m12gb"
	mag_type = MAGAZINE
	ammo_type = /obj/item/ammo_casing/shotgun
	matter = list(MATERIAL_STEEL = 525)
	caliber = CALIBER_SHOTGUN
	multiple_sprites = 1
	max_ammo = 8

/obj/item/ammo_magazine/c12m/empty
	icon_state = "m12gb-0"
	initial_ammo = 0

/obj/item/ammo_magazine/c12m/shock
	name = "shock drum"
	icon_state = "m12gs"
	mag_type = MAGAZINE
	ammo_type = /obj/item/ammo_casing/shotgun/stunshell
	matter = list(MATERIAL_STEEL = 525)
	caliber = CALIBER_SHOTGUN
	max_ammo = 8

/obj/item/ammo_magazine/c12m/buckshot
	name = "buckshot drum"
	icon_state = "m12gb"
	mag_type = MAGAZINE
	ammo_type = /obj/item/ammo_casing/shotgun/pellet
	matter = list(MATERIAL_STEEL = 525)
	caliber = CALIBER_SHOTGUN
	max_ammo = 8

/obj/item/ammo_magazine/c12755
	name = "magazine (12.7x55mm)"
	icon_state = "assault_rifle"
	mag_type = MAGAZINE
	caliber = CALIBER_ANTIMATERIAL_SMALL
	matter = list(MATERIAL_STEEL = 2300)
	ammo_type = /obj/item/ammo_casing/a12755
	max_ammo = 8
	multiple_sprites = 1

/obj/item/ammo_magazine/c12755/empty
	initial_ammo = 0

/obj/item/ammo_magazine/mc57
	name = "magazine (5.7mm)"
	icon = 'infinity/icons/event/ammo.dmi'
	icon_state = "smg"
	mag_type = MAGAZINE
	ammo_type = /obj/item/ammo_casing/c57
	matter = list(MATERIAL_STEEL = 1200)
	caliber = CALIBER_PISTOL_FAST
	max_ammo = 30

/obj/item/ammo_magazine/mc57/empty
	initial_ammo = 0

/obj/item/ammo_magazine/uni46x30mm
	name = "magazine (4.6x30mm universal)"
	icon = 'infinity/icons/event/ammo.dmi'
	icon_state = "smg"
	origin_tech = list(TECH_COMBAT = 2)
	mag_type = MAGAZINE
	caliber = CALIBER_PISTOL_FAST
	matter = list(MATERIAL_STEEL = 1500)
	ammo_type = /obj/item/ammo_casing/uni46x30mm
	max_ammo = 30
	multiple_sprites = 1

/obj/item/ammo_magazine/uni46x30mm/empty
	initial_ammo = 0

/obj/item/ammo_magazine/n10mm
	name = "NT41 magazine (5.7x28mm)"
	icon = 'infinity/icons/obj/ammo.dmi'
	icon_state = "10mm"
	mag_type = MAGAZINE
	ammo_type = /obj/item/ammo_casing/nt28mm
	matter = list(MATERIAL_STEEL = 1500)
	caliber = CALIBER_PISTOL_FAST
	max_ammo = 20
	multiple_sprites = 1

/obj/item/ammo_magazine/e
	icon = 'infinity/icons/obj/p_weapon.dmi'
	mag_type = MAGAZINE
	caliber = CALIBER_DART
	multiple_sprites = 1
	loadeble = 0

/obj/item/ammo_magazine/e/emg
	name = "Ares EMG MK4 magazine"
	icon_state = "EMG"
	ammo_type = /obj/item/ammo_casing/e/emg
	max_ammo = 60

/obj/item/ammo_magazine/e/rifle
	name = "Ares ER MK2 magazine"
	icon_state = "ER"
	ammo_type = /obj/item/ammo_casing/e/rifle
	max_ammo = 30

/obj/item/ammo_magazine/e/pistol
	name = "Ares EP \"Predator\" magazine"
	icon_state = "EP"
	ammo_type = /obj/item/ammo_casing/e/pistol
	max_ammo = 20

/obj/item/ammo_magazine/shotguntaj
	name = "magazine (12 gauge)"
	icon = 'infinity/icons/obj/ammo.dmi'
	icon_state = "taj12"
	mag_type = MAGAZINE
	ammo_type = /obj/item/ammo_casing/shotgun
	matter = list(MATERIAL_STEEL = 525)
	caliber = CALIBER_SHOTGUN
	max_ammo = 5

/obj/item/ammo_magazine/shotguntaj/empty
	icon_state = "taj12-0"
	initial_ammo = 0

/obj/item/ammo_magazine/shotguntaj/net
	name = "magazine (12 gauge) - net"
	icon = 'infinity/icons/obj/ammo.dmi'
	icon_state = "taj12"
	mag_type = MAGAZINE
	ammo_type = /obj/item/ammo_casing/shotgun/net
	matter = list(MATERIAL_STEEL = 525)
	caliber = CALIBER_SHOTGUN
	max_ammo = 5
