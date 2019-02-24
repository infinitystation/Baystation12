/obj/item/weapon/gun/energy/laser/secure/mounted
	name = "robot laser carbine"
	desc = "A robot-mounted equivalnet of the G40E carbine, which is always registered to its owner."
	self_recharge = 1
	use_external_power = 1
	one_hand_penalty = 0

/obj/item/weapon/gun/energy/laser/secure/mounted/New()
	var/mob/borg = get_holder_of_type(src, /mob/living/silicon/robot)
	if(!borg)
		CRASH("Invalid spawn location.")
	registered_owner = borg.name
	GLOB.registered_cyborg_weapons += src
	..()
