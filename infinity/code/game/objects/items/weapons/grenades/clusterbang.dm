/obj/item/weapon/grenade/flashbang/clusterbang
	desc = "Use of this weapon may constiute a war crime in your area, consult your local captain."
	name = "clusterbang"
	icon = 'icons/obj/grenade.dmi'
	icon_state = "clusterbang"

/obj/item/weapon/grenade/flashbang/clusterbang/detonate()
	var/numspawned = rand(4,8)
	for(var/spawned in 1 to numspawned)
		new /obj/item/weapon/grenade/flashbang/clusterbang/segment(src.loc)
		playsound(src.loc, 'sound/weapons/armbomb.ogg', 75, 1, -3)
	qdel(src)
	return

/obj/item/weapon/grenade/flashbang/clusterbang/segment
	desc = "A smaller segment of a clusterbang. Better run."
	name = "clusterbang segment"
	icon = 'icons/obj/grenade.dmi'
	icon_state = "clusterbang_segment"
	det_time = 20

/obj/item/weapon/grenade/flashbang/clusterbang/segment/Initialize()
	icon_state = "clusterbang_segment_active"
	var/throwdir = rand(1, 8)
	throw_at(get_edge_target_turf(src, throwdir),rand(1, 4), 0)
	activate()

/obj/item/weapon/grenade/flashbang/clusterbang/segment/detonate()
	var/numspawned = rand(2,4)
	for(var/spawned in 1 to numspawned)
		new /obj/item/weapon/grenade/flashbang/cluster(src.loc)
		playsound(src.loc, 'sound/weapons/armbomb.ogg', 75, 1, -3)
	qdel(src)
	return

/obj/item/weapon/grenade/flashbang/cluster/Initialize()
	var/throwdir = rand(1, 8)
	throw_at(get_edge_target_turf(src, throwdir),rand(1, 4), 0)
	det_time = 10
	activate()