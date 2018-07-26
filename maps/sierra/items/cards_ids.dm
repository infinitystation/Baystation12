//Sierra ID Cards (they have to be here to make the outfits work, no way around it)

/obj/item/weapon/card/id/sierra
	name = "identification card"
	desc = "An identification card issued to personnel aboard the NES Sierra."
	icon_state = "id"
	item_state = "card-id"
	job_access_type = /datum/job/assistant

/obj/item/weapon/card/id/sierra/silver
	desc = "A silver identification card belonging to heads of staff."
	icon_state = "silver"
	item_state = "silver_id"
	job_access_type = /datum/job/hop

/obj/item/weapon/card/id/sierra/gold
	desc = "A golden identification card belonging to the Commanding Officer."
	icon_state = "gold"
	item_state = "gold_id"
	job_access_type = /datum/job/captain

/obj/item/weapon/card/id/sierra/captains_spare
	name = "commanding officer's spare ID"
	desc = "The skipper's spare ID."
	icon_state = "gold"
	item_state = "gold_id"
	registered_name = "Commanding Officer"
	assignment = "Commanding Officer"
/obj/item/weapon/card/id/sierra/captains_spare/New()
	access = get_all_station_access()
	..()


// SolGov Crew and Contractors
/obj/item/weapon/card/id/sierra/crew
	desc = "An identification card issued to SolGov crewmembers aboard the NES Sierra."
	icon_state = "solgov"
	job_access_type = /datum/job/crew


/obj/item/weapon/card/id/sierra/contractor
	desc = "An identification card issued to private contractors aboard the NES Sierra."
	icon_state = "civ"
	job_access_type = /datum/job/assistant


/obj/item/weapon/card/id/sierra/silver/medical
	job_access_type = /datum/job/cmo

/obj/item/weapon/card/id/sierra/crew/medical
	job_access_type = /datum/job/doctor

/obj/item/weapon/card/id/sierra/crew/medical/senior
	job_access_type = /datum/job/senior_doctor

/obj/item/weapon/card/id/sierra/contractor/medical
	job_access_type = /datum/job/doctor_contractor

/obj/item/weapon/card/id/sierra/contractor/chemist
	job_access_type = /datum/job/chemist

/obj/item/weapon/card/id/sierra/contractor/medical/counselor
	job_access_type = /datum/job/psychiatrist


/obj/item/weapon/card/id/sierra/silver/security
	job_access_type = /datum/job/hos

/obj/item/weapon/card/id/sierra/crew/security
	job_access_type = /datum/job/officer

/obj/item/weapon/card/id/sierra/crew/security/brigofficer
	job_access_type = /datum/job/warden

/obj/item/weapon/card/id/sierra/crew/security/forensic
	job_access_type = /datum/job/detective


/obj/item/weapon/card/id/sierra/silver/engineering
	job_access_type = /datum/job/chief_engineer

/obj/item/weapon/card/id/sierra/crew/engineering
	job_access_type = /datum/job/engineer

/obj/item/weapon/card/id/sierra/crew/engineering/senior
	job_access_type = /datum/job/senior_engineer

/obj/item/weapon/card/id/sierra/contractor/engineering
	job_access_type = /datum/job/engineer_contractor

/obj/item/weapon/card/id/sierra/contractor/engineering/roboticist
	job_access_type = /datum/job/roboticist


/obj/item/weapon/card/id/sierra/crew/supply/deckofficer
	job_access_type = /datum/job/qm

/obj/item/weapon/card/id/sierra/crew/supply
	job_access_type = /datum/job/cargo_tech

/obj/item/weapon/card/id/sierra/contractor/supply
	job_access_type = /datum/job/cargo_contractor


/obj/item/weapon/card/id/sierra/crew/service //unused
	job_access_type = /datum/job/assistant

/obj/item/weapon/card/id/sierra/crew/service/janitor
	job_access_type = /datum/job/janitor

/obj/item/weapon/card/id/sierra/crew/service/chef
	job_access_type = /datum/job/chef

/obj/item/weapon/card/id/sierra/contractor/service //unused
	job_access_type = /datum/job/assistant

/obj/item/weapon/card/id/sierra/contractor/service/bartender
	job_access_type = /datum/job/bartender


/obj/item/weapon/card/id/sierra/crew/representative
	job_access_type = /datum/job/representative

/obj/item/weapon/card/id/sierra/crew/sea
	job_access_type = /datum/job/sea

/obj/item/weapon/card/id/sierra/crew/bridgeofficer
	job_access_type = /datum/job/bridgeofficer

/obj/item/weapon/card/id/sierra/crew/pathfinder
	job_access_type = /datum/job/pathfinder

/obj/item/weapon/card/id/sierra/crew/explorer
	job_access_type = /datum/job/explorer

//NanoTrasen and Passengers

/obj/item/weapon/card/id/sierra/passenger
	desc = "A card issued to passengers and off-duty personnel aboard the NES Sierra."
	icon_state = "id"
	job_access_type = /datum/job/assistant

/obj/item/weapon/card/id/sierra/passenger/research
	desc = "A card issued to NanoTrasen personnel aboard the NES Sierra."
	icon_state = "corporate"
	job_access_type = /datum/job/scientist_assistant

/obj/item/weapon/card/id/sierra/silver/research
	job_access_type = /datum/job/rd

/obj/item/weapon/card/id/sierra/passenger/research/senior_scientist
	job_access_type = /datum/job/senior_scientist

/obj/item/weapon/card/id/sierra/passenger/research/nt_pilot
	job_access_type = /datum/job/nt_pilot

/obj/item/weapon/card/id/sierra/passenger/research/scientist
	job_access_type = /datum/job/scientist

/obj/item/weapon/card/id/sierra/passenger/research/mining
	job_access_type = /datum/job/mining

/obj/item/weapon/card/id/sierra/passenger/research/guard
	job_access_type = /datum/job/guard

/obj/item/weapon/card/id/sierra/passenger/research/liaison
	job_access_type = /datum/job/liaison


//Merchant
/obj/item/weapon/card/id/sierra/merchant
	desc = "An identification card issued to Merchants, indicating their right to sell and buy goods."
	icon_state = "trader"
	job_access_type = /datum/job/merchant

//Stowaway
/obj/item/weapon/card/id/sierra/stowaway
	desc = "An identification card issued to personnel aboard the NES Sierra. Looks like the photo fell off this one."
	icon_state = "id"
	job_access_type = /datum/job/crew

/obj/item/weapon/card/id/sierra/stowaway/New()
	..()
	var/species = SPECIES_HUMAN
	if(prob(10))
		species = pick(SPECIES_SKRELL,SPECIES_TAJARA,SPECIES_IPC)
	var/datum/species/S = all_species[species]
	var/gender = pick(MALE,FEMALE)
	registered_name = S.get_random_name(gender)
	sex = capitalize(gender)
	age = rand(19,25)
	fingerprint_hash = md5(registered_name)
	dna_hash = md5(fingerprint_hash)
	blood_type = RANDOM_BLOOD_TYPE
