///Job Outfits

/*
sierra OUTFITS
Keeping them simple for now, just spawning with basic EC uniforms, and pretty much no gear. Gear instead goes in lockers. Keep this in mind if editing.
*/

/decl/hierarchy/outfit/job/sierra
	name = OUTFIT_JOB_NAME("sierra Outfit")
	hierarchy_type = /decl/hierarchy/outfit/job/sierra
	uniform = /obj/item/clothing/under/color/grey
	l_ear = /obj/item/device/radio/headset
	shoes = /obj/item/clothing/shoes/black
	pda_type = /obj/item/modular_computer/pda
	pda_slot = slot_l_store

/decl/hierarchy/outfit/job/sierra/crew
	name = OUTFIT_JOB_NAME("sierra Crew Outfit")
	hierarchy_type = /decl/hierarchy/outfit/job/sierra/crew
	uniform = /obj/item/clothing/under/solgov/utility/expeditionary
	shoes = /obj/item/clothing/shoes/dutyboots

/decl/hierarchy/outfit/job/sierra/crew/fleet
	name = OUTFIT_JOB_NAME("sierra Fleet Outfit")
	hierarchy_type = /decl/hierarchy/outfit/job/sierra/crew/fleet
	uniform = /obj/item/clothing/under/solgov/utility/fleet
	shoes = /obj/item/clothing/shoes/dutyboots

/decl/hierarchy/outfit/job/sierra/passenger
	name = OUTFIT_JOB_NAME("sierra Passenger")
	hierarchy_type = /decl/hierarchy/outfit/job/sierra/passenger
	uniform = /obj/item/clothing/under/solgov/utility

//Command Outfits
/decl/hierarchy/outfit/job/sierra/crew/command
	name = OUTFIT_JOB_NAME("sierra Command Outfit")
	hierarchy_type = /decl/hierarchy/outfit/job/sierra/crew/command
	l_ear = /obj/item/device/radio/headset/headset_com

/decl/hierarchy/outfit/job/sierra/crew/command/CO
	name = OUTFIT_JOB_NAME("Commanding Officer")
	glasses = /obj/item/clothing/glasses/sunglasses
	uniform = /obj/item/clothing/under/solgov/utility/expeditionary/officer/command
	l_ear = /obj/item/device/radio/headset/heads/sierracaptain
	shoes = /obj/item/clothing/shoes/dutyboots
	head = /obj/item/clothing/head/soft/solgov/expedition/co
	id_type = /obj/item/weapon/card/id/sierra/gold
	pda_type = /obj/item/modular_computer/pda/captain

/decl/hierarchy/outfit/job/sierra/crew/command/CO/New()
	..()
	backpack_overrides[/decl/backpack_outfit/backpack] = /obj/item/weapon/storage/backpack/captain
	backpack_overrides[/decl/backpack_outfit/satchel] = /obj/item/weapon/storage/backpack/satchel_cap
	backpack_overrides[/decl/backpack_outfit/messenger_bag] = /obj/item/weapon/storage/backpack/messenger/com

/decl/hierarchy/outfit/job/sierra/crew/command/XO
	name = OUTFIT_JOB_NAME("Executive Officer")
	uniform = /obj/item/clothing/under/solgov/utility/expeditionary/officer/command
	l_ear = /obj/item/device/radio/headset/heads/sierraxo
	shoes = /obj/item/clothing/shoes/dutyboots
	id_type = /obj/item/weapon/card/id/sierra/silver
	pda_type = /obj/item/modular_computer/pda/heads/hop

/decl/hierarchy/outfit/job/sierra/crew/command/XO/fleet
	name = OUTFIT_JOB_NAME("Executive Officer - Fleet")
	uniform = /obj/item/clothing/under/solgov/utility/fleet/command
	shoes = /obj/item/clothing/shoes/dutyboots

/decl/hierarchy/outfit/job/sierra/passenger/research/rd
	name = OUTFIT_JOB_NAME("Research Director - sierra")
	l_ear = /obj/item/device/radio/headset/heads/sierrantcommand
	uniform = /obj/item/clothing/under/rank/research_director
	suit = /obj/item/clothing/suit/storage/toggle/labcoat/science
	shoes = /obj/item/clothing/shoes/brown
	id_type = /obj/item/weapon/card/id/sierra/silver/research
	pda_type = /obj/item/modular_computer/pda/heads/rd

