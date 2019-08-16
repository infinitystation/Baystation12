//This file was auto-corrected by findeclaration.exe on 25.5.2012 20:42:31

//Circuit boards are in /code/game/objects/items/weapons/circuitboards/machinery/

/obj/machinery/constructable_frame //Made into a seperate type to make future revisions easier.
	name = "machine frame"
	icon = 'icons/obj/stock_parts.dmi'
	icon_state = "box_0"
	density = TRUE
	anchored = FALSE
	use_power = POWER_USE_OFF
	uncreated_component_parts = null
	construct_state = /decl/machine_construction/frame/unwrenched
	var/obj/item/weapon/stock_parts/circuitboard/circuit = null
	var/expected_machine_type
	atom_flags = ATOM_FLAG_NO_TEMP_CHANGE | ATOM_FLAG_CLIMBABLE

/obj/machinery/constructable_frame/state_transition(decl/machine_construction/new_state)
	. = ..()
	update_icon()

/obj/machinery/constructable_frame/dismantle()
	new /obj/item/stack/material/steel(loc, 5)
	qdel(src)
	return TRUE

/obj/machinery/constructable_frame/machine_frame
	expected_machine_type = "machine"

/obj/machinery/constructable_frame/machine_frame/on_update_icon()
	switch(construct_state && construct_state.type)
		if(/decl/machine_construction/frame/awaiting_circuit)
			icon_state = "box_1"
		if(/decl/machine_construction/frame/awaiting_parts)
			icon_state = "box_2"
		else
			icon_state = "box_0"

/obj/machinery/constructable_frame/machine_frame/deconstruct
	anchored = TRUE
	construct_state = /decl/machine_construction/frame/awaiting_circuit


/*INF@Waiting for QuardBreak
							if(istype(P, /obj/item/weapon/storage/part_replacer) && P.contents.len && get_req_components_amt())
							var/obj/item/weapon/storage/part_replacer/replacer = P
							var/list/added_components = list()
							var/list/part_list = list()

							//Assemble a list of current parts, then sort them by their rating!
							for(var/obj/item/weapon/stock_parts/co in replacer)
								part_list += co
							//Sort the parts. This ensures that higher tier items are applied first.
							part_list = sortTim(part_list)

							for(var/path in req_components)
								while(req_components[path] > 0 && (locate(path) in part_list))
									var/obj/item/part = (locate(path) in part_list)
									added_components[part] = path
									replacer.remove_from_storage(part, src)
									req_components[path]--
									part_list -= part

							for(var/obj/item/weapon/stock_parts/part in added_components)
								components += part
								user << "<span class='notice'>[part.name] applied.</span>"
							replacer.play_rped_sound()

							update_desc()
*/