/obj/item/mine
	name = "mine"
	var/active = 0

/obj/item/mine/proc/activate(mob/user)
	if(active)
		return

	if(user)
		msg_admin_attack("[user.name] ([user.ckey]) primed \a [src] (<A HREF='?_src_=holder;adminplayerobservecoodjump=1;X=[user.x];Y=[user.y];Z=[user.z]'>JMP</a>)")

	active = 1

/obj/item/mine/proc/detonate()
	var/turf/T = get_turf(src)
	if(T)
		T.hotspot_expose(700,125)

/obj/item/mine/Crossed(AM as mob|obj)
	if(!istype(AM, /mob/observer))
		if(active)
			detonate()