/decl/hierarchy/outfit/job/sierra/crew/command/cmo
	name = OUTFIT_JOB_NAME("Chief Medical Officer - sierra")
	l_ear  =/obj/item/device/radio/headset/heads/cmo
	uniform = /obj/item/clothing/under/solgov/utility/expeditionary/officer/medical
	shoes = /obj/item/clothing/shoes/dutyboots
	id_type = /obj/item/weapon/card/id/sierra/silver/medical
	pda_type = /obj/item/modular_computer/pda/heads/cmo
	pda_slot = slot_l_store

/decl/hierarchy/outfit/job/sierra/crew/command/cmo/New()
	..()
	BACKPACK_OVERRIDE_MEDICAL

/decl/hierarchy/outfit/job/sierra/crew/command/cmo/fleet
	name = OUTFIT_JOB_NAME("Chief Medical Officer - Fleet")
	uniform = /obj/item/clothing/under/solgov/utility/fleet/medical
	shoes = /obj/item/clothing/shoes/dutyboots

/decl/hierarchy/outfit/job/sierra/crew/command/chief_engineer
	name = OUTFIT_JOB_NAME("Chief Engineer - sierra")
	uniform = /obj/item/clothing/under/solgov/utility/expeditionary/officer/engineering
	shoes = /obj/item/clothing/shoes/dutyboots
	l_ear = /obj/item/device/radio/headset/heads/ce
	id_type = /obj/item/weapon/card/id/sierra/silver/engineering
	pda_type = /obj/item/modular_computer/pda/heads/ce
	pda_slot = slot_l_store
	flags = OUTFIT_HAS_BACKPACK|OUTFIT_EXTENDED_SURVIVAL

/decl/hierarchy/outfit/job/sierra/crew/command/cos/New()
	..()
	BACKPACK_OVERRIDE_ENGINEERING

/decl/hierarchy/outfit/job/sierra/crew/command/chief_engineer/fleet
	name = OUTFIT_JOB_NAME("Chief Engineer - Fleet")
	uniform = /obj/item/clothing/under/solgov/utility/fleet/engineering
	shoes = /obj/item/clothing/shoes/dutyboots

/decl/hierarchy/outfit/job/sierra/crew/command/cos
	name = OUTFIT_JOB_NAME("Chief of Security")
	l_ear = /obj/item/device/radio/headset/heads/cos
	uniform = /obj/item/clothing/under/solgov/utility/expeditionary/officer/security
	shoes = /obj/item/clothing/shoes/dutyboots
	id_type = /obj/item/weapon/card/id/sierra/silver/security
	pda_type = /obj/item/modular_computer/pda/heads/hos

/decl/hierarchy/outfit/job/sierra/crew/command/cos/New()
	..()
	BACKPACK_OVERRIDE_SECURITY

/decl/hierarchy/outfit/job/sierra/crew/command/cos/fleet
	name = OUTFIT_JOB_NAME("Chief of Security - Fleet")
	uniform = /obj/item/clothing/under/solgov/utility/fleet/combat/security
	shoes = /obj/item/clothing/shoes/dutyboots

/decl/hierarchy/outfit/job/sierra/passenger/research/cl
	name = OUTFIT_JOB_NAME("NanoTrasen Liaison")
	l_ear = /obj/item/device/radio/headset/heads/sierrantcommand
	uniform = /obj/item/clothing/under/suit_jacket/nt
	suit = /obj/item/clothing/suit/storage/toggle/suit/black
	shoes = /obj/item/clothing/shoes/laceup
	id_type = /obj/item/weapon/card/id/sierra/passenger/research/liaison
	pda_type = /obj/item/modular_computer/pda/heads/paperpusher
	backpack_contents = list(/obj/item/clothing/accessory/badge/nanotrasen = 1)

/decl/hierarchy/outfit/job/sierra/crew/representative
	name = OUTFIT_JOB_NAME("SolGov Representative")
	l_ear = /obj/item/device/radio/headset/headset_com
	uniform = /obj/item/clothing/under/rank/internalaffairs/plain/solgov
	suit = /obj/item/clothing/suit/storage/toggle/suit/black
	shoes = /obj/item/clothing/shoes/laceup
	id_type = /obj/item/weapon/card/id/sierra/crew/representative
	pda_type = /obj/item/modular_computer/pda/heads/paperpusher
	backpack_contents = list(/obj/item/clothing/accessory/badge/solgov/representative = 1)

/decl/hierarchy/outfit/job/sierra/crew/command/sea/fleet
	name = OUTFIT_JOB_NAME("Senior Enlisted Advisor - Fleet")
	uniform = /obj/item/clothing/under/solgov/utility/fleet/command
	shoes = /obj/item/clothing/shoes/dutyboots
	l_ear = /obj/item/device/radio/headset/heads/sierraxo
	id_type = /obj/item/weapon/card/id/sierra/crew/sea
	pda_type = /obj/item/modular_computer/pda/heads

