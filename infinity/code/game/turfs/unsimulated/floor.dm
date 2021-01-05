/turf/unsimulated/floor/plating
	name = "plating"
	icon = 'icons/turf/flooring/plating.dmi'
	icon_state = "plating"

/turf/unsimulated/floor/snow
	name = "snow"
	icon = 'icons/turf/snow.dmi'
	icon_state = "snow"
//	dirt_color = "#e3e7e8"
	footstep_type = /decl/footsteps/snow

/turf/unsimulated/floor/snow/Initialize()
	. = ..()
	icon_state = pick("snow[rand(1,12)]","snow0")

/turf/unsimulated/floor/snow/fire_act(datum/gas_mixture/air, exposed_temperature, exposed_volume)
	melt()

/turf/unsimulated/floor/snow/melt()
	SetName("permafrost")
	icon_state = "permafrost"
	footstep_type = /decl/footsteps/asteroid
