/obj/item/ammo_casing/a22lr
	desc = "A .22LR bullet casing."
	caliber = CALIBER_PISTOL_TINY
	projectile_type = /obj/item/projectile/bullet/pistol/tiny

/obj/item/ammo_casing/a22lr/rubber
	desc = "A .22LR rubber bullet casing."
	icon_state = "r-casing"
	spent_icon = "r-casing-spent"
	projectile_type = /obj/item/projectile/bullet/pistol/tiny/rubber

/obj/item/ammo_casing/a357
	desc = "A .357 bullet casing."
	caliber = CALIBER_PISTOL_SMALL_MAGNUM
	icon_state = "357casing"
	spent_icon = "357casing-spent"

/obj/item/ammo_casing/a50/rubber
	desc = "A .50AE rubber edition"
	projectile_type = /obj/item/projectile/bullet/pistol/strong/rubber

/obj/item/ammo_casing/c57
	desc = "A 5.7mm bullet casing."
	caliber = CALIBER_PISTOL_FAST
	projectile_type = /obj/item/projectile/bullet/pistol/medium/fast

/obj/item/ammo_casing/c9mm/used/Initialize()
	. = ..()
	expend()
	pixel_x = rand(-10, 10)
	pixel_y = rand(-10, 10)

/obj/item/ammo_casing/c44/rubber
	desc = "A .44 magnum rubber bullet casing."

/obj/item/ammo_casing/a12755
	name = "bullet casing"
	desc = "A 12.7x55mm bullet casing."
	projectile_type = /obj/item/projectile/bullet/rifle/a12755
	icon_state = "lcasing"
	spent_icon = "lcasing-spent"
	caliber = CALIBER_ANTIMATERIAL_SMALL
	matter = list(MATERIAL_STEEL = 500)

/obj/item/ammo_casing/uni46x30mm
	desc = "A 46x30mm bullet casing."
	caliber = CALIBER_PISTOL_FAST
	projectile_type = /obj/item/projectile/bullet/smg/uni46x30mm

/obj/item/ammo_casing/nt28mm
	desc = "A 5.7x28mm bullet casing."
	caliber = CALIBER_PISTOL_FAST
	projectile_type = /obj/item/projectile/bullet/pistol/medium/fast

// EMP ammo.
/obj/item/ammo_casing/c44/emp
	desc = "A .44 haywire round"
	desc = "A .44 bullet casing fitted with a single-use ion pulse generator."
	caliber = CALIBER_PISTOL_BIG_MAGNUM
	icon_state = "empcasing"
	projectile_type = /obj/item/projectile/ion/small
	matter = list(MATERIAL_STEEL = 130, MATERIAL_URANIUM = 100)

/obj/item/ammo_casing/shotgun/net
	name = "net shell"
	desc = "A net shell."
	icon_state = "netshell"
	projectile_type = /obj/item/projectile/bullet/shotgun/beanbag/net
	matter = list(MATERIAL_STEEL = 180)

/obj/item/ammo_casing/e
	desc = "Dart for energy weapon"
	caliber = CALIBER_DART
	icon_state = "lcasing"
	spent_icon = "lcasing-spent"

/obj/item/ammo_casing/e/emg
	projectile_type = /obj/item/projectile/bullet/Erifle

/obj/item/ammo_casing/e/expend()
	qdel(src)

/obj/item/ammo_casing/e/rifle
	projectile_type = /obj/item/projectile/bullet/Erifle/small

/obj/item/ammo_casing/e/pistol
	projectile_type = /obj/item/projectile/bullet/Erifle/pistol

// Instagib //
/obj/item/ammo_casing/energy/instakill
	projectile_type = /obj/item/projectile/beam/instakill

/obj/item/ammo_casing/energy/instakill/blue
	projectile_type = /obj/item/projectile/beam/instakill/blue

/obj/item/ammo_casing/energy/instakill/red
	projectile_type = /obj/item/projectile/beam/instakill/red
