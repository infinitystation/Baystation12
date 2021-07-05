/obj/item/integrated_circuit/size_converter
	category_text = "Size Converters"

/obj/item/integrated_circuit/size_converter/bluespace_circuit_expander
	name = "Bluespace circuit expander"
	desc = "This circuit use bluspace tech to crate mini rift for storing more compenents in assemble."
	icon_state = "template"
	extended_desc = "Finaly useful way use bluspace"
	size = -25
	complexity = 25
	spawn_flags = IC_SPAWN_RESEARCH

/obj/item/integrated_circuit/size_converter/expansion_board
	name = "Expansion board"
	desc = "Expansion board with connectors for easy component installation"
	icon_state = "template"
	extended_desc = "Board with signed connectors for easy installation, if the component is not installed, you should push it harder."
	size = 25
	complexity = -25
	spawn_flags = IC_SPAWN_RESEARCH
	//need balancing this shit
