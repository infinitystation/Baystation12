///Job Outfits

/*
sierra OUTFITS
Keeping them simple for now, just spawning with basic EC uniforms, and pretty much no gear. Gear instead goes in lockers. Keep this in mind if editing.
*/

/decl/hierarchy/outfit/job/sierra
	name = OUTFIT_JOB_NAME("Sierra Outfit")
	hierarchy_type = /decl/hierarchy/outfit/job/sierra
	uniform = /obj/item/clothing/under/color/grey
	l_ear = /obj/item/device/radio/headset
	shoes = /obj/item/clothing/shoes/black
	pda_type = /obj/item/modular_computer/pda
	pda_slot = slot_l_store

/decl/hierarchy/outfit/job/sierra/crew
	name = OUTFIT_JOB_NAME("Sierra Crew Outfit")
	hierarchy_type = /decl/hierarchy/outfit/job/sierra/crew
	uniform = /obj/item/clothing/under/solgov/utility/expeditionary
	shoes = /obj/item/clothing/shoes/dutyboots

/decl/hierarchy/outfit/job/sierra/passenger
	name = OUTFIT_JOB_NAME("Sierra Passenger")
	hierarchy_type = /decl/hierarchy/outfit/job/sierra/passenger
	uniform = /obj/item/clothing/under/color/grey

	///////////
	//COMMAND//
	///////////

/decl/hierarchy/outfit/job/sierra/crew/command
	name = OUTFIT_JOB_NAME("Sierra Command Outfit")
	hierarchy_type = /decl/hierarchy/outfit/job/sierra/crew/command
	l_ear = /obj/item/device/radio/headset/headset_com

/decl/hierarchy/outfit/job/sierra/crew/command/captain
	name = OUTFIT_JOB_NAME("Captain - Sierra")
	glasses = /obj/item/clothing/glasses/sunglasses
	uniform = /obj/item/clothing/under/rank/captain
	l_ear = /obj/item/device/radio/headset/heads/sierracaptain
	shoes = /obj/item/clothing/shoes/brown
	head = /obj/item/clothing/head/caphat
	id_type = /obj/item/weapon/card/id/sierra/gold
	pda_type = /obj/item/modular_computer/pda/captain

/decl/hierarchy/outfit/job/sierra/crew/command/captain/New()
	..()
	backpack_overrides[/decl/backpack_outfit/backpack] = /obj/item/weapon/storage/backpack/captain
	backpack_overrides[/decl/backpack_outfit/satchel] = /obj/item/weapon/storage/backpack/satchel_cap
	backpack_overrides[/decl/backpack_outfit/messenger_bag] = /obj/item/weapon/storage/backpack/messenger/com

/decl/hierarchy/outfit/job/sierra/crew/command/hop
	name = OUTFIT_JOB_NAME("Head of Personnel")
	uniform = /obj/item/clothing/under/rank/head_of_personnel
	l_ear = /obj/item/device/radio/headset/heads/sierraxo
	shoes = /obj/item/clothing/shoes/brown
	id_type = /obj/item/weapon/card/id/sierra/silver
	pda_type = /obj/item/modular_computer/pda/heads/hop

/decl/hierarchy/outfit/job/sierra/crew/research/rd
	name = OUTFIT_JOB_NAME("Research Director - Sierra")
	l_ear = /obj/item/device/radio/headset/heads/sierrantcommand
	uniform = /obj/item/clothing/under/rank/research_director
	suit = /obj/item/clothing/suit/storage/toggle/labcoat/science
	shoes = /obj/item/clothing/shoes/brown
	id_type = /obj/item/weapon/card/id/sierra/silver/research
	pda_type = /obj/item/modular_computer/pda/heads/rd

/decl/hierarchy/outfit/job/sierra/crew/command/cmo
	name = OUTFIT_JOB_NAME("Chief Medical Officer - Sierra")
	l_ear  =/obj/item/device/radio/headset/heads/cmo
	uniform = /obj/item/clothing/under/solgov/utility/expeditionary/officer/medical
	shoes = /obj/item/clothing/shoes/brown
	id_type = /obj/item/weapon/card/id/sierra/silver/medical
	pda_type = /obj/item/modular_computer/pda/heads/cmo
	pda_slot = slot_l_store

/decl/hierarchy/outfit/job/sierra/crew/command/cmo/New()
	..()
	BACKPACK_OVERRIDE_MEDICAL

