/turf/simulated/wall
	name = "bulkhead"

/turf/simulated/floor
	name = "bare deck"

/turf/simulated/floor/tiled
	name = "deck"

/decl/flooring/tiling
	name = "deck"

//wild capitalism (no)
/datum/computer_file/program/merchant
	required_access = list("ACCESS_MERCHANT")

/obj/machinery/power/smes/buildable/explor_shuttle/New()
	..(0)
	component_parts += new /obj/item/weapon/smes_coil/weak(src)
	recalc_coils()

/obj/structure/closet/secure_closet/security/bearcat
	name = "security guard's locker"
	req_access = list(access_brig)
/*	icon_state = "sec1"
	icon_closed = "sec"
	icon_locked = "sec1"
	icon_opened = "secopen"
	icon_broken = "secbroken"
	icon_off = "secoff"*/

/obj/structure/closet/secure_closet/security/bearcat/WillContain()
	return list(
		new/datum/atom_creator/weighted(list(/obj/item/weapon/storage/backpack/security, /obj/item/weapon/storage/backpack/satchel/sec)),
		new/datum/atom_creator/simple(/obj/item/weapon/storage/backpack/dufflebag/sec, 50),
		/obj/item/clothing/mask/gas/half,
		/obj/item/weapon/handcuffs,
		/obj/item/weapon/storage/belt/holster/security,
		/obj/item/device/flash,
		/obj/item/device/radio/off,
		/obj/item/taperoll/police,
		/obj/item/device/hailer,
		/obj/item/weapon/gun/energy/stunrevolver,
		/obj/item/device/holowarrant,
	)
