//Shouldn't be a lot in here, only sierra versions of existing machines that need a different access req or something along those lines.

/obj/machinery/drone_fabricator/sierra
	fabricator_tag = "NES Sierra Maintenance"

/obj/machinery/drone_fabricator/sierra/adv
	name = "advanced drone fabricator"
	fabricator_tag = "SFV Arrow Maintenance"
	drone_type = /mob/living/silicon/robot/drone/construction

//telecommunications gubbins for sierra-specific networks

/obj/machinery/telecomms/hub/preset
	id = "Hub"
	network = "tcommsat"
	autolinkers = list("hub", "relay", "c_relay", "s_relay", "m_relay", "r_relay", "b_relay", "1_relay", "2_relay", "3_relay", "4_relay", "5_relay", "s_relay", "science", "medical",
	"supply", "service", "common", "command", "engineering", "security", "exploration", "unused",
 	"receiverA", "broadcasterA")

/obj/machinery/telecomms/receiver/preset_right
	freq_listening = list(AI_FREQ, SCI_FREQ, MED_FREQ, SUP_FREQ, SRV_FREQ, COMM_FREQ, ENG_FREQ, SEC_FREQ, ENT_FREQ, EXP_FREQ)

/obj/machinery/telecomms/bus/preset_two
	freq_listening = list(SUP_FREQ, SRV_FREQ, EXP_FREQ)
	autolinkers = list("processor2", "supply", "service", "exploration", "unused")

/obj/machinery/telecomms/server/presets/service
	id = "Service and Exploration Server"
	freq_listening = list(SRV_FREQ, EXP_FREQ)
	channel_tags = list(
		list(SRV_FREQ, "Service", COMMS_COLOR_SERVICE),
		list(EXP_FREQ, "Exploration", COMMS_COLOR_EXPLORER)
	)
	autolinkers = list("service", "exploration")

/obj/machinery/telecomms/server/presets/exploration
	id = "Utility Server"
	freq_listening = list(EXP_FREQ)
	channel_tags = list(list(EXP_FREQ, "Exploration", COMMS_COLOR_EXPLORER))
	autolinkers = list("Exploration")

// Suit cyclers and storage
/obj/machinery/suit_cycler/exploration
	name = "Exploration suit cycler"
	model_text = "Exploration"
	req_access = list(access_explorer)
	available_modifications = list(/decl/item_modifier/space_suit/explorer)

/obj/machinery/suit_cycler/pilot
	req_access = list(access_explorer, access_expedition_shuttle_helm)

/obj/machinery/suit_storage_unit/explorer
	name = "Exploration Voidsuit Storage Unit"
	suit_type = /obj/item/clothing/suit/space/void/exploration
	helmet_type = /obj/item/clothing/head/helmet/space/void/exploration
	boots_type = /obj/item/clothing/shoes/magboots
	tank_type = /obj/item/weapon/tank/oxygen
	mask_type = /obj/item/clothing/mask/gas/half
	req_access = list(access_explorer)
	islocked = 1

/obj/machinery/suit_storage_unit/pilot
	name = "Expeditionary Pilot Voidsuit Storage Unit"
	suit_type = /obj/item/clothing/suit/space/void/pilot
	helmet_type = /obj/item/clothing/head/helmet/space/void/pilot
	boots_type = /obj/item/clothing/shoes/magboots
	tank_type = /obj/item/weapon/tank/oxygen
	mask_type = /obj/item/clothing/mask/breath
	req_access = list(access_explorer, access_expedition_shuttle_helm)
	islocked = 1
