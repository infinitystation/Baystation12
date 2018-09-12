/datum/gear/accessory/solawardmajor
	display_name = "SolGov major award selection"
	description = "A medal or ribbon awarded to SolGov personnel for significant accomplishments."
	path = /obj/item/clothing/accessory
	cost = 8
	allowed_roles = /datum/job/assistant

/datum/gear/accessory/solawardmajor/New()
	..()
	var/solmajors = list()
	solmajors["iron star"] = /obj/item/clothing/accessory/medal/solgov/iron/star
	solmajors["bronze heart"] = /obj/item/clothing/accessory/medal/solgov/bronze/heart
	solmajors["silver sword"] = /obj/item/clothing/accessory/medal/solgov/silver/sword
	solmajors["medical heart"] = /obj/item/clothing/accessory/medal/solgov/heart
	solmajors["valor medal"] = /obj/item/clothing/accessory/medal/solgov/silver/sol
	solmajors["sapienterian medal"] = /obj/item/clothing/accessory/medal/solgov/gold/sol
	solmajors["peacekeeper ribbon"] = /obj/item/clothing/accessory/ribbon/solgov/peace
	solmajors["marksman ribbon"] = /obj/item/clothing/accessory/ribbon/solgov/marksman
	gear_tweaks += new/datum/gear_tweak/path(solmajors)

/datum/gear/accessory/solawardminor
	display_name = "SolGov minor award selection"
	description = "A medal or ribbon awarded to SolGov personnel for minor accomplishments."
	path = /obj/item/clothing/accessory
	cost = 5
	allowed_roles = /datum/job/assistant

/datum/gear/accessory/solawardminor/New()
	..()
	var/solminors = list()
	solminors["expeditionary medal"] = /obj/item/clothing/accessory/medal/solgov/iron/sol
	solminors["operations medal"] = /obj/item/clothing/accessory/medal/solgov/bronze/sol
	solminors["frontier ribbon"] = /obj/item/clothing/accessory/ribbon/solgov/frontier
	solminors["instructor ribbon"] = /obj/item/clothing/accessory/ribbon/solgov/instructor
	gear_tweaks += new/datum/gear_tweak/path(solminors)

/datum/gear/accessory/tags
	display_name = "dog tags"
	path = /obj/item/clothing/accessory/badge/tags

/datum/gear/accessory/pilot_pin
	display_name = "pilot's qualification pin"
	path = /obj/item/clothing/accessory/solgov/speciality/pilot
	allowed_roles = list(/datum/job/captain, /datum/job/hop, /datum/job/adjutant, /datum/job/exploration_leader)

/datum/gear/accessory/armband_security
	allowed_roles = SECURITY_ROLES

/datum/gear/accessory/armband_cargo
	allowed_roles = SUPPLY_ROLES

/datum/gear/accessory/armband_medical
	allowed_roles = MEDICAL_ROLES

/datum/gear/accessory/armband_emt
	allowed_roles = list(/datum/job/doctor, /datum/job/doctor_trainee, /datum/job/explorer_medic)

/datum/gear/accessory/armband_engineering
	allowed_roles = ENGINEERING_ROLES

/datum/gear/accessory/armband_hydro
	allowed_roles = list(/datum/job/rd, /datum/job/scientist, /datum/job/scientist_assistant, /datum/job/assistant)

/datum/gear/accessory/armband_nt

/datum/gear/accessory/ntaward
	allowed_roles = NANOTRASEN_ROLES

/datum/gear/accessory/ntaward_sci
	allowed_roles = NANOTRASEN_ROLES

/datum/gear/accessory/tie

/datum/gear/accessory/tie_color

/datum/gear/accessory/stethoscope
	allowed_roles = STERILE_ROLES

/datum/gear/storage/brown_vest
	allowed_roles = list(/datum/job/chief_engineer, /datum/job/senior_engineer, /datum/job/engineer, /datum/job/engineer_trainee, /datum/job/explorer_engineer, /datum/job/roboticist, /datum/job/qm, /datum/job/cargo_tech,
						/datum/job/cargo_assistant, /datum/job/mining, /datum/job/janitor, /datum/job/scientist_assistant, /datum/job/merchant, /datum/job/nt_pilot)

/datum/gear/storage/black_vest
	allowed_roles = list(/datum/job/hos, /datum/job/warden, /datum/job/detective, /datum/job/officer, /datum/job/merchant)

/datum/gear/storage/white_vest
	allowed_roles = list(/datum/job/cmo, /datum/job/senior_doctor, /datum/job/doctor, /datum/job/doctor_trainee, /datum/job/explorer_medic, /datum/job/roboticist, /datum/job/merchant)

/datum/gear/storage/brown_drop_pouches
	allowed_roles = list(/datum/job/chief_engineer, /datum/job/senior_engineer, /datum/job/engineer, /datum/job/engineer_trainee, /datum/job/roboticist, /datum/job/qm, /datum/job/cargo_tech,
						/datum/job/cargo_assistant, /datum/job/mining, /datum/job/janitor, /datum/job/scientist_assistant, /datum/job/merchant)

/datum/gear/storage/black_drop_pouches
	allowed_roles = list(/datum/job/hos, /datum/job/warden, /datum/job/detective, /datum/job/officer, /datum/job/merchant)

/datum/gear/storage/white_drop_pouches
	allowed_roles = list(/datum/job/cmo, /datum/job/senior_doctor, /datum/job/doctor, /datum/job/doctor_trainee, /datum/job/explorer_medic, /datum/job/roboticist, /datum/job/merchant)

/datum/gear/clothing/hawaii

/datum/gear/clothing/scarf

/datum/gear/clothing/flannel

/datum/gear/clothing/vest

/datum/gear/clothing/suspenders

/datum/gear/clothing/wcoat

/datum/gear/clothing/zhongshan

/datum/gear/clothing/dashiki

/datum/gear/clothing/thawb

/datum/gear/clothing/sherwani

/datum/gear/clothing/qipao

/datum/gear/clothing/sweater

/datum/gear/clothing/tangzhuang

/datum/gear/accessory/bowtie

/datum/gear/accessory/talisman

/datum/gear/accessory/collar

/datum/gear/head/kittyears
	allowed_roles = RESTRICTED_ROLES

/datum/gear/accessory/ftupin
	allowed_roles = list(/datum/job/merchant, /datum/job/assistant)