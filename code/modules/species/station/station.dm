/datum/species/human
	name = SPECIES_HUMAN
	name_plural = "Humans"
	primitive_form = "Monkey"
	unarmed_types = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/kick, /datum/unarmed_attack/punch, /datum/unarmed_attack/bite)
	description = "Humanity originated in the Sol system, and over the last five centuries has spread \
	colonies across a wide swathe of space. They hold a wide range of forms and creeds.<br/><br/> \
	While the central Sol government maintains control of its far-flung people, powerful corporate \
	interests, rampant cyber and bio-augmentation and secretive factions make life on most human \
	worlds tumultous at best."
	assisted_langs = list(LANGUAGE_NABBER)
	min_age = 17
	max_age = 100
	hidden_from_codex = FALSE

	gluttonous = GLUT_TINY

	speech_chance = 40 //INF
	ambiguous_genders = 0
	bandages_icon = 'icons/mob/bandage.dmi'

	spawn_flags = SPECIES_CAN_JOIN
	appearance_flags = HAS_HAIR_COLOR | HAS_SKIN_TONE_NORMAL | HAS_LIPS | HAS_UNDERWEAR | HAS_EYE_COLOR

	sexybits_location = BP_GROIN

	inherent_verbs = list(/mob/living/carbon/human/proc/tie_hair)

	available_cultural_info = list(
		TAG_CULTURE = list(
			CULTURE_HUMAN_MARTIAN,
			CULTURE_HUMAN_MARSTUN,
			CULTURE_HUMAN_LUNAPOOR,
			CULTURE_HUMAN_LUNARICH,
			CULTURE_HUMAN_VENUSIAN,
			CULTURE_HUMAN_VENUSLOW,
			CULTURE_HUMAN_BELTER,
			CULTURE_HUMAN_PLUTO,
			CULTURE_HUMAN_EARTH,
			CULTURE_HUMAN_CETI,
			CULTURE_HUMAN_SPACER,
			CULTURE_HUMAN_SPAFRO,
			CULTURE_HUMAN_CONFED,
			CULTURE_HUMAN_OTHER,
			CULTURE_HUMAN_AVACOMMON, //inf
			CULTURE_HUMAN_AVANOBLE, //inf
			CULTURE_HUMAN_LORRIMAN, //inf
			CULTURE_HUMAN_LORDUP, //inf
			CULTURE_HUMAN_LORDLOW, //inf
			CULTURE_HUMAN_MIRANIAN, //inf
			CULTURE_HUMAN_NYXIAN //inf
		)
	)

/datum/species/human/get_bodytype(var/mob/living/carbon/human/H)
	return SPECIES_HUMAN

/datum/species/human/handle_npc(var/mob/living/carbon/human/H)
	if(H.stat != CONSCIOUS)
		return

	if(H.get_shock() && H.shock_stage < 40 && prob(3))
		H.agony_moan() //INF, WAS H.emote(pick("moan","groan"))

	if(H.shock_stage > 10 && prob(3))
		H.emote(pick("cry","whimper"))

	if(H.shock_stage >= 40 && prob(3))
		H.emote("scream")

	if(!H.restrained() && H.lying && H.shock_stage >= 60 && prob(3))
		H.custom_emote("thrashes in agony")

	if(!H.restrained() && H.shock_stage < 40 && prob(3))
		var/maxdam = 0
		var/obj/item/organ/external/damaged_organ = null
		for(var/obj/item/organ/external/E in H.organs)
			if(!E.can_feel_pain()) continue
			var/dam = E.get_damage()
			// make the choice of the organ depend on damage,
			// but also sometimes use one of the less damaged ones
			if(dam > maxdam && (maxdam == 0 || prob(50)) )
				damaged_organ = E
				maxdam = dam
		var/datum/gender/T = gender_datums[H.get_gender()]
		if(damaged_organ)
			if(damaged_organ.status & ORGAN_BLEEDING)
				H.custom_emote("clutches [T.his] [damaged_organ.name], trying to stop the blood.")
			else if(damaged_organ.status & ORGAN_BROKEN)
				H.custom_emote("holds [T.his] [damaged_organ.name] carefully.")
			else if(damaged_organ.burn_dam > damaged_organ.brute_dam && damaged_organ.organ_tag != BP_HEAD)
				H.custom_emote("blows on [T.his] [damaged_organ.name] carefully.")
			else
				H.custom_emote("rubs [T.his] [damaged_organ.name] carefully.")

		for(var/obj/item/organ/I in H.internal_organs)
			if((I.status & ORGAN_DEAD) || BP_IS_ROBOTIC(I)) continue
			if(I.damage > 2) if(prob(2))
				var/obj/item/organ/external/parent = H.get_organ(I.parent_organ)
				H.custom_emote("clutches [T.his] [parent.name]!")

