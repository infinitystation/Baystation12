/turf/simulated/wall
	name = "bulkhead"

/turf/simulated/floor
	name = "bare deck"

/turf/simulated/floor/tiled
	name = "deck"

/decl/flooring/tiling
	name = "deck"
/turf/simulated/floor/shuttle_ceiling/bearcat
	color = COLOR_DARK_BROWN

/obj/machinery/power/smes/buildable/preset/bearcat/shuttle
	uncreated_component_parts = list(/obj/item/stock_parts/smes_coil/weak = 1)
	_input_maxed = TRUE
	_output_maxed = TRUE
	_input_on = TRUE
	_output_on = TRUE
	_fully_charged = TRUE

//wild capitalism (no)
/datum/computer_file/program/merchant
	required_access = list(access_merchant)

/obj/structure/closet/secure_closet/security/bearcat
	name = "security guard's locker"
	req_access = list(access_brig)

/obj/structure/closet/secure_closet/security/bearcat/WillContain()
	return list(
		new/datum/atom_creator/weighted(list(/obj/item/storage/backpack/security, /obj/item/storage/backpack/satchel/sec)),
		new/datum/atom_creator/simple(/obj/item/storage/backpack/dufflebag/sec, 50),
		/obj/item/clothing/mask/gas/half,
		/obj/item/handcuffs,
		/obj/item/storage/belt/holster/security,
		/obj/item/device/flash,
		/obj/item/device/radio/off,
		/obj/item/taperoll/police,
		/obj/item/device/hailer,
		/obj/item/gun/energy/stunrevolver,
		/obj/item/device/holowarrant,
	)
