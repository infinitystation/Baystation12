#define WEBHOOK_SUBMAP_LOADED_SKRELL "webhook_submap_skrell"

#include "skrellscoutship_areas.dm"
#include "skrellscoutship_jobs.dm"
#include "skrellscoutship_shuttles.dm"

#undef WEBHOOK_SUBMAP_LOADED_SKRELL
/datum/map_template/ruin/away_site/skrellscoutship
	name = "Skrellian Scout Ship"
	id = "awaysite_skrell_scout"
	description = "A Skrellian SDTF scouting vessel."
	prefix = "maps/away_inf/"
	suffixes = list("skrellscoutship/skrellscoutship-1.dmm", "skrellscoutship/skrellscoutship-2.dmm")
	spawn_weight = 50 //INF, HABITABLE SHIPS SPAWN
	cost = 2000
	shuttles_to_initialise = list(/datum/shuttle/autodock/overmap/skrellscoutship, /datum/shuttle/autodock/overmap/skrellscoutshuttle)
	apc_test_exempt_areas = list(
		/area/ship/skrellscoutshuttle =                NO_SCRUBBER|NO_VENT|NO_APC,
		/area/ship/skrellscoutship/crew/toilets =      NO_SCRUBBER|NO_VENT,
		/area/ship/skrellscoutship/maintenance/power = NO_SCRUBBER|NO_VENT,
		/area/ship/skrellscoutship/solars =            NO_SCRUBBER|NO_VENT|NO_APC
	)

/obj/effect/overmap/visitable/sector/skrellscoutspace
	name = "strange ion cloud"
	desc = "Slight traces of a cloaking device are present. Unable to determine exact location."
	hide_from_reports = TRUE
	in_space = 1
	icon_state = "ion1"

/obj/item/weapon/stock_parts/circuitboard/telecomms/allinone/skrellscoutship
	build_path = /obj/machinery/telecomms/allinone/skrellscoutship

/obj/machinery/telecomms/allinone/skrellscoutship
	listening_freqs = list(SKRELL_FREQ)
	channel_color = COMMS_COLOR_SKRELL
	channel_name = "Recon"
	circuitboard = /obj/item/weapon/stock_parts/circuitboard/telecomms/allinone/skrellscoutship

/obj/item/device/radio/headset/skrellian
	name = "recon headset"
	icon_state = "srv_headset"
	ks1type = /obj/item/device/encryptionkey/skrellian

/obj/item/device/radio/headset/skrellian/Initialize()
	. = ..()
	set_frequency(SKRELL_FREQ)	//Not going to be random or just set to the common frequency, but can be set later.

/obj/item/device/encryptionkey/skrellian
	name = "recon radio encryption key"
	icon_state = "medsci_cypherkey"
	channels = list("Recon" = 1)

/obj/item/weapon/reagent_containers/food/condiment/psilocybin
	label_text = "Psilocybin"
	starting_reagents = list(/datum/reagent/psilocybin = 50)

/obj/item/weapon/reagent_containers/food/condiment/mindbreaker
	label_text = "Mindbreaker"
	starting_reagents = list(/datum/reagent/mindbreaker = 50)

/obj/item/weapon/reagent_containers/food/condiment/space_drugs
	label_text = "Ambrosia"
	starting_reagents = list(/datum/reagent/space_drugs = 50)

/datum/mil_branch/skrell_fleet
	name = "Skrellian Defense Task Force"
	name_short = "SDTF"
	email_domain = "sdtf.qb"

	rank_types = list(/datum/mil_rank/skrell_fleet)
	spawn_rank_types = list(/datum/mil_rank/skrell_fleet)

/datum/mil_rank/skrell_fleet
	name = "NULL"

/obj/machinery/power/apc/skrell
	req_access = list(access_skrellscoutship)

/obj/machinery/alarm/skrell
	req_access = list(access_skrellscoutship)
	target_temperature = T0C+40

/obj/machinery/alarm/skrell/Initialize()
	. = ..()
	TLV["pressure"] =		list(ONE_ATMOSPHERE*0.80,ONE_ATMOSPHERE*0.90,ONE_ATMOSPHERE*1.30,ONE_ATMOSPHERE*1.40) /* kpa */
	TLV["temperature"] =	list(T0C-26, T0C, T0C+80, T0C+90) // K

/obj/machinery/power/smes/buildable/preset/skrell
	uncreated_component_parts = list(
		/obj/item/weapon/stock_parts/smes_coil/super_io = 2,
		/obj/item/weapon/stock_parts/smes_coil/super_capacity = 2)
	_input_maxed = TRUE
	_output_maxed = TRUE
	_input_on = TRUE
	_output_on = TRUE
	_fully_charged = TRUE

/obj/machinery/vending/medical/skrell
	req_access = list(access_skrellscoutship)

/obj/machinery/suit_storage_unit/skrell
	name = "Black Voidsuit Storage Unit"
	suit= /obj/item/clothing/suit/space/void/skrell/black
	helmet = /obj/item/clothing/head/helmet/space/void/skrell/black
	boots = /obj/item/clothing/shoes/magboots
	tank = /obj/item/weapon/tank/oxygen
	mask = /obj/item/clothing/mask/gas/half
	req_access = list(access_skrellscoutship)
	islocked = 1

/obj/machinery/suit_storage_unit/skrell/white
	name = "White Voidsuit Storage Unit"
	suit= /obj/item/clothing/suit/space/void/skrell/white
	helmet = /obj/item/clothing/head/helmet/space/void/skrell/white

/*
 * AIRLOCKS
 * ========
 */

/obj/machinery/door/airlock/skrell
	door_color = COLOR_SILVER

/obj/machinery/door/airlock/skrell/engineering
	stripe_color = COLOR_AMBER

/obj/machinery/door/airlock/skrell/command
	stripe_color = COLOR_COMMAND_BLUE

/obj/machinery/door/airlock/skrell/medical
	stripe_color = COLOR_DEEP_SKY_BLUE

/obj/machinery/door/airlock/skrell/security
	stripe_color = COLOR_NT_RED

/obj/machinery/door/airlock/skrell/living
	stripe_color = COLOR_CIVIE_GREEN