/datum/species/human/get_ssd(var/mob/living/carbon/human/H)
	if(H.stat == CONSCIOUS)
		return "staring blankly, not reacting to your presence"
	return ..()

/datum/species/skrell
	name = SPECIES_SKRELL
	name_plural = SPECIES_SKRELL
	icobase = 'icons/mob/human_races/species/skrell/body.dmi'
	deform = 'icons/mob/human_races/species/skrell/deformed_body.dmi'
	preview_icon = 'icons/mob/human_races/species/skrell/preview.dmi'
	bandages_icon = 'icons/mob/bandage.dmi'
	primitive_form = "Neaera"
	unarmed_types = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/kick, /datum/unarmed_attack/punch, /datum/unarmed_attack/bite)
	description = "An amphibious species, Skrell come from the star system known as Qerr'Vallis, which translates to 'Star of \
	the royals' or 'Light of the Crown'.<br/><br/>Skrell are a highly advanced and logical race who live under the rule \
	of the Qerr'Katish, a caste within their society which keeps the empire of the Skrell running smoothly. Skrell are \
	herbivores on the whole and tend to be co-operative with the other species of the galaxy, although they rarely reveal \
	the secrets of their empire to their allies."
	assisted_langs = list(LANGUAGE_NABBER)
	health_hud_intensity = 1.75
	meat_type = /obj/item/weapon/reagent_containers/food/snacks/fish/octopus
	bone_material = MATERIAL_BONE_CARTILAGE
	genders = list(PLURAL)
	hidden_from_codex = FALSE
	min_age = 19
	max_age = 120

	burn_mod = 0.9
	oxy_mod = 1.3
	flash_mod = 1.2
	toxins_mod = 0.8
	siemens_coefficient = 1.3
	warning_low_pressure = WARNING_LOW_PRESSURE * 1.4
	hazard_low_pressure = HAZARD_LOW_PRESSURE * 2
	warning_high_pressure = WARNING_HIGH_PRESSURE / 0.8125
	hazard_high_pressure = HAZARD_HIGH_PRESSURE / 0.84615
	water_soothe_amount = 5

	body_temperature = null // cold-blooded, implemented the same way nabbers do it

	darksight_range = 4
	darksight_tint = DARKTINT_MODERATE

	spawn_flags = SPECIES_CAN_JOIN | SPECIES_IS_WHITELISTED
	appearance_flags = HAS_HAIR_COLOR | HAS_LIPS | HAS_UNDERWEAR | HAS_SKIN_COLOR

	flesh_color = "#8cd7a3"
	blood_color = "#1d2cbf"
	base_color = "#006666"
	organs_icon = 'icons/mob/human_races/species/skrell/organs.dmi'

	cold_level_1 = 250 //Default 260 - Lower is better
	cold_level_2 = 220 //Default 200
	cold_level_3 = 130 //Default 120

	heat_level_1 = 420 //Default 360 - Higher is better
	heat_level_2 = 480 //Default 400
	heat_level_3 = 1100 //Default 1000

	cold_discomfort_level = 292 //Higher than perhaps it should be, to avoid big speed reduction at normal room temp
	heat_discomfort_level = 368

	reagent_tag = IS_SKRELL

	descriptors = list(
		/datum/mob_descriptor/height = 1,
		/datum/mob_descriptor/build = 0,
		/datum/mob_descriptor/headtail_length = 0
	)

	available_cultural_info = list(
		TAG_CULTURE = list(
			CULTURE_SKRELL_QERR,
			CULTURE_SKRELL_MALISH,
			CULTURE_SKRELL_KANIN,
			CULTURE_SKRELL_TALUM,
			CULTURE_SKRELL_RASKINTA,
			CULTURE_HUMAN,
			CULTURE_HUMAN_MARTIAN,
			CULTURE_HUMAN_MARSTUN,
			CULTURE_HUMAN_LUNAPOOR,
			CULTURE_HUMAN_LUNARICH,
			CULTURE_HUMAN_VENUSIAN,
			CULTURE_HUMAN_VENUSLOW,
			CULTURE_HUMAN_BELTER,
			CULTURE_HUMAN_PLUTO,
			CULTURE_HUMAN_EARTH,
			CULTURE_HUMAN_CETI,
			CULTURE_HUMAN_SPACER,
			CULTURE_HUMAN_SPAFRO,
			CULTURE_HUMAN_OTHER
		),
		TAG_HOMEWORLD = list(
			HOME_SYSTEM_QERRBALAK,
			HOME_SYSTEM_EARTH,
			HOME_SYSTEM_LUNA,
			HOME_SYSTEM_MARS,
			HOME_SYSTEM_VENUS,
			HOME_SYSTEM_CERES,
			HOME_SYSTEM_PLUTO,
			HOME_SYSTEM_TAU_CETI,
			HOME_SYSTEM_HELIOS,
			HOME_SYSTEM_TERSTEN,
			HOME_SYSTEM_AHDOMAI,
			HOME_SYSTEM_LORRIMAN,
			HOME_SYSTEM_CINU,
			HOME_SYSTEM_YUKLID,
			HOME_SYSTEM_LORDANIA,
			HOME_SYSTEM_KINGSTON,
			HOME_SYSTEM_GAIA,
			HOME_SYSTEM_OTHER,
			HOME_SYSTEM_TALAMIRA,
			HOME_SYSTEM_ROASORA,
			HOME_SYSTEM_MITORQI,
			HOME_SYSTEM_SKRELLSPACE
		),
		TAG_FACTION = list(
			FACTION_SKRELL_MED,
			FACTION_SKRELL_AIR,
			FACTION_SKRELL_FOOD,
			FACTION_NANOTRASEN,
			FACTION_FREETRADE,
			FACTION_HEPHAESTUS,
			FACTION_XYNERGY,
			FACTION_EXPEDITIONARY,
			FACTION_PCRC,
			FACTION_CORPORATE,
			FACTION_DAIS,
			FACTION_ZENG_HU,
			FACTION_WARD_TAKAHASHI,
			FACTION_GRAYSON,
			FACTION_AERTHER,
			FACTION_SAARE,
			FACTION_MAJOR_BILL,
			FACTION_FOCAL_POINT,
			FACTION_XION,
			FACTION_VEY_MED,
			FACTION_BISHOP,
			FACTION_ZPCI,
			FACTION_SEPTENERGO,
			FACTION_SKRELL_QERRVOAL,
			FACTION_SKRELL_QALAOA,
			FACTION_SKRELL_YIITALANA,
			FACTION_SKRELL_KRRIGLI,
			FACTION_SKRELL_QONPRRI,
			FACTION_OTHER
		),
		TAG_RELIGION = list(
			RELIGION_SPIRITUALISM,
			RELIGION_JUDAISM,
			RELIGION_HINDUISM,
			RELIGION_BUDDHISM,
			RELIGION_ISLAM,
			RELIGION_CHRISTIANITY,
			RELIGION_AGNOSTICISM,
			RELIGION_DEISM,
			RELIGION_THELEMA,
			RELIGION_ATHEISM,
			RELIGION_OTHER
		)
	)

	has_organ = list(
		BP_HEART =    /obj/item/organ/internal/heart,
		BP_STOMACH =  /obj/item/organ/internal/stomach,
		BP_LUNGS =    /obj/item/organ/internal/lungs/gills,
		BP_LIVER =    /obj/item/organ/internal/liver,
		BP_KIDNEYS =  /obj/item/organ/internal/kidneys,
		BP_BRAIN =    /obj/item/organ/internal/brain,
		BP_EYES =     /obj/item/organ/internal/eyes/skrell
		)

