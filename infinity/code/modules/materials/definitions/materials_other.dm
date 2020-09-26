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
	icon_colour = "#35343a"
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

/material/alien
	name = MATERIAL_ALIEN
	lore_text = "A strange kind of crystal-looking alloy. It should be very tough."
	stack_type = /obj/item/stack/material/alien
	integrity = 800
	flags = MATERIAL_UNMELTABLE
	cut_delay = 60
	icon_colour = COLOR_DIAMOND
	shard_type = SHARD_SHARD
	tableslam_noise = 'sound/effects/Glasshit.ogg'
	hardness = MATERIAL_VERY_HARD + 20
	brute_armor = 45
	burn_armor = 50
	table_icon_base = "alien"
	stack_origin_tech = list(TECH_MATERIAL = 7)
	conductive = 0
	construction_difficulty = MATERIAL_VERY_HARD_DIY
	xarch_source_mineral = GAS_NITROGEN
	ore_icon_overlay = "gems"
	sale_price = 5
	sheet_singular_name = "sheet"
	sheet_plural_name = "sheets"
	value = 70

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