/decl/hierarchy/outfit/job/sierra/crew/command/bridgeofficer
	name = OUTFIT_JOB_NAME("Bridge Officer")
	uniform = /obj/item/clothing/under/solgov/utility/expeditionary/officer/command
	shoes = /obj/item/clothing/shoes/dutyboots
	id_type = /obj/item/weapon/card/id/sierra/crew/bridgeofficer
	pda_type = /obj/item/modular_computer/pda/heads
	l_ear = /obj/item/device/radio/headset/bridgeofficer

/decl/hierarchy/outfit/job/sierra/crew/command/bridgeofficer/fleet
	name = OUTFIT_JOB_NAME("Bridge Officer - Fleet")
	uniform = /obj/item/clothing/under/solgov/utility/fleet/command
	shoes = /obj/item/clothing/shoes/dutyboots

//Engineering Outfits

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
	uniform = /obj/item/clothing/under/solgov/utility/expeditionary/engineering
	shoes = /obj/item/clothing/shoes/dutyboots
	id_type = /obj/item/weapon/card/id/sierra/crew/engineering/senior
	pda_type = /obj/item/modular_computer/pda/heads/ce

/decl/hierarchy/outfit/job/sierra/crew/engineering/senior_engineer/fleet
	name = OUTFIT_JOB_NAME("Senior Engineer - Fleet")
	uniform = /obj/item/clothing/under/solgov/utility/fleet/engineering
	shoes = /obj/item/clothing/shoes/dutyboots

/decl/hierarchy/outfit/job/sierra/crew/engineering/engineer
	name = OUTFIT_JOB_NAME("Engineer - sierra")
	uniform = /obj/item/clothing/under/solgov/utility/expeditionary/engineering
	shoes = /obj/item/clothing/shoes/dutyboots
	id_type = /obj/item/weapon/card/id/sierra/crew/engineering
	pda_type = /obj/item/modular_computer/pda/engineering

/decl/hierarchy/outfit/job/sierra/crew/engineering/engineer/fleet
	name = OUTFIT_JOB_NAME("Engineer - Fleet")
	uniform = /obj/item/clothing/under/solgov/utility/fleet/engineering
	shoes = /obj/item/clothing/shoes/dutyboots

/decl/hierarchy/outfit/job/sierra/crew/engineering/contractor
	name = OUTFIT_JOB_NAME("Engineering Assistant")
	uniform = /obj/item/clothing/under/rank/engineer
	shoes = /obj/item/clothing/shoes/workboots
	id_type = /obj/item/weapon/card/id/sierra/contractor/engineering
	pda_type = /obj/item/modular_computer/pda/engineering

/decl/hierarchy/outfit/job/sierra/crew/engineering/roboticist
	name = OUTFIT_JOB_NAME("Roboticist - sierra")
	uniform = /obj/item/clothing/under/rank/roboticist
	shoes = /obj/item/clothing/shoes/black
	l_ear = /obj/item/device/radio/headset/sierraroboticist
	id_type = /obj/item/weapon/card/id/sierra/contractor/engineering/roboticist
	pda_type = /obj/item/modular_computer/pda/roboticist

//Security Outfits

/decl/hierarchy/outfit/job/sierra/crew/security
	hierarchy_type = /decl/hierarchy/outfit/job/sierra/crew/security
	l_ear = /obj/item/device/radio/headset/headset_sec
	pda_slot = slot_l_store

/decl/hierarchy/outfit/job/sierra/crew/security/New()
	..()
	BACKPACK_OVERRIDE_SECURITY

/decl/hierarchy/outfit/job/sierra/crew/security/brig_officer
	name = OUTFIT_JOB_NAME("Brig Officer")
	uniform = /obj/item/clothing/under/solgov/utility/expeditionary/security
	shoes = /obj/item/clothing/shoes/dutyboots
	id_type = /obj/item/weapon/card/id/sierra/crew/security/brigofficer
	pda_type = /obj/item/modular_computer/pda/security

/decl/hierarchy/outfit/job/sierra/crew/security/brig_officer/fleet
	name = OUTFIT_JOB_NAME("Brig Officer - Fleet")
	uniform = /obj/item/clothing/under/solgov/utility/fleet/combat/security
	shoes = /obj/item/clothing/shoes/dutyboots

