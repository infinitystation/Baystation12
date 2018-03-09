/datum/species/machine
	name = SPECIES_IPC
	name_plural = "machines"

	blurb = "Positronic intelligence really took off in the 26th century, and it is not uncommon to see independant, free-willed \
	robots on many human stations, particularly in fringe systems where standards are slightly lax and public opinion less relevant \
	to corporate operations. IPCs (Integrated Positronic Chassis) are a loose category of self-willed robots with a humanoid form, \
	generally self-owned after being 'born' into servitude; they are reliable and dedicated workers, albeit more than slightly \
	inhuman in outlook and perspective."

	icobase = 'icons/mob/human_races/r_machine.dmi'
	deform = 'icons/mob/human_races/r_machine.dmi'

	eye_icon_location = 'icons/mob/infinity_human_face.dmi'

	language = LANGUAGE_EAL
	unarmed_types = list(/datum/unarmed_attack/punch)
	rarity_value = 2
	num_alternate_languages = 2
	strength = STR_HIGH
	name_language = LANGUAGE_EAL

	min_age = 1
	max_age = 90

	brute_mod = 1 // Because of the introduction of FBPs, IPCs are rebalanced back to 1.
	burn_mod = 1  //

	warning_low_pressure = 50
	hazard_low_pressure = -1

	cold_level_1 = SYNTH_COLD_LEVEL_1
	cold_level_2 = SYNTH_COLD_LEVEL_2
	cold_level_3 = SYNTH_COLD_LEVEL_3

	heat_level_1 = SYNTH_HEAT_LEVEL_1		// Gives them about 25 seconds in space before taking damage
	heat_level_2 = SYNTH_HEAT_LEVEL_2
	heat_level_3 = SYNTH_HEAT_LEVEL_3

	body_temperature = null
	passive_temp_gain = 5  // This should cause IPCs to stabilize at ~80 C in a 20 C environment.

	species_flags = SPECIES_FLAG_NO_SCAN | SPECIES_FLAG_NO_PAIN | SPECIES_FLAG_NO_POISON | SPECIES_FLAG_NO_EMBED
	spawn_flags = SPECIES_CAN_JOIN | SPECIES_IS_WHITELISTED | SPECIES_NO_FBP_CONSTRUCTION | SPECIES_NO_LACE
	appearance_flags = HAS_UNDERWEAR //IPCs can wear undies too :(

	blood_color = "#1f181f"
	flesh_color = "#575757"
	virus_immune = 1

	has_organ = list(
		BP_POSIBRAIN = /obj/item/organ/internal/posibrain,
		BP_OPTICS = /obj/item/organ/internal/eyes/optics
		)

	vision_organ = BP_OPTICS

	has_limbs = list(
		BP_CHEST =  list("path" = /obj/item/organ/external/chest),
		BP_GROIN =  list("path" = /obj/item/organ/external/groin),
		BP_HEAD =   list("path" = /obj/item/organ/external/head/no_eyes),
		BP_L_ARM =  list("path" = /obj/item/organ/external/arm),
		BP_R_ARM =  list("path" = /obj/item/organ/external/arm/right),
		BP_L_LEG =  list("path" = /obj/item/organ/external/leg),
		BP_R_LEG =  list("path" = /obj/item/organ/external/leg/right),
		BP_L_HAND = list("path" = /obj/item/organ/external/hand),
		BP_R_HAND = list("path" = /obj/item/organ/external/hand/right),
		BP_L_FOOT = list("path" = /obj/item/organ/external/foot),
		BP_R_FOOT = list("path" = /obj/item/organ/external/foot/right)
		)

	heat_discomfort_level = 373.15
	heat_discomfort_strings = list(
		"Your CPU temperature probes warn you that you are approaching critical heat levels!"
		)
	genders = list(NEUTER)

/datum/species/machine/handle_death(var/mob/living/carbon/human/H)
	..()
	if(istype(H.wear_mask,/obj/item/clothing/mask/monitor))
		var/obj/item/clothing/mask/monitor/M = H.wear_mask
		M.monitor_state_index = "blank"
		M.update_icon()

/datum/species/machine/sanitize_name(var/new_name)
	return sanitizeName(new_name, allow_numbers = 1)

/datum/species/machine/handle_post_spawn(var/mob/living/carbon/human/H)
	if(!H)
		return
	handle_limbs_setup(H)

