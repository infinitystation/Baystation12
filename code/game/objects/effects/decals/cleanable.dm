/obj/effect/decal/cleanable
	waterproof = FALSE
	var/persistent = FALSE
	var/generic_filth = FALSE
	var/age = 0
	var/list/random_icon_states
	var/image/hud_overlay/hud_overlay
	anchored = 1
	density = 0

/obj/effect/decal/cleanable/New()
	..()
	var/turf/space/sp = get_turf(src)
	if(istype(sp))
		visible_message("<span class='notice'><i>[src] vanishes in void.</i></span>")
		qdel(src)
		return
	if(src.loc) // It's stupid but it makes no runtimes
		if(src.loc.density)
			qdel(src)
			return

/obj/effect/decal/cleanable/Initialize(var/ml, var/_age)
	if(!isnull(_age))
		age = _age
	if(random_icon_states && length(src.random_icon_states) > 0)
		src.icon_state = pick(src.random_icon_states)
	SSpersistence.track_value(src, /datum/persistent/filth)
	. = ..()
	hud_overlay = new /image/hud_overlay('icons/obj/hud_tile.dmi', src, "caution")
	hud_overlay.plane = EFFECTS_ABOVE_LIGHTING_PLANE

/obj/effect/decal/cleanable/Destroy()
	SSpersistence.forget_value(src, /datum/persistent/filth)
	. = ..()
/obj/effect/decal/cleanable/water_act(var/depth)
	..()
	qdel(src)

/obj/effect/decal/cleanable/clean_blood(var/ignore = 0)
	if(!ignore)
		qdel(src)
		return
	..()