/decl/hierarchy/outfit/job/sierra/crew/security/forensic_tech
	name = OUTFIT_JOB_NAME("Forensic Technician - sierra")
	uniform = /obj/item/clothing/under/solgov/utility/expeditionary/security
	shoes = /obj/item/clothing/shoes/dutyboots
	id_type = /obj/item/weapon/card/id/sierra/crew/security/forensic
	pda_type = /obj/item/modular_computer/pda/forensics

/decl/hierarchy/outfit/job/sierra/crew/security/forensic_tech/contractor
	name = OUTFIT_JOB_NAME("Forensic Technician - Contractor")
	head = /obj/item/clothing/head/det
	uniform = /obj/item/clothing/under/det
	suit = /obj/item/clothing/suit/storage/det_trench/ft
	shoes = /obj/item/clothing/shoes/laceup
	backpack_contents = list(/obj/item/clothing/accessory/badge/PI = 1)

/decl/hierarchy/outfit/job/sierra/crew/security/forensic_tech/fleet
	name = OUTFIT_JOB_NAME("Forensic Technician - Fleet")
	uniform = /obj/item/clothing/under/solgov/utility/fleet/combat/security
	shoes = /obj/item/clothing/shoes/dutyboots

/decl/hierarchy/outfit/job/sierra/crew/security/forensic_tech/marshal
	name = OUTFIT_JOB_NAME("Forensic Technician - Colonial Marshal")
	uniform = /obj/item/clothing/under/det/grey
<<<<<<< HEAD
	suit = /obj/item/clothing/suit/storage/toggle/marshal_jacket
=======
	suit = /obj/item/clothing/suit/storage/toggle/agent_jacket
>>>>>>> 1d134c975d63c37d3b2ab5d2b4874f33d3794904
	shoes = /obj/item/clothing/shoes/dress

/decl/hierarchy/outfit/job/sierra/crew/security/maa
	name = OUTFIT_JOB_NAME("Master at Arms")
	uniform = /obj/item/clothing/under/solgov/utility/expeditionary/security
	shoes = /obj/item/clothing/shoes/dutyboots
	id_type = /obj/item/weapon/card/id/sierra/crew/security
	pda_type = /obj/item/modular_computer/pda/security

/decl/hierarchy/outfit/job/sierra/crew/security/maa/fleet
	name = OUTFIT_JOB_NAME("Master at Arms - Fleet")
	uniform = /obj/item/clothing/under/solgov/utility/fleet/combat/security
	shoes = /obj/item/clothing/shoes/dutyboots

//Medical Outfits

/decl/hierarchy/outfit/job/sierra/crew/medical
	hierarchy_type = /decl/hierarchy/outfit/job/sierra/crew/medical
	l_ear = /obj/item/device/radio/headset/headset_med
	pda_type = /obj/item/modular_computer/pda/medical
	pda_slot = slot_l_store

/decl/hierarchy/outfit/job/sierra/crew/medical/New()
	..()
	BACKPACK_OVERRIDE_MEDICAL

/decl/hierarchy/outfit/job/sierra/crew/medical/senior
	name = OUTFIT_JOB_NAME("Physician")
	uniform = /obj/item/clothing/under/solgov/utility/expeditionary/officer/medical
	shoes = /obj/item/clothing/shoes/dutyboots
	id_type = /obj/item/weapon/card/id/sierra/crew/medical/senior

/decl/hierarchy/outfit/job/sierra/crew/medical/senior/fleet
	name = OUTFIT_JOB_NAME("Physician - Fleet")
	uniform = /obj/item/clothing/under/solgov/utility/fleet/medical
	shoes = /obj/item/clothing/shoes/dutyboots

/decl/hierarchy/outfit/job/sierra/crew/medical/doctor
	name = OUTFIT_JOB_NAME("Corpsman")
	uniform = /obj/item/clothing/under/solgov/utility/expeditionary/medical
	shoes = /obj/item/clothing/shoes/dutyboots
	id_type = /obj/item/weapon/card/id/sierra/crew/medical
	l_ear = /obj/item/device/radio/headset/headset_corpsman

/decl/hierarchy/outfit/job/sierra/crew/medical/doctor/fleet
	name = OUTFIT_JOB_NAME("Corpsman - Fleet")
	uniform = /obj/item/clothing/under/solgov/utility/fleet/medical
	shoes = /obj/item/clothing/shoes/dutyboots
	l_ear = /obj/item/device/radio/headset/headset_corpsman

/decl/hierarchy/outfit/job/sierra/crew/medical/doctor/medic
	name = OUTFIT_JOB_NAME("Corpsman - Medic")
	uniform = /obj/item/clothing/under/solgov/utility/fleet/combat/medical
	shoes = /obj/item/clothing/shoes/dutyboots
	l_ear = /obj/item/device/radio/headset/headset_corpsman

