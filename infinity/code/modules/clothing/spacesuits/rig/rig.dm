/obj/item/rig/military/equipped/comander
	armor = list(
		melee = ARMOR_MELEE_MAJOR,
		bullet = ARMOR_BALLISTIC_RESISTANT,
		laser = ARMOR_LASER_MAJOR,
		energy = ARMOR_ENERGY_SMALL,
		bomb = ARMOR_BOMB_RESISTANT,
		bio = ARMOR_BIO_SHIELDED,
		rad = ARMOR_RAD_RESISTANT
		)
	initial_modules = list(
		/obj/item/rig_module/mounted/egun,
		/obj/item/rig_module/maneuvering_jets,
		/obj/item/rig_module/vision/multi,
		/obj/item/rig_module/power_sink,
		/obj/item/rig_module/chem_dispenser/combat
		)

/obj/item/rig/military/equipped/enlisted
	armor = list(
		melee = ARMOR_MELEE_MAJOR,
		bullet = ARMOR_BALLISTIC_RESISTANT,
		laser = ARMOR_LASER_MAJOR,
		energy = ARMOR_ENERGY_SMALL,
		bomb = ARMOR_BOMB_RESISTANT,
		bio = ARMOR_BIO_SHIELDED,
		rad = ARMOR_RAD_RESISTANT
		)
	initial_modules = list(
		/obj/item/rig_module/vision/nvg,
		/obj/item/rig_module/maneuvering_jets,
		/obj/item/rig_module/power_sink
		)

/obj/item/rig/military/equipped/engineer
	armor = list(
		melee = ARMOR_MELEE_MAJOR,
		bullet = ARMOR_BALLISTIC_RESISTANT,
		laser = ARMOR_LASER_MAJOR,
		energy = ARMOR_ENERGY_SMALL,
		bomb = ARMOR_BOMB_RESISTANT,
		bio = ARMOR_BIO_SHIELDED,
		rad = ARMOR_RAD_RESISTANT
		)
	initial_modules = list(
		/obj/item/rig_module/vision/meson,
		/obj/item/rig_module/maneuvering_jets,
		/obj/item/rig_module/power_sink,
		/obj/item/rig_module/device/rcd,
		/obj/item/rig_module/device/healthscanner
		)

/obj/item/rig/military/equipped/corpsman
	armor = list(
		melee = ARMOR_MELEE_MAJOR,
		bullet = ARMOR_BALLISTIC_RESISTANT,
		laser = ARMOR_LASER_MAJOR,
		energy = ARMOR_ENERGY_SMALL,
		bomb = ARMOR_BOMB_RESISTANT,
		bio = ARMOR_BIO_SHIELDED,
		rad = ARMOR_RAD_RESISTANT
		)
	initial_modules = list(
		/obj/item/rig_module/vision/medhud,
		/obj/item/rig_module/maneuvering_jets,
		/obj/item/rig_module/power_sink,
		/obj/item/rig_module/chem_dispenser/injector,
		/obj/item/rig_module/device/defib,
		/obj/item/rig_module/device/healthscanner
		)