/datum/species/skrell/get_sex(var/mob/living/carbon/human/H)
	return istype(H) && (H.descriptors["headtail length"] == 1 ? MALE : FEMALE)

/datum/species/skrell/check_background()
	return TRUE

/datum/species/diona
	name = SPECIES_DIONA
	name_plural = "Dionaea"
	icobase = 'icons/mob/human_races/species/diona/body.dmi'
	deform = 'icons/mob/human_races/species/diona/deformed_body.dmi'
	preview_icon = 'icons/mob/human_races/species/diona/preview.dmi'
	hidden_from_codex = FALSE
	move_intents = list(/decl/move_intent/walk, /decl/move_intent/creep)
	unarmed_types = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/kick, /datum/unarmed_attack/diona)
	//primitive_form = "Nymph"
	slowdown = 5
	rarity_value = 3
	hud_type = /datum/hud_data/diona
	siemens_coefficient = 0.3
	show_ssd = "completely quiescent"
	strength = STR_VHIGH
	assisted_langs = list(LANGUAGE_NABBER)
	spawns_with_stack = 0
	health_hud_intensity = 2
	hunger_factor = 3
	thirst_factor = 0.01

	min_age = 1
	max_age = 300

	description = "Commonly referred to (erroneously) as 'plant people', the Dionaea are a strange space-dwelling collective \
	species hailing from Epsilon Ursae Minoris. Each 'diona' is a cluster of numerous cat-sized organisms called nymphs; \
	there is no effective upper limit to the number that can fuse in gestalt, and reports exist	of the Epsilon Ursae \
	Minoris primary being ringed with a cloud of singing space-station-sized entities.<br/><br/>The Dionaea coexist peacefully with \
	all known species, especially the Skrell. Their communal mind makes them slow to react, and they have difficulty understanding \
	even the simplest concepts of other minds. Their alien physiology allows them survive happily off a diet of nothing but light, \
	water and other radiation."

	has_organ = list(
		BP_NUTRIENT = /obj/item/organ/internal/diona/nutrients,
		BP_STRATA =   /obj/item/organ/internal/diona/strata,
		BP_RESPONSE = /obj/item/organ/internal/diona/node,
		BP_GBLADDER = /obj/item/organ/internal/diona/bladder,
		BP_POLYP =    /obj/item/organ/internal/diona/polyp,
		BP_ANCHOR =   /obj/item/organ/internal/diona/ligament
		)

	has_limbs = list(
		BP_CHEST =  list("path" = /obj/item/organ/external/diona/chest),
		BP_GROIN =  list("path" = /obj/item/organ/external/diona/groin),
		BP_HEAD =   list("path" = /obj/item/organ/external/head/diona),
		BP_L_ARM =  list("path" = /obj/item/organ/external/diona/arm),
		BP_R_ARM =  list("path" = /obj/item/organ/external/diona/arm/right),
		BP_L_LEG =  list("path" = /obj/item/organ/external/diona/leg),
		BP_R_LEG =  list("path" = /obj/item/organ/external/diona/leg/right),
		BP_L_HAND = list("path" = /obj/item/organ/external/diona/hand),
		BP_R_HAND = list("path" = /obj/item/organ/external/diona/hand/right),
		BP_L_FOOT = list("path" = /obj/item/organ/external/diona/foot),
		BP_R_FOOT = list("path" = /obj/item/organ/external/diona/foot/right)
		)

	base_auras = list(
		/obj/aura/regenerating/human/diona
		)

	inherent_verbs = list(
		/mob/living/carbon/human/proc/diona_heal_toggle
		)

	warning_low_pressure = 50
	hazard_low_pressure = -1

	cold_level_1 = 50
	cold_level_2 = -1
	cold_level_3 = -1

	heat_level_1 = 2000
	heat_level_2 = 3000
	heat_level_3 = 4000

	body_temperature = T0C + 15		//make the plant people have a bit lower body temperature, why not

	species_flags = SPECIES_FLAG_NO_SCAN | SPECIES_FLAG_IS_PLANT | SPECIES_FLAG_NO_PAIN | SPECIES_FLAG_NO_SLIP
	appearance_flags = 0
	spawn_flags = SPECIES_CAN_JOIN | SPECIES_IS_WHITELISTED | SPECIES_NO_FBP_CONSTRUCTION | SPECIES_NO_FBP_CHARGEN

	blood_color = "#004400"
	flesh_color = "#907e4a"