/decl/hierarchy/outfit/job/sierra/crew/medical/contractor
	name = OUTFIT_JOB_NAME("Medical Contractor")
	uniform = /obj/item/clothing/under/rank/medical
	shoes = /obj/item/clothing/shoes/white
	id_type = /obj/item/weapon/card/id/sierra/contractor/medical

/decl/hierarchy/outfit/job/sierra/crew/medical/contractor/orderly
	name = OUTFIT_JOB_NAME("Orderly")
	uniform = /obj/item/clothing/under/rank/orderly

/decl/hierarchy/outfit/job/sierra/crew/medical/contractor/resident
	name = OUTFIT_JOB_NAME("Medical Resident")
	uniform = /obj/item/clothing/under/color/white

/decl/hierarchy/outfit/job/sierra/crew/medical/contractor/xenosurgeon
	name = OUTFIT_JOB_NAME("Xenosurgeon")
	uniform = /obj/item/clothing/under/rank/medical/scrubs/purple

/decl/hierarchy/outfit/job/sierra/crew/medical/contractor/mortus
	name = OUTFIT_JOB_NAME("Mortician")
	uniform = /obj/item/clothing/under/rank/medical/scrubs/black

/decl/hierarchy/outfit/job/sierra/crew/medical/contractor/virologist
	name = OUTFIT_JOB_NAME("Virologist - sierra")
	uniform = /obj/item/clothing/under/rank/virologist

/decl/hierarchy/outfit/job/sierra/crew/medical/contractor/virologist/New()
	..()
	BACKPACK_OVERRIDE_VIROLOGY

/decl/hierarchy/outfit/job/sierra/crew/medical/contractor/paramedic
	name = OUTFIT_JOB_NAME("Paramedic - sierra")
	uniform = /obj/item/clothing/under/rank/medical/paramedic
	suit = /obj/item/clothing/suit/storage/toggle/fr_jacket
	shoes = /obj/item/clothing/shoes/jackboots
	l_hand = /obj/item/weapon/storage/firstaid/adv
	belt = /obj/item/weapon/storage/belt/medical/emt
	flags = OUTFIT_HAS_BACKPACK|OUTFIT_EXTENDED_SURVIVAL

/decl/hierarchy/outfit/job/sierra/crew/medical/contractor/chemist
	name = OUTFIT_JOB_NAME("Chemist - sierra")
	uniform = /obj/item/clothing/under/rank/chemist
	shoes = /obj/item/clothing/shoes/white
	pda_type = /obj/item/modular_computer/pda/chemistry
	id_type = /obj/item/weapon/card/id/sierra/contractor/chemist

/decl/hierarchy/outfit/job/sierra/crew/medical/contractor/chemist/New()
	..()
	BACKPACK_OVERRIDE_CHEMISTRY

/decl/hierarchy/outfit/job/sierra/crew/medical/counselor
	name = OUTFIT_JOB_NAME("Counselor")
	uniform = /obj/item/clothing/under/rank/psych/turtleneck
	shoes = /obj/item/clothing/shoes/white
	id_type = /obj/item/weapon/card/id/sierra/contractor/medical/counselor

/decl/hierarchy/outfit/job/sierra/crew/medical/counselor/psychiatrist
	name = OUTFIT_JOB_NAME("Psychiatrist - sierra")
	uniform = /obj/item/clothing/under/rank/psych

/decl/hierarchy/outfit/job/sierra/crew/medical/counselor/chaplain
	name = OUTFIT_JOB_NAME("Chaplain - sierra")
	uniform = /obj/item/clothing/under/rank/chaplain
	l_hand = /obj/item/weapon/storage/bible

/decl/hierarchy/outfit/job/sierra/crew/medical/counselor/ec
	name = OUTFIT_JOB_NAME("Counselor - Expeditionary Corps")
	uniform = /obj/item/clothing/under/solgov/utility/expeditionary/officer/medical
	shoes = /obj/item/clothing/shoes/dutyboots

/decl/hierarchy/outfit/job/sierra/crew/medical/counselor/fleet
	name = OUTFIT_JOB_NAME("Counselor - Fleet")
	uniform = /obj/item/clothing/under/solgov/utility/fleet/medical
	shoes = /obj/item/clothing/shoes/dutyboots

//Supply Outfits

/decl/hierarchy/outfit/job/sierra/crew/supply
	l_ear = /obj/item/device/radio/headset/headset_cargo
	hierarchy_type = /decl/hierarchy/outfit/job/sierra/crew/supply

