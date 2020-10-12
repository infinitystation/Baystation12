/obj/machinery/sealgen
	name = "sealing field generator"
	desc = "A highly sophisticated generator, capable of projecting fields that will block any gas movement, still allowing to walk nearby."
	icon = 'infinity/icons/obj/machines/shielding.dmi'
	icon_state = "sealgen"

	atom_flags = ATOM_FLAG_NO_TEMP_CHANGE | ATOM_FLAG_CLIMBABLE

	anchored = TRUE
	density = TRUE

	active_power_usage = 2500
	idle_power_usage = 50

	var/obj/effect/seal_field/current_field

	var/fold_time = 2 SECONDS

	var/field_color = COLOR_YELLOW
	var/field_density = FALSE //It can be used to block movement via wires, though you can dispel it with hand

	var/hatch_open = FALSE
	wires = /datum/wires/sealgen

	req_access = list(access_engine_equip)

	var/locked = FALSE

//General proc overrides

/obj/machinery/sealgen/Initialize()
	. = ..()
	update_icon()

/obj/machinery/sealgen/on_update_icon()
	overlays.Cut()
	if(current_field)
		var/image/I = image(icon=icon,icon_state=initial(icon_state)+"-on",layer=LIGHTING_PLANE+1)
		overlays += I
	if(hatch_open)
		overlays += initial(icon_state)+"-hatch"

/obj/machinery/sealgen/Process()
	if(stat & NOPOWER)
		off()
	update_icon()
	change_power_consumption(field_density ? initial(active_power_usage)*3 : initial(active_power_usage), use_power_mode = POWER_USE_ACTIVE)
	update_use_power(current_field ? POWER_USE_ACTIVE : POWER_USE_IDLE)
	if(current_field)
		current_field.density = field_density

/obj/machinery/sealgen/Destroy()
	off()
	. = ..()

/obj/machinery/sealgen/emp_act()
	..()
	off()

//Machine-specific procs

/obj/machinery/sealgen/proc/activate()
	if(stat & NOPOWER) return
	current_field = new(get_step(src,dir))
	current_field.dir = NORTH //was dir
	current_field.generator = src
	colorize(field_color)

/obj/machinery/sealgen/proc/off()
	qdel(current_field)
	current_field = null

/obj/machinery/sealgen/proc/colorize()
	if(!current_field) return
	current_field.color = field_color
	current_field.set_light(1, 0.3, 5, l_color = field_color) //Glowy thing

//Interaction

/obj/machinery/sealgen/attack_hand(var/mob/user)

	if(locked)
		to_chat(user, SPAN_WARNING("It's locked! You can't [current_field ? "shut it down" : "turn it on"]."))
		return

	if(!current_field)
		activate()
	else
		off()

	update_icon()

/obj/machinery/sealgen/attackby(obj/item/weapon/W, mob/user)

	if(isMultitool(W) && !locked)
		field_color = input(usr, "Choose field colour.", "Field color", initial(field_color)) as color|null
		to_chat(usr, SPAN_NOTICE("You change \the [src] field <font color='[field_color]'>color.</font>"))
		colorize()
		return

	if(isWirecutter(W) && hatch_open)
		wires.Interact(user)
		return

	if(isScrewdriver(W))
		hatch_open = !hatch_open
		to_chat(user, "You [hatch_open ? "open" : "close"] \the [src] panel.")
		playsound(src.loc, "[GLOB.machinery_exposed_sound[2]]", 20)
		update_icon()
		return

	if(isid(W) && allowed(usr))
		locked = !locked
		to_chat(user, "You [locked ? "lock" : "unlock"] \the [src].")
		return

	..()

//Actual field

/obj/effect/seal_field
	name = "atmospheric containment field"
	desc = "An energy field, capable of blocking any gas as long as it's active."
	icon = 'infinity/icons/obj/machines/shielding.dmi'
	icon_state = "shield_normal"

	atmos_canpass = CANPASS_PROC //That's it. //FUCK YOU ZAS

	anchored = TRUE
	density = FALSE
	opacity = FALSE

	var/dispel_delay = 10 SECONDS
	var/obj/machinery/sealgen/generator
	var/ded = FALSE

/obj/effect/seal_field/attack_hand(var/mob/user)
	..()
	if(density)
		user.visible_message(SPAN_DANGER("[user] begins waving around [src]."),SPAN_WARNING("You begin to wave around [src], trying to dispel it."))
		if(do_after(user, dispel_delay, src))
			generator.off()

