/obj/item/weapon/storage/mirror/examine(mob/user)
	. = ..()
	user.examine(user, mirror = 1)

/obj/item/weapon/mirror/examine(mob/user)
	. = ..()
	user.examine(user, mirror = 1)