/decl/hierarchy/outfit/job/sierra/crew/command/cmo/fleet
	name = OUTFIT_JOB_NAME("Chief Medical Officer - Fleet")
	uniform = /obj/item/clothing/under/rank/chief_medical_officer
	shoes = /obj/item/clothing/shoes/dutyboots

/decl/hierarchy/outfit/job/sierra/crew/command/chief_engineer
	name = OUTFIT_JOB_NAME("Chief Engineer - Sierra")
	uniform = /obj/item/clothing/under/rank/chief_engineer
	shoes = /obj/item/clothing/shoes/workboots/alt
	l_ear = /obj/item/device/radio/headset/heads/ce
	id_type = /obj/item/weapon/card/id/sierra/silver/engineering
	pda_type = /obj/item/modular_computer/pda/heads/ce
	pda_slot = slot_l_store
	flags = OUTFIT_HAS_BACKPACK|OUTFIT_EXTENDED_SURVIVAL

/decl/hierarchy/outfit/job/sierra/crew/command/chief_engineer/New()
	..()
	BACKPACK_OVERRIDE_ENGINEERING

/decl/hierarchy/outfit/job/sierra/crew/command/hos
	name = OUTFIT_JOB_NAME("Head of Security")
	l_ear = /obj/item/device/radio/headset/heads/cos
	uniform = /obj/item/clothing/under/rank/head_of_security/corp
	shoes = /obj/item/clothing/shoes/jackboots
	id_type = /obj/item/weapon/card/id/sierra/silver/security
	pda_type = /obj/item/modular_computer/pda/heads/hos

/decl/hierarchy/outfit/job/sierra/crew/command/hos/New()
	..()
	BACKPACK_OVERRIDE_SECURITY

/decl/hierarchy/outfit/job/sierra/crew/research/iaa
	name = OUTFIT_JOB_NAME("Internal Affairs Agent - Sierra")
	l_ear = /obj/item/device/radio/headset/heads/sierrantcommand
	uniform = /obj/item/clothing/under/rank/internalaffairs/plain/nt
	suit = /obj/item/clothing/suit/storage/toggle/suit/black
	shoes = /obj/item/clothing/shoes/laceup
	id_type = /obj/item/weapon/card/id/sierra/crew/research/liaison
	pda_type = /obj/item/modular_computer/pda/heads/paperpusher
	backpack_contents = list(/obj/item/clothing/accessory/badge/nanotrasen = 1)

/decl/hierarchy/outfit/job/sierra/crew/command/adjutant
	name = OUTFIT_JOB_NAME("Adjutant")
	uniform = /obj/item/clothing/under/rank/guard
	shoes = /obj/item/clothing/shoes/brown

	///////////////
	//ENGINEERING//
	///////////////

/decl/hierarchy/outfit/job/sierra/crew/engineering
	hierarchy_type = /decl/hierarchy/outfit/job/sierra/crew/engineering
	l_ear = /obj/item/device/radio/headset/headset_eng
	pda_slot = slot_l_store
	flags = OUTFIT_HAS_BACKPACK|OUTFIT_EXTENDED_SURVIVAL

/decl/hierarchy/outfit/job/sierra/crew/engineering/New()
	..()
	BACKPACK_OVERRIDE_ENGINEERING

/decl/hierarchy/outfit/job/sierra/crew/engineering/senior_engineer
	name = OUTFIT_JOB_NAME("Senior Engineer")
	uniform = /obj/item/clothing/under/rank/engineer
	shoes = /obj/item/clothing/shoes/workboots/alt
	id_type = /obj/item/weapon/card/id/sierra/crew/engineering/senior
	pda_type = /obj/item/modular_computer/pda/heads/ce

/decl/hierarchy/outfit/job/sierra/crew/engineering/engineer
	name = OUTFIT_JOB_NAME("Engineer - Sierra")
	uniform = /obj/item/clothing/under/rank/engineer
	shoes = /obj/item/clothing/shoes/workboots/alt
	id_type = /obj/item/weapon/card/id/sierra/crew/engineering
	pda_type = /obj/item/modular_computer/pda/engineering

/decl/hierarchy/outfit/job/sierra/crew/engineering/engineer/atmos
	name = OUTFIT_JOB_NAME("Engineer (Atmos) - Sierra")
	uniform = /obj/item/clothing/under/rank/atmospheric_technician

