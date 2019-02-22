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
