/obj/machinery/atmospherics/unary/vent_pump/high_volume/on //for hangar and so
	use_power = POWER_USE_IDLE
	icon_state = "map_vent_out"

/obj/machinery/atmospherics/unary/vent_pump/high_volume/external_air/Initialize()
	. = ..()
	air_contents.volume = ATMOS_DEFAULT_VOLUME_PUMP * 5

/obj/machinery/atmospherics/unary/vent_pump/high_volume/shuttle/Initialize()
	. = ..()
	air_contents.volume = ATMOS_DEFAULT_VOLUME_PUMP * 5
