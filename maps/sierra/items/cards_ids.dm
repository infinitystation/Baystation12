//Sierra ID Cards (they have to be here to make the outfits work, no way around it)

/obj/item/weapon/card/id/sierra
	name = "identification card"
	desc = "An identification card issued to personnel aboard the NSV Sierra."
	icon_state = "id"
	item_state = "card-id"
	job_access_type = /datum/job/assistant

/obj/item/weapon/card/id/sierra/silver
	desc = "A silver identification card belonging to heads of staff."
	icon_state = "silver"
	item_state = "silver_id"
	job_access_type = /datum/job/hop

/obj/item/weapon/card/id/sierra/gold
	desc = "A golden identification card belonging to the Captain."
	icon_state = "gold"
	item_state = "gold_id"
	job_access_type = /datum/job/captain

// SolGov Crew, NanoTrasen Personnel and Passengers
/obj/item/weapon/card/id/sierra/passenger
	desc = "An identification card issued to passengers aboard the NSV Sierra."
	icon_state = "id"
	job_access_type = /datum/job/assistant

/obj/item/weapon/card/id/sierra/crew
	desc = "An identification card issued to NanoTrasen crewmembers aboard the NSV Sierra."
	icon_state = "id"
	job_access_type = /datum/job/assistant

/obj/item/weapon/card/id/sierra/crew/medical
	desc = "An identification card issued to medical crewmembers aboard the NSV Sierra."
	icon_state = "med"
	job_access_type = /datum/job/doctor

/obj/item/weapon/card/id/sierra/silver/medical
	icon_state = "medGold"
	job_access_type = /datum/job/cmo

/obj/item/weapon/card/id/sierra/crew/medical/senior
	job_access_type = /datum/job/senior_doctor

/obj/item/weapon/card/id/sierra/crew/medical/trainee
	job_access_type = /datum/job/doctor_trainee

/obj/item/weapon/card/id/sierra/crew/medical/chemist
	job_access_type = /datum/job/chemist

/obj/item/weapon/card/id/sierra/crew/medical/counselor
	job_access_type = /datum/job/psychiatrist



/obj/item/weapon/card/id/sierra/silver/security
	icon_state = "secGold"
	job_access_type = /datum/job/hos

/obj/item/weapon/card/id/sierra/crew/security
	desc = "An identification card issued to asset protection depatment's personnel aboard the NSV Sierra."
	icon_state = "sec"
	job_access_type = /datum/job/officer

/obj/item/weapon/card/id/sierra/crew/security/warden
	job_access_type = /datum/job/warden

/obj/item/weapon/card/id/sierra/crew/security/detective
	job_access_type = /datum/job/detective



/obj/item/weapon/card/id/sierra/silver/engineering
	icon_state = "engGold"
	job_access_type = /datum/job/chief_engineer

/obj/item/weapon/card/id/sierra/crew/engineering
	desc = "An identification card issued to engineering personnel aboard the NSV Sierra."
	icon_state = "eng"
	job_access_type = /datum/job/engineer

/obj/item/weapon/card/id/sierra/crew/engineering/senior
	job_access_type = /datum/job/senior_engineer

/obj/item/weapon/card/id/sierra/crew/engineering/trainee
	job_access_type = /datum/job/engineer_trainee

/obj/item/weapon/card/id/sierra/crew/engineering/comms
	job_access_type = /datum/job/infsys



/obj/item/weapon/card/id/sierra/crew/supply/quartermaster
	icon_state = "cargoGold"
	job_access_type = /datum/job/qm

/obj/item/weapon/card/id/sierra/crew/supply
	icon_state = "cargo"
	job_access_type = /datum/job/cargo_tech

/obj/item/weapon/card/id/sierra/crew/supply/mining
	job_access_type = /datum/job/mining

/obj/item/weapon/card/id/sierra/crew/supply/assistant
	job_access_type = /datum/job/cargo_assistant



/obj/item/weapon/card/id/sierra/crew/service //unused
	desc = "An identification card issued to service personnel aboard the NSV Sierra."
	icon_state = "civ"

/obj/item/weapon/card/id/sierra/crew/service/janitor
	job_access_type = /datum/job/janitor

/obj/item/weapon/card/id/sierra/crew/service/chef
	job_access_type = /datum/job/chef

/obj/item/weapon/card/id/sierra/crew/service //unused
	job_access_type = /datum/job/assistant

/obj/item/weapon/card/id/sierra/crew/service/bartender
	job_access_type = /datum/job/bartender

/obj/item/weapon/card/id/sierra/crew/exploration_leader
	job_access_type = /datum/job/exploration_leader

/obj/item/weapon/card/id/sierra/crew/explorer
	job_access_type = /datum/job/explorer

/obj/item/weapon/card/id/sierra/crew/pilot
	job_access_type = /datum/job/explorer_pilot

/obj/item/weapon/card/id/sierra/crew/field_medic
	job_access_type = /datum/job/explorer_medic

/obj/item/weapon/card/id/sierra/crew/field_engineer
	job_access_type = /datum/job/explorer_engineer



/obj/item/weapon/card/id/sierra/crew/research
	desc = "A card issued to research personnel aboard the NSV Sierra."
	icon_state = "sci"
	job_access_type = /datum/job/scientist_assistant

/obj/item/weapon/card/id/sierra/silver/research
	icon_state = "sciGold"
	job_access_type = /datum/job/rd

/obj/item/weapon/card/id/sierra/crew/research/senior_scientist
	job_access_type = /datum/job/senior_scientist

/obj/item/weapon/card/id/sierra/crew/research/scientist
	job_access_type = /datum/job/scientist

/obj/item/weapon/card/id/sierra/crew/research/roboticist
	job_access_type = /datum/job/roboticist

/obj/item/weapon/card/id/sierra/crew/liaison
	desc = "A card issued to corporate represenatives aboard the NSV Sierra."
	icon_state = "corporate"
	job_access_type = /datum/job/iaa

/obj/item/weapon/card/id/sierra/crew/adjutant
	desc = "A card issued to command's support personnel aboard the NSV Sierra."
	icon_state = "centcomNew"
	job_access_type = /datum/job/adjutant

//Merchant
/obj/item/weapon/card/id/sierra/merchant
	desc = "An identification card issued to Merchants."
	icon_state = "trader"
	job_access_type = /datum/job/merchant_trainee

/obj/item/weapon/card/id/sierra/merchant/leader
	desc = "An identification card issued to Merchant Leaders, indicating their right to sell and buy goods."
	job_access_type = /datum/job/merchant

//Stowaway
/obj/item/weapon/card/id/sierra/stowaway
	desc = "An identification card issued to personnel aboard the NSV Sierra. Looks like the photo fell off this one."
	icon_state = "id"
	job_access_type = /datum/job/stowaway

/obj/item/weapon/card/id/sierra/stowaway/New()
	..()
	var/species = SPECIES_HUMAN
	if(prob(10))
		species = pick(SPECIES_SKRELL,SPECIES_TAJARA,SPECIES_IPC)
	var/datum/species/S = all_species[species]
	var/decl/cultural_info/culture/C = SSculture.get_culture(S.default_cultural_info[TAG_CULTURE])
	var/gender = pick(MALE,FEMALE)
	assignment = "Passenger"
	registered_name = C.get_random_name(gender)
	sex = capitalize(gender)
	age = rand(19,25)
	fingerprint_hash = md5(registered_name)
	dna_hash = md5(fingerprint_hash)
	blood_type = RANDOM_BLOOD_TYPE
