//
// Wall mounted holomap of the station
//
/obj/machinery/station_map
	name = "local holomap"
	desc = "A virtual map of the surrounding station or vessel."
	icon = 'icons/obj/machines/stationmap.dmi'
	icon_state = "station_map"
	anchored = 1
	density = 0
	use_power = 1
	idle_power_usage = 10
	active_power_usage = 500

	// TODO - Port use_auto_lights from /vg - for now declare here
	var/use_auto_lights = 1
	var/light_power_on = 1
	var/light_range_on = 2
	light_color = "#64c864"

	plane = OBJ_PLANE
	layer = ABOVE_WINDOW_LAYER

	var/mob/watching_mob = null
	var/image/small_station_map = null
	var/image/floor_markings = null
	var/image/panel = null
	var/adir
	var/original_zLevel = 1	// zLevel on which the station map was initialized.
	var/bogus = TRUE		// set to 0 when you initialize the station map on a zLevel that has its own icon formatted for use by station holomaps.
	var/datum/station_holomap/holomap_datum

/obj/machinery/station_map/New()
	..()
	component_parts = list()
	component_parts += new /obj/item/weapon/circuitboard/station_map(src)
	component_parts += new /obj/item/weapon/stock_parts/scanning_module(src)
	component_parts += new /obj/item/weapon/stock_parts/micro_laser(src)
	component_parts += new /obj/item/weapon/stock_parts/micro_laser(src)
	RefreshParts()

	if(src.dir == NORTH)
		adir = SOUTH
	if(src.dir == SOUTH)
		adir = NORTH
	if(src.dir == WEST)
		adir = EAST
	if(src.dir == EAST)
		adir = WEST
	set_dir(adir)
	holomap_datum = new()
	original_zLevel = loc.z
	SSholomaps.station_holomaps += src
	// flags |= ON_BORDER Why? It doesn't help if its not density

/obj/machinery/station_map/Initialize()
	. = ..()
	if(SSholomaps.holomaps_initialized)
		spawn(1) // Tragically we need to spawn this in order to give the frame construcing us time to set pixel_x/y
			setup_holomap()

/obj/machinery/station_map/Destroy()
	SSholomaps.station_holomaps -= src
	stopWatching()
	holomap_datum = null
	. = ..()

/obj/machinery/station_map/proc/setup_holomap()
	. = ..()
	bogus = FALSE
	var/turf/T = get_turf(src)
	original_zLevel = T.z
	if(!("[HOLOMAP_EXTRA_STATIONMAP]_[original_zLevel]" in SSholomaps.extraMiniMaps))
		bogus = TRUE
		holomap_datum.initialize_holomap_bogus()
		update_icon()
		return

	holomap_datum.initialize_holomap(T, reinit = TRUE)

	small_station_map = image(SSholomaps.extraMiniMaps["[HOLOMAP_EXTRA_STATIONMAPSMALL]_[original_zLevel]"], dir = dir)
	// small_station_map.plane = LIGHTING_PLANE // Not until we do planes ~Leshana
	// small_station_map.layer = LIGHTING_LAYER+1 // Weird things will happen!

	floor_markings = image('icons/obj/machines/stationmap.dmi', "decal_station_map")
	floor_markings.dir = src.dir
	// floor_markings.plane = ABOVE_TURF_PLANE // Not until we do planes ~Leshana
	// floor_markings.layer = DECAL_LAYER
	update_icon()

/obj/machinery/station_map/attack_hand(var/mob/user)
	if(watching_mob && (watching_mob != user))
		to_chat(user, "<span class='warning'>Someone else is currently watching the holomap.</span>")
		return
	if(user.loc != loc)
		to_chat(user, "<span class='warning'>You need to stand in front of \the [src].</span>")
		return
	startWatching(user)

// Let people bump up against it to watch
/obj/machinery/station_map/Bumped(var/atom/movable/AM)
	if(!watching_mob && isliving(AM) && AM.loc == loc)
		startWatching(AM)

// In order to actually get Bumped() we need to block movement.  We're (visually) on a wall, so people
// couldn't really walk into us anyway.  But in reality we are on the turf in front of the wall, so bumping
// against where we seem is actually trying to *exit* our real loc
/obj/machinery/station_map/CheckExit(atom/movable/mover as mob|obj, turf/target as turf)
	log_debug("[src] (dir=[dir]) CheckExit([mover], [target])  get_dir() = [get_dir(target, loc)]")
	if(get_dir(target, loc) == dir) // Opposite of "normal" since we are visually in the next turf over
		return FALSE
	else
		return TRUE

