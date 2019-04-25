//Adherents crystal walls (used to in away_inf/adherent_base.dm*)

/turf/simulated/wall/crystal/New(var/newloc)
	..(newloc,MATERIAL_CRYSTAL)

/turf/simulated/wall/crystal/attackby()
	return

/turf/simulated/wall/crystal/r_wall
	icon_state = "rgeneric"

/turf/simulated/wall/crystal/r_wall/New(var/newloc)
	..(newloc,MATERIAL_CRYSTAL, MATERIAL_CRYSTAL)