//	virus_immune = 1

	reagent_tag = IS_DIONA
	genders = list(PLURAL)

	available_cultural_info = list(
		TAG_CULTURE =   list(CULTURE_DIONA),
		TAG_HOMEWORLD = list(HOME_SYSTEM_DIONAEA),
		TAG_FACTION =   list(FACTION_OTHER),
		TAG_RELIGION =  list(RELIGION_OTHER)
	)

/proc/spawn_diona_nymph(var/turf/target)
	if(!istype(target))
		return 0

	//This is a terrible hack and I should be ashamed.
	var/datum/seed/diona = SSplants.seeds["diona"]
	if(!diona)
		return 0

	spawn(1) // So it has time to be thrown about by the gib() proc.
		var/mob/living/carbon/alien/diona/D = new(target)
		var/datum/ghosttrap/plant/P = get_ghost_trap("living plant")
		P.request_player(D, "A diona nymph has split off from its gestalt. ")
		spawn(60)
			if(D)
				if(!D.ckey || !D.client)
					D.death()
		return 1

#define DIONA_LIMB_DEATH_COUNT 9
/datum/species/diona/handle_death_check(var/mob/living/carbon/human/H)
	var/lost_limb_count = has_limbs.len - H.organs.len
	if(lost_limb_count >= DIONA_LIMB_DEATH_COUNT)
		return TRUE
	for(var/thing in H.bad_external_organs)
		var/obj/item/organ/external/E = thing
		if(E && E.is_stump())
			lost_limb_count++
	return (lost_limb_count >= DIONA_LIMB_DEATH_COUNT)
