/obj/item/projectile/bullet/pistol/tiny
	damage = 8 //.22, etc
	armor_penetration = 8

/obj/item/projectile/bullet/pistol/tiny/rubber
	name = "rubber bullet tiny"
	damage_flags = 0
	damage = 1
	agony = 15
	embed = 0
	sharp = 0
	armor_penetration = 1

/obj/item/projectile/bullet/pistol/medium/fast
	fire_sound = 'sound/weapons/gunshot/gunshot_smg.ogg'
	damage = 45 //4.6x30 mm, 5.7x28 mm
	armor_penetration = 7.5
	distance_falloff = 2


/obj/item/projectile/bullet/pistol/strong/rubber
	damage = 0
	sharp = 0
	embed = 0
	armor_penetration = 10
	agony = 60

/obj/item/projectile/bullet/smg/uni46x30mm
	damage = 45
	armor_penetration = 7.5
	distance_falloff = 2

/obj/item/projectile/bullet/smg/uni46x30mm_charged
	damage = 15
	armor_penetration = 20
	distance_falloff = 2

/obj/item/projectile/bullet/explosion/shotgun
	name = "grenade"
	fire_sound = 'sound/weapons/gunshot/shotgun.ogg'

/obj/item/projectile/bullet/explosion/shotgun/on_hit(var/atom/target, var/blocked = 0)
	if(isturf(target))
		explosion(target, -1, 1, 1)
	..()

/obj/item/projectile/bullet/shotgun/fire
	name = "dragon breath slug"
	damage = 20
	armor_penetration = 5

/obj/item/projectile/bullet/shotgun/fire/on_hit(var/mob/living/carbon/target, var/blocked = 0)
	if(istype(target))
		target.adjust_fire_stacks(rand(1,3))
		target.IgniteMob()
	. = ..()

/obj/item/projectile/bullet/shotgun/breaching
	name = "breaching slug"
	damage = 5
	armor_penetration = 15

/obj/item/projectile/bullet/shotgun/breaching/on_hit(var/atom/movable/target, var/blocked = 0)
	if(istype(target))
		var/throwdir = get_dir(firer,target)
		target.throw_at(get_edge_target_turf(target, throwdir),4,3)
		return 1
	. = ..()


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

/obj/item/projectile/bullet/shotgun/beanbag/net
	name = "netshell"
	damage = 5
	agony = 10

/obj/item/projectile/bullet/shotgun/beanbag/net/on_hit(var/atom/target, var/blocked = 0, var/def_zone = null)
	var/obj/item/weapon/energy_net/safari/net = new(loc)
	net.throw_impact(target)
	return TRUE

/obj/item/projectile/bullet/rifle/tv
	fire_sound = 'infinity/sound/weapons/gunshot/tjgun.ogg'
	damage = 30
	armor_penetration = 50
	penetration_modifier = 1
	stun = 1
	weaken = 1
	distance_falloff = 0.5

/obj/item/projectile/bullet/Erifle
	fire_sound = 'sound/weapons/rapidslice.ogg'
	icon = 'infinity/icons/obj/p_weapon.dmi'
	icon_state = "gauss_silenced"
	damage = 25
	armor_penetration = 50

/obj/item/projectile/bullet/Erifle/small
	damage = 15
	armor_penetration = 60

/obj/item/projectile/bullet/Erifle/pistol
	damage = 15
	armor_penetration = 35

/obj/item/projectile/bullet/rifle/rubber
	fire_sound = 'sound/items/bikehorn.ogg'
	damage = 5
	armor_penetration = 0
	penetrating = 0

/obj/item/projectile/bullet/rifle/rubber/on_hit(var/atom/target, var/blocked = 0, var/def_zone = null)
	if(blocked == 0)
		if (istype(target, /mob/living))
			var/mob/living/M = target
			M.slip("the [src.name]",2)