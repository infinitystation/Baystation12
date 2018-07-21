/obj/item/ammo_casing/a17
	desc = "A .17 HMR bullet casing."
	caliber = "17"
	projectile_type = /obj/item/projectile/bullet/pistol/tiny

/obj/item/ammo_casing/a357
	desc = "A .357 bullet casing."
	caliber = "357"
	projectile_type = /obj/item/projectile/bullet/pistol/medium/revolver

/obj/item/ammo_casing/a50
	desc = "A .50AE bullet casing."
	caliber = ".50"
	projectile_type = /obj/item/projectile/bullet/pistol/strong

/obj/item/ammo_casing/a75
	desc = "A 20mm gyro shell."
	caliber = "75"
	projectile_type = /obj/item/projectile/bullet/gyro

/obj/item/ammo_casing/c38
	desc = "A .38 bullet casing."
	caliber = "38"
	projectile_type = /obj/item/projectile/bullet/pistol

/obj/item/ammo_casing/c38/rubber
	desc = "A .38 rubber bullet casing."
	projectile_type = /obj/item/projectile/bullet/pistol/rubber
	icon_state = "r-casing"
	spent_icon = "r-casing-spent"

/obj/item/ammo_casing/c9mm
	desc = "A 9x19mm bullet casing."
	caliber = "9mm"
	projectile_type = /obj/item/projectile/bullet/pistol

/obj/item/ammo_casing/c9mm/flash
	desc = "A 9x19mm flash shell casing."
	projectile_type = /obj/item/projectile/energy/flash

/obj/item/ammo_casing/c9mm/rubber
	desc = "A 9x19mm rubber bullet casing."
	projectile_type = /obj/item/projectile/bullet/pistol/rubber
	icon_state = "r-casing"
	spent_icon = "r-casing-spent"

/obj/item/ammo_casing/c9mm/practice
	desc = "A 9x19mm practice bullet casing."
	projectile_type = /obj/item/projectile/bullet/pistol/practice

/obj/item/ammo_casing/c9mm/used/Initialize()
	. = ..()
	expend()
	pixel_x = rand(-10, 10)
	pixel_y = rand(-10, 10)


/obj/item/ammo_casing/c44
	desc = "A .44 magnum bullet casing."
	caliber = ".44"
	projectile_type = /obj/item/projectile/bullet/pistol/strong/revolver

/obj/item/ammo_casing/c44/rubber
	desc = "A .44 magnum rubber bullet casing."
	projectile_type = /obj/item/projectile/bullet/pistol/strong/revolver/rubber
	icon_state = "r-casing"
	spent_icon = "r-casing-spent"

/obj/item/ammo_casing/c45
	desc = "A .45 bullet casing."
	caliber = ".45"
	projectile_type = /obj/item/projectile/bullet/pistol/medium

/obj/item/ammo_casing/c45/practice
	desc = "A .45 practice bullet casing."
	projectile_type = /obj/item/projectile/bullet/pistol/practice

/obj/item/ammo_casing/c45/rubber
	desc = "A .45 rubber bullet casing."
	projectile_type = /obj/item/projectile/bullet/pistol/rubber
	icon_state = "r-casing"
	spent_icon = "r-casing-spent"

/obj/item/ammo_casing/c45/flash
	desc = "A .45 flash shell casing."
	projectile_type = /obj/item/projectile/energy/flash

/obj/item/ammo_casing/a10mm
	desc = "A 10x25mm bullet casing."
	caliber = "10mm"
	projectile_type = /obj/item/projectile/bullet/pistol/medium/smg

/obj/item/ammo_casing/shotgun
	name = "shotgun slug"
	desc = "A 12 gauge slug."
	icon_state = "slshell"
	spent_icon = "slshell-spent"
	caliber = "shotgun"
	projectile_type = /obj/item/projectile/bullet/shotgun
	matter = list(DEFAULT_WALL_MATERIAL = 360)
	fall_sounds = list('sound/weapons/guns/shotgun_fall.ogg')

/obj/item/ammo_casing/shotgun/pellet
	name = "shotgun shell"
	desc = "A 12 gauge shell."
	icon_state = "gshell"
	spent_icon = "gshell-spent"
	projectile_type = /obj/item/projectile/bullet/pellet/shotgun
	matter = list(DEFAULT_WALL_MATERIAL = 360)