/decl/hierarchy/outfit/job/sierra/crew/engineering/engineer/maints
	name = OUTFIT_JOB_NAME("Engineer (Maints) - Sierra")
	uniform = /obj/item/clothing/under/hazard

/decl/hierarchy/outfit/job/sierra/crew/engineering/engineer/tcomms
	name = OUTFIT_JOB_NAME("Engineer (Tcomms) - Sierra")
	uniform = /obj/item/clothing/under/rank/dispatch
	shoes = /obj/item/clothing/shoes/brown
	id_type = /obj/item/weapon/card/id/sierra/crew/engineering/comms

/decl/hierarchy/outfit/job/sierra/crew/engineering/roboticist
	name = OUTFIT_JOB_NAME("Roboticist - Sierra")
	uniform = /obj/item/clothing/under/rank/roboticist
	shoes = /obj/item/clothing/shoes/black
	l_ear = /obj/item/device/radio/headset/sierraroboticist
	id_type = /obj/item/weapon/card/id/sierra/crew/engineering/roboticist
	pda_type = /obj/item/modular_computer/pda/roboticist

	////////////
	//SECURITY//
	////////////

/decl/hierarchy/outfit/job/sierra/crew/security
	hierarchy_type = /decl/hierarchy/outfit/job/sierra/crew/security
	l_ear = /obj/item/device/radio/headset/headset_sec
	pda_slot = slot_l_store

/decl/hierarchy/outfit/job/sierra/crew/security/New()
	..()
	BACKPACK_OVERRIDE_SECURITY

/decl/hierarchy/outfit/job/sierra/crew/security/warden
	name = OUTFIT_JOB_NAME("Warden")
	uniform = /obj/item/clothing/under/rank/warden/corp
	shoes = /obj/item/clothing/shoes/jackboots
	id_type = /obj/item/weapon/card/id/sierra/crew/security/warden
	pda_type = /obj/item/modular_computer/pda/security

/decl/hierarchy/outfit/job/sierra/crew/security/detective
	name = OUTFIT_JOB_NAME("Detective")
	head = /obj/item/clothing/head/det
	uniform = /obj/item/clothing/under/det
	suit = /obj/item/clothing/suit/storage/det_trench/ft
	shoes = /obj/item/clothing/shoes/laceup

/decl/hierarchy/outfit/job/sierra/crew/security/officer
	name = OUTFIT_JOB_NAME("Security Officer")
	uniform = /obj/item/clothing/under/rank/security/corp
	shoes = /obj/item/clothing/shoes/jackboots
	id_type = /obj/item/weapon/card/id/sierra/crew/security
	pda_type = /obj/item/modular_computer/pda/security

	///////////
	//MEDICAL//
	///////////

/decl/hierarchy/outfit/job/sierra/crew/medical
	hierarchy_type = /decl/hierarchy/outfit/job/sierra/crew/medical
	l_ear = /obj/item/device/radio/headset/headset_med
	shoes = /obj/item/clothing/shoes/white
	pda_type = /obj/item/modular_computer/pda/medical
	pda_slot = slot_l_store

/decl/hierarchy/outfit/job/sierra/crew/medical/New()
	..()
	BACKPACK_OVERRIDE_MEDICAL

/decl/hierarchy/outfit/job/sierra/crew/medical/senior
	name = OUTFIT_JOB_NAME("Surgeon")
	uniform = /obj/item/clothing/under/rank/medical/scrubs
	id_type = /obj/item/weapon/card/id/sierra/crew/medical/senior

/decl/hierarchy/outfit/job/sierra/crew/medical/doctor
	name = OUTFIT_JOB_NAME("Doctor")
	uniform = /obj/item/clothing/under/rank/medical
	id_type = /obj/item/weapon/card/id/sierra/crew/medical

/decl/hierarchy/outfit/job/sierra/crew/medical/doctor/orderly
	name = OUTFIT_JOB_NAME("Orderly")
	uniform = /obj/item/clothing/under/rank/orderly

/decl/hierarchy/outfit/job/sierra/crew/medical/doctor/xenosurgeon
	name = OUTFIT_JOB_NAME("Xenosurgeon")
	uniform = /obj/item/clothing/under/rank/medical/scrubs/purple

