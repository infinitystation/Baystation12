/obj/item/weapon/weaponparts/core_part/heavysniper
	partsrequired = list(
		/obj/item/weapon/weaponparts/stock/scope/heavysniper,
		/obj/item/weapon/weaponparts/stock/barrel/heavysniper
		)
	type_of_result = /obj/item/weapon/gun/projectile/heavysniper/constructable
	name = "sniper rifle base"
	desc = "This is a heavy sniper's rifle stock."
	icon_state = "sniper_base"


/obj/item/weapon/weaponparts/stock/scope/heavysniper
	name = "sniper rifle scope"
	desc = "This is a heavy sniper's rifle scope."
	icon_state = "sniper_scope"

/obj/item/weapon/weaponparts/stock/barrel/heavysniper
	name = "sniper rifle barrel"
	desc = "This is a barrel for the heavy sniper rifle."
	icon_state = "sniper_barrel"

/obj/item/weapon/gun/projectile/heavysniper/constructable/verb/make_out()
	set name = "Dismantle Rifle"
	set category = "Object"
	set src in usr

	if(!ismob(usr)) return
	var/mob/user = usr
	if(do_after(user, 3 SECONDS, src, can_move = 1))
		var/obj/item/weapon/weaponparts/core_part/base = new/obj/item/weapon/weaponparts/core_part/heavysniper(get_turf(src))
		var/atom/movable/scope = new/obj/item/weapon/weaponparts/stock/scope/heavysniper(get_turf(src))
		var/atom/movable/barel = new/obj/item/weapon/weaponparts/stock/barrel/heavysniper(get_turf(src))
		user.drop_from_inventory(src, get_turf(src))
		base.attach_part(barel, user)
		user.put_in_any_hand_if_possible(base)
		user.put_in_any_hand_if_possible(scope)
		qdel(src)