/obj/item/ammo_casing/shotgun/blank
	name = "shotgun shell"
	desc = "A blank shell."
	icon_state = "blshell"
	spent_icon = "blshell-spent"
	projectile_type = /obj/item/projectile/bullet/blank
	matter = list(DEFAULT_WALL_MATERIAL = 90)

/obj/item/ammo_casing/shotgun/practice
	name = "shotgun shell"
	desc = "A practice shell."
	icon_state = "pshell"
	spent_icon = "pshell-spent"
	projectile_type = /obj/item/projectile/bullet/shotgun/practice
	matter = list("metal" = 90)

/obj/item/ammo_casing/shotgun/beanbag
	name = "beanbag shell"
	desc = "A beanbag shell."
	icon_state = "bshell"
	spent_icon = "bshell-spent"
	projectile_type = /obj/item/projectile/bullet/shotgun/beanbag
	matter = list(DEFAULT_WALL_MATERIAL = 180)

//Can stun in one hit if aimed at the head, but
//is blocked by clothing that stops tasers and is vulnerable to EMP
/obj/item/ammo_casing/shotgun/stunshell
	name = "stun shell"
	desc = "A 12 gauge taser cartridge."
	icon_state = "stunshell"
	spent_icon = "stunshell-spent"
	projectile_type = /obj/item/projectile/energy/electrode/stunshot
	leaves_residue = 0
	matter = list(DEFAULT_WALL_MATERIAL = 360, "glass" = 720)

/obj/item/ammo_casing/shotgun/stunshell/emp_act(severity)
	if(prob(100/severity)) BB = null
	update_icon()

//Does not stun, only blinds, but has area of effect.
/obj/item/ammo_casing/shotgun/flash
	name = "flash shell"
	desc = "A chemical shell used to signal distress or provide illumination."
	icon_state = "fshell"
	spent_icon = "fshell-spent"
	projectile_type = /obj/item/projectile/energy/flash/flare
	matter = list(DEFAULT_WALL_MATERIAL = 90, "glass" = 90)

/obj/item/ammo_casing/shotgun/greande
	name = "shotgun grenade shell"
	desc = "A 12 gauge grenade shell."
	icon_state = "gshell"
	spent_icon = "gshell-spent"
	projectile_type = /obj/item/projectile/bullet/explosion/shotgun
	matter = list(DEFAULT_WALL_MATERIAL = 500)

/obj/item/ammo_casing/a556
	desc = "A 5.56x45mm bullet casing."
	caliber = "a556"
	projectile_type = /obj/item/projectile/bullet/rifle/a556
	icon_state = "rifle-casing"
	spent_icon = "rifle-casing-spent"

/obj/item/ammo_casing/a556/ap
	desc = "A 5.56x45mm AP bullet casing."
	projectile_type = /obj/item/projectile/bullet/rifle/a556/ap

/obj/item/ammo_casing/a12755
	name = "bullet casing"
	desc = "A 12.7x55mm bullet casing."
	projectile_type = /obj/item/projectile/bullet/rifle/a12755
	icon_state = "lcasing"
	spent_icon = "lcasing-spent"
	caliber = "127x55"
	matter = list(DEFAULT_WALL_MATERIAL = 500)

/obj/item/ammo_casing/a145
	name = "shell casing"
	desc = "A 14.5mm shell."
	icon_state = "lcasing"
	spent_icon = "lcasing-spent"
	caliber = "14.5mm"
	projectile_type = /obj/item/projectile/bullet/rifle/a145
	matter = list(DEFAULT_WALL_MATERIAL = 1250)

/obj/item/ammo_casing/a145/apds
	name = "APDS shell casing"
	desc = "A 14.5mm Armour Piercing Discarding Sabot shell."
	projectile_type = /obj/item/projectile/bullet/rifle/a145/apds

/obj/item/ammo_casing/a762
	desc = "A 7.62x39mm bullet casing."
	caliber = "a762"
	projectile_type = /obj/item/projectile/bullet/rifle/a762
	icon_state = "rifle-casing"
	spent_icon = "rifle-casing-spent"

