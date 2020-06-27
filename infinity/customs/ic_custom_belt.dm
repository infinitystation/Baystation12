/obj/item/device/integrated_circuit_printer/custom
	name = "NT(tm) integrated circuit printer"
	desc = "A portable(ish) machine made to print tiny modular circuitry out of metal. This one has fancy NanoTrasen brand design."
	icon_state = "circuit_printer_custom"
	icon = 'infinity/icons/customs/ic_belt_custom.dmi'
	trade_blacklisted = TRUE

/obj/item/weapon/storage/belt/holster/ic
	name = "IC developer's belt"
	desc = "It's a toolbelt, that have big pocket for portable circuit printer on right side and five smaller pockets for tools on left side."
	icon = 'infinity/icons/customs/ic_belt_custom.dmi'
	icon_state = "ic_belt"
	item_state = "utility"
	max_w_class = ITEM_SIZE_LARGE
	storage_slots = 6
	can_holster = list(
		/obj/item/device/integrated_circuit_printer
		)
	can_hold = list(
		/obj/item/weapon/screwdriver,
		/obj/item/device/integrated_electronics/analyzer,
		/obj/item/device/integrated_electronics/debugger,
		/obj/item/device/integrated_electronics/detailer,
		/obj/item/device/integrated_electronics/wirer
		)
	trade_blacklisted = TRUE

/obj/item/weapon/storage/belt/holster/ic/on_update_icon()
	..()
	for(var/obj/item/I in contents)
		if(istype(I, /obj/item/device/integrated_electronics/wirer)) //better than 4 same icon for every icon_state
			overlays += image('infinity/icons/customs/ic_belt_custom.dmi', "wirer")
		else if(istype(I, /obj/item/device/integrated_circuit_printer/custom))	//bad, when obj and it overlay icons in one file
			overlays += image('infinity/icons/customs/ic_belt_custom.dmi', "circuit_printer_custom_overlay")
		else if(istype(I, /obj/item/device))
			overlays += image('infinity/icons/customs/ic_belt_custom.dmi', "[I.icon_state]")

/obj/item/weapon/storage/belt/holster/ic/full/Initialize()
	.=..()
	new /obj/item/weapon/screwdriver(src)
	new /obj/item/device/integrated_electronics/analyzer(src)
	new /obj/item/device/integrated_electronics/debugger(src)
	new /obj/item/device/integrated_electronics/detailer(src)
	new /obj/item/device/integrated_electronics/wirer(src)
	//manualy holsted printer
	var/datum/extension/holster/H = get_extension(src, /datum/extension/holster)
	H.holstered = new /obj/item/device/integrated_circuit_printer/custom
	H.storage.w_class = max(H.storage.w_class, H.holstered.w_class)
	H.storage.handle_item_insertion(H.holstered, 1)
	H.atom_holder.SetName("occupied [initial(H.atom_holder.name)]")
	GLOB.moved_event.register(H.holstered, H, /datum/extension/holster/proc/check_holster)
	GLOB.destroyed_event.register(H.holstered, H, /datum/extension/holster/proc/clear_holster)
	update_icon()