/datum/species/machine/handle_limbs_setup(var/mob/living/carbon/human/H)
	for(var/obj/item/organ/external/E in H.organs)
		if(E.robotic < ORGAN_ROBOT)
			E.robotize("Morpheus")
	return

/datum/species/machine/get_blood_name()
	return "oil"

/datum/species/machine/disfigure_msg(var/mob/living/carbon/human/H)
	var/datum/gender/T = gender_datums[H.get_gender()]
	return "<span class='danger'>[T.His] monitor is completely busted!</span>\n"

/datum/species/machine/industrial
	name = "Industrial Machine"

	brute_mod = 0.8
	burn_mod = 1.1
	slowdown = 1

	blurb = "The first commercialized attempt Morpheus made at an industrial-type IPC. Designed for extra durability and increased weight loads, the first generation Industrial was considered a success, though it possessed some issues. A limited power cell and actuators designed for heavy lifting and not locomotion resulted in a slow and frequently charging machine. A special addition to the chassis makes up for these drawbacks - the ability to simply slot a suit cooling unit onto the model's back and make use of its built-in heat transferal conduits, allowing the Industrial to perform EVA without any extra peripherals such as a voidsuit."

	icobase = 'icons/mob/human_races/r_industrial.dmi'
	deform = 'icons/mob/human_races/r_industrial.dmi'

	eye_icon = "eyes_industry"
	show_ssd = "completely quiescent"

	heat_level_1 = 600
	heat_level_2 = 1200
	heat_level_3 = 2400

	heat_discomfort_level = 800

/datum/species/machine/industrial/handle_limbs_setup(var/mob/living/carbon/human/H)
	for(var/obj/item/organ/external/E in H.organs)
		if(E.robotic < ORGAN_ROBOT)
			E.robotize("Morpheus Special")
	return

/datum/species/machine/industrial/hephaestus
	name = "Military Machine"

	icobase = 'icons/mob/human_races/r_ind_hephaestus.dmi'
	deform = 'icons/mob/human_races/r_ind_hephaestus.dmi'

	slowdown = 1.7
	brute_mod = 0.8
	burn_mod = 0.8

	eye_icon = "heph_eyes"

	blurb = "An extremely durable and heavy Industrial model branded by Hephaestus Industries. \
	It is their improved Industrial model, with thicker plating and improved power cell. \
	Its actuators struggle to carry the immense weight, however, making the unit quite slow. \
	This chassis would be seen in roles where it would be dangerous or inefficient to use a less durable unit, \
	such as engineering, security, and mining. While this unit still possesses built-in cooling conduits, the \
	increased plating and thickness of said plating proved a difficult challenge for the engineers to develop good \
	cooling, so the unit suffers somewhat from increased heat loads. Overtaxing its hardware will quickly lead to overheating."

/datum/species/machine/industrial/hephaestus/handle_limbs_setup(var/mob/living/carbon/human/H)
	for(var/obj/item/organ/external/E in H.organs)
		if(E.robotic < ORGAN_ROBOT)
			E.robotize("Hephaestus Special")
	return

/datum/species/machine/zenghu
	name = "Science Machine"

	icobase = 'icons/mob/human_races/r_ind_zenghu.dmi'
	deform = 'icons/mob/human_races/r_ind_zenghu.dmi'

	brute_mod = 1.5
	slowdown = -0.7

	eye_icon = "zenghu_eyes"

	appearance_flags = HAS_EYE_COLOR

	blurb = "Being a corporation focused primarily on medical sciences and treatments, \
	Ward-Takahashi had little interest in the market of synthetics in the beginning.. \
	However, after seeing the advances in almost all fields of the galactic market after the advent of synthetics, \
	Ward-Takahashi set aside some funds for their own robotics department, \
	focused mainly on medical service and even science related operations. \
	Having taken some inspiration from biological life, the chassis has an interesting leg design: \
	digitigrade legs provide the chassis with enhanced speed. A downside to this development was the reduction of metals on the chassis. \
	Most plates covering the sensitive interior electronics are polymer casts to reduce the weight of the unit, \
	resulting in a not-so-durable android."

/datum/species/machine/zenghu/handle_limbs_setup(var/mob/living/carbon/human/H)
	for(var/obj/item/organ/external/E in H.organs)
		if(E.robotic < ORGAN_ROBOT)
			E.robotize("Ward-Takahashi Special")
	return


