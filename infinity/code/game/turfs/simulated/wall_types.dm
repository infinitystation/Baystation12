//Adherents crystal walls (used to in away_inf/adherent_base.dm*)

/turf/simulated/wall/crystal/New(var/newloc)
	..(newloc,MATERIAL_CRYSTAL)

/turf/simulated/wall/crystal/attackby()
	return

/turf/simulated/wall/crystal/r_wall
	icon_state = "rgeneric"

/turf/simulated/wall/crystal/r_wall/New(var/newloc)
	..(newloc,MATERIAL_CRYSTAL, MATERIAL_CRYSTAL)

/turf/simulated/wall/fconcrete
	icon_state = "titanium"
	noblend_objects = list(/obj/machinery/door/window, /obj/machinery/door/blast/regular/evacshield)

/turf/simulated/wall/fconcrete/New(var/newloc)
	..(newloc,MATERIAL_FCONCRETE)

/turf/simulated/wall/r_fconcrete
	icon_state = "r_titanium"
	noblend_objects = list(/obj/machinery/door/window, /obj/machinery/door/blast/regular/evacshield)

/turf/simulated/wall/r_fconcrete/New(var/newloc)
	..(newloc, MATERIAL_FCONCRETE,MATERIAL_FCONCRETE)