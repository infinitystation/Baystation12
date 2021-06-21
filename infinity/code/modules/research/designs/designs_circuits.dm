/datum/design/circuit/telesci_console
	name = "telepad control console"
	id = "telesci_console"
	req_tech = list(TECH_DATA = 3, TECH_BLUESPACE = 2)
	build_path = /obj/item/stock_parts/circuitboard/telesci_console
	sort_string = "HAAAD"

/datum/design/circuit/telepad
	name = "telepad"
	id = "telepad"
	req_tech = list(TECH_DATA = 4, TECH_ENGINEERING = 3, TECH_MATERIAL = 3, TECH_BLUESPACE = 4)
	build_path = /obj/item/stock_parts/circuitboard/telesci_pad
	sort_string = "HAAAF"


/datum/design/circuit/coinmachine
	name = "coin making machine board"
	id = "coinmachine"
	req_tech = list(TECH_DATA = 1, TECH_ENGINEERING = 1)
	build_path = /obj/item/stock_parts/circuitboard/autolathe/coinmachine
	sort_string = "HABAL"

/datum/design/circuit/bs_silk_control
	name = "bluespace snare control"
	id = "bsc"
	req_tech = list(TECH_BLUESPACE = 5, TECH_DATA = 4)
	build_path = /obj/item/stock_parts/circuitboard/bs_snare_control
	sort_string = "KCAAH"

/datum/design/circuit/bs_silk_hub
	name = "bluespace snare hub"
	id = "bsh"
	req_tech = list(TECH_BLUESPACE = 5, TECH_DATA = 4)
	build_path = /obj/item/stock_parts/circuitboard/bs_snare_hub
	sort_string = "KCAAI"

/datum/design/circuit/teleport_pad // Здесь требуется переработать уровни ~bear1ake
	name = "teleporter pad"
	id = "teleport_pad"
	req_tech = list(TECH_ENGINEERING = 4, TECH_DATA = 4, TECH_BLUESPACE = 4)
	build_path =/obj/item/stock_parts/circuitboard/teleporter_pad
	sort_string = "KCAAJ"

/datum/design/circuit/teleport_projector // Здесь требуется переработать уровни
	name = "teleporter projector"
	id = "teleport_projector"
	req_tech = list(TECH_ENGINEERING = 4, TECH_DATA = 4, TECH_BLUESPACE = 4)
	build_path = /obj/item/stock_parts/circuitboard/teleporter_projector
	sort_string = "KCAAK"

/datum/design/circuit/wallcharger
	name = "wall recharger"
	id = "recharger_wall"
	req_tech = list(TECH_ENGINEERING = 3, TECH_POWER = 4, TECH_DATA = 2)
	build_path = /obj/item/stock_parts/circuitboard/wallcharger
	sort_string = "KCAAL"

/datum/design/circuit/cell_charger
	name = "heavy-duty cell charger"
	id = "cell_charger"
	req_tech = list(TECH_ENGINEERING = 2, TECH_POWER = 2, TECH_DATA = 2)
	build_path = /obj/item/stock_parts/circuitboard/cell_charger
	sort_string = "KCAAM"

/datum/design/circuit/recharger
	name = "recharger"
	id = "recharger"
	req_tech = list(TECH_ENGINEERING = 3, TECH_POWER = 3, TECH_DATA = 2)
	build_path = /obj/item/stock_parts/circuitboard/recharger
	sort_string = "KCAAO"

/datum/design/circuit/scrap_crusher
	name = "crusher"
	id = "crusher"
	req_tech = list(TECH_ENGINEERING = 3, TECH_MATERIAL = 3, TECH_DATA = 3)
	build_path = /obj/item/stock_parts/circuitboard/crusher
	sort_string = "KCASA"

/datum/design/circuit/scrap_ripper
	name = "pile ripper"
	id = "pile_ripper"
	req_tech = list(TECH_ENGINEERING = 3, TECH_DATA = 2)
	build_path = /obj/item/stock_parts/circuitboard/pile_ripper
	sort_string = "KCASB"

/datum/design/circuit/srcap_recycler
	name = "recycler"
	id = "recycler"
	req_tech = list(TECH_ENGINEERING = 3, TECH_DATA = 2)
	build_path = /obj/item/stock_parts/circuitboard/recycler
	sort_string = "KCASC"

/datum/design/circuit/area_atmos
	name = "area atmos"
	id = "area_atmos"
	req_tech = list(TECH_DATA = 2)
	build_path = /obj/item/stock_parts/circuitboard/area_atmos
	sort_string = "KCAAR"

/datum/design/circuit/emitter
	name = "emitter"
	id = "emitter"
	req_tech = list(TECH_POWER = 4, TECH_ENGINEERING = 3)
	build_path = /obj/item/stock_parts/circuitboard/emitter
	sort_string = "KCASE"

/datum/design/circuit/sublimator
	name = "reagent sublimator"
	id = "reagent_sublimator"
	req_tech = list(TECH_POWER = 2, TECH_ENGINEERING = 1)
	build_path = /obj/item/stock_parts/circuitboard/sublimator
	sort_string = "KCASS"

/datum/design/circuit/rad_collector
	name = "radiation collector"
	id = "radiation_collector"
	req_tech = list(TECH_POWER = 4, TECH_ENGINEERING = 4, TECH_PHORON = 3)
	build_path = /obj/item/stock_parts/circuitboard/rad_collector
	sort_string = "KCASR"

/datum/design/circuit/traffic_console
	name = "telecommunications traffic control console"
	id = "teletraffic"
	req_tech = list(TECH_DATA = 3)
	build_path = /obj/item/stock_parts/circuitboard/comm_traffic
	sort_string = "KCAST"
