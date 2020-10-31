/obj/machinery/chemical_dispenser/bar_alc/kote
	name = "drinks dispenser"
	desc = "Dispener of a various drinks!"
	icon_state = "booze_dispenser"
	ui_title = "Booze Dispenser"
	accept_drinking = 1
	core_skill = SKILL_COOKING
	can_contaminate = FALSE //See above.

/obj/machinery/chemical_dispenser/bar_alc/kote/full
	spawn_cartridges = list(
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/water,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/ice,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/coffee,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/hot_coco,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/cream,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/tea,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/green_tea,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/cola,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/djurl,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/selm,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/travi,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/milkk,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/sodawater,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/lemon_lime,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/sugar,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/orange,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/lime,
		)
