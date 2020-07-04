/decl/flooring/tiling/asteroid
	icon = 'icons/turf/floors.dmi'
	icon_base = "asteroidfloor"
	build_type = null //no override

/decl/flooring/snow
	name = "snow"
	desc = "Let is sno-ow... Let is snow..."
	icon = 'icons/turf/snow.dmi'
	icon_base = "snow"
	has_base_range = 12
	flags = TURF_REMOVE_SHOVEL
	build_type = null
	can_engrave = FALSE
	footstep_type = /decl/footsteps/grass

/decl/flooring/tiling/mono/white
	icon = 'infinity/icons/turf/flooring/decals.dmi'
	icon_base = "monotile_light"
	color = COLOR_OFF_WHITE
	build_type = /obj/item/stack/tile/mono/white

/decl/flooring/tiling/concrete
	name = "concrete"
	desc = "Concrete pavement. Nothing extra."
	icon = 'icons/turf/flooring/misc.dmi'
	icon_base = "concrete"
	build_type = /obj/item/stack/tile/concrete
