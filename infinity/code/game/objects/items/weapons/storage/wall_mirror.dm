/obj/item/weapon/storage/mirror/examine(mob/user)
	. = ..()
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		H.examine(user, mirror = 1)
	else
		user.examine(user)

/obj/item/weapon/mirror/examine(mob/user)
	. = ..()
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		H.examine(user, mirror = 1)
	else
		user.examine(user)
