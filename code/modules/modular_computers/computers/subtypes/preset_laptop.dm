//Loadout presets

/obj/item/modular_computer/laptop/preset/custom_loadout/cheap/install_default_hardware()
	..()
	processor_unit = new/obj/item/weapon/computer_hardware/processor_unit/small(src)
	//tesla_link = new/obj/item/weapon/computer_hardware/tesla_link(src)
	hard_drive = new/obj/item/weapon/computer_hardware/hard_drive/(src)
	network_card = new/obj/item/weapon/computer_hardware/network_card/(src)
	nano_printer = new/obj/item/weapon/computer_hardware/nano_printer(src)
	card_slot = new/obj/item/weapon/computer_hardware/card_slot(src)
	battery_module = new/obj/item/weapon/computer_hardware/battery_module/advanced(src)
	battery_module.charge_to_full()

/obj/item/modular_computer/laptop/preset/custom_loadout/advanced/install_default_hardware()
	..()
	processor_unit = new/obj/item/weapon/computer_hardware/processor_unit(src)
	//tesla_link = new/obj/item/weapon/computer_hardware/tesla_link(src)
	hard_drive = new/obj/item/weapon/computer_hardware/hard_drive/advanced(src)
	network_card = new/obj/item/weapon/computer_hardware/network_card/advanced(src)
	nano_printer = new/obj/item/weapon/computer_hardware/nano_printer(src)
	card_slot = new/obj/item/weapon/computer_hardware/card_slot(src)
	battery_module = new/obj/item/weapon/computer_hardware/battery_module/advanced(src)
	battery_module.charge_to_full()

/obj/item/modular_computer/laptop/preset/custom_loadout/standard/install_default_hardware()
	..()
	processor_unit = new/obj/item/weapon/computer_hardware/processor_unit(src)
	//tesla_link = new/obj/item/weapon/computer_hardware/tesla_link(src)
	hard_drive = new/obj/item/weapon/computer_hardware/hard_drive/(src)
	network_card = new/obj/item/weapon/computer_hardware/network_card/(src)
	nano_printer = new/obj/item/weapon/computer_hardware/nano_printer(src)
	card_slot = new/obj/item/weapon/computer_hardware/card_slot(src)
	battery_module = new/obj/item/weapon/computer_hardware/battery_module/advanced(src)
	battery_module.charge_to_full()

/obj/item/modular_computer/laptop/preset/custom_loadout/install_default_programs()
	..()
	var/mob/living/carbon/human/H = get_holder_of_type(src, /mob)
	if(!istype(H)) return
	install_default_programs_by_job(H)
	hard_drive.store_file(new/datum/computer_file/program/wordprocessor())

//Map presets

/obj/item/modular_computer/laptop/preset/records/install_default_hardware()
	..()
	processor_unit = new/obj/item/weapon/computer_hardware/processor_unit/small(src)
	//tesla_link = new/obj/item/weapon/computer_hardware/tesla_link(src)
	hard_drive = new/obj/item/weapon/computer_hardware/hard_drive/(src)
	network_card = new/obj/item/weapon/computer_hardware/network_card/(src)
	nano_printer = new/obj/item/weapon/computer_hardware/nano_printer(src)
	battery_module = new/obj/item/weapon/computer_hardware/battery_module/nano(src)
	battery_module.charge_to_full()
	scanner = new /obj/item/weapon/computer_hardware/scanner/paper(src)

/obj/item/modular_computer/laptop/preset/records/install_default_programs()
	..()
	hard_drive.store_file(new/datum/computer_file/program/records())
	hard_drive.store_file(new/datum/computer_file/program/wordprocessor())