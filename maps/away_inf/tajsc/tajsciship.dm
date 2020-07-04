#include "tajsciship_areas.dm"
#include "tajsciship_shuttles.dm"
#include "tajsciship_equipment.dm"

/datum/map_template/ruin/away_site/tajsciship
	name = "AEV Ir'Shira"
	id = "awaysite_taj_sciship"
	description = "A CCA EC scouting station."
	suffixes = list("tajsc/tajsciship-1.dmm")
	cost = 0
	shuttles_to_initialise = list(/datum/shuttle/autodock/overmap/tajscishuttle, /obj/effect/overmap/visitable/ship/tajsciship)
	prefix = "map/away_inf/"
	template_flags = TEMPLATE_FLAG_SPAWN_GUARANTEED

/obj/effect/overmap/visitable/sector/tajscispace
	name = "Abnormal sector"
	desc = "Slight traces of a bluespace are present. Dangerous place."
	in_space = 1
	icon = 'maps/away_inf/tajsc/tajsciship.dmi'
	icon_state = "bshole"

/obj/effect/submap_landmark/joinable_submap/tajsciship
	name = "CCA NSV Ir'Shira-13"
	archetype = /decl/submap_archetype/tajsciship

/obj/effect/submap_landmark/spawnpoint/tajsciship/crew
	name = "O-2 Operator"

/obj/effect/submap_landmark/spawnpoint/tajsciship/crew_leader
	name = "K-1 Field Commander"

/decl/submap_archetype/tajsciship
	descriptor = "CCA exploration light-armored mobile station"
	map = "CCA NSV Ir'Shira-13"
	whitelisted_species = list(SPECIES_TAJARA)
	blacklisted_species = null
	crew_jobs = list(
		/datum/job/submap/tajsciship/crew,
		/datum/job/submap/tajsciship/crew_leader
	)

/obj/machinery/computer/shuttle_control/explore/tajscisshuttle
	name = "CCA EC shuttle control console"
	req_access = list(access_tajsciship)
	shuttle_tag = "CCA EC Shuttle"

/var/const/access_tajsciship = "ACCESS_TAJSCISHIP"
/datum/access/tajsciship
	id = access_tajsciship
	desc = "CCA NSV Ir'Shira-13 EC"
	region = ACCESS_REGION_NONE

/obj/item/weapon/card/id/tajsciship
	color = COLOR_DARK_GUNMETAL
	detail_color = "#800080"
	access = list("access_tajsciship")

/datum/job/submap/tajsciship/crew
	title = "O-2 Operator"
	total_positions = 5
	outfit_type = /decl/hierarchy/outfit/job/tajsciship/crew
	supervisors = "your K-1, Field Commander"
	info = "You are the crewman of the ship that was sent through Azjufiyr-Zan. Now you have to explore the space around you, be extremely careful, the stars around are cold."
	skill_points = 30
	whitelisted_species = list(SPECIES_TAJARA)
	blacklisted_species = null

/datum/job/submap/tajsciship/crew_leader
	title = "K-1 Field Commander"
	supervisors = "your K-7 Tactician, Mrojarl'Khanch Nal'zherch-Mank'tcrrick and CCA EC HQ."
	total_positions = 1
	outfit_type = /decl/hierarchy/outfit/job/tajsciship/crew_leader
	info = "Your vessel, captain, is scouting through Azjufiyr-Zan. Be wise and guide your brothers and sisters wisely. The place where you fell is unknown. From your actions and decisions may depend on the fate of not only your career, life, but also race."
	skill_points = 34
	whitelisted_species = list(SPECIES_TAJARA)
	blacklisted_species = null

#define TAJSCISHIP_OUTFIT_JOB_NAME(job_name) ("CCA NSV Ir'Shira-13 - Job - " + job_name)

/decl/hierarchy/outfit/job/tajsciship/crew
	name = TAJSCISHIP_OUTFIT_JOB_NAME("O-2 Operator")
	pda_type = /obj/item/modular_computer/pda
	pda_slot = slot_l_store
	id_type = /obj/item/weapon/card/id/tajsciship
	uniform = /obj/item/clothing/under/tajsciship
	shoes = /obj/item/clothing/shoes/workboots/toeless
	l_pocket = /obj/item/clothing/accessory/badge/tajamc
	r_pocket = /obj/item/clothing/accessory/inf_pin/ccapin
	l_ear = /obj/item/device/radio/headset/tajsciship
	glasses = /obj/item/clothing/glasses/meson/prescription/tajvisor
	l_hand = /obj/item/clothing/accessory/shouldercape/command

/decl/hierarchy/outfit/job/tajsciship/crew_leader
	pda_type = /obj/item/modular_computer/pda
	pda_slot = slot_l_store
	id_type = /obj/item/weapon/card/id/tajsciship
	name = TAJSCISHIP_OUTFIT_JOB_NAME("K-1 Field Commander")
	uniform = /obj/item/clothing/under/tajsciship
	shoes = /obj/item/clothing/shoes/workboots/toeless
	l_pocket = /obj/item/clothing/accessory/badge/tajamc
	r_pocket = /obj/item/clothing/accessory/inf_pin/ccapin
	l_ear = /obj/item/device/radio/headset/tajsciship
	glasses = /obj/item/clothing/glasses/meson/prescription/tajvisor
	l_hand = /obj/item/clothing/accessory/shouldercape/general

#undef TAJSCISHIP_OUTFIT_JOB_NAME
