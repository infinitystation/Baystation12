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
	display_name = "runed metal" //INF was "disturbing stone"
	icon_base = "cult"
	icon_colour = "#402821"
	icon_reinf = "reinf_cult"
	shard_type = SHARD_STONE_PIECE
	sheet_singular_name = "sheet" //INF, was "brick"
	sheet_plural_name = "sheets" //INF, was "bricks"
	conductive = 0
	construction_difficulty = MATERIAL_NORMAL_DIY
	hidden_from_codex = TRUE
	door_icon_base = "cultdoor" //INF

/material/cult/place_dismantled_girder(var/turf/target)
	new /obj/structure/girder/cult(target)

/material/cult/reinf
	name = MATERIAL_REINFORCED_CULT
	display_name = "runic plasteel" //INF was "runic inscriptions"
