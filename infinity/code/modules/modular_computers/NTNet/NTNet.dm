/datum/ntnet/proc/get_relay_on_z(var/z_lv)
	var/list/R_on_Z = list()
	for(var/obj/machinery/ntnet_relay/i in relays) if(i.z in GetConnectedZlevels(z_lv)) R_on_Z += i
	return R_on_Z.len ? pick(R_on_Z) : null

/datum/ntnet/proc/get_connection_quality_for(var/obj/item/weapon/stock_parts/computer/network_card/A)
	. = 0
	var/atom/movable/At = get_turf(A.loc)
	var/obj/machinery/ntnet_relay/R = get_relay_on_z(At.z)
	if(R)
		var/distance = GET_2D_DISTANCE(At, R)
		if(!distance) distance = 1

		var/adapter_quality = A.long_range
		if(adapter_quality <= 1) adapter_quality = 1
		else adapter_quality /= 1.5

		var/m = Clamp(R.total_component_rating_of_type(/obj/item/weapon/stock_parts/scanning_module), 1, 10)
		if(m <= 1) m = 1

		else m /= 2
		. = 4 - log(distance / m / adapter_quality / NTNET_RADIUS_MULTIPLIER)
		if(. <= 0) . = 0