/decl/hierarchy/outfit/job/sierra/crew/medical/doctor/mortus
	name = OUTFIT_JOB_NAME("Mortician")
	uniform = /obj/item/clothing/under/rank/medical/scrubs/black

/decl/hierarchy/outfit/job/sierra/crew/medical/doctor/virologist
	name = OUTFIT_JOB_NAME("Virologist - Sierra")
	uniform = /obj/item/clothing/under/rank/virologist

/decl/hierarchy/outfit/job/sierra/crew/medical/doctor/virologist/New()
	..()
	BACKPACK_OVERRIDE_VIROLOGY

/decl/hierarchy/outfit/job/sierra/crew/medical/doctor/paramedic
	name = OUTFIT_JOB_NAME("Paramedic - Sierra")
	uniform = /obj/item/clothing/under/rank/medical/paramedic
	suit = /obj/item/clothing/suit/storage/toggle/fr_jacket
	shoes = /obj/item/clothing/shoes/jackboots
	l_hand = /obj/item/weapon/storage/firstaid/adv
	belt = /obj/item/weapon/storage/belt/medical/emt
	flags = OUTFIT_HAS_BACKPACK|OUTFIT_EXTENDED_SURVIVAL

/decl/hierarchy/outfit/job/sierra/crew/medical/doctor/chemist
	name = OUTFIT_JOB_NAME("Chemist - Sierra")
	uniform = /obj/item/clothing/under/rank/chemist
	pda_type = /obj/item/modular_computer/pda/chemistry
	id_type = /obj/item/weapon/card/id/sierra/crew/medical/chemist

/decl/hierarchy/outfit/job/sierra/crew/medical/doctor/chemist/New()
	..()
	BACKPACK_OVERRIDE_CHEMISTRY

/decl/hierarchy/outfit/job/sierra/crew/medical/counselor
	name = OUTFIT_JOB_NAME("Counselor")
	uniform = /obj/item/clothing/under/rank/psych/turtleneck
	id_type = /obj/item/weapon/card/id/sierra/crew/medical/counselor

/decl/hierarchy/outfit/job/sierra/crew/medical/counselor/psychiatrist
	name = OUTFIT_JOB_NAME("Psychiatrist - Sierra")
	uniform = /obj/item/clothing/under/rank/psych

/decl/hierarchy/outfit/job/sierra/crew/medical/counselor/chaplain
	name = OUTFIT_JOB_NAME("Chaplain - Sierra")
	uniform = /obj/item/clothing/under/rank/chaplain
	l_hand = /obj/item/weapon/storage/bible

	/////////
	//CARGO//
	/////////

/decl/hierarchy/outfit/job/sierra/crew/supply
	l_ear = /obj/item/device/radio/headset/headset_cargo
	shoes = /obj/item/clothing/shoes/brown
	pda_type = /obj/item/modular_computer/pda/cargo
	hierarchy_type = /decl/hierarchy/outfit/job/sierra/crew/supply

/decl/hierarchy/outfit/job/sierra/crew/supply/New()
	..()
	BACKPACK_OVERRIDE_ENGINEERING

/decl/hierarchy/outfit/job/sierra/crew/supply/quartermaster
	name = OUTFIT_JOB_NAME("Quartermaster")
	l_ear = /obj/item/device/radio/headset/headset_deckofficer
	uniform = /obj/item/clothing/under/rank/cargo
	id_type = /obj/item/weapon/card/id/sierra/crew/supply/quartermaster

/decl/hierarchy/outfit/job/sierra/crew/supply/tech
	name = OUTFIT_JOB_NAME("Cargo Technician")
	uniform = /obj/item/clothing/under/rank/cargotech
	id_type = /obj/item/weapon/card/id/sierra/crew/supply

/decl/hierarchy/outfit/job/sierra/crew/supply/prospector
	name = OUTFIT_JOB_NAME("Prospector")
	uniform = /obj/item/clothing/under/rank/ntwork
	shoes = /obj/item/clothing/shoes/workboots/alt
	id_type = /obj/item/weapon/card/id/sierra/crew/supply/mining
	l_ear = /obj/item/device/radio/headset/headset_mining
	flags = OUTFIT_HAS_BACKPACK|OUTFIT_EXTENDED_SURVIVAL

/decl/hierarchy/outfit/job/sierra/crew/research/prospector/New()
	..()
	BACKPACK_OVERRIDE_ENGINEERING

