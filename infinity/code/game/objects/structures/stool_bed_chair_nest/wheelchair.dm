/datum/gear/utility/wheelchair
	display_name = "compressed wheelchair kit"
	path = /obj/item/wheelchair_kit
	cost = 2

/obj/structure/bed/chair/wheelchair/verb/collapse()
	set src in oview(1)
	set name = "Collapse Wheelchair"
	set category = "Object"

	if(!CanPhysicallyInteract(usr))
		return

	if(!ishuman(usr))
		return

	if(usr.incapacitated())
		return

	if(buckled_mob)
		to_chat(usr, "<span class='warning'>You can't collapse \the [src.name] while it still on use.</span>")
		return

	visible_message("<b>[usr]</b> starts collapse \the [src.name].")
	if(do_after(usr, 40, src))
		var/obj/item/wheelchair_kit/K = new /obj/item/wheelchair_kit(get_turf(usr))
		visible_message("<span class='notice'><b>[usr]</b> collapses \the [src.name].</span>")
		K.add_fingerprint(usr)
		qdel(src)

/obj/item/wheelchair_kit
	name = "compressed wheelchair kit"
	desc = "Collapsed parts, prepared to immediately spring into the shape of a wheelchair."
	icon = 'infinity/icons/obj/items.dmi'
	icon_state = "wheelchair-item"
	item_state = "rbed"
	w_class = ITEM_SIZE_LARGE

/obj/item/wheelchair_kit/attack_self(mob/user)
	visible_message("<b>[user]</b> starts lay out \the [src.name].")
	if(do_after(user, 40, src))
		var/obj/structure/bed/chair/wheelchair/W = new /obj/structure/bed/chair/wheelchair(get_turf(user))
		visible_message("<span class='notice'><b>[user]</b> lay out \the [W.name].</span>")
		W.add_fingerprint(user)
		qdel(src)
