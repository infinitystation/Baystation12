/obj/item/projectile/ship_munition/energy
	name = "maser burst"
	icon_state = "heavylaser"
	fire_sound = 'sound/weapons/emitter.ogg'
	pass_flags = PASS_FLAG_TABLE | PASS_FLAG_GLASS | PASS_FLAG_GRILLE
	damage_type = BURN
	check_armour = "laser"
	hitscan = 1
	damage = 500 // pew
	penetrating = 1
	armor_penetration = 90
	kill_count = 400

	on_hit(var/atom/target, var/blocked = 0)
		explosion(target, -1, 0, 1, 2, 0)
		return 1

	muzzle_type = /obj/effect/projectile/laser/heavy/muzzle
	tracer_type = /obj/effect/projectile/laser/heavy/tracer
	impact_type = /obj/effect/projectile/laser/heavy/impact

/obj/item/projectile/ship_munition/energy/destroyer
	damage = 800
	penetrating = 2
	armor_penetration = 100

	on_hit(var/atom/target, var/blocked = 0)
		explosion(target, -1, 0, 2, 2, 0)
		return 1

	muzzle_type = /obj/effect/projectile/laser/xray/muzzle
	tracer_type = /obj/effect/projectile/laser/xray/tracer
	impact_type = /obj/effect/projectile/laser/xray/impact

/obj/item/projectile/ship_munition/energy/dawn
	damage = 1000
	penetrating = 3
	armor_penetration = 100

	on_hit(var/atom/target, var/blocked = 0)
		explosion(target, -1, 1, 2, 2, 0)
		return 1

	muzzle_type = /obj/effect/projectile/laser/xray/muzzle
	tracer_type = /obj/effect/projectile/laser/xray/tracer
	impact_type = /obj/effect/projectile/laser/xray/impact