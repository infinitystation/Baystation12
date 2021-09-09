/datum/job/submap/bearcat_captain
	title = "Independant First Mate"
	total_positions = 1
	outfit_type = /decl/hierarchy/outfit/job/bearcat/captain
	supervisors = "собственным здравым смыслом"
	info = "Ваш корабль получил катастрофические повреждения, что перебили свет и обрекли его на медленную смерть от астероидов \
	в глубинах неисследованного космоса. Капитан погиб, оставив Вас, некогда своего Первого Помощника на самого себя. Организуйте то, \
	что осталось от вашего экипажа, и возможно, вам удастся продержаться достаточно долго, чтобы спастись или даже вернуться в порт."
	required_language = LANGUAGE_SPACER
	economic_power = 7

/datum/job/submap/bearcat_crewman
	title = "Independant Crewman"
	supervisors = "Капитаном"
	total_positions = 3
	outfit_type = /decl/hierarchy/outfit/job/bearcat/crew
	info = "Ваш корабль получил катастрофические повреждения, что перебили свет и обрекли его на медленную смерть от астероидов \
	в глубинах неисследованного космоса. Работайте сообща с Первым Помощником и оставшимся экипажем, и возможно, \
	вам удастся продержаться достаточно долго, чтобы спастись или даже вернуться в порт."
	required_language = LANGUAGE_SPACER
	economic_power = 2

/datum/job/submap/bearcat_captain/equip(var/mob/living/carbon/human/H)
	setup_away_account(H)
	return ..()
	
/datum/job/submap/bearcat_crewman/equip(var/mob/living/carbon/human/H)
	setup_away_account(H)
	return ..()
	
#define BEARCAT_OUTFIT_JOB_NAME(job_name) ("Bearcat - Job - " + job_name)

/decl/hierarchy/outfit/job/bearcat
	hierarchy_type = /decl/hierarchy/outfit/job/bearcat
	pda_type = /obj/item/modular_computer/pda
	pda_slot = slot_l_store
	r_pocket = /obj/item/device/radio
	l_ear = null
	r_ear = null

/decl/hierarchy/outfit/job/bearcat/crew
	name = BEARCAT_OUTFIT_JOB_NAME("Crew")
	id_types = list(/obj/item/card/id/bearcat)

/decl/hierarchy/outfit/job/bearcat/captain
	name = BEARCAT_OUTFIT_JOB_NAME("First Mate")
	uniform = /obj/item/clothing/under/casual_pants/classicjeans
	shoes = /obj/item/clothing/shoes/black
	pda_type = /obj/item/modular_computer/pda/captain
	id_types = list(/obj/item/card/id/bearcat_captain)

/decl/hierarchy/outfit/job/bearcat/captain/post_equip(var/mob/living/carbon/human/H)
	..()
	var/obj/item/clothing/uniform = H.w_uniform
	if(uniform)
		var/obj/item/clothing/accessory/toggleable/hawaii/random/eyegore = new()
		if(uniform.can_attach_accessory(eyegore))
			uniform.attach_accessory(null, eyegore)
		else
			qdel(eyegore)

#undef BEARCAT_OUTFIT_JOB_NAME

/obj/effect/submap_landmark/spawnpoint/captain
	name = "Independant First Mate"

/obj/effect/submap_landmark/spawnpoint/crewman
	name = "Independant Crewman"
