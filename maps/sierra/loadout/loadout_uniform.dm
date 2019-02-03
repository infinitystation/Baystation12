/datum/gear/uniform/utility
	display_name = "utility uniform"
	path = /obj/item/clothing/under/solgov/utility

/datum/gear/uniform/roboticist_skirt
	allowed_roles = list(/datum/job/roboticist)

/datum/gear/uniform/sterile
	allowed_roles = STERILE_ROLES

/datum/gear/uniform/hazard
	allowed_roles = TECHNICAL_ROLES

/datum/gear/uniform/pmc
	display_name = "PMC uniform selection"
	allowed_roles = list(/datum/job/detective, /datum/job/officer)
	allowed_branches = list(/datum/mil_branch/contractor)
	path = /obj/item/clothing/under

/datum/gear/uniform/pmc/New()
	..()
	var/pmc = list()
	pmc["SAARE utility uniform"]= /obj/item/clothing/under/saare
	pmc["PCRC utility uniform"]	= /obj/item/clothing/under/pcrc
	pmc["PCRC formal uniform"]	= /obj/item/clothing/under/pcrcsuit
	pmc["SCP utility uniform"]	= /obj/item/clothing/under/scp_uniform
	pmc["ZPCI utility uniform"]	= /obj/item/clothing/under/zpci_uniform
	gear_tweaks += new/datum/gear_tweak/path(pmc)

/datum/gear/uniform/corpsi
	display_name = "contractor uniform selection"
	path = /obj/item/clothing/under
	allowed_branches = list(/datum/mil_branch/contractor)

/datum/gear/uniform/corpsi/New()
	..()
	var/corpsi = list()
	corpsi["Major Bill's uniform"]		= /obj/item/clothing/under/mbill
	corpsi["Aether uniform"]			= /obj/item/clothing/under/aether
	corpsi["Hephaestus science uniform"]= /obj/item/clothing/under/rank/scientist/heph
	corpsi["Hephaestus uniform"]		= /obj/item/clothing/under/hephaestus
	corpsi["Ward-Takahashi uniform"]	= /obj/item/clothing/under/wardt
	corpsi["Grayson uniform"]			= /obj/item/clothing/under/grayson
	corpsi["Focal Point uniform"]		= /obj/item/clothing/under/focal
	corpsi["Morpheus uniform"]			= /obj/item/clothing/under/morpheus
	corpsi["Skinner uniform"]			= /obj/item/clothing/under/skinner
	corpsi["DAIS uniform"]				= /obj/item/clothing/under/dais
	gear_tweaks += new/datum/gear_tweak/path(corpsi)

/datum/gear/uniform/si_guard
	display_name = "NanoTrasen guard uniform"
	path = /obj/item/clothing/under/rank/guard/nanotrasen
	allowed_roles = list(/datum/job/officer)
	allowed_branches = list(/datum/mil_branch/employee)

/datum/gear/uniform/si_exec
	display_name = "NanoTrasen senior researcher alt uniform"
	path = /obj/item/clothing/under/rank/scientist/executive/nanotrasen
	allowed_roles = list(/datum/job/senior_scientist)

/datum/gear/uniform/si_overalls
	display_name = "corporate coveralls"
	path = /obj/item/clothing/under/rank/ntwork
	allowed_branches = list(/datum/mil_branch/employee, /datum/mil_branch/contractor)

/datum/gear/uniform/si_overalls/New()
	..()
	var/overalls = list()
	overalls["NT beige and red coveralls"]			= /obj/item/clothing/under/rank/ntwork/nanotrasen
	overalls["Hephaestus grey and cyan coveralls"]	= /obj/item/clothing/under/rank/ntwork/heph
	gear_tweaks += new/datum/gear_tweak/path(overalls)

/datum/gear/uniform/si_flight
	display_name = "corporate pilot suit"
	path = /obj/item/clothing/under/rank/ntpilot
	allowed_branches = list(/datum/mil_branch/employee, /datum/mil_branch/contractor)

/datum/gear/uniform/si_flight/New()
	..()
	var/flight = list()
	flight["NT red flight suit"]			= /obj/item/clothing/under/rank/ntpilot/nanotrasen
	flight["Hephaestus cyan flight suit"]	= /obj/item/clothing/under/rank/ntpilot/heph
	gear_tweaks += new/datum/gear_tweak/path(flight)

/datum/gear/uniform/si_exec_jacket
	display_name = "NanoTrasen liason suit"
	path = /obj/item/clothing/under/suit_jacket/corp/nanotrasen
	allowed_roles = list(/datum/job/iaa)