/decl/hierarchy/outfit/job/sierra/crew/supply/assistant
	name = OUTFIT_JOB_NAME("Cargo Assistant")
	uniform = /obj/item/clothing/under/rank/cargotech
	id_type = /obj/item/weapon/card/id/sierra/crew/supply

	///////////
	//SERVICE//
	///////////

/decl/hierarchy/outfit/job/sierra/crew/service
	l_ear = /obj/item/device/radio/headset/headset_service
	shoes = /obj/item/clothing/shoes/black
	pda_type = /obj/item/modular_computer/pda
	hierarchy_type = /decl/hierarchy/outfit/job/sierra/crew/service

/decl/hierarchy/outfit/job/sierra/crew/service/janitor
	name = OUTFIT_JOB_NAME("Janitor - Sierra")
	uniform = /obj/item/clothing/under/rank/janitor
	id_type = /obj/item/weapon/card/id/sierra/crew/service/janitor

/decl/hierarchy/outfit/job/sierra/crew/service/cook
	name = OUTFIT_JOB_NAME("Chef - Sierra")
	uniform = /obj/item/clothing/under/rank/chef
	id_type = /obj/item/weapon/card/id/sierra/crew/service/chef

/decl/hierarchy/outfit/job/sierra/crew/service/bartender
	name = OUTFIT_JOB_NAME("Bartender - Sierra")
	uniform = /obj/item/clothing/under/rank/bartender
	shoes = /obj/item/clothing/shoes/laceup
	id_type = /obj/item/weapon/card/id/sierra/crew/service/bartender
	l_pocket = /obj/item/device/cassette/custom

	///////////////
	//EXPLORATION//
	///////////////

/decl/hierarchy/outfit/job/sierra/crew/exploration
	shoes = /obj/item/clothing/shoes/dutyboots
	pda_type = /obj/item/modular_computer/pda/explorer
	l_ear = /obj/item/device/radio/headset/exploration

/decl/hierarchy/outfit/job/sierra/crew/exploration/New()
	..()
	backpack_overrides[/decl/backpack_outfit/backpack]      = /obj/item/weapon/storage/backpack/explorer
	backpack_overrides[/decl/backpack_outfit/satchel]       = /obj/item/weapon/storage/backpack/satchel_explorer
	backpack_overrides[/decl/backpack_outfit/messenger_bag] = /obj/item/weapon/storage/backpack/messenger/explorer

/decl/hierarchy/outfit/job/sierra/crew/exploration/pathfinder
	name = OUTFIT_JOB_NAME("Pathfinder")
	uniform = /obj/item/clothing/under/solgov/utility/expeditionary/officer/exploration
	id_type = /obj/item/weapon/card/id/sierra/solgov/pathfinder
	l_ear = /obj/item/device/radio/headset/pathfinder

/decl/hierarchy/outfit/job/sierra/crew/exploration/explorer
	name = OUTFIT_JOB_NAME("Explorer")
	uniform = /obj/item/clothing/under/solgov/utility/expeditionary/exploration
	id_type = /obj/item/weapon/card/id/sierra/solgov/explorer

/decl/hierarchy/outfit/job/sierra/crew/exploration/pilot
	name = OUTFIT_JOB_NAME("Expeditionary Pilot")
	uniform = /obj/item/clothing/under/solgov/utility/expeditionary/exploration/pilot
	id_type = /obj/item/weapon/card/id/sierra/solgov/pilot

/decl/hierarchy/outfit/job/sierra/crew/exploration/medic
	name = OUTFIT_JOB_NAME("Field Medic")
	uniform = /obj/item/clothing/under/solgov/utility/expeditionary/exploration/field_medic
	id_type = /obj/item/weapon/card/id/sierra/solgov/field_medic
	l_ear = /obj/item/device/radio/headset/exploration/medic

/decl/hierarchy/outfit/job/sierra/crew/exploration/engineer
	name = OUTFIT_JOB_NAME("Field Engineer")
	uniform = /obj/item/clothing/under/solgov/utility/expeditionary/exploration/field_engineer
	id_type = /obj/item/weapon/card/id/sierra/solgov/field_engineer
	l_ear = /obj/item/device/radio/headset/exploration/engineer

	////////////
	//RESEARCH//
	////////////

