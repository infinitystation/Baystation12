/obj/item/custkit
	name = "customization kit"
	desc = "It is OOC object, you should not see it. Ударьте этот подарок предметом, который нужно изменить."
	icon = 'icons/obj/items.dmi'
	icon_state = "gift2"
	w_class = 2
	var/input
	var/output

/obj/item/custkit/attackby(obj/item/I, mob/user, params)
	if(istype(I, input))
		qdel(I)
		user.put_in_hands(new output)
		qdel(src)
		return

/obj/item/custkit/sprite //changes sprite, doesn't mades new obj
	name = "sprite customization kit"
//	input // object's type
	output = "" //this should be a sprite

/obj/item/custkit/sprite/attackby(obj/item/I, mob/user, params)
	if(istype(I, input))
		I.icon = 'icons/infinity_custom_items_obj.dmi' //we can add a new var in future for a better icons managment
		I.icon_state = output
		qdel(src)
