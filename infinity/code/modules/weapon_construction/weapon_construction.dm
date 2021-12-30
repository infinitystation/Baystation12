/obj/item/weaponparts
	name = "root weaponpart"
	desc = "how did you get it?"
	icon = 'infinity/icons/obj/weaponparts.dmi'
	var/attachment_time = 1 SECONDS

/obj/item/weaponparts/core_part
	name = "core weaponpart"
	var/list/partsrequired = list()
	var/tmp/list/partsneedednow = list()
	var/type_of_result = null

/obj/item/weaponparts/core_part/Initialize()
	. = ..()
	if(!partsneedednow.len) partsneedednow = partsrequired.Copy()
	update_construction()

/obj/item/weaponparts/core_part/examine(mob/user, distance)
	. = ..()
	for(var/obj/item/weaponparts/stock/S in contents) to_chat(user, "\icon[S] [S] is attached to [src].")
	for(var/a in partsneedednow)
		var/atom/t = a
		to_chat(user, "[src] need to get [initial(t.name)]")

/obj/item/weaponparts/core_part/on_update_icon()
	. = ..()
	overlays.Cut()
	for(var/obj/item/weaponparts/stock/S in contents)
		overlays += image(S.icon, S.icon_state)
	
/obj/item/weaponparts/core_part/attackby(obj/item/W, mob/user)
	. = ..()
	if(istype(W, /obj/item/weaponparts/stock))
		try_to_attach_part(user, W)

/obj/item/weaponparts/core_part/proc/update_construction()
	partsneedednow = partsrequired.Copy()
	for(var/obj/item/weaponparts/w in contents)
		if(!(w.type in partsrequired))
			w.dropInto(get_turf(loc))
			continue
		partsneedednow -= w.type
	if(!partsneedednow.len)
		var/obj/item/result = new type_of_result(get_turf(src))
		if(ismob(loc))
			var/mob/user = loc
			var/equip_slot = user.get_inventory_slot(src)
			if(equip_slot)
				user.drop_from_inventory(src)
				user.equip_to_slot_if_possible(result, equip_slot)
		qdel(src)

	update_icon()

/obj/item/weaponparts/core_part/proc/try_to_attach_part(mob/user, obj/item/weaponparts/stock/part)
	if((user?.get_inventory_slot(src) in list(slot_r_hand, slot_l_hand)) || isturf(loc))
		if(do_after(user, attachment_time, src) && istype(part))
			return attach_part(part, user)

/obj/item/weaponparts/core_part/proc/attach_part(obj/item/weaponparts/part, mob/user = null)
	if(user && !user.unequip_item(part))
		return FALSE
	part.forceMove(src)
	update_construction()
	return TRUE

/obj/item/weaponparts/core_part/verb/remove_part_verb(obj/item/weaponparts/part in src)
	set name = "Remove part from base"
	set src in view(1)
	set category = "Object"

	if(Adjacent(usr))
		remove_part(part)

/obj/item/weaponparts/core_part/proc/remove_part(obj/item/weaponparts/part)
	part.forceMove(get_turf(src))
	update_construction()