#undef DIONA_LIMB_DEATH_COUNT

/datum/species/diona/can_understand(var/mob/other)
	var/mob/living/carbon/alien/diona/D = other
	if(istype(D))
		return 1
	return 0

/datum/species/diona/equip_survival_gear(var/mob/living/carbon/human/H)
	if(istype(H.get_equipped_item(slot_back), /obj/item/weapon/storage/backpack))
		H.equip_to_slot_or_del(new /obj/item/device/flashlight/flare(H.back), slot_in_backpack)
	else
		H.equip_to_slot_or_del(new /obj/item/device/flashlight/flare(H), slot_r_hand)

/datum/species/diona/skills_from_age(age)
	switch(age)
		if(101 to 200)	. = 12 // age bracket before this is 46 to 100 . = 8 making this +4
		if(201 to 300)	. = 16 // + 8
		else			. = ..()

// Dionaea spawned by hand or by joining will not have any
// nymphs passed to them. This should take care of that.
/datum/species/diona/handle_post_spawn(var/mob/living/carbon/human/H)
	H.gender = NEUTER
	. = ..()
	addtimer(CALLBACK(src, .proc/fill_with_nymphs, H), 0)

/datum/species/diona/proc/fill_with_nymphs(var/mob/living/carbon/human/H)

	if(!H || H.species.name != name) return

	var/nymph_count = 0
	for(var/mob/living/carbon/alien/diona/nymph in H)
		nymph_count++
		if(nymph_count >= 3) return

	while(nymph_count < 3)
		new /mob/living/carbon/alien/diona/sterile(H)
		nymph_count++

/datum/species/diona/handle_death(var/mob/living/carbon/human/H)

	if(H.isSynthetic())
		var/mob/living/carbon/alien/diona/S = new(get_turf(H))

		if(H.mind)
			H.mind.transfer_to(S)
		H.visible_message("<span class='danger'>\The [H] collapses into parts, revealing a solitary diona nymph at the core.</span>")
		return
	else
		split_into_nymphs(H)

/datum/species/diona/get_blood_name()
	return "sap"

/datum/species/diona/handle_environment_special(var/mob/living/carbon/human/H)
	if(H.InStasis() || H.stat == DEAD)
		return

	if(H.nutrition < 10)
		H.take_overall_damage(2,0)

	if(H.hydration < 550 && H.loc)
		var/is_in_water = FALSE
		if(H.loc.is_flooded(lying_mob = TRUE))
			is_in_water = TRUE
		else
			for(var/obj/structure/hygiene/shower/shower in H.loc)
				if(shower.on)
					is_in_water = TRUE
					break
		if(is_in_water)
			H.adjust_hydration(100)
