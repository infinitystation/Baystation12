/obj/item/clothing/mask/gas_alt
	name = "gas mask"
	desc = "A mask that can be connected to an air supply. Filters harmful gases from the air."
	icon = 'icons/obj/clothing/infinity/TG_copy/infinity_work.dmi'
	icon_override = 'icons/infinity_work.dmi'
	icon_state = "gas_alt"
	item_flags = BLOCK_GAS_SMOKE_EFFECT | AIRTIGHT
	flags_inv = HIDEEARS|HIDEFACE
	body_parts_covered = FACE
	w_class = ITEM_SIZE_NORMAL
	item_state = "gas_alt"
	gas_transfer_coefficient = 0.01
	permeability_coefficient = 0.01
	siemens_coefficient = 0.9
	var/gas_filter_strength = 1			//For gas mask filters
	var/list/filtered_gases = list("phoron", "sleeping_agent")
	armor = list(melee = 5, bullet = 5, laser = 5, energy = 0, bomb = 0, bio = 75, rad = 0)