/decl/hierarchy/outfit/job/sierra/crew/supply/New()
	..()
	BACKPACK_OVERRIDE_ENGINEERING

/decl/hierarchy/outfit/job/sierra/crew/supply/deckofficer
	name = OUTFIT_JOB_NAME("Deck Officer")
	l_ear = /obj/item/device/radio/headset/headset_deckofficer
	uniform = /obj/item/clothing/under/solgov/utility/expeditionary/supply
	shoes = /obj/item/clothing/shoes/dutyboots
	id_type = /obj/item/weapon/card/id/sierra/crew/supply/deckofficer
	pda_type = /obj/item/modular_computer/pda/cargo

/decl/hierarchy/outfit/job/sierra/crew/supply/deckofficer/commissioned
	name = OUTFIT_JOB_NAME("Deck Officer - EC Officer")
	uniform = /obj/item/clothing/under/solgov/utility/expeditionary/officer/supply

/decl/hierarchy/outfit/job/sierra/crew/supply/deckofficer/fleet
	name = OUTFIT_JOB_NAME("Deck Officer - Fleet")
	uniform = /obj/item/clothing/under/solgov/utility/fleet/supply
	shoes = /obj/item/clothing/shoes/dutyboots

/decl/hierarchy/outfit/job/sierra/crew/supply/tech
	name = OUTFIT_JOB_NAME("Deck Technician")
	uniform = /obj/item/clothing/under/solgov/utility/expeditionary/supply
	shoes = /obj/item/clothing/shoes/dutyboots
	id_type = /obj/item/weapon/card/id/sierra/crew/supply
	pda_type = /obj/item/modular_computer/pda/cargo

/decl/hierarchy/outfit/job/sierra/crew/supply/tech/fleet
	name = OUTFIT_JOB_NAME("Deck Technician - Fleet")
	uniform = /obj/item/clothing/under/solgov/utility/fleet/supply
	shoes = /obj/item/clothing/shoes/dutyboots

/decl/hierarchy/outfit/job/sierra/crew/supply/contractor
	name = OUTFIT_JOB_NAME("Supply Assistant")
	uniform = /obj/item/clothing/under/rank/cargotech
	shoes = /obj/item/clothing/shoes/brown
	id_type = /obj/item/weapon/card/id/sierra/contractor/supply
	pda_type = /obj/item/modular_computer/pda/cargo


//Service Outfits

/decl/hierarchy/outfit/job/sierra/crew/service
	l_ear = /obj/item/device/radio/headset/headset_service
	hierarchy_type = /decl/hierarchy/outfit/job/sierra/crew/service

/decl/hierarchy/outfit/job/sierra/crew/service/janitor
	name = OUTFIT_JOB_NAME("Sanitation Technician - sierra")
	uniform = /obj/item/clothing/under/rank/janitor
	shoes = /obj/item/clothing/shoes/black
	id_type = /obj/item/weapon/card/id/sierra/crew/service/janitor
	pda_type = /obj/item/modular_computer/pda

/decl/hierarchy/outfit/job/sierra/crew/service/janitor/ec
	name = OUTFIT_JOB_NAME("Sanitation Technician - Expeditionary Corps")
	uniform = /obj/item/clothing/under/solgov/utility/expeditionary/service
	shoes = /obj/item/clothing/shoes/dutyboots
	id_type = /obj/item/weapon/card/id/sierra/crew/service/janitor
	pda_type = /obj/item/modular_computer/pda

/decl/hierarchy/outfit/job/sierra/crew/service/janitor/fleet
	name = OUTFIT_JOB_NAME("Sanitation Technician - Fleet")
	uniform = /obj/item/clothing/under/solgov/utility/fleet/service
	shoes = /obj/item/clothing/shoes/dutyboots

/decl/hierarchy/outfit/job/sierra/crew/service/cook
	name = OUTFIT_JOB_NAME("Cook - sierra")
	uniform = /obj/item/clothing/under/rank/chef
	shoes = /obj/item/clothing/shoes/black
	id_type = /obj/item/weapon/card/id/sierra/crew/service/chef
	pda_type = /obj/item/modular_computer/pda

/decl/hierarchy/outfit/job/sierra/crew/service/cook/ec
	name = OUTFIT_JOB_NAME("Cook - Expeditionary Corps")
	uniform = /obj/item/clothing/under/solgov/utility/expeditionary/service
	shoes = /obj/item/clothing/shoes/dutyboots
	id_type = /obj/item/weapon/card/id/sierra/crew/service/chef
	pda_type = /obj/item/modular_computer/pda

