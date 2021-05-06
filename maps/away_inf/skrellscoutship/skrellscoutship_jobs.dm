/decl/submap_archetype/skrellscoutship
	descriptor = "Skrellian Scout Ship"
	map = "Xilvuxix"
	crew_jobs = list(
		/datum/job/submap/skrellscoutship_crew,
		/datum/job/submap/skrellscoutship_crew/leader
	)
	call_webhook = WEBHOOK_SUBMAP_LOADED_SKRELL

/obj/effect/submap_landmark/joinable_submap/skrellscoutship
	name = "Xilvuxix"
	archetype = /decl/submap_archetype/skrellscoutship

/obj/effect/submap_landmark/spawnpoint/skrellscoutship
	name = "Qrri-Zuumqix"
	movable_flags = MOVABLE_FLAG_EFFECTMOVE

/obj/effect/submap_landmark/spawnpoint/skrellscoutship/leader
	name = "Qrri-Vuxix"

/*
 * ACCESS
 * ======
 */

/var/const/access_skrellscoutship = "ACCESS_SKRELLSCOUT"
/var/const/access_skrellscoutship_captain = "ACCESS_SKRELLSCOUT_CAPTAIN"

/datum/access/skrellscoutship
	id = access_skrellscoutship
	desc = "SSV Crewman"
	region = ACCESS_REGION_NONE

/datum/access/skrellscoutship_captain
	id = access_skrellscoutship_captain
	desc = "SSV Captain"
	region = ACCESS_REGION_NONE

/obj/item/card/id/skrellscoutship
	color = COLOR_GRAY40
	detail_color = "#7331c4"
	access = list(access_skrellscoutship)

/obj/item/card/id/skrellscoutship/captain
	access = list(access_skrellscoutship, access_skrellscoutship_captain)
	extra_details = list("goldstripe")

/*
 * JOBS
 * ====
 */

/datum/job/submap/skrellscoutship_crew
	title = "Qrri-Zuumqix"
	supervisors = "your Qrri-Vuxix"
	total_positions = 5
	whitelisted_species = list("Skrell")
	outfit_type = /decl/hierarchy/outfit/job/skrellscoutship
	info = "Ваше судно получило приказ разведать данный сектор, отметив на нем точки интереса, возможных врагов и возможных союзников. \
	\
	Ваше присутсвие должно оставаться в секрете, однако устранение свидетелей запрещено, т.к. может повлечь дипламатические конфликты. \
	В случае контакта с патрульными судами других государств рекомендуется выйти на связь для избежания конфликта, не раскрывая свою истинную миссию. \
	Вы не являетесь спасателями и не должны реагировать на любые запросы о помощи."
	branch = /datum/mil_branch/skrell_fleet
	rank = /datum/mil_rank/skrell_fleet
	allowed_branches = list(/datum/mil_branch/skrell_fleet)
	allowed_ranks = list(/datum/mil_rank/skrell_fleet)
	skill_points = 30
	is_semi_antagonist = TRUE
	min_skill = list(SKILL_EVA = SKILL_ADEPT,
					SKILL_HAULING = SKILL_ADEPT,
					SKILL_COMBAT = SKILL_ADEPT,
					SKILL_WEAPONS = SKILL_ADEPT,
					SKILL_MEDICAL = SKILL_BASIC)

	required_role = list("Qrri-Vuxix")

/datum/job/submap/skrellscoutship_crew/leader
	title = "Qrri-Vuxix"
	supervisors = "your SDTF"
	total_positions = 1
	outfit_type = /decl/hierarchy/outfit/job/skrellscoutship/leader
	is_semi_antagonist = TRUE
	min_skill = list(SKILL_EVA = SKILL_ADEPT,
					SKILL_PILOT = SKILL_ADEPT,
					SKILL_HAULING = SKILL_ADEPT,
					SKILL_COMBAT = SKILL_ADEPT,
					SKILL_WEAPONS = SKILL_ADEPT,
					SKILL_MEDICAL = SKILL_BASIC)

	required_role = null

/datum/job/submap/skrellscoutship_crew/equip(var/mob/living/carbon/human/H, var/alt_title, var/datum/mil_branch/branch, var/datum/mil_rank/grade)
	. = ..(H, alt_title, branch, grade)	//passing through arguments
	//Limited to subcastes that make sense on the vessel. No need for ground-forces or R&D on such a ship.
	var/skrellscoutcastes = list(
		"Malish-Katish" = list(
			"Mero'ta-Ketish",
			"Toglo'i-Ketish"
		),
		"Kanin-Katish" = list(
			"Xiqarr-Ketish",
			"Mero'tol-Ketish",
			"Goxo'i-Ketish"
		),
		"Raskinta-Katish" = list(
			"Me'kerr-Ketish",
			"Qi'kerr-Ketish",
			"Me'xoal-Ketish"
		)
	)

	var/skrellcaste = input(H, "What is your Skrell's Caste?", "SDTF Rank") as null|anything in skrellscoutcastes
	if(skrellcaste)
		var/skrellsubcaste = input(H, "What is your Skrell's Subcaste?", "SDTF Rank") as null|anything in skrellscoutcastes[skrellcaste]
		var/obj/item/card/id/C = H.wear_id
		if(istype(C))
			C.assignment = skrellsubcaste

/obj/item/clothing/gloves/thick/swat/skrell
	name = "black gloves"
	desc = "A pair of black, reinforced gloves. The tag on the inner stitching appears to be written in some form of Skrellian."

/obj/item/clothing/under/skrelljumpsuit
	name = "black bodysuit"
	desc = "A sleek, skin-tight bodysuit designed to not wick moisture away from the body. The inner stitching appears to contain something written in Skrellian."
	icon_state = "skrell_suit"
	icon_state = "skrell_suit"
	worn_state = "skrell_suit"

/obj/item/clothing/under/skrelljumpsuit/holster
	starting_accessories = list(/obj/item/clothing/accessory/storage/holster/thigh)

/decl/hierarchy/outfit/job/skrellscoutship
	name = "Xilvuxix Crew"
	uniform = /obj/item/clothing/under/skrelljumpsuit/holster
	shoes = /obj/item/clothing/shoes/dutyboots
	gloves = /obj/item/clothing/gloves/thick/swat/skrell
	pda_type = /obj/item/modular_computer/pda
	pda_slot = slot_l_store
	l_ear = /obj/item/device/radio/headset/skrellian
	id_types = list(/obj/item/card/id/skrellscoutship)
	l_pocket = /obj/item/clothing/accessory/badge/tags/skrell

/decl/hierarchy/outfit/job/skrellscoutship/leader
	name = "Xilvuxix Captain"
	id_types = list(/obj/item/card/id/skrellscoutship/captain)

