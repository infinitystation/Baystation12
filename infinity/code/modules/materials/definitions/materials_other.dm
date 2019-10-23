/material/scrap
	name = MATERIAL_SCRAP
	stack_type = /obj/item/stack/material/scrap
	icon_base = "metal"
	door_icon_base = "metal"
	icon_colour = "#999966"
	icon_reinf = "reinf_over"
	shard_can_repair = 0
	melting_point = 540
	brute_armor = 3.2
	integrity = 100
	explosion_resistance = 3
	alloy_materials = list(DEFAULT_WALL_MATERIAL = 720, "plastic" = 420)
	weight = 18
	hardness = 30
	hitsound = 'sound/weapons/smash.ogg'

/material/scrap/refined
	name = MATERIAL_SCRAP_REFINED
	stack_type = /obj/item/stack/material/refined_scrap
	melting_point = 820
	brute_armor = 4
	integrity = 120
	explosion_resistance = 4
	alloy_materials = list(DEFAULT_WALL_MATERIAL = 940, "plastic" = 210)
	weight = 18
	hardness = 40

/material/resin
	name = MATERIAL_RESIN
	icon_colour = "#e85dd8"
	dooropen_noise = 'sound/effects/attackblob.ogg'
	door_icon_base = "resin"
	melting_point = T0C+300
	sheet_singular_name = "blob"
	sheet_plural_name = "blobs"
	conductive = 0
	stack_type = null
	hidden_from_codex = TRUE

/material/resin/can_open_material_door(var/mob/living/user)
	var/mob/living/carbon/M = user
	if(locate(/obj/item/organ/internal/xeno/hivenode) in M?.internal_organs)
		return 1
	return 0

/material/concrete
	name = MATERIAL_CONCRETE
	lore_text = "One of the strongest materials of all time, combining the good old classics and new technologies."
	wall_name = "bulkhead"
	stack_type = /obj/item/stack/material/concrete
	integrity = 400
	melting_point = 6000
	icon_base = "stone"
	icon_reinf = "reinf_over"
	icon_colour = COLOR_CONCRETE
	explosion_resistance = 25
	brute_armor = 6
	burn_armor = 10
	hardness = 80
	weight = 23
	stack_origin_tech = list(TECH_MATERIAL = 2)
	hitsound = 'sound/weapons/smash.ogg'
	construction_difficulty = 1
	sale_price = 1
	value = 12