/datum/species/machine/bishop
	name = "Accessory Machine"

	icobase = 'icons/mob/human_races/r_ind_bishop.dmi'
	deform = 'icons/mob/human_races/r_ind_bishop.dmi'

	brute_mod = 1.2
	slowdown = -0.4

	eye_icon = "bishop_eyes"

	appearance_flags = HAS_EYE_COLOR

	blurb = "Bishop Cybernetics frames are among the sleeker, flashier frames widely produced for IPCs. This brand-new, \
	high end design has a focus on pioneering energy efficiency without sacrifice, fitting to Bishop's company vision. \
	Cutting-edge technology in power management means this frame can operate longer while running more demanding processing \
	algorithms than most. This extreme push to minimize power draw means this frame can be equipped with all sorts of extra \
	equipment: a hologram for a face, flashing status displays and embedded lights solely meant for show. \
	The one thing holding this frame back from perfection is the same common criticism leveled against almost all \
	Bishop products: the shiny chrome and glass meant to put all of this tech on display means it's exposed and fragile. \
	It's because of Bishop's unrelenting pursuit of vanity in their designs that these frames often suffer from issues with \
	reliability and struggle to safely perform the same work as cheaper, more rugged frames."

/datum/species/machine/bishop/handle_limbs_setup(var/mob/living/carbon/human/H)
	for(var/obj/item/organ/external/E in H.organs)
		if(E.robotic < ORGAN_ROBOT)
			E.robotize("Bishop Special")
	return

/datum/species/machine/industrial/xion
	name = "Engineering Machine"

	icobase = 'icons/mob/human_races/r_ind_xion.dmi'
	deform = 'icons/mob/human_races/r_ind_xion.dmi'

	blurb = "The Xion Manufacturing Group, being a subsidiary of Hephaestus Industries, saw the original Industrial models and wanted to develop their own chassis based off of the original design. The result is the Xion Industrial model. Sturdy and strong, this chassis is quite powerful and equally durable, with an ample power cell and improved actuators for carrying the increased weight of the body. The Xion model also retains sturdiness without covering the chassis in plating, allowing for the cooling systems to vent heat much easier than the Hephaestus-brand model. The Group did not wish to leave exposed cooling conduits, however, so this chassis will require a suit to perform EVA."

	eye_icon = "xion_eyes"

/datum/species/machine/industrial/xion/handle_limbs_setup(var/mob/living/carbon/human/H)
	for(var/obj/item/organ/external/E in H.organs)
		if(E.robotic < ORGAN_ROBOT)
			E.robotize("Xion Special")
	return

/datum/species/machine/terminator
	name = "Terminator"

	blurb = "\[REDACTED\]"

	icobase = 'icons/mob/human_races/r_terminator.dmi'
	deform = 'icons/mob/human_races/r_terminator.dmi'

	eye_icon = "eyes_terminator"
	has_floating_eyes = 1

	unarmed_types = list(/datum/unarmed_attack/terminator)
	rarity_value = 20
	strength = STR_VHIGH
	brute_mod = 0.3
	burn_mod = 0.5
	flash_mod = 0
	siemens_coefficient = 0
	mob_size = 20

	show_ssd = "laying inert, its activation glyph dark"
	death_sound = 'sound/effects/bang.ogg'
	death_message = "collapses to the ground with a CLUNK, and begins to beep ominously."

	heat_level_1 = 1500
	heat_level_2 = 2000
	heat_level_3 = 5000

	passive_temp_gain = 10

	inherent_verbs = list(
		/mob/living/carbon/human/proc/self_destruct
	)
/*
	has_organ = list(
		"brain" = /obj/item/organ/mmi_holder/posibrain/terminator,
		"shielded cell" = /obj/item/organ/cell/terminator,
		"optics" = /obj/item/organ/eyes/optical_sensor/terminator,
		"data core" = /obj/item/organ/data
	)
*/

	heat_discomfort_level = 2000
	heat_discomfort_strings = list(
		"Your CPU temperature probes warn you that you are approaching critical heat levels!"
		)
	slowdown = 1

/datum/species/machine/terminator/handle_death(var/mob/living/carbon/human/H)
	..()
	playsound(H.loc, 'sound/items/countdown.ogg', 125, 1)
	spawn(15)
		explosion(H.loc, -1, 1, 3)
		H.gib()

/datum/species/machine/terminator/handle_limbs_setup(var/mob/living/carbon/human/H)
	for(var/obj/item/organ/external/E in H.organs)
		if(E.robotic < ORGAN_ROBOT)
			E.robotize("Terminator")
	return