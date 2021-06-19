/datum/ntnet/proc/get_relay_for_atom(var/atom/A)
	A = get_turf(A)
	var/list/R_on_Z = list()
	for(var/obj/machinery/ntnet_relay/i in relays) if(i.z in GetConnectedZlevels(A.z)) R_on_Z += i
	var/list/L = list()
	var/list/nums = list()
	for(var/atom/i in R_on_Z)
		var/n = GET_2D_DISTANCE(i, A)
		L["[n]"] = i
		nums += n
	if(L.len && nums) . = L["[min(nums)]"]
	return

/datum/ntnet/proc/get_connection_quality_for(var/obj/item/stock_parts/computer/network_card/A)
	. = 0
	var/atom/movable/At = get_turf(A)
	var/obj/machinery/ntnet_relay/R = get_relay_for_atom(A)
	if(R)
		var/distance = GET_2D_DISTANCE(At, R)
		if(!distance) distance = 1

		var/adapter_quality = A.long_range
		if(adapter_quality <= 1) adapter_quality = 1
		else adapter_quality /= 1.25

		var/m = Clamp(R.total_component_rating_of_type(/obj/item/stock_parts/scanning_module), 1, 10)
		if(m <= 1) m = 1

		else m /= 2
		. = NTNET_SPEED_LIMITER - log(distance / m / adapter_quality / NTNET_RADIUS_MULTIPLIER)
		if(. < 0) . = 0
