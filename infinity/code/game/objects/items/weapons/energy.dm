/obj/item/weapon/melee/energy/sword/clown
	name = "honkenergy sword"
	desc = "May the honk be within you."
	damtype = STUN

/obj/item/weapon/melee/energy/sword/clown/afterattack(var/mob/target as obj, mob/user as mob)
	if(target)
		if (istype(target, /mob/living))
			var/mob/living/M = target
			M.slip("the [src.name]",2)

/obj/item/weapon/melee/energy/sword/clown/Crossed(AM as mob|obj)
	if (istype(AM, /mob/living))
		var/mob/living/M = AM
		M.slip("the [src.name]",4)