/decl/hierarchy/outfit/job/sierra/crew/service/cook/fleet
	name = OUTFIT_JOB_NAME("Cook - Fleet")
	uniform = /obj/item/clothing/under/solgov/utility/fleet/service
	shoes = /obj/item/clothing/shoes/dutyboots

/decl/hierarchy/outfit/job/sierra/crew/service/bartender
	name = OUTFIT_JOB_NAME("Bartender - sierra")
	uniform = /obj/item/clothing/under/rank/bartender
	shoes = /obj/item/clothing/shoes/laceup
	id_type = /obj/item/weapon/card/id/sierra/contractor/service/bartender
	l_pocket = /obj/item/device/cassette/custom
	pda_type = /obj/item/modular_computer/pda

/decl/hierarchy/outfit/job/sierra/crew/service/crewman
	name = OUTFIT_JOB_NAME("Crewman")
	uniform = /obj/item/clothing/under/solgov/utility/expeditionary
	shoes = /obj/item/clothing/shoes/dutyboots
	id_type = /obj/item/weapon/card/id/sierra/crew
	pda_type = /obj/item/modular_computer/pda

/decl/hierarchy/outfit/job/sierra/crew/service/crewman/fleet
	name = OUTFIT_JOB_NAME("Crewman - Fleet")
	uniform = /obj/item/clothing/under/solgov/utility/fleet
	shoes = /obj/item/clothing/shoes/dutyboots

//Exploration Outfits
/decl/hierarchy/outfit/job/sierra/crew/exploration/New()
	..()
	backpack_overrides[/decl/backpack_outfit/backpack]      = /obj/item/weapon/storage/backpack/explorer
	backpack_overrides[/decl/backpack_outfit/satchel]       = /obj/item/weapon/storage/backpack/satchel_explorer
	backpack_overrides[/decl/backpack_outfit/messenger_bag] = /obj/item/weapon/storage/backpack/messenger/explorer

/decl/hierarchy/outfit/job/sierra/crew/exploration/pathfinder
	name = OUTFIT_JOB_NAME("Pathfinder")
	uniform = /obj/item/clothing/under/solgov/utility/expeditionary/officer/exploration
	shoes = /obj/item/clothing/shoes/dutyboots
	id_type = /obj/item/weapon/card/id/sierra/crew/pathfinder
	pda_type = /obj/item/modular_computer/pda/explorer
	l_ear = /obj/item/device/radio/headset/pathfinder

/decl/hierarchy/outfit/job/sierra/crew/exploration/explorer
	name = OUTFIT_JOB_NAME("Explorer")
	uniform = /obj/item/clothing/under/solgov/utility/expeditionary/exploration
	shoes = /obj/item/clothing/shoes/dutyboots
	id_type = /obj/item/weapon/card/id/sierra/crew/explorer
	pda_type = /obj/item/modular_computer/pda/explorer
	l_ear = /obj/item/device/radio/headset/exploration

//Passenger Outfits

/decl/hierarchy/outfit/job/sierra/passenger/research
	hierarchy_type = /decl/hierarchy/outfit/job/sierra/passenger/research
	l_ear = /obj/item/device/radio/headset/sierrananotrasen

/decl/hierarchy/outfit/job/sierra/passenger/research/senior_scientist
	name = OUTFIT_JOB_NAME("Senior Researcher")
	uniform = /obj/item/clothing/under/rank/scientist/executive
	suit = /obj/item/clothing/suit/storage/toggle/labcoat/science
	shoes = /obj/item/clothing/shoes/white
	pda_type = /obj/item/modular_computer/pda/heads/rd
	id_type = /obj/item/weapon/card/id/sierra/passenger/research/senior_scientist

/decl/hierarchy/outfit/job/sierra/passenger/research/senior_scientist/New()
	..()
	BACKPACK_OVERRIDE_RESEARCH

/decl/hierarchy/outfit/job/sierra/passenger/research/nt_pilot //pending better uniform
	name = OUTFIT_JOB_NAME("NanoTrasen Pilot")
	uniform = /obj/item/clothing/under/rank/ntpilot
	suit = /obj/item/clothing/suit/storage/toggle/brown_jacket/nanotrasen
	shoes = /obj/item/clothing/shoes/workboots
	id_type = /obj/item/weapon/card/id/sierra/passenger/research/nt_pilot
	l_ear = /obj/item/device/radio/headset/headset_pilot/

/decl/hierarchy/outfit/job/sierra/passenger/research/scientist
	name = OUTFIT_JOB_NAME("Scientist - sierra")
	uniform = /obj/item/clothing/under/rank/scientist
	shoes = /obj/item/clothing/shoes/white
	pda_type = /obj/item/modular_computer/pda/science
	id_type = /obj/item/weapon/card/id/sierra/passenger/research/scientist

