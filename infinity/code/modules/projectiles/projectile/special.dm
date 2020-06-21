//Sniper rounds


/obj/item/projectile/bullet/rifle/shell/sleepy
	name = "chloral hydrate dart"
	icon = 'icons/obj/ammo.dmi'
	icon_state = "syringe-cartridge-flight"
	damage = 1
	nodamage = 1
	weaken = 1
	armor_penetration = 30

/obj/item/projectile/bullet/rifle/shell/sleepy/on_hit(var/atom/target, var/blocked = 0)
	if(blocked > 50)
		return

	if(isliving(target))
		var/mob/living/mob = target
		if(mob.reagents)
			mob.reagents.add_reagent(/datum/reagent/chloralhydrate, 5)


//Pistol rounds


/obj/item/projectile/bullet/hollow
	damage = 55

/obj/item/projectile/bullet/piercing
	damage = 30
	armor_penetration = 20


/obj/item/projectile/bullet/pistol/holdout/hollow
	damage = 55

/obj/item/projectile/bullet/pistol/holdout/piercing
	damage = 25
	armor_penetration = 15

//Rifle rounds

/obj/item/projectile/bullet/rifle/hollow
	damage = 60
	armor_penetration = 10

/obj/item/projectile/bullet/rifle/piercing
	damage = 30
	armor_penetration = 45
	penetrating = 1


/obj/item/projectile/bullet/rifle/a12755/hollow
	damage = 60
	armor_penetration = 25
	penetrating = 0

/obj/item/projectile/bullet/rifle/a12755/piercing
	damage = 30
	armor_penetration = 75
	penetrating = 3


/obj/item/projectile/bullet/rifle/military/hollow
	damage = 55
	armor_penetration = 0

/obj/item/projectile/bullet/rifle/military/piercing
	damage = 25
	armor_penetration = 50

//Shotgun rounds


/obj/item/projectile/bullet/shotgun/real
	name = "shrapnel"
	damage = 7
	armor_penetration = 0
	dispersion = 2

/obj/item/projectile/bullet/shotgun/shrapnel_holder/launch_from_gun(atom/target, mob/user, obj/item/weapon/gun/launcher, var/target_zone, var/x_offset=0, var/y_offset=0)
	for(var/i = 1 to 8)
		var/obj/item/projectile/bullet/shotgun/real/real = new(get_turf(user))
		real.launch_from_gun(target, user, launcher, target_zone, x_offset, y_offset)
	qdel(src)
