	//////////
	//TCOMMS//
	//////////

/obj/machinery/telecomms/relay/preset/sent
	id = "Sentinel Relay"
	autolinkers = list("sentrelay")

/obj/machinery/telecomms/relay/preset/sentalb
	id = "Albatross Relay"
	autolinkers = list("albrelay")

/obj/machinery/telecomms/receiver/preset_sent
	id = "Sentinel Receiver"
	network = "senttcommsat"
	autolinkers = list("receiverSent")
	freq_listening = list(ERT_FREQ, MED_FREQ, COMM_FREQ, ENG_FREQ)

/obj/machinery/telecomms/bus/preset_sent1
	id = "Bus Sent1"
	network = "senttcommsat"
	freq_listening = list(ERT_FREQ, COMM_FREQ)
	autolinkers = list("processorsent1", "centcomm", "command")

/obj/machinery/telecomms/bus/preset_sent2
	id = "Bus Sent2"
	network = "senttcommsat"
	freq_listening = list(MED_FREQ, ENG_FREQ)
	autolinkers = list("processorsent2", "medical", "engineering")

/obj/machinery/telecomms/bus/preset_sent2/New()
	for(var/i = PUBLIC_LOW_FREQ, i < PUBLIC_HIGH_FREQ, i += 2)
		if(i == PUB_FREQ)
			continue
		freq_listening |= i
	..()

/obj/machinery/telecomms/processor/preset_sent1
	id = "Processor Sent1"
	network = "senttcommsat"
	autolinkers = list("processorsent1")

/obj/machinery/telecomms/processor/preset_sent2
	id = "Processor Sent2"
	network = "senttcommsat"
	autolinkers = list("processorsent2")

/obj/machinery/telecomms/hub/presetsent
	id = "sentHub"
	network = "senttcommsat"
	autolinkers = list("sentHub", "sentrelay", "albrelay", "senttroops", "sentmedical", "sentcommon", "sentcommand",
	 "receiverSent", "broadcasterSent")

 /obj/machinery/telecomms/broadcaster/preset_sent
	id = "Broadcaster Sent"
	network = "senttcommsat"
	autolinkers = list("broadcasterSent")

/obj/machinery/telecomms/server/presets/sentinel/common
	id = "Common Server"
	freq_listening = list(PUB_FREQ) // AI Private and Common
	autolinkers = list("sentcommon")

/obj/machinery/telecomms/server/presets/sentinel/command
	id = "sentCommand Server"
	freq_listening = list(COMM_FREQ)
	autolinkers = list("sentcommand")

/obj/machinery/telecomms/server/presets/sentinel/troops
	id = "Troops Server"
	freq_listening = list(ERT_FREQ)
	autolinkers = list("senttroops")

/obj/machinery/telecomms/server/presets/sentinel/medical
	id = "sentMedical Server"
	freq_listening = list(MED_FREQ)
	autolinkers = list("sentmedical")

	/////////////
	//GUNCABINS//
	/////////////

/obj/structure/closet/secure_closet/guncabinet/patrol
	name = "storm group cabinet"

/obj/structure/closet/secure_closet/guncabinet/patrol/energy/WillContain()
	return list(
		/obj/item/clothing/accessory/holster/thigh = 8,
		/obj/item/weapon/gun/energy/gun = 8
	)

/obj/structure/closet/secure_closet/guncabinet/patrol/assault/WillContain()
	return list(
		/obj/item/ammo_magazine/a762 = 16,
		/obj/item/weapon/gun/projectile/automatic/z8 = 4
	)

/obj/structure/closet/secure_closet/guncabinet/patrol/carabine/WillContain()
	return list(
		/obj/item/ammo_magazine/c12755 = 6,
		/obj/item/weapon/gun/projectile/automatic/amrcarabine = 2
	)

/obj/structure/closet/secure_closet/guncabinet/patrol/shotgun/WillContain()
	return list(
		/obj/item/ammo_casing/shotgun/pellet = 20,
		/obj/item/clothing/accessory/storage/bandolier = 2,
		/obj/item/weapon/gun/projectile/shotgun/pump/combat/lethal = 2
	)