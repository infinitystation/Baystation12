//Adherents crystal walls (used to in away_inf/adherent_base.dm*)

/turf/simulated/wall/crystal/New(var/newloc)
	..(newloc,MATERIAL_CRYSTAL)

/turf/simulated/wall/crystal/attackby()
	return

/turf/simulated/wall/crystal/r_wall
	icon_state = "rgeneric"

/turf/simulated/wall/crystal/r_wall/New(var/newloc)
	..(newloc,MATERIAL_CRYSTAL, MATERIAL_CRYSTAL)


/turf/simulated/wall/concrete
	icon_state = "titanium"
	noblend_objects = list(/obj/machinery/door/window, /obj/machinery/door/blast/regular/escape_pod)

/turf/simulated/wall/concrete/New(var/newloc)
	..(newloc,MATERIAL_CONCRETE)

/turf/simulated/wall/r_concrete
	icon_state = "r_titanium"
	noblend_objects = list(/obj/machinery/door/window, /obj/machinery/door/blast/regular/escape_pod)

/turf/simulated/wall/r_concrete/New(var/newloc)
	..(newloc, MATERIAL_CONCRETE,MATERIAL_CONCRETE)

/turf/simulated/wall/r_titanium/ascent
	paint_color = COLOR_PURPLE

/turf/simulated/wall/titanium/ascent
	paint_color = COLOR_PURPLE
