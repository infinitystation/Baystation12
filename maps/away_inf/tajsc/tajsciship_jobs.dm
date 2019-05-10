/var/const/access_tajsciship = "access_tajsciship"

/datum/access/tajsciship
	id = access_tajsciship
	desc = "CCA NSV Ma'Shira-13 EC"
	region = "access_tajsciship"

/obj/item/weapon/card/id/tajsciship
	color = COLOR_DARK_GUNMETAL
	detail_color = "#800080"
	access = list("access_tajsciship", "ACCESS_ENGINE_EQUIP") // proshe chem propisat 100500 apc i prochee lol


/datum/job/submap/tajsciship/crew
	title = "O-2 Tactical Operator"
	total_positions = 5
	outfit_type = /decl/hierarchy/outfit/job/tajsciship/crew
	supervisors = "your K-1, Field Commander"
	info = "Your vessel is scouting through Azjufiyr-Zan, working to map out any potential dangers, as well as potential allies. "
	skill_points = 30
	whitelisted_species = list(SPECIES_TAJARA)
	blacklisted_species = null


/datum/job/submap/tajsciship/crew_leader
	title = "K-1 Field Commander"
	supervisors = "your K-7 Tactician, Mrojarl'Khanch Nal'zherch-Mank'tcrrick and CCA EC HQ."
	total_positions = 1
	outfit_type = /decl/hierarchy/outfit/job/tajsciship/crew_leader
	info = "Your vessel is scouting through Azjufiyr-Zan, now you must research space around you."
	skill_points = 40
	whitelisted_species = list(SPECIES_TAJARA)
	blacklisted_species = null


#define TAJSCISHIP_OUTFIT_JOB_NAME(job_name) ("CCA NSV Ma'Shira-13 - Job - " + job_name)

/decl/hierarchy/outfit/job/tajsciship
	hierarchy_type = /decl/hierarchy/outfit/job/tajsciship
	pda_type = /obj/item/modular_computer/pda
	pda_slot = slot_l_store


/decl/hierarchy/outfit/job/tajsciship/crew
	name = TAJSCISHIP_OUTFIT_JOB_NAME("O-2 Tactical Operator")
	hierarchy_type = /decl/hierarchy/outfit/job/tajsciship
	pda_type = /obj/item/modular_computer/pda
	pda_slot = slot_l_store
	id_type = /obj/item/weapon/card/id/tajsciship
	uniform = /obj/item/clothing/under/tajsciship/CCAECjumpsuit
	shoes = /obj/item/clothing/shoes/workboots/toeless
	l_pocket = /obj/item/weapon/crowbar/prybar
	l_ear = /obj/item/device/radio/headset/tajsciship
	glasses = /obj/item/clothing/glasses/meson/prescription/tajvisor
	l_hand = /obj/item/clothing/accessory/shouldercape/command




/decl/hierarchy/outfit/job/tajsciship/crew_leader
	hierarchy_type = /decl/hierarchy/outfit/job/tajsciship
	pda_type = /obj/item/modular_computer/pda
	pda_slot = slot_l_store
	id_type = /obj/item/weapon/card/id/tajsciship
	name = TAJSCISHIP_OUTFIT_JOB_NAME("K-1 Field Commander")
	uniform = /obj/item/clothing/under/tajsciship/CCAECjumpsuit
	shoes = /obj/item/clothing/shoes/workboots/toeless
	l_pocket = /obj/item/weapon/crowbar/prybar
	l_ear = /obj/item/device/radio/headset/tajsciship
	glasses = /obj/item/clothing/glasses/meson/prescription/tajvisor
	l_hand = /obj/item/clothing/accessory/shouldercape/general


/obj/effect/submap_landmark/spawnpoint/tajsciship/crew
	name = "O-2 Tactical Operator"

/obj/effect/submap_landmark/spawnpoint/tajsciship/crew_leader
	name = "K-1 Field Commander"




#undef TAJSCISHIP_OUTFIT_JOB_NAME
