/material/waste
	name = MATERIAL_WASTE
	stack_type = null
	icon_colour = "#2e3a07"
	ore_name = "slag"
	ore_desc = "Someone messed up..."
	ore_icon_overlay = "lump"
	hidden_from_codex = TRUE

/material/cult
	name = MATERIAL_CULT
	display_name = "disturbing stone"
	icon_base = "cult"
	icon_colour = "#402821"
	icon_reinf = "reinf_cult"
	shard_type = SHARD_STONE_PIECE
	sheet_singular_name = "brick"
	sheet_plural_name = "bricks"
	conductive = 0
	construction_difficulty = 1
	hidden_from_codex = TRUE

/material/cult/place_dismantled_girder(var/turf/target)
	new /obj/structure/girder/cult(target)

/material/cult/reinf
	name = MATERIAL_REINFORCED_CULT
	display_name = "runic inscriptions"

/material/scrap
	name = "scrap"
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
	name = "refscrap"
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
	if(istype(M) && locate(/obj/item/organ/internal/xeno/hivenode) in M.internal_organs)
		return 1
	return 0
