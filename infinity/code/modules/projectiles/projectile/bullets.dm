/obj/item/projectile/bullet/pistol/tiny
	damage = 8 //.22, etc
	armor_penetration = 8

/obj/item/projectile/bullet/pistol/tiny/rubber
	name = "rubber bullet tiny"
	check_armour = "melee"
	damage = 1
	agony = 15
	embed = 0
	sharp = 0
	armor_penetration = 1

/obj/item/projectile/bullet/pistol/medium/fast
	fire_sound = 'sound/weapons/gunshot/gunshot_smg.ogg'
	damage = 18 //4.6x30 mm, 5.7x28 mm
	armor_penetration = 25


/obj/item/projectile/bullet/pistol/strong/rubber
	damage = 0
	sharp = 0
	embed = 0
	armor_penetration = 10
	agony = 60

/obj/item/projectile/bullet/smg/uni46x30mm
	damage = 20
	armor_penetration = 5

/obj/item/projectile/bullet/smg/uni46x30mm_charged
	damage = 15
	armor_penetration = 30

/obj/item/projectile/bullet/explosion/shotgun
	name = "grenade"
	fire_sound = 'sound/weapons/gunshot/shotgun.ogg'

/obj/item/projectile/bullet/explosion/shotgun/on_hit(var/atom/target, var/blocked = 0)
	if(isturf(target))
		explosion(target, -1, 1, 1)
	..()

/* "Rifle" rounds */

/obj/item/projectile/bullet/rifle/a763r
	fire_sound = 'sound/weapons/gunshot/gunshot2.ogg'
	damage = 36
	armor_penetration = 40

/obj/item/projectile/bullet/rifle/a12755 //this one has 10 ammo in magazine.
	fire_sound = 'sound/weapons/gunshot/sniper.ogg'
	damage = 45 //12x55mm
	armor_penetration = 50
	penetrating = 2
	penetration_modifier = 1.1

/obj/item/projectile/bullet/rifle/a127
	fire_sound = 'sound/weapons/gunshot/sniper.ogg'
	damage = 70 //.50BMG
	stun = 1
	weaken = 1
	penetrating = 3
	armor_penetration = 75
	hitscan = 1
	penetration_modifier = 1.25

/obj/item/projectile/bullet/rifle/a127/apds
	damage = 65
	penetrating = 4
	armor_penetration = 85
	penetration_modifier = 1.5