/decl/hierarchy/outfit/job/sierra/passenger/research/scientist/New()
	..()
	BACKPACK_OVERRIDE_RESEARCH

/decl/hierarchy/outfit/job/sierra/passenger/research/scientist/psych
	name = OUTFIT_JOB_NAME("Psychologist - sierra")
	uniform = /obj/item/clothing/under/rank/psych

/decl/hierarchy/outfit/job/sierra/passenger/research/prospector
	name = OUTFIT_JOB_NAME("Prospector")
	uniform = /obj/item/clothing/under/rank/ntwork
	shoes = /obj/item/clothing/shoes/workboots
	id_type = /obj/item/weapon/card/id/sierra/passenger/research/mining
	pda_type = /obj/item/modular_computer/pda/science
	flags = OUTFIT_HAS_BACKPACK|OUTFIT_EXTENDED_SURVIVAL
	l_ear = /obj/item/device/radio/headset/headset_mining

/decl/hierarchy/outfit/job/sierra/passenger/research/prospector/New()
	..()
	BACKPACK_OVERRIDE_ENGINEERING

/decl/hierarchy/outfit/job/sierra/passenger/research/guard
	name = OUTFIT_JOB_NAME("Security Guard")
	uniform = /obj/item/clothing/under/rank/guard
	shoes = /obj/item/clothing/shoes/jackboots
	id_type = /obj/item/weapon/card/id/sierra/passenger/research/guard
	pda_type = /obj/item/modular_computer/pda/security

/decl/hierarchy/outfit/job/sierra/passenger/research/guard/New()
	..()
	BACKPACK_OVERRIDE_SECURITY

/decl/hierarchy/outfit/job/sierra/passenger/research/assist
	name = OUTFIT_JOB_NAME("Research Assistant - sierra")
	uniform = /obj/item/clothing/under/rank/scientist
	shoes = /obj/item/clothing/shoes/white
	pda_type = /obj/item/modular_computer/pda/science
	id_type = /obj/item/weapon/card/id/sierra/passenger/research

/decl/hierarchy/outfit/job/sierra/passenger/research/assist/janitor
	name = OUTFIT_JOB_NAME("Custodian - sierra")
	uniform = /obj/item/clothing/under/rank/janitor

/decl/hierarchy/outfit/job/sierra/passenger/research/assist/testsubject
	name = OUTFIT_JOB_NAME("Testing Assistant")
	uniform = /obj/item/clothing/under/rank/ntwork

/decl/hierarchy/outfit/job/sierra/passenger/passenger
	name = OUTFIT_JOB_NAME("Passenger - sierra")
	uniform = /obj/item/clothing/under/color/grey
	l_ear = /obj/item/device/radio/headset
	shoes = /obj/item/clothing/shoes/black
	pda_type = /obj/item/modular_computer/pda
	id_type = /obj/item/weapon/card/id/sierra/passenger

/decl/hierarchy/outfit/job/sierra/passenger/passenger/journalist
	name = OUTFIT_JOB_NAME("Journalist - sierra")
	backpack_contents = list(/obj/item/device/tvcamera = 1,
	/obj/item/clothing/accessory/badge/press = 1)

/decl/hierarchy/outfit/job/sierra/passenger/passenger/investor
	name = OUTFIT_JOB_NAME("Investor - sierra")

/decl/hierarchy/outfit/job/sierra/passenger/passenger/investor/post_equip(var/mob/living/carbon/human/H)
	..()
	var/obj/item/weapon/storage/secure/briefcase/money/case = new(H.loc)
	H.put_in_hands(case)

/decl/hierarchy/outfit/job/sierra/merchant
	name = OUTFIT_JOB_NAME("Merchant - sierra")
	uniform = /obj/item/clothing/under/color/black
	l_ear = null
	shoes = /obj/item/clothing/shoes/black
	pda_type = /obj/item/modular_computer/pda
	id_type = /obj/item/weapon/card/id/sierra/merchant

/decl/hierarchy/outfit/job/sierra/stowaway
	name = OUTFIT_JOB_NAME("Stowaway - sierra")
	id_type = null
	pda_type = null
	l_ear = null
	l_pocket = /obj/item/weapon/wrench
	r_pocket = /obj/item/weapon/crowbar/prybar

/decl/hierarchy/outfit/job/sierra/stowaway/post_equip(var/mob/living/carbon/human/H)
	..()
	var/obj/item/weapon/card/id/sierra/stowaway/ID = new(H.loc)
	H.put_in_hands(ID)
