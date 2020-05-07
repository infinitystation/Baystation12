/obj/item/projectile/beam/heavylaser/bogani
	name = "alien laser"
	fire_sound = 'sound/weapons/marauder.ogg'
	damage = 40
	armor_penetration = 50
	penetration_modifier = 1

/obj/item/projectile/beam/lastertag/red/on_hit(var/atom/target, var/blocked = 0)
	if(istype(target, /mob/living/carbon/human))
		var/mob/living/carbon/human/M = target
		if(istype(M.wear_suit, /obj/item/clothing/suit/bluetag))
			M.Weaken(5)
	return 1

/obj/item/projectile/beam/instakill
	name = "instagib laser"
	icon_state = "magicm"
	damage = 200
	damage_type = BURN

/obj/item/projectile/beam/instakill/blue
	color = COLOR_BLUE

/obj/item/projectile/beam/instakill/red
	color = COLOR_RED

/obj/item/projectile/beam/instakill/on_hit(atom/target)
	. = ..()
	if(iscarbon(target))
		var/mob/living/carbon/M = target
		M.visible_message("<span class='danger'>[M] explodes into a shower of gibs!</span>")
		M.gib()

// For Security Cadets usage
/obj/item/projectile/beam/confuseray/weak
	life_span = 50

/obj/item/projectile/beam/confuseray/weak/on_hit(var/atom/target, var/blocked = 0)
	if(istype(target, /mob/living))
		var/mob/living/L = target
		var/potency = rand(potency_min, potency_max)
		L.eye_blurry += potency
	return 1