/obj/machinery/station_map/proc/startWatching(var/mob/user)
	// Okay, does this belong on a screen thing or what?
	// One argument is that this is an "in game" object becuase its in the world.
	// But I think it actually isn't.  The map isn't holo projected into the whole room, (maybe strat one is!)
	// But for this, the on screen object just represents you leaning in and looking at it closely.
	// So it SHOULD be a screen object.
	// But it is not QUITE a hud either.  So I think it shouldn't go in /datum/hud
	// Okay? Yeah.  Lets use screen objects but manage them manually here in the item.
	// That might be a mistake... I'd rather they be managed by some central hud management system.
	// But the /vg code, while the screen obj is managed, its still adding and removing image, so this is
	// just as good.

	// EH JUST HACK IT FOR NOW SO WE CAN SEE HOW IT LOOKS! STOP OBSESSING, ITS BEEN AN HOUR NOW!

	// TODO - This part!! ~Leshana
	if(isliving(user) && anchored && !(stat & (NOPOWER|BROKEN)))
		if(user.client)
			holomap_datum.station_map.loc = GLOB.global_hud.holomap  // Put the image on the holomap hud
			holomap_datum.station_map.alpha = 0 // Set to transparent so we can fade in
			animate(holomap_datum.station_map, alpha = 255, time = 5, easing = LINEAR_EASING)
			flick("station_map_activate", src)
			// Wait, if wea re not modifying the holomap_obj... can't it be part of the global hud?
			user.client.screen |= GLOB.global_hud.holomap // TODO - HACK! This should be there permenently really.
			user.client.images |= holomap_datum.station_map

			watching_mob = user
			GLOB.moved_event.register(watching_mob, src, /obj/machinery/station_map/proc/checkPosition)
			GLOB.dir_set_event.register(watching_mob, src, /obj/machinery/station_map/proc/checkPosition)
			GLOB.destroyed_event.register(watching_mob, src, /obj/machinery/station_map/proc/stopWatching)
			update_use_power(2)

			if(bogus)
				to_chat(user, "<span class='warning'>The holomap failed to initialize. This area of space cannot be mapped.</span>")
			else
				to_chat(user, "<span class='notice'>A hologram of the [GLOB.using_map.full_name] appears before your eyes.</span>")

/obj/machinery/station_map/attack_ai(var/mob/living/silicon/robot/user)
	return // TODO - Implement for AI ~Leshana
	// user.station_holomap.toggleHolomap(user, isAI(user))

/obj/machinery/station_map/Process()
	if((stat & (NOPOWER|BROKEN)) || !anchored)
		stopWatching()

/obj/machinery/station_map/proc/checkPosition()
	if(!watching_mob || (watching_mob.loc != loc) || (dir != watching_mob.dir))
		stopWatching()

/obj/machinery/station_map/proc/stopWatching()
	if(watching_mob)
		if(watching_mob.client)
			animate(holomap_datum.station_map, alpha = 0, time = 5, easing = LINEAR_EASING)
			var/mob/M = watching_mob
			spawn(5) //we give it time to fade out
				M.client.images -= holomap_datum.station_map
		GLOB.moved_event.unregister(watching_mob, src)
		GLOB.dir_set_event.unregister(watching_mob, src)
		GLOB.destroyed_event.unregister(watching_mob, src)
	watching_mob = null
	update_use_power(1)

/obj/machinery/station_map/power_change()
	. = ..()
	update_icon()
	// TODO - Port use_auto_lights from /vg - For now implement it manually here
	if(stat & NOPOWER)
		set_light(0)
	else
		set_light(light_range_on, light_power_on)

/obj/machinery/station_map/proc/set_broken()
	stat |= BROKEN
	update_icon()