/obj/item/ammo_casing/a762/ap
	desc = "A 7.62x39mm AP bullet casing."
	projectile_type = /obj/item/projectile/bullet/rifle/a762/ap

/obj/item/ammo_casing/a762/practice
	desc = "A 7.62x39mm practice bullet casing."
	projectile_type = /obj/item/projectile/bullet/rifle/a762/practice

/obj/item/ammo_casing/rocket
	name = "rocket shell"
	desc = "A high explosive designed to be fired from a launcher."
	icon_state = "rocketshell"
	projectile_type = /obj/item/missile
	caliber = "rocket"

/obj/item/ammo_casing/cap
	name = "cap"
	desc = "A cap for children toys."
	caliber = "caps"
	color = "#ff0000"
	projectile_type = /obj/item/projectile/bullet/pistol/cap

// EMP ammo.
/obj/item/ammo_casing/c38/emp
	name = ".38 haywire round"
	desc = "A .38 bullet casing fitted with a single-use ion pulse generator."
	icon_state = "empcasing"
	projectile_type = /obj/item/projectile/ion/small
	matter = list(DEFAULT_WALL_MATERIAL = 130, "uranium" = 100)

/obj/item/ammo_casing/c45/emp
	name = ".45 haywire round"
	desc = "A .45 bullet casing fitted with a single-use ion pulse generator."
	projectile_type = /obj/item/projectile/ion/small
	icon_state = "empcasing"
	matter = list(DEFAULT_WALL_MATERIAL = 130, "uranium" = 100)

/obj/item/ammo_casing/a10mm/emp
	name = "10mm haywire round"
	desc = "A 10mm bullet casing fitted with a single-use ion pulse generator."
	projectile_type = /obj/item/projectile/ion/small
	icon_state = "empcasing"
	matter = list(DEFAULT_WALL_MATERIAL = 130, "uranium" = 100)

/obj/item/ammo_casing/shotgun/emp
	name = "haywire slug"
	desc = "A 12-gauge shotgun slug fitted with a single-use ion pulse generator."
	icon_state = "empshell"
	spent_icon = "empshell-spent"
	projectile_type  = /obj/item/projectile/ion
	matter = list(DEFAULT_WALL_MATERIAL = 260, "uranium" = 200)

/obj/item/ammo_casing/uni46x20mm
	desc = "A 4.6x20 mm bullet casing."
	caliber = "46x20mm"
	projectile_type = /obj/item/projectile/bullet/pistol/smg

/obj/item/ammo_casing/a57
	desc = "A 5.7x28 mm bullet casing."
	caliber = "57"
	projectile_type = /obj/item/projectile/bullet/pistol/tiny/fast

/obj/item/ammo_casing/a3006
	desc = "A .30-06 bullet casing."
	caliber = "3006"
	icon = 'icons/obj/infinity_ammo.dmi'
	icon_state = "3006"
	spent_icon = "3006old"
	projectile_type = /obj/item/projectile/bullet/rifle/a762r

/obj/item/ammo_casing/a4570
	desc = "A .45-70 Government bullet casing."
	caliber = "4570"
	icon = 'icons/obj/infinity_ammo.dmi'
	icon_state = "3006"
	spent_icon = "3006old"
	projectile_type = /obj/item/projectile/bullet/rifle/a4570

/obj/item/ammo_casing/a410
	desc = "A .410 slug."
	caliber = "4570"
	icon = 'icons/obj/infinity_ammo.dmi'
	icon_state = "bshell-live"
	spent_icon = "bshell"
	projectile_type = /obj/item/projectile/bullet/rifle/a410

/obj/item/ammo_casing/a410/pellet
	desc = "A .410 shell."
	caliber = "4570"
	icon = 'icons/obj/infinity_ammo.dmi'
	icon_state = "gshell-live"
	spent_icon = "gshell"
	projectile_type = /obj/item/projectile/bullet/pellet/a410/

/obj/item/ammo_casing/a410/stun
	desc = "A .410 stun shell."
	caliber = "4570"
	icon = 'icons/obj/infinity_ammo.dmi'
	icon_state = "stunshell-live"
	spent_icon = "stunshell"
	projectile_type = /obj/item/projectile/energy/electrode