/decl/hierarchy/outfit/job/sierra/crew/research
	hierarchy_type = /decl/hierarchy/outfit/job/sierra/crew/research
	pda_type = /obj/item/modular_computer/pda/science
	l_ear = /obj/item/device/radio/headset/sierrananotrasen

/decl/hierarchy/outfit/job/sierra/crew/research/senior_scientist
	name = OUTFIT_JOB_NAME("Senior Researcher")
	uniform = /obj/item/clothing/under/rank/scientist/executive
	suit = /obj/item/clothing/suit/storage/toggle/labcoat/science
	shoes = /obj/item/clothing/shoes/white
	pda_type = /obj/item/modular_computer/pda/heads/rd
	id_type = /obj/item/weapon/card/id/sierra/crew/research/senior_scientist

/decl/hierarchy/outfit/job/sierra/crew/research/senior_scientist/New()
	..()
	BACKPACK_OVERRIDE_RESEARCH

/decl/hierarchy/outfit/job/sierra/crew/research/nt_pilot //pending better uniform
	name = OUTFIT_JOB_NAME("Pilot")
	uniform = /obj/item/clothing/under/rank/ntpilot
	suit = /obj/item/clothing/suit/storage/toggle/brown_jacket/nanotrasen
	shoes = /obj/item/clothing/shoes/workboots
	id_type = /obj/item/weapon/card/id/sierra/crew/research/nt_pilot
	l_ear = /obj/item/device/radio/headset/headset_pilot/

/decl/hierarchy/outfit/job/sierra/crew/research/scientist
	name = OUTFIT_JOB_NAME("Scientist - Sierra")
	uniform = /obj/item/clothing/under/rank/scientist
	shoes = /obj/item/clothing/shoes/white
	id_type = /obj/item/weapon/card/id/sierra/crew/research/scientist

/decl/hierarchy/outfit/job/sierra/crew/research/scientist/New()
	..()
	BACKPACK_OVERRIDE_RESEARCH

/decl/hierarchy/outfit/job/sierra/crew/research/scientist/psych
	name = OUTFIT_JOB_NAME("Psychologist - Sierra")
	uniform = /obj/item/clothing/under/rank/psych

/decl/hierarchy/outfit/job/sierra/crew/research/assist
	name = OUTFIT_JOB_NAME("Research Assistant - Sierra")
	uniform = /obj/item/clothing/under/rank/scientist
	shoes = /obj/item/clothing/shoes/white
	id_type = /obj/item/weapon/card/id/sierra/crew/research

/decl/hierarchy/outfit/job/sierra/crew/research/assist/testsubject
	name = OUTFIT_JOB_NAME("Testing Assistant")
	uniform = /obj/item/clothing/under/rank/ntwork

	//////////////
	//PASSENGERS//
	//////////////

/decl/hierarchy/outfit/job/sierra/passenger
	name = OUTFIT_JOB_NAME("Passenger - Sierra")
	uniform = /obj/item/clothing/under/color/grey
	l_ear = /obj/item/device/radio/headset
	shoes = /obj/item/clothing/shoes/black
	id_type = /obj/item/weapon/card/id/sierra/passenger

/decl/hierarchy/outfit/job/sierra/passenger/journalist
	name = OUTFIT_JOB_NAME("Journalist - Sierra")
	backpack_contents = list(/obj/item/device/tvcamera = 1,
	/obj/item/clothing/accessory/badge/press = 1)

	/////////
	//OTHER//
	/////////

/decl/hierarchy/outfit/job/sierra/merchant
	name = OUTFIT_JOB_NAME("Merchant - Sierra")
	uniform = /obj/item/clothing/under/suit_jacket/charcoal
	l_ear = null
	shoes = /obj/item/clothing/shoes/black
	pda_type = /obj/item/modular_computer/pda
	id_type = /obj/item/weapon/card/id/sierra/merchant

/decl/hierarchy/outfit/job/sierra/stowaway
	name = OUTFIT_JOB_NAME("Stowaway - Sierra")
	id_type = null
	pda_type = null
	l_ear = null
	l_pocket = /obj/item/weapon/wrench
	r_pocket = /obj/item/weapon/crowbar/prybar

/decl/hierarchy/outfit/job/sierra/stowaway/post_equip(var/mob/living/carbon/human/H)
	..()
	var/obj/item/weapon/card/id/sierra/stowaway/ID = new(H.loc)
	H.put_in_hands(ID)
