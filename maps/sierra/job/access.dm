/************
* SEV sierra *
************/
/var/const/access_hangar = 73
/datum/access/hangar
	id = access_hangar
	desc = "Hangar Deck"
	region = ACCESS_REGION_GENERAL

/var/const/access_petrov = 74
/datum/access/petrov
	id = access_petrov
	desc = "Petrov"
	region = ACCESS_REGION_GENERAL

/var/const/access_petrov_helm = 75
/datum/access/petrov_helm
	id = access_petrov_helm
	desc = "Petrov Helm"
	region = ACCESS_REGION_GENERAL

/var/const/access_guppy_helm = 76
/datum/access/guppy_helm
	id = access_guppy_helm
	desc = "General Utility Pod Helm"
	region = ACCESS_REGION_GENERAL

/var/const/access_expedition_shuttle_helm = 77
/datum/access/exploration_shuttle_helm
	id = access_expedition_shuttle_helm
	desc = "Charon Helm"
	region = ACCESS_REGION_GENERAL

/var/const/access_iaa = 78
/datum/access/iaa
	id = access_iaa
	desc = "Internal Affairs Agent"
	region = ACCESS_REGION_COMMAND
	access_type = ACCESS_TYPE_NONE //Ruler of their own domain, CO and RD cannot enter

/var/const/access_nanotrasen = 81
/datum/access/nanotrasen
	id = access_nanotrasen
	desc = "NanoTrasen Personnel"
	region = ACCESS_REGION_RESEARCH

/var/const/access_robotics_engineering = 82 //two accesses so that you can give access to the lab without giving access to the borgs
/datum/access/robotics_engineering
	id = access_robotics_engineering
	desc = "Biomechanical Engineering"
	region = ACCESS_REGION_ENGINEERING

/var/const/access_gun = 87
/datum/access/gun
	id = access_gun
	desc = "Gunnery"
	region = ACCESS_REGION_COMMAND

/var/const/access_expedition_shuttle = 88
/datum/access/exploration_shuttle
	id = access_expedition_shuttle
	desc = "Charon"
	region = ACCESS_REGION_GENERAL

/var/const/access_guppy = 89
/datum/access/guppy
	id = access_guppy
	desc = "General Utility Pod"
	region = ACCESS_REGION_GENERAL

/var/const/access_seneng = 90
/datum/access/seneng
	id = access_seneng
	desc = "Senior Engineer"
	region = ACCESS_REGION_ENGINEERING

/var/const/access_senmed = 91
/datum/access/senmed
	id = access_senmed
	desc = "Physician"
	region = ACCESS_REGION_MEDBAY

/var/const/access_explorer = 93
/datum/access/explorer
	id = access_explorer
	desc = "Explorer"
	region = ACCESS_REGION_RESEARCH

/var/const/access_el = 94
/datum/access/el
	id = access_el
	desc = "Exploration Leader"
	region = ACCESS_REGION_RESEARCH

/var/const/access_pilot = 95
/datum/access/pilot
	id = access_pilot
	desc = "NT Pilot"
	region = ACCESS_REGION_GENERAL

/var/const/access_commissary = 96
/datum/access/commissary
	id = access_commissary
	desc = "Commissary"
	region = ACCESS_REGION_GENERAL


/************
* SEV sierra *
************/

/datum/access/network
	region = ACCESS_REGION_COMMAND