/obj/machinery/station_map/on_update_icon()
	overlays.Cut()
	if(src.dir == NORTH)
		pixel_y = -32
	if(src.dir == EAST)
		pixel_x = -32
	if(src.dir == SOUTH)
		pixel_y = 32
	if(src.dir == WEST)
		pixel_x = 32
	if(stat & BROKEN)
		icon_state = "station_mapb"
	else if((stat & NOPOWER) || !anchored)
		icon_state = "station_map0"
	else
		icon_state = "station_map"

		if(bogus)
			holomap_datum.initialize_holomap_bogus()
		else
			small_station_map.icon = SSholomaps.extraMiniMaps["[HOLOMAP_EXTRA_STATIONMAPSMALL]_[original_zLevel]"]
			overlays |= small_station_map
			holomap_datum.initialize_holomap(get_turf(src))

	// Put the little "map" overlay down where it looks nice
	if(floor_markings)
		floor_markings.dir = src.dir
		floor_markings.pixel_x = -src.pixel_x
		floor_markings.pixel_y = -src.pixel_y
		overlays += floor_markings

	if(panel_open)
		overlays += "station_map-panel"
	else
		overlays -= "station_map-panel"

/obj/machinery/station_map/attackby(obj/item/weapon/W as obj, mob/user as mob)
	src.add_fingerprint(user)
	if(default_deconstruction_screwdriver(user, W))
		return
	if(default_deconstruction_crowbar(user, W))
		return
	return ..()

/obj/machinery/station_map/ex_act(severity)
	switch(severity)
		if(1)
			qdel(src)
		if(2)
			if (prob(50))
				qdel(src)
			else
				set_broken()
		if(3)
			if (prob(25))
				set_broken()

/obj/machinery/constructable_frame/machine_frame/holomap
	name = "Local Map Frame"
	//frame_class = "display"
	//frame_size = 3
	//frame_style = "wall"
	var/x_offset = WORLD_ICON_SIZE
	var/y_offset = WORLD_ICON_SIZE
	circuit = /obj/item/weapon/circuitboard/station_map
	icon = 'icons/obj/machines/stationmap.dmi'
	icon_state = "station_map_frame_0"
	density = 0

