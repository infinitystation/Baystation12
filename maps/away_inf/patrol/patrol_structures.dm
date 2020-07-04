/* TCOMMS
 * ======
 */

/obj/machinery/telecomms/allinone/away_scg_patrol
	listening_freqs = list(ERT_FREQ)
	channel_color = COMMS_COLOR_CENTCOMM
	channel_name = "SCG Patrol"
	circuitboard = /obj/item/weapon/stock_parts/circuitboard/telecomms/allinone/away_scg_patrol

/obj/item/weapon/stock_parts/circuitboard/telecomms/allinone/away_scg_patrol
	build_path = /obj/machinery/telecomms/allinone/away_scg_patrol

/* SMES
 * ====
 */

/obj/machinery/power/smes/buildable/preset/patrol
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