/obj/effect/seal_field/c_airblock(turf/other)
	return ded ? 0 : BLOCKED

/obj/effect/seal_field/New()
	..()
	update_nearby_tiles(need_rebuild=1)

/obj/effect/seal_field/Destroy()
	ded = TRUE
	update_nearby_tiles()
	. = ..()

//Wires
#define SEALGEN_WIRE_LOCK		1
#define SEALGEN_WIRE_DENSITY	2
#define SEALGEN_WIRE_POWER		4

/datum/wires/sealgen
	holder_type = /obj/machinery/sealgen
	wire_count = 6
	window_y = 340
	descriptions = list(
		new /datum/wire_description(SEALGEN_WIRE_LOCK, "This wire is connected to the ID scanning panel."),
		new /datum/wire_description(SEALGEN_WIRE_DENSITY, "This wire is connected to field density setting.",SKILL_ADEPT),
		new /datum/wire_description(SEALGEN_WIRE_POWER, "This wire seems to be carrying a heavy current.",SKILL_ADEPT)
	)

/datum/wires/sealgen/UpdateCut(var/index, var/mended)
	var/obj/machinery/sealgen/S = holder
	switch(index)
		if(SEALGEN_WIRE_LOCK)
			S.locked = !mended
		if(SEALGEN_WIRE_DENSITY)
			S.field_density = !mended
		if(SEALGEN_WIRE_POWER)
			if(!S.current_field) return
			S.off()
			S.shock(usr, 100)

#undef SEALGEN_WIRE_LOCK
#undef SEALGEN_WIRE_DENSITY
#undef SEALGEN_WIRE_POWER

/datum/wires/sealgen/GetInteractWindow(mob/user)
	var/obj/machinery/sealgen/S = holder
	. += ..()
	. += "<br>\nLockdown light is [S.locked ? "on" : "off"].<br>\nDensity setting is set to [S.field_density ? "maximum" : "normal"]."

//Case and folding

/obj/item/sealgen_case
	name = "sealing field generator case"
	desc = "A briefcase that contains a highly sophisticated generator, capable of projecting fields that will block any gas movement, still allowing to walk nearby."
	icon = 'icons/obj/storage.dmi'
	icon_state = "secure"
	item_state = "briefcase"

	w_class = ITEM_SIZE_HUGE

	var/deploy_time = 2 SECONDS

/obj/item/sealgen_case/attack_self(var/mob/user)
	. = ..()
	to_chat(user,SPAN_NOTICE("You start deploying \the [src]."))
	user.visible_message(SPAN_NOTICE("[user] starts deploying \the [src]."))
	if(do_after(user, deploy_time, src))
		qdel(src)
		var/obj/machinery/sealgen/G  = new(get_turf(user))
		user.visible_message(SPAN_NOTICE("[user] deploys \the [G]."),SPAN_INFO("You deploy \the [G]."))
		G.dir = user.dir

/obj/machinery/sealgen/MouseDrop(over_object, src_location, over_location)
	. = ..()
	var/mob/user = usr
	if(istype(user) && Adjacent(user))
		if(locked)
			to_chat(user,SPAN_WARNING("You can't fold [src], it's locked!"))
			return
		if(over_object == user)
			to_chat(user,SPAN_NOTICE("You start folding \the [src]."))
			user.visible_message(SPAN_NOTICE("[user] starts folding \the [src]."))
			if(do_after(user, fold_time, src))
				user.visible_message(SPAN_NOTICE("[user] folds \the [src]."),SPAN_INFO("You fold \the [src]."))
				fold(user)

/obj/machinery/sealgen/proc/fold(var/mob/user)
	if(current_field)
		off()
	if(user)
		var/obj/item/sealgen_case/case = new(get_turf(user))
		user.put_in_hands(case)
	else
		new/obj/item/sealgen_case(get_turf(src))
	qdel(src)

//Vending & cargo

/obj/machinery/vending/engivend/Initialize()
	products[/obj/item/sealgen_case] = 3
	. = ..()

/decl/hierarchy/supply_pack/machinery/sealgen
	name = "Machinery - SFG Crate"
	containername = "sealing field generator crate"
	containertype = /obj/structure/closet/crate
	cost = 30
	contains = list(/obj/item/sealgen_case = 3)