/obj/machinery/constructable_frame/machine_frame/holomap/attackby(obj/item/P as obj, mob/user as mob)
	switch(state)
		if(1)
			if(istype(P, /obj/item/weapon/circuitboard))
				var/obj/item/weapon/circuitboard/B = P
				if(B.board_type == "holomap")
					if(!user.unEquip(P, src))
						return
					playsound(src.loc, 'sound/items/Deconstruct.ogg', 50, 1)
					to_chat(user, "<span class='notice'>You add the circuit board to the frame.</span>")
					circuit = P
					icon_state = "station_map_frame_2"
					state = 2
					components = list()
					req_components = circuit.req_components.Copy()
					for(var/A in circuit.req_components)
						req_components[A] = circuit.req_components[A]
					req_component_names = circuit.req_components.Copy()
					for(var/A in req_components)
						var/obj/ct = A
						req_component_names[A] = initial(ct.name)
					update_desc()
					to_chat(user, desc)
				else
					to_chat(user, "<span class='warning'>This frame does not accept circuit boards of this type!</span>")
			else
				if(isWrench(P))
					playsound(src.loc, 'sound/items/Ratchet.ogg', 75, 1)
					to_chat(user, "<span class='notice'>You dismantle the frame</span>")
					new /obj/item/stack/material/steel(src.loc, 5)
					qdel(src)
		if(2)
			if(isCoil(P))
				var/component_check = 1
				for(var/R in req_components)
					if(req_components[R] > 0)
						component_check = 0
						break
				if(component_check)
					var/obj/item/stack/cable_coil/C = P
					if (C.get_amount() < 5)
						to_chat(user, "<span class='warning'>You need five lengths of cable to add them to the frame.</span>")
						return
					playsound(src.loc, 'sound/items/Deconstruct.ogg', 50, 1)
					to_chat(user, "<span class='notice'>You start connecting components in the chain.</span>")
					if(do_after(user, 20, src) && state == 2)
						if(C.use(5))
							to_chat(user, "<span class='notice'>You connect components.</span>")
							state = 3
							icon_state = "station_map_frame_3"
			else
				if(isCrowbar(P))
					playsound(src.loc, 'sound/items/Crowbar.ogg', 50, 1)
					state = 1
					circuit.dropInto(loc)
					circuit = null
					if(components.len == 0)
						to_chat(user, "<span class='notice'>You remove the circuit board.</span>")
					else
						to_chat(user, "<span class='notice'>You remove the circuit board and other components.</span>")
						for(var/obj/item/weapon/W in components)
							W.dropInto(loc)
					desc = initial(desc)
					req_components = null
					components = null
					icon_state = "station_map_frame_1"
				else
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
							to_chat(user, "<span class='notice'>[part.name] applied.</span>")
						replacer.play_rped_sound()
						update_desc()
					else
						if(istype(P, /obj/item))
							for(var/I in req_components)
								if(istype(P, I) && (req_components[I] > 0))
									if(isCoil(P))
										var/obj/item/stack/cable_coil/CP = P
										if(CP.get_amount() > 1)
											var/camt = min(CP.amount, req_components[I]) // amount of cable to take, idealy amount required, but limited by amount provided
											var/obj/item/stack/cable_coil/CC = new /obj/item/stack/cable_coil(src)
											CC.amount = camt
											CC.update_icon()
											CP.use(camt)
											components += CC
											req_components[I] -= camt
											update_desc()
											break
									if(!user.unEquip(P, src))
										return
									components += P
									req_components[I]--
									update_desc()
									break
							playsound(src.loc, 'sound/items/Deconstruct.ogg', 50, 1)
							to_chat(user, desc)
							if(P && P.loc != src && !istype(P, /obj/item/stack/cable_coil))
								to_chat(user, "<span class='warning'>You cannot add that component to the machine!</span>")
		if(3)
			if(isWirecutter(P))
				playsound(src.loc, 'sound/items/Wirecutter.ogg', 50, 1)
				to_chat(user, "<span class='notice'>You remove the cables.</span>")
				state = 2
				icon_state = "station_map_frame_1"
				var/obj/item/stack/cable_coil/A = new /obj/item/stack/cable_coil( src.loc )
				A.amount = 5
			else
				if(istype(P, /obj/item/stack/material) && P.get_material_name() == MATERIAL_GLASS)
					var/obj/item/stack/G = P
					if (G.get_amount() < 2)
						to_chat(user, "<span class='warning'>You need two sheets of glass to put in the glass panel.</span>")
						return
					playsound(src.loc, 'sound/items/Deconstruct.ogg', 50, 1)
					to_chat(user, "<span class='notice'>You start to put in the glass panel.</span>")
					if(do_after(user, 20, src) && state == 3)
						if (G.use(2))
							to_chat(user, "<span class='notice'>You put in the glass panel.</span>")
							icon_state = "station_map_frame_4"
							state = 4
		if(4)
			if(isScrewdriver(P))
				playsound(src.loc, 'sound/items/Screwdriver.ogg', 50, 1)
				var/obj/machinery/new_machine = new src.circuit.build_path(src.loc, src.dir)
				if(new_machine.component_parts)
					new_machine.component_parts.Cut()
				else
					new_machine.component_parts = list()
				src.circuit.construct(new_machine)
				for(var/obj/O in src)
					if(circuit.contain_parts) // things like disposal don't want their parts in them
						O.forceMove(new_machine)
					else
						O.forceMove(null)
					new_machine.component_parts += O
				if(circuit.contain_parts)
					circuit.forceMove(new_machine)
				else
					circuit.forceMove(null)
				new_machine.RefreshParts()
				qdel(src)
			else
				if(isCrowbar(P))
					playsound(src.loc, 'sound/items/Crowbar.ogg', 50, 1)
					state = 3
					icon_state = "station_map_frame_3"
					to_chat(user, "<span class='notice'>You remove the glass panel.</span>")
					new /obj/item/stack/material/glass( src.loc, 2 )

/*
/obj/machinery/constructable_frame/machine_frame/holomap/Initialize()
	sleep(1)
	if(src.dir == NORTH)
		pixel_y = -32
	if(src.dir == EAST)
		pixel_x = -32
	if(src.dir == SOUTH)
		pixel_y = 32
	if(src.dir == WEST)
		pixel_x = 32
	. = ..()
*/
/*
/datum/frame/frame_types/station_map/get_icon_state(var/state)
	return "station_map_frame_[state]"

/obj/structure/frame
	layer = ABOVE_WINDOW_LAYER
*/

// TODO
// //Portable holomaps, currently AI/Borg/MoMMI only

// TODO
// OHHHH YEAH - STRATEGIC HOLOMAP! NICE!
// It will need to wait until later tho.

/obj/item/weapon/circuitboard/station_map
	name = T_BOARD("Station Map")
	build_path = /obj/machinery/station_map
	origin_tech = list(TECH_DATA = 3, TECH_ENGINEERING = 2)
	board_type = "holomap"
	req_components = list(
							/obj/item/weapon/stock_parts/scanning_module = 1,
							/obj/item/weapon/stock_parts/manipulator = 1,
							/obj/item/weapon/stock_parts/micro_laser = 2)
