/datum/species/bionic
	name = SPECIES_BIONIC
	name_plural = "Bionic"

	blurb = "Бионическое шасси было впервые использовано в 2548 году, когда выдающемус&#255; ученому корпорации NanoTrasen Дэниелу Озборну потребовалась операци&#255; по переносу мозга в сложнейший по своей структуре бионический каркас. \
Данна&#255; технологи&#255; кибернетического усилени&#255; позвол&#255;ет преумножить как физические способности носител&#255;, так и умственные, использу&#255; при этом человеческий мозг, чьи функции теменной и затылочной долей переход&#255;т напр&#255;мую к плазматронному &#255;дру. \
В насто&#255;щее врем&#255; проект признан нестабильным и сверхдорогим в своей реализации, потому, веро&#255;тно, навсегда останетс&#255; в единственном экземпл&#255;ре под контролем Корпорации NanoTrasen."

	preview_icon = 'infinity/icons/mob/human_races/species/bionic/preview.dmi'

	language = LANGUAGE_EAL
	secondary_langs = list(LANGUAGE_SOL_COMMON, LANGUAGE_INDEPENDENT, LANGUAGE_SPACER, \
		LANGUAGE_LUNAR, LANGUAGE_SIGN)
	unarmed_types = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/kick, /datum/unarmed_attack/punch)
	rarity_value = 2
	num_alternate_languages = 2
	strength = STR_HIGH
	name_language = LANGUAGE_EAL
	min_age = 30
	max_age = 200
	brute_mod = 1.3
	burn_mod = 1.3
	slowdown = -0.5
	warning_low_pressure = -1
	hazard_low_pressure = -1
	cold_level_1 = SYNTH_COLD_LEVEL_1
	cold_level_2 = SYNTH_COLD_LEVEL_2
	cold_level_3 = SYNTH_COLD_LEVEL_3
	heat_level_1 = SYNTH_HEAT_LEVEL_1
	heat_level_2 = SYNTH_HEAT_LEVEL_2
	heat_level_3 = SYNTH_HEAT_LEVEL_3
	body_temperature = null
	passive_temp_gain = -5
	species_flags = SPECIES_FLAG_NO_SCAN | SPECIES_FLAG_NO_PAIN | SPECIES_FLAG_NO_POISON | SPECIES_FLAG_NO_EMBED
	spawn_flags = SPECIES_CAN_JOIN | SPECIES_IS_WHITELISTED | SPECIES_NO_FBP_CONSTRUCTION | SPECIES_NO_LACE
	appearance_flags = HAS_EYE_COLOR //IPCs can wear undies too :(
	blood_color = "#000000"
	flesh_color = "#000000"
	virus_immune = 1
	has_organ = list(
		BP_BRAIN =    /obj/item/organ/internal/brain,
		BP_OPTICS = /obj/item/organ/internal/eyes/optics
		)
	vision_organ = BP_OPTICS
	has_limbs = list(
		BP_CHEST =  list("path" = /obj/item/organ/external/chest/bionic),
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
	heat_discomfort_level = 600
	genders = list(MALE)


/datum/species/bionic/handle_limbs_setup(var/mob/living/carbon/human/H)
	for(var/obj/item/organ/external/E in H.organs)
		if(!BP_IS_ROBOTIC(E))
			E.robotize("Bionic")
	return

/datum/species/bionic/get_description()
	var/list/damage_types = list(
		"physical trauma" = brute_mod,
		"burns" = burn_mod,
		"lack of air" = oxy_mod,
		"poison" = toxins_mod
	)
	var/dat = list()
	dat += "<center><h2>[name] \[<a href='?src=\ref[src];show_species=1'>change</a>\]</h2></center><hr/>"
	dat += "<table padding='8px'>"
	dat += "<tr>"
	dat += "<td width = 400>[blurb]</td>"
	dat += "<td width = 200 align='center'>"
	if("preview" in icon_states(get_icobase()))
		usr << browse_rsc(icon(get_icobase(),"preview"), "species_preview_[name].png")
		dat += "<img src='species_preview_[name].png' width='64px' height='64px'><br/><br/>"
	dat += "<b>Language:</b> [language]<br/>"
	dat += "<small>"
	if(spawn_flags & SPECIES_CAN_JOIN)
		dat += "</br><b>Often present among humans.</b>"
	if(spawn_flags & SPECIES_IS_WHITELISTED)
		dat += "</br><b>Whitelist restricted.</b>"
	if(!has_organ[BP_HEART])
		dat += "</br><b>Does not have blood.</b>"
	if(!has_organ[breathing_organ])
		dat += "</br><b>Does not breathe.</b>"
	if(species_flags & SPECIES_FLAG_NO_SCAN)
		dat += "</br><b>Does not have DNA.</b>"
	if(species_flags & SPECIES_FLAG_NO_PAIN)
		dat += "</br><b>Does not feel pain.</b>"
	if(species_flags & SPECIES_FLAG_NO_SLIP)
		dat += "</br><b>Has excellent traction.</b>"
	if(species_flags & SPECIES_FLAG_NO_POISON)
		dat += "</br><b>Immune to most poisons.</b>"
	if(slowdown)
		dat += "</br><b>Moves [slowdown > 0 ? "slower" : "faster"] than most.</b>"
	for(var/kind in damage_types)
		if(damage_types[kind] > 1)
			dat += "</br><b>Vulnerable to [kind].</b>"
		else if(damage_types[kind] < 1)
			dat += "</br><b>Resistant to [kind].</b>"
	dat += "</small></td>"
	dat += "</tr>"
	dat += "</table><hr/>"
	return jointext(dat, null)