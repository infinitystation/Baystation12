/obj/item/custkit
	icon = 'icons/obj/items.dmi'
	icon_state = "gift"
	name = "customization kit"
	desc = "Hmmmmm...."
	var/input
	var/output

/obj/item/custkit/attackby(obj/item/I, mob/user, params)
	if (istype(I, input))
		qdel(I)
		user.put_in_hands(new output)
		qdel(src)
		return


