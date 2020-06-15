#define WEBHOOK_SUBMAP_LOADED_SOL"webhook_submap_sol"

#include "patrol_crew.dm"
#include "patrol_areas.dm"
#include "patrol_items.dm"
#include "patrol_shuttle.dm"

/* OVERMAP
 * =======
 */

/datum/map_template/ruin/away_site/patrol
	name = "Sol Patrol Shuttle"
	id = "awaysite_patrol_ship"
	description = "A saviours for crew."
	prefix = "maps/away_inf/"
	suffixes = list("patrol/patrol.dmm")
	cost = 1000
	shuttles_to_initialise = list(/datum/shuttle/autodock/overmap/scgpatrol)
	apc_test_exempt_areas = list(
		/area/ship/patrol/atmos = NO_SCRUBBER|NO_VENT,
		/area/ship/patrol/power = NO_SCRUBBER|NO_VENT,
	)

/obj/effect/overmap/visitable/sector/scgpatrol
	name = "Bluespace Traces"
	desc = "Slight traces of a cloaking device are present. Unable to determine exact location."
	in_space = 1
	icon_state = null

/* TCOMMS
 * ======
 */

/obj/machinery/telecomms/allinone/away_scg_patrol
	listening_freqs = list(ERT_FREQ)
	channel_color = COMMS_COLOR_CENTCOMM
	channel_name = "Response Team"
	circuitboard = /obj/item/weapon/stock_parts/circuitboard/telecomms/allinone/away_scg_patrol

/obj/item/weapon/stock_parts/circuitboard/telecomms/allinone/away_scg_patrol
	build_path = /obj/machinery/telecomms/allinone/away_scg_patrol

/obj/item/device/radio/headset/away_scg_patrol
	name = "SCG Patrol headset"
	icon_state = "nt_headset"
	ks1type = /obj/item/device/encryptionkey/away_scg_patrol

/obj/item/device/radio/headset/away_scg_patrol/Initialize()
	. = ..()
	set_frequency(ERT_FREQ)	//Not going to be random or just set to the common frequency, but can be set later.

/obj/item/device/encryptionkey/away_scg_patrol
	name = "SCG Patrol radio encryption key"
	icon_state = "nt_cypherkey"
	channels = list("Response Team" = 1)

/* SMES
 * ====
 */

/obj/machinery/power/smes/buildable/preset/patrol
	uncreated_component_parts = list(
		/obj/item/weapon/stock_parts/smes_coil/super_io = 2,
		/obj/item/weapon/stock_parts/smes_coil/super_capacity = 2)
	_input_maxed = TRUE
	_output_maxed = TRUE
	_input_on = TRUE
	_output_on = TRUE
	_fully_charged = TRUE

/obj/machinery/alarm/away_patrol
	req_access = list(access_away_patrol)

/obj/machinery/power/apc/away_patrol
	req_access = list(access_away_patrol)
	is_critical = 1
