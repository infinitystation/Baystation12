/obj/item/robot_module/standard
	name = "standard robot module"
	display_name = "Standard"
	sprites = list(
		"Basic" = "robot_old",
		"Android" = "droid",
		"Default" = "robot",
		"Motile" = "motile"
	)
	equipment = list(
		/obj/item/device/flash,
		/obj/item/extinguisher,
		/obj/item/wrench,
		/obj/item/crowbar,
		/obj/item/device/scanner/health
	)
//	emag = /obj/item/melee/energy/sword //rly? this borgie already has stunbaton & flash, i think it's enough
	skills = list(
		SKILL_COMBAT       = SKILL_ADEPT,
		SKILL_MEDICAL      = SKILL_ADEPT,
		SKILL_CONSTRUCTION = SKILL_ADEPT,
		SKILL_BUREAUCRACY  = SKILL_ADEPT,
		SKILL_PILOT        = SKILL_ADEPT //INF
	)
