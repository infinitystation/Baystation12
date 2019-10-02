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
	footstep_type = FOOTSTEP_GRASS

/decl/flooring/tiling/fc
	name = "concrete"
	desc = "Concrete pavement. Nothing extra."
	icon = 'icons/turf/flooring/misc.dmi'
	icon_base = "concrete"
	build_type = /obj/item/stack/tile/fconcrete