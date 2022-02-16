/material/steel/generate_recipes(var/reinforce_material)
	. = ..()
	. += new/datum/stack_recipe/chem_